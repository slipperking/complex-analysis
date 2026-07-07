from __future__ import annotations

import json
import re
import unicodedata
from dataclasses import dataclass, field
from html.parser import HTMLParser
from pathlib import Path
from typing import Iterable


BLOCK_TAGS = {"p", "li", "h1", "h2", "h3", "h4", "h5", "h6", "figcaption", "div"}
SKIP_TAGS = {"script", "style", "nav", "aside", "svg"}
ALLOWED_DIV_CLASSES = {
    "display-math",
    "thm-box",
    "abstract",
    "recommendation",
    "theorem-list-entry",
}
VOID_TAGS = {
    "area",
    "base",
    "br",
    "col",
    "embed",
    "hr",
    "img",
    "input",
    "link",
    "meta",
    "param",
    "source",
    "track",
    "wbr",
}


def normalize_whitespace(value: str) -> str:
    return re.sub(r"\s+", " ", value).strip()


def normalize_text(value: str) -> str:
    return normalize_whitespace(value).casefold()


def normalize_math_markup(value: str) -> str:
    return re.sub(r"\s+", " ", value.replace("> <", "><")).strip().casefold()


def strip_tags(value: str) -> str:
    return re.sub(r"<[^>]+>", " ", value)


def strip_search_noise_html(value: str) -> str:
    value = re.sub(r"<span class=\"prefix\">.*?</span>\s*", "", value, flags=re.DOTALL)
    value = re.sub(r"<sup[^>]*role=\"doc-backlink\"[^>]*>.*?</sup>\s*", "", value, flags=re.DOTALL)
    value = re.sub(r"<math class=\"typst-multi-label-list\">.*?</math>", "", value, flags=re.DOTALL)
    value = re.sub(r"<a class=\"eq-tag\">.*?</a>", "", value, flags=re.DOTALL)
    return value


def strip_search_noise_text(value: str) -> str:
    value = re.sub(r"\[\d+\]\s*", "", value)
    value = re.sub(r"\(\d+(?:\.\d+)*\)\s*$", "", value)
    return value


GREEK_NAMES = {
    "alpha", "beta", "gamma", "delta", "epsilon", "zeta", "eta", "theta",
    "iota", "kappa", "lambda", "mu", "nu", "xi", "omicron", "pi", "rho",
    "sigma", "tau", "upsilon", "phi", "chi", "psi", "omega",
}


def load_symbol_aliases(root_dir: Path) -> dict[str, list[str]]:
    alias_file = root_dir / "scripts" / "codex_sym_aliases.txt"
    aliases: dict[str, list[str]] = {}
    if not alias_file.exists():
        return aliases

    for raw_line in alias_file.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#"):
            continue
        if "=" not in line:
            continue
        symbol, values = line.split("=", 1)
        key = symbol.strip()
        terms = [part.strip() for part in values.split(",") if part.strip()]
        if not key or not terms:
            continue
        aliases.setdefault(key, []).extend(terms)

    return aliases


def alias_terms(value: str, symbol_aliases: dict[str, list[str]]) -> str:
    aliases: list[str] = []
    compact_value = normalize_whitespace(
        unicodedata.normalize("NFKC", value)
        .replace("<", " ")
        .replace(">", " ")
        .replace("/", " ")
    )

    for char in value:
        aliases.extend(symbol_aliases.get(char, ()))
        try:
            name = unicodedata.name(char).lower()
        except ValueError:
            continue

        compact = name.replace("-", " ")
        for greek in GREEK_NAMES:
            if greek in compact:
                aliases.append(greek)
                break

        if "double struck capital" in compact:
            base = compact.split()[-1]
            aliases.append(base)
            aliases.append(base * 2)
        elif "double struck" in compact:
            aliases.append(compact.split()[-1])

    for match in re.finditer(r"\bd\s*([A-Za-z0-9]+)\b", compact_value, flags=re.IGNORECASE):
        variable = match.group(1).casefold()
        aliases.append("d" + variable)
        aliases.append("d " + variable)

    return normalize_text(" ".join(aliases))


