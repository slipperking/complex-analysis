# /// script
# dependencies = ["beautifulsoup4", "pagefind[extended]"]
# ///
"""
Build script for the HTML version of these complex analysis notes.

Usage:
    uv run web/build.py
    uv run web/build.py --skip-pdf
    uv run web/build.py --skip-compile
"""

import argparse
import json
import posixpath
import re
import shutil
import subprocess
import sys
from pathlib import Path, PurePosixPath

try:
    from bs4 import BeautifulSoup, Tag
except ImportError:
    print("Error: beautifulsoup4 required. Run with: uv run web/build.py")
    sys.exit(1)

ROOT = Path(__file__).resolve().parent.parent
WEB_DIR = ROOT / "web"
DIST_DIR = WEB_DIR / "dist"
ASSETS_SRC = WEB_DIR / "assets"

LANG = "en"

THESIS_TITLE = "Notes on Complex Analysis"

GITHUB_URL = "https://github.com/slipperking/complex-analysis"
BASE_URL = "/"  # overridden by --base-url CLI arg


ICON_HAMBURGER = '<svg width="20" height="20" viewBox="0 0 20 20" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 5h14M3 10h14M3 15h14"/></svg>'
ICON_SEARCH = '<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/></svg>'
ICON_GITHUB = '<svg width="20" height="20" viewBox="0 0 16 16" fill="currentColor"><path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27s1.36.09 2 .27c1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.01 8.01 0 0 0 16 8c0-4.42-3.58-8-8-8z"/></svg>'
ICON_TOC = '<svg width="20" height="20" viewBox="0 0 20 20" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 4h14M3 8h10M3 12h12M3 16h8"/></svg>'
ICON_THEME_LIGHT = '<svg viewBox="0 0 512 512" width="18" height="18" aria-hidden="true" fill="currentColor"><path d="M361.5 1.2c5 2.1 8.6 6.6 9.6 11.9L391 121l107.9 19.8c5.3 1 9.8 4.6 11.9 9.6s1.5 10.7-1.6 15.2L446.9 256l62.3 90.3c3.1 4.5 3.7 10.2 1.6 15.2s-6.6 8.6-11.9 9.6L391 391 371.1 498.9c-1 5.3-4.6 9.8-9.6 11.9s-10.7 1.5-15.2-1.6L256 446.9l-90.3 62.3c-4.5 3.1-10.2 3.7-15.2 1.6s-8.6-6.6-9.6-11.9L121 391 13.1 371.1c-5.3-1-9.8-4.6-11.9-9.6s-1.5-10.7 1.6-15.2L65.1 256 2.8 165.7c-3.1-4.5-3.7-10.2-1.6-15.2s6.6-8.6 11.9-9.6L121 121 140.9 13.1c1-5.3 4.6-9.8 9.6-11.9s10.7-1.5 15.2 1.6L256 65.1 346.3 2.8c4.5-3.1 10.2-3.7 15.2-1.6zM160 256a96 96 0 1 1 192 0 96 96 0 1 1 -192 0zm224 0a128 128 0 1 0 -256 0 128 128 0 1 0 256 0z"></path></svg>'


# ---------------------------------------------------------------------------
# Step 1: Compile Typst -> HTML
# ---------------------------------------------------------------------------

def compile_typst() -> Path:
    """Compile the notes to a single HTML file."""
    full_html = DIST_DIR / "full-en.html"
    DIST_DIR.mkdir(parents=True, exist_ok=True)
    cmd = [
        "typst", "compile",
        "--features", "html",
        "--format", "html",
        "--input", f"lang={LANG}",
        "--input", "html=true",
        str(ROOT / "main.typ"),
        str(full_html),
    ]
    print(f"  Compiling HTML ({LANG}): {' '.join(cmd[-3:])}")
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        for line in result.stderr.splitlines():
            if line.startswith("error:"):
                print(line, file=sys.stderr)
        sys.exit(1)
    warnings = [l for l in result.stderr.splitlines() if l.startswith("warning:")]
    if warnings:
        print(f"    ({len(warnings)} warnings suppressed)")
    print(f"    -> {full_html.name} ({full_html.stat().st_size // 1024} KB)")
    return full_html