@dataclass
class Block:
    tag: str
    anchor: str | None = None
    symbol_aliases: dict[str, list[str]] = field(default_factory=dict)
    depth: int = 0
    html_parts: list[str] = field(default_factory=list)
    text_parts: list[str] = field(default_factory=list)
    math_parts: list[str] = field(default_factory=list)

    def add_raw(self, value: str) -> None:
        self.html_parts.append(value)

    def add_text(self, value: str) -> None:
        self.text_parts.append(value)

    def add_math_text(self, value: str) -> None:
        self.math_parts.append(value)

    def to_search_record(self) -> dict[str, str] | None:
        html = strip_search_noise_html("".join(self.html_parts).strip())
        text = normalize_whitespace(strip_search_noise_text("".join(self.text_parts)))
        math_text = normalize_whitespace("".join(self.math_parts))
        if not html or not (text or math_text):
            return None

        kind = "math" if self.tag == "div" and "<math" in html else "heading" if self.tag.startswith("h") else "text"
        return {
            "anchor": self.anchor or "",
            "kind": kind,
            "html": html,
            "text": text,
            "textNormalized": normalize_text(text),
            "mathText": math_text,
            "mathTextNormalized": normalize_text(math_text),
            "mathMarkupNormalized": normalize_math_markup(html if "<math" in html else ""),
            "aliasNormalized": alias_terms(text + " " + math_text + " " + html, self.symbol_aliases),
        }


class SearchPageParser(HTMLParser):
    def __init__(self, symbol_aliases: dict[str, list[str]]) -> None:
        super().__init__(convert_charrefs=False)
        self.symbol_aliases = symbol_aliases
        self.in_main = False
        self.skip_depth = 0
        self.math_depth = 0
        self.current_block: Block | None = None
        self.blocks: list[dict[str, str]] = []
        self.page_text: list[str] = []
        self.page_math_text: list[str] = []
        self.route_title: str | None = None
        self.capture_route_title = False
        self.last_anchor: str | None = None

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        attrs_dict = dict(attrs)
        raw = self.get_starttag_text()
        current_id = attrs_dict.get("id")

        if tag == "main" and attrs_dict.get("class", "").find("content") != -1:
            self.in_main = True

        if not self.in_main:
            return

        if tag in SKIP_TAGS:
            self.skip_depth += 1
            return

        if self.skip_depth > 0:
            return

        if tag == "h1" and attrs_dict.get("class") == "page-title":
            self.route_title = ""
            self.capture_route_title = True
            return

        if tag == "math":
            self.math_depth += 1

        if current_id:
            self.last_anchor = current_id

        if tag in BLOCK_TAGS and self.current_block is None:
            if tag == "div":
                classes = set((attrs_dict.get("class") or "").split())
                if not classes.intersection(ALLOWED_DIV_CLASSES):
                    return
            if tag == "li" and attrs_dict.get("role") == "doc-endnote":
                return
            self.current_block = Block(
                tag=tag,
                anchor=current_id or self.last_anchor,
                symbol_aliases=self.symbol_aliases,
                depth=1,
            )
        elif self.current_block is not None:
            self.current_block.depth += 1

        if self.current_block is not None:
            self.current_block.add_raw(raw)

    def handle_endtag(self, tag: str) -> None:
        if tag == "main" and self.in_main:
            self.in_main = False

        if not self.in_main and tag != "main":
            return

        if self.skip_depth > 0:
            if tag in SKIP_TAGS:
                self.skip_depth -= 1
            return

        if self.current_block is not None:
            if tag not in VOID_TAGS:
                self.current_block.add_raw(f"</{tag}>")
            self.current_block.depth -= 1
            if self.current_block.depth <= 0:
                record = self.current_block.to_search_record()
                if record is not None:
                    self.blocks.append(record)
                self.current_block = None

        if tag == "math" and self.math_depth > 0:
            self.math_depth -= 1
        if tag == "h1" and self.capture_route_title:
            self.route_title = normalize_whitespace(self.route_title)
            self.capture_route_title = False

    def handle_data(self, data: str) -> None:
        if self.capture_route_title and self.route_title is not None:
            self.route_title += data

        if not self.in_main or self.skip_depth > 0:
            return

        if self.current_block is not None:
            self.current_block.add_raw(data)
            self.current_block.add_text(data)
            if self.math_depth > 0:
                self.current_block.add_math_text(data)

        self.page_text.append(data)
        if self.math_depth > 0:
            self.page_math_text.append(data)

    def handle_entityref(self, name: str) -> None:
        self.handle_data(f"&{name};")

    def handle_charref(self, name: str) -> None:
        self.handle_data(f"&#{name};")


def extract_title(html_text: str) -> str:
    match = re.search(r"<title>(.*?)</title>", html_text, flags=re.IGNORECASE | re.DOTALL)
    if not match:
        return "Untitled"
    return normalize_whitespace(strip_tags(match.group(1)))