# ---------------------------------------------------------------------------
# Step 2: Compile PDFs
# ---------------------------------------------------------------------------

def compile_pdfs():
    """Compile the PDF notes."""
    pdf_dir = DIST_DIR / "pdf"
    pdf_dir.mkdir(parents=True, exist_ok=True)
    out = pdf_dir / "notes.pdf"
    cmd = [
        "typst", "compile",
        "--features", "html", # so that target works
        str(ROOT / "main.typ"),
        str(out),
    ]
    print("  Compiling PDF...")
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        for line in result.stderr.splitlines():
            if line.startswith("error:"):
                print(line, file=sys.stderr)
        print("  WARNING: PDF compilation failed", file=sys.stderr)
        return
    warnings = [l for l in result.stderr.splitlines() if l.startswith("warning:")]
    if warnings:
        print(f"    ({len(warnings)} warnings suppressed)")
    print(f"    -> pdf/notes.pdf ({out.stat().st_size // 1024} KB)")


# ---------------------------------------------------------------------------
# Step 3: Parse and split into chapters
# ---------------------------------------------------------------------------

def ensure_anchor_id(node: Tag, fallback_text: str) -> str:
    """Ensure a node has an anchor id, generating one from text if needed."""
    node_id = node.get("id", "")
    if node_id:
        return node_id
    node_id = re.sub(r"[^\w-]", "-", fallback_text.lower())[:60].strip("-")
    if not node_id:
        node_id = "section"
    node["id"] = node_id
    return node_id


def theorem_toc_entry(theorem_box: Tag, section: Tag, level: int) -> dict | None:
    """Build a local TOC entry for theorem-like blocks."""
    classes = theorem_box.get("class", [])
    if "thm-box" not in classes or "thm-remark" in classes:
        return None

    head = theorem_box.find("p", class_="thm-head")
    if head is None:
        return None

    text = " ".join(head.get_text(" ", strip=True).split())
    if not text:
        return None

    anchor = theorem_box
    while isinstance(anchor.parent, Tag) and anchor.parent is not section and not anchor.get("id"):
        anchor = anchor.parent
    anchor_id = ensure_anchor_id(anchor, text)

    return {
        "level": level,
        "kind": "theorem",
        "id": anchor_id,
        "text": text,
        "html": head.decode_contents().strip(),
    }


def extract_local_toc(section: Tag) -> list[dict]:
    """Extract h2/h3 headings and theorem-like blocks from a section for the local TOC."""
    toc = []
    current_heading_level = 2

    for node in section.descendants:
        if not isinstance(node, Tag):
            continue

        if node.name in {"h2", "h3"}:
            heading_id = ensure_anchor_id(node, node.get_text(strip=True))
            current_heading_level = int(node.name[1])
            toc.append({
                "level": current_heading_level,
                "kind": "heading",
                "id": heading_id,
                "text": node.get_text(strip=True),
                "html": heading_inner_html(node),
            })
            continue

        entry = theorem_toc_entry(node, section, level=current_heading_level + 1)
        if entry is not None:
            toc.append(entry)

    return toc


def section_filename(section_id: str) -> str:
    """Map a top-level section id to its output filename."""
    return "index.html" if section_id == "cover" else f"{section_id}/index.html"


def relative_href(current_file: str, target_file: str, anchor: str | None = None) -> str:
    """Build a relative link from one generated page to another."""
    current_dir = PurePosixPath(current_file).parent.as_posix()
    rel = posixpath.relpath(target_file, current_dir if current_dir != "." else ".")
    if rel == "index.html":
        rel = "./"
    elif rel.endswith("/index.html"):
        rel = rel[: -len("index.html")]
    return f"{rel}#{anchor}" if anchor else rel


def asset_href(current_file: str, asset_path: str) -> str:
    """Build a relative link from a generated page to a shared asset."""
    current_dir = (PurePosixPath(LANG) / PurePosixPath(current_file)).parent.as_posix()
    return posixpath.relpath(asset_path, current_dir if current_dir != "." else ".")


def clean_nav_title_text(text: str) -> str:
    """Remove displayed numbering prefixes from plain-text navigation labels."""
    text = " ".join(text.split())
    text = re.sub(r"^Chapter\s+\d+:\s*", "", text)
    text = re.sub(r"^\d+(?:\.\d+)*\s+", "", text)
    return text.strip()


def clean_nav_title_html(heading: Tag) -> str:
    """Remove displayed numbering prefixes from a heading while preserving inline HTML."""
    cloned = BeautifulSoup(str(heading), "html.parser").find(heading.name)
    if cloned is None:
        return ""

    first_text = cloned.find(string=True)
    if first_text is not None:
        cleaned = re.sub(r"^\s*Chapter\s+\d+:\s*", "", str(first_text))
        cleaned = re.sub(r"^\s*\d+(?:\.\d+)*\s+", "", cleaned)
        first_text.replace_with(cleaned)

    return cloned.decode_contents().strip()


def heading_inner_html(heading: Tag) -> str:
    """Preserve a heading's inline HTML exactly as rendered."""
    cloned = BeautifulSoup(str(heading), "html.parser").find(heading.name)
    if cloned is None:
        return ""
    return cloned.decode_contents().strip()


def discover_structure(soup: BeautifulSoup) -> tuple[list[tuple[str, str, str]], list[tuple[str, str, str, str]], dict[str, int], list[tuple[str | None, list[str]]]]:
    """Discover pages and navigation entries from chapter-section blocks."""
    pages: list[tuple[str, str, str]] = []
    nav_items: list[tuple[str, str, str, str]] = []
    nav_depths: dict[str, int] = {}

    for section in soup.find_all("section", class_="chapter"):
        sid = section.get("id", "")
        if not sid:
            continue

        title_heading = section.find(["h1", "h2", "h3"], recursive=False)
        if title_heading is not None and title_heading.name.startswith("h"):
            depth = max(0, int(title_heading.name[1]) - 1)
        else:
            attr_depth = section.get("data-nav-depth")
            if attr_depth is not None:
                try:
                    depth = max(0, int(attr_depth))
                except ValueError:
                    depth = len(section.find_parents("section", class_="chapter"))
            else:
                depth = len(section.find_parents("section", class_="chapter"))
        page_title = clean_nav_title_text(title_heading.get_text(" ", strip=True)) if title_heading else sid.replace("-", " ").title()
        nav_title_html = clean_nav_title_html(title_heading) if title_heading else page_title
        if sid == "cover":
            page_title = "Home"
            nav_title_html = "Home"

        filename = section_filename(sid)
        pages.append((sid, filename, page_title))
        nav_items.append((sid, filename, page_title, nav_title_html))
        nav_depths[sid] = depth

    parts = [(None, [sid for sid, _href, _title, _nav_html in nav_items])]
    return pages, nav_items, nav_depths, parts