def collect_pages(root_dir: Path, dist_dir: Path) -> list[dict[str, object]]:
    pages: list[dict[str, object]] = []
    symbol_aliases = load_symbol_aliases(root_dir)

    for path in sorted(dist_dir.rglob("*.html")):
        if path.name == "404.html" or path.parts[-2:] == ("search", "index.html"):
            continue

        rel_path = path.relative_to(dist_dir).as_posix()
        html_text = path.read_text(encoding="utf-8")
        parser = SearchPageParser(symbol_aliases)
        parser.feed(html_text)

        title = normalize_whitespace(parser.route_title or "") or extract_title(html_text)
        route = "" if rel_path == "index.html" else rel_path.removesuffix("index.html").rstrip("/")
        route_text = route or ""
        page_text = normalize_whitespace(" ".join(parser.page_text))
        page_math_text = normalize_whitespace(" ".join(parser.page_math_text))
        math_markup = " ".join(
            block["html"] for block in parser.blocks if "<math" in block["html"]
        )
        pages.append(
            {
                "title": title,
                "titleNormalized": normalize_text(title),
                "path": rel_path,
                "route": route_text,
                "textNormalized": normalize_text(page_text),
                "mathTextNormalized": normalize_text(page_math_text),
                "mathMarkupNormalized": normalize_math_markup(math_markup),
                "aliasNormalized": alias_terms(title + " " + page_text + " " + page_math_text + " " + math_markup, symbol_aliases),
                "blocks": parser.blocks[:18],
            }
        )

    return pages


def write_search_index(dist_dir: Path, pages: Iterable[dict[str, object]]) -> None:
    payload = {"pages": list(pages)}
    index_js = "window.SEARCH_INDEX = " + json.dumps(payload, ensure_ascii=False, separators=(",", ":")) + ";\n"
    (dist_dir / "assets" / "search-index.js").write_text(index_js, encoding="utf-8")


def search_page_html() -> str:
    return """<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Search | Notes on Complex Analysis</title>
  <link rel="stylesheet" href="../assets/site.css">
  <link rel="stylesheet" href="../assets/search.css">
</head>
<body data-page-type="search">
  <header class="topbar">
    <div class="topbar-left">
      <a class="topbar-title" href="../index.html">Notes on Complex Analysis</a>
    </div>
    <form class="topbar-search" data-search-form="true" action="index.html" method="get" role="search">
      <input class="search-input" type="search" name="q" placeholder="Search..." autocomplete="off" aria-label="Search the site">
      <button class="search-submit" type="submit">Search</button>
    </form>
    <div class="topbar-right">
      <button class="icon-button theme-toggle" aria-label="Toggle theme" title="Theme">
        <img class="icon" src="../assets/theme.svg" alt="Theme">
      </button>
      <a class="icon-button github-link" href="https://github.com/slipperking/complex-analysis" aria-label="GitHub source">
        <img class="icon" src="../assets/github.svg" alt="GitHub">
      </a>
    </div>
  </header>
  <div class="layout">
    <main class="content search-page" id="main">
      <h1 class="page-title">Search</h1>
      <p class="search-warning">Search functionality is still experimental, and math expressions do not work well yet.</p>
      <p class="search-summary" id="search-summary">Enter prose, a symbol, or MathML to search the notes.</p>
      <section class="search-results" id="search-results" aria-live="polite">
        <div class="search-empty">Search results will appear here.</div>
      </section>
    </main>
  </div>
  <script src="../assets/search-index.js"></script>
  <script src="../assets/site.js"></script>
  <script src="../assets/search.js"></script>
</body>
</html>
"""


def write_search_page(dist_dir: Path) -> None:
    search_dir = dist_dir / "search"
    search_dir.mkdir(parents=True, exist_ok=True)
    (search_dir / "index.html").write_text(search_page_html(), encoding="utf-8")


def copy_search_assets(root_dir: Path, dist_dir: Path) -> None:
    asset_dir = dist_dir / "assets"
    asset_dir.mkdir(parents=True, exist_ok=True)
    for name in ("search.css", "search.js"):
        source = root_dir / "src" / "assets" / name
        (asset_dir / name).write_text(source.read_text(encoding="utf-8"), encoding="utf-8")


def main() -> None:
    root_dir = Path(__file__).resolve().parent.parent
    dist_dir = root_dir / "dist"
    if not dist_dir.exists():
        raise SystemExit("dist directory not found; compile the Typst bundle first.")

    pages = collect_pages(root_dir, dist_dir)
    copy_search_assets(root_dir, dist_dir)
    write_search_index(dist_dir, pages)
    write_search_page(dist_dir)
    print(f"indexed {len(pages)} pages into {dist_dir / 'assets' / 'search-index.js'}")


if __name__ == "__main__":
    main()