def build_global_nav(
    nav_items: list[tuple[str, str, str, str]],
    parts: list[tuple],
    current_id: str,
    nav_depths: dict[str, int],
    current_file: str,
) -> tuple[str, list[str]]:
    """Build the global navigation sidebar HTML."""
    chapter_map = {sid: (href, title, nav_title_html) for sid, href, title, nav_title_html in nav_items}

    def build_nav_tree(section_ids: list[str]) -> list[dict]:
        roots: list[dict] = []
        stack: list[tuple[int, dict]] = []

        for sid in section_ids:
            depth = nav_depths.get(sid, 0)
            node = {"sid": sid, "depth": depth, "children": []}

            while stack and stack[-1][0] >= depth:
                stack.pop()

            if stack:
                stack[-1][1]["children"].append(node)
            else:
                roots.append(node)

            stack.append((depth, node))

        return roots

    def render_nodes(nodes: list[dict], level: int = 0) -> tuple[list[str], bool, list[str]]:
        indent = "  " * level
        lines = [f"{indent}<ul>"]
        contains_active = False
        active_group_ids: list[str] = []

        for node in nodes:
            sid = node["sid"]
            target_file, _title, nav_title_html = chapter_map[sid]
            depth = node["depth"]
            node_is_active = sid == current_id
            classes = []
            if node_is_active:
                classes.append("active")
            if depth > 0:
                classes.append("nav-sub")
                classes.append(f"nav-depth-{depth}")
            if node["children"]:
                classes.append("nav-parent")

            cls = f' class="{" ".join(classes)}"' if classes else ""
            href = relative_href(current_file, target_file)
            lines.append(f"{indent}  <li{cls}>")

            if node["children"]:
                controls_id = f"nav-group-{sid}"
                child_lines, child_contains_active, child_active_group_ids = render_nodes(node["children"], level + 3)
                node_contains_active = node_is_active or child_contains_active
                lines.append(f'{indent}    <div class="nav-item-row">')
                lines.append(
                    f'{indent}      <a href="{href}">{nav_title_html}</a>'
                )
                lines.append(
                    f'{indent}      <button class="nav-collapse-toggle" type="button" '
                    f'aria-expanded="true" aria-label="Collapse subsection" '
                    f'aria-controls="{controls_id}"></button>'
                )
                lines.append(f"{indent}    </div>")
                lines.append(f'{indent}    <div class="nav-children" id="{controls_id}">')
                lines.extend(child_lines)
                lines.append(f"{indent}    </div>")
                if node_contains_active:
                    active_group_ids.append(controls_id)
                active_group_ids.extend(child_active_group_ids)
                contains_active = contains_active or node_contains_active
            else:
                lines.append(f'{indent}    <a href="{href}">{nav_title_html}</a>')
                contains_active = contains_active or node_is_active

            lines.append(f"{indent}  </li>")

        lines.append(f"{indent}</ul>")
        return lines, contains_active, active_group_ids

    lines = ['<nav class="global-nav" aria-label="Global navigation">']
    active_nav_groups: list[str] = []
    for part_title, section_ids in parts:
        if part_title:
            lines.append(f'  <div class="nav-part">{part_title}</div>')
        part_lines, _part_contains_active, part_active_groups = render_nodes(build_nav_tree(section_ids), 1)
        lines.extend(part_lines)
        active_nav_groups.extend(part_active_groups)
    lines.append("</nav>")
    return "\n".join(lines), active_nav_groups


def build_local_toc(toc: list[dict], lang: str) -> str:
    """Build the local TOC sidebar HTML."""
    if not toc:
        return ""
    title = "On this page"
    lines = [f'<nav class="local-toc" aria-label="{title}">']
    lines.append(f"  <h3>{title}</h3>")
    lines.append("  <ul>")
    for item in toc:
        indent = "    " if item["level"] == 2 else "      "
        classes = []
        if item["level"] >= 3:
            classes.append(f'toc-l{item["level"]}')
        if item.get("kind") == "heading":
            classes.append("toc-page")
        elif item.get("kind") == "theorem":
            classes.append("toc-theorem")
        cls = f' class="{" ".join(classes)}"' if classes else ""
        label_html = item.get("html") or item["text"]
        lines.append(f'{indent}<li{cls}><a href="#{item["id"]}">{label_html}</a></li>')
    lines.append("  </ul>")
    lines.append("</nav>")
    return "\n".join(lines)


def build_page(
    section_html: str,
    global_nav: str,
    active_nav_groups: list[str],
    local_toc: str,
    title: str,
    thesis_title: str,
    prev_link: tuple[str, str] | None,
    next_link: tuple[str, str] | None,
    lang: str,
    current_file: str,
) -> str:
    """Assemble a complete HTML page with topbar."""
    prev_btn = f'<a href="{relative_href(current_file, prev_link[0])}" class="nav-prev">&larr; {prev_link[1]}</a>' if prev_link else '<span></span>'
    next_btn = f'<a href="{relative_href(current_file, next_link[0])}" class="nav-next">{next_link[1]} &rarr;</a>' if next_link else '<span></span>'

    search_label = "Search"
    home_href = relative_href(current_file, "index.html")
    favicon_href = asset_href(current_file, "assets/favicon.svg")
    stylesheet_href = asset_href(current_file, "assets/style.css")
    modifications_script_href = asset_href(current_file, "assets/modifications.js")
    active_nav_groups_json = json.dumps(active_nav_groups)

    return f"""<!DOCTYPE html>
<html lang="{lang}" data-theme="light">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{title} — {thesis_title}</title>
  <meta name="author" content="Fabien Mathieu">
  <meta name="pagefind-base" content="{BASE_URL}">
  <link rel="icon" href="{favicon_href}" type="image/svg+xml">
  <link rel="stylesheet" href="{stylesheet_href}">
  <script>
    (function(){{
      var t=localStorage.getItem("theme")||"auto";
      if(t==="auto")t=matchMedia("(prefers-color-scheme:dark)").matches?"dark":"light";
      document.documentElement.dataset.theme=t;
    }})();
  </script>
  <script>
    (function(){{
      var activeNavGroups = {active_nav_groups_json};
      var collapsed = {{}};
      try {{
        collapsed = JSON.parse(sessionStorage.getItem("global-nav-collapsed") || "{{}}") || {{}};
      }} catch (_err) {{
        collapsed = {{}};
      }}
      for (var i = 0; i < activeNavGroups.length; i++) {{
        delete collapsed[activeNavGroups[i]];
      }}
      var ids = Object.keys(collapsed).filter(function(id) {{ return collapsed[id]; }});
      if (!ids.length) return;
      var style = document.createElement("style");
      style.id = "nav-collapsed-state";
      style.textContent = ids.map(function(id) {{
        return "#" + id + "{{display:none;}}";
      }}).join("");
      document.head.appendChild(style);
    }})();
  </script>
</head>
<body>
  <header class="topbar" data-pagefind-ignore>
    <div class="topbar-left">
      <button class="sidebar-toggle-btn" id="sidebar-toggle-left" aria-label="Menu">{ICON_HAMBURGER}</button>
      <a href="{home_href}" class="topbar-title">{thesis_title}</a>
    </div>
    <div class="topbar-right">
      <button class="search-trigger" aria-label="{search_label} (Ctrl+K)">{ICON_SEARCH} <kbd>Ctrl+K</kbd></button>
      <button class="theme-toggle" aria-label="Toggle theme" title="Toggle theme">{ICON_THEME_LIGHT}</button>
      <a href="{GITHUB_URL}" class="github-link" aria-label="GitHub" target="_blank" rel="noopener">{ICON_GITHUB}</a>
      <button class="sidebar-toggle-btn" id="sidebar-toggle-right" aria-label="Table of contents">{ICON_TOC}</button>
    </div>
  </header>
  <div class="layout">
    <aside class="sidebar-left" data-pagefind-ignore>
      {global_nav}
    </aside>
    <main class="content">
      {section_html}
      <footer class="page-nav" data-pagefind-ignore>
        {prev_btn}
        {next_btn}
      </footer>
    </main>
    <aside class="sidebar-right" data-pagefind-ignore>
      {local_toc}
    </aside>
  </div>
  <div class="sidebar-backdrop" id="sidebar-backdrop"></div>
  <div class="search-overlay" id="search-overlay">
    <div class="search-dialog">
      <div class="search-header">
        <input type="text" class="search-input" id="search-input" placeholder="{search_label}..." autocomplete="off">
        <kbd class="search-close">Esc</kbd>
      </div>
      <div class="search-results" id="search-results"></div>
    </div>
  </div>
  <script src="{modifications_script_href}"></script>
</body>
</html>"""


def split_and_generate(full_html: Path):
    """Parse the full HTML, split by sections, generate individual pages."""
    thesis_title = THESIS_TITLE
    lang = LANG
    out_dir = DIST_DIR / lang
    out_dir.mkdir(parents=True, exist_ok=True)

    print(f"  Parsing HTML ({lang})...")
    soup = BeautifulSoup(full_html.read_text(encoding="utf-8"), "html.parser")
    pages, nav_items, nav_depths, parts = discover_structure(soup)

    # Find all chapter sections
    chapter_map = {sid: (fname, title) for sid, fname, title in pages}
    sections: dict[str, Tag] = {}

    for section in soup.find_all("section", class_="chapter"):
        sid = section.get("id", "")
        if sid in chapter_map:
            sections[sid] = section

    print(f"    Found {len(sections)} chapter sections")

    # Extract endnotes (footnotes)
    endnotes_section = soup.find("section", attrs={"role": "doc-endnotes"})
    footnote_map: dict[str, Tag] = {}
    if endnotes_section:
        for li in endnotes_section.find_all("li", id=True):
            footnote_map[li["id"]] = li
        print(f"    Found {len(footnote_map)} footnotes")

    # Build id -> filename map for cross-chapter link rewriting
    id_to_file: dict[str, str] = {}
    for sid, fname, _title in pages:
        if sid not in sections:
            continue
        id_to_file[sid] = fname
        for elem in sections[sid].find_all(attrs={"id": True}):
            id_to_file[elem["id"]] = fname

    # Map footnote IDs to chapter files
    if footnote_map:
        for sid, fname, _title in pages:
            if sid not in sections:
                continue
            for ref_a in sections[sid].find_all("a", attrs={"role": "doc-noteref"}):
                target_id = ref_a.get("href", "").lstrip("#")
                if target_id in footnote_map:
                    id_to_file[target_id] = fname

    cross_links_total = 0

    # Generate each page
    for i, (sid, fname, title) in enumerate(pages):
        if sid not in sections:
            print(f"    WARNING: section '{sid}' not found, skipping")
            continue

        section = sections[sid]
        page_section = BeautifulSoup(str(section), "html.parser").find("section")
        if page_section is None:
            print(f"    WARNING: section '{sid}' could not be cloned, skipping")
            continue

        # Parent chapter pages should not inline the full bodies of nested chapter-section pages.
        # Those nested sections get their own generated pages and nav entries.
        for nested in page_section.find_all("section", class_="chapter"):
            nested.decompose()

        local_toc = extract_local_toc(page_section)
        global_nav, active_nav_groups = build_global_nav(nav_items, parts, sid, nav_depths, fname)
        local_toc_html = build_local_toc(local_toc, lang)

        prev_link = (nav_items[i - 1][1], nav_items[i - 1][3]) if i > 0 else None
        next_link = (nav_items[i + 1][1], nav_items[i + 1][3]) if i < len(pages) - 1 else None

        # Rewrite cross-chapter href="#id" to href="other-file.html#id"
        cross_links = 0
        for a_tag in page_section.find_all("a", href=True):
            href = a_tag["href"]
            if href.startswith("#"):
                target_id = href[1:]
                target_file = id_to_file.get(target_id)
                if target_file and target_file != fname:
                    a_tag["href"] = relative_href(fname, target_file, target_id)
                    cross_links += 1

        # Collect footnotes for this chapter
        footnotes_html = ""
        if footnote_map:
            noterefs = page_section.find_all("a", attrs={"role": "doc-noteref"})
            chapter_footnotes = []
            for ref_a in noterefs:
                target_id = ref_a.get("href", "").lstrip("#")
                if target_id in footnote_map:
                    chapter_footnotes.append(footnote_map[target_id])
            if chapter_footnotes:
                for fn in chapter_footnotes:
                    for a_tag in fn.find_all("a", href=True):
                        href = a_tag["href"]
                        if href.startswith("#"):
                            tid = href[1:]
                            target_file = id_to_file.get(tid)
                            if target_file and target_file != fname:
                                a_tag["href"] = relative_href(fname, target_file, tid)
                                cross_links += 1
                items = "\n".join(fn.decode() for fn in chapter_footnotes)
                footnotes_html = (
                    f'\n<section class="footnotes" role="doc-endnotes">'
                    f'\n<hr>\n<ol style="list-style-type: none">\n{items}\n</ol>'
                    f'\n</section>'
                )

        section_html = page_section.decode_contents() + footnotes_html

        page = build_page(
            section_html=section_html,
            global_nav=global_nav,
            active_nav_groups=active_nav_groups,
            local_toc=local_toc_html,
            title=title,
            thesis_title=thesis_title,
            prev_link=prev_link,
            next_link=next_link,
            lang=lang,
            current_file=fname,
        )

        cross_links_total += cross_links
        out_path = out_dir / fname
        out_path.parent.mkdir(parents=True, exist_ok=True)
        out_path.write_text(page, encoding="utf-8")
        print(f"    -> {lang}/{out_path.relative_to(out_dir).as_posix()} ({len(local_toc)} TOC, {cross_links} xlinks)")

    print(f"    Total cross-chapter links rewritten: {cross_links_total}")


# ---------------------------------------------------------------------------
# Step 4: Generate redirect index
# ---------------------------------------------------------------------------

def generate_redirect_index():
    """Generate dist/index.html redirecting to the notes home page."""
    html = """\
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Notes on Complex Analysis</title>
  <script>window.location.replace("en/index.html");</script>
  <meta http-equiv="refresh" content="0;url=en/index.html">
  <noscript><meta http-equiv="refresh" content="0;url=en/index.html"></noscript>
</head>
<body>
  <p>Redirecting&hellip; <a href="en/index.html">Open the notes</a></p>
</body>
</html>"""
    out = DIST_DIR / "index.html"
    out.write_text(html, encoding="utf-8")
    print(f"  -> index.html (redirect)")


# ---------------------------------------------------------------------------
# Step 5: Copy assets
# ---------------------------------------------------------------------------

def copy_assets():
    """Copy CSS/JS assets to dist/assets/."""
    assets_dist = DIST_DIR / "assets"
    assets_dist.mkdir(parents=True, exist_ok=True)
    for src in ASSETS_SRC.glob("*"):
        if src.is_file():
            shutil.copy2(src, assets_dist / src.name)
            print(f"  -> assets/{src.name}")


# ---------------------------------------------------------------------------
# Step 6: Run Pagefind
# ---------------------------------------------------------------------------

def run_pagefind():
    """Index the site with Pagefind for search."""
    pf_args = ["--site", str(DIST_DIR), "--output-subdir", "assets/pagefind"]
    # Try several ways to run Pagefind
    candidates = [
        [sys.executable, "-m", "pagefind"] + pf_args,
        ["pagefind"] + pf_args,
        ["npx", "-y", "pagefind"] + pf_args,
    ]
    for cmd in candidates:
        try:
            result = subprocess.run(cmd, capture_output=True, text=True, timeout=120)
            if result.returncode == 0:
                print("  Pagefind indexing complete")
                return
        except (FileNotFoundError, subprocess.TimeoutExpired):
            continue
    print("  WARNING: Pagefind not available, search will be disabled")
    print("  Install with: pip install pagefind, or npm i -g pagefind")


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main():
    parser = argparse.ArgumentParser(description="Build the HTML complex analysis notes")
    parser.add_argument("--skip-pdf", action="store_true", help="Skip PDF compilation")
    parser.add_argument("--skip-compile", action="store_true", help="Skip Typst HTML compilation")
    parser.add_argument("--skip-search", action="store_true", help="Skip Pagefind indexing")
    parser.add_argument("--base-url", default="/", help="Base URL prefix for deployment (e.g. /phd-pagerank/)")
    args = parser.parse_args()

    global BASE_URL
    BASE_URL = args.base_url

    print("=== Building HTML complex analysis notes ===\n")

    lang_dir = DIST_DIR / LANG
    if lang_dir.exists():
        shutil.rmtree(lang_dir)

    # Step 1: Compile HTML for each language
    full_html = None
    if not args.skip_compile:
        print("[1/5] Compiling Typst -> HTML")
        full_html = compile_typst()
    else:
        print("[1/5] Skipping Typst compilation")
        p = DIST_DIR / "full-en.html"
        if not p.exists():
            print(f"  Error: {p.name} not found. Run without --skip-compile first.")
            sys.exit(1)
        full_html = p

    # Step 2: Split and generate pages
    print("\n[2/5] Splitting into chapter pages")
    split_and_generate(full_html)
    try:
        full_html.unlink()
    except FileNotFoundError:
        pass
    except PermissionError:
        print(f"  Warning: could not remove temporary file {full_html.name} because it is still in use.")

    # Step 3: Compile PDFs
    if not args.skip_pdf:
        print("\n[3/5] Compiling PDFs")
        compile_pdfs()
    else:
        print("\n[3/5] Skipping PDF compilation")

    # Step 4: Generate redirect index + copy assets
    print("\n[4/5] Generating assets and index")
    generate_redirect_index()
    copy_assets()

    # Step 5: Pagefind
    if not args.skip_search:
        print("\n[5/5] Running Pagefind search indexer")
        run_pagefind()
    else:
        print("\n[5/5] Skipping search indexing")

    print(f"\nDone! Open {DIST_DIR / 'index.html'} in a browser.")


if __name__ == "__main__":
    main()
