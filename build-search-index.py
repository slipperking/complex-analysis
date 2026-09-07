from __future__ import annotations

import json
import re
from pathlib import Path

from lxml import etree, html
from lxml.html import HtmlElement


BLOCK_TAGS = {"p", "li", "h2", "h3", "h4", "h5", "h6", "figcaption"}
BLOCK_CLASSES = {
    "abstract",
    "recommendation",
    "display-math",
    "theorem-list-entry",
    "thm-head",
    "proof-head",
}
COMPOSITE_BLOCK_CLASSES = {"abstract", "recommendation", "theorem-list-entry"}
NOISE_TAGS = {"script", "style"}
NOISE_CLASSES = {
    "page-nav",
    "typst-multi-label-list",
    "eq-tag",
    "equation-tag-group",
    "equation-tag-holder",
    "page-source-heading",
}

SKIP_PATHS = {
    "404.html",
    "search/index.html",
    "todo/index.html",
    "page-not-found/index.html",
}


def normalize_whitespace(value: str) -> str:
    return re.sub(r"\s+", " ", value).strip()


def normalize_text(value: str) -> str:
    return normalize_whitespace(value).casefold()


def node_classes(node: HtmlElement) -> set[str]:
    return set((node.get("class") or "").split())


def is_block_node(node: HtmlElement) -> bool:
    if node.tag == "li" and node.get("role") == "doc-endnote":
        return False
    return node.tag in BLOCK_TAGS or bool(BLOCK_CLASSES.intersection(node_classes(node)))


def is_noise_node(node: HtmlElement) -> bool:
    if node.tag == "sup" and node.get("role") == "doc-backlink":
        return True
    return node.tag in NOISE_TAGS or bool(NOISE_CLASSES.intersection(node_classes(node)))


def is_structure_head(node: HtmlElement) -> bool:
    return bool({"thm-head", "proof-head"}.intersection(node_classes(node)))


def has_indexable_descendant(node: HtmlElement, noise_nodes: set[HtmlElement]) -> bool:
    if node.tag != "li" and not COMPOSITE_BLOCK_CLASSES.intersection(node_classes(node)):
        return False
    return any(
        child not in noise_nodes and is_block_node(child)
        for child in node.iterdescendants()
    )


def node_text(node: HtmlElement, noise_nodes: set[HtmlElement]) -> str:
    pieces: list[str] = []

    def append_text(current: HtmlElement) -> None:
        if current in noise_nodes:
            return
        if current.text:
            pieces.append(current.text)
        for child in current:
            append_text(child)
            if child.tail:
                pieces.append(child.tail)

    append_text(node)
    return normalize_whitespace(" ".join(pieces))


def block_anchor(node: HtmlElement, ordinal: int, used_anchors: set[str]) -> tuple[str, bool]:
    if node.get("id"):
        return str(node.get("id")), False

    anchor = f"search-hit-{ordinal}"
    suffix = 2
    while anchor in used_anchors:
        anchor = f"search-hit-{ordinal}-{suffix}"
        suffix += 1

    node.set("id", anchor)
    used_anchors.add(anchor)
    return anchor, True


def block_context(
    node: HtmlElement,
    main: HtmlElement,
    heading_context: str,
    structural_contexts: dict[HtmlElement, str],
) -> str:
    current = node.getparent()
    while current is not None and current is not main:
        classes = node_classes(current)
        if "thm-box" in classes or "thm-proof" in classes:
            if current not in structural_contexts:
                head = next((child for child in current.iterdescendants() if is_structure_head(child)), None)
                structural_contexts[current] = normalize_whitespace(" ".join(head.itertext())) if head is not None else ""
            return structural_contexts[current]
        current = current.getparent()
    return heading_context


def block_kind(node: HtmlElement) -> str:
    if node.tag in {"h2", "h3", "h4", "h5", "h6"}:
        return "heading"
    if "display-math" in node_classes(node):
        return "math"
    for parent in node.iterancestors():
        classes = node_classes(parent)
        if "thm-proof" in classes:
            return "proof"
        if "thm-box" in classes:
            return "statement"
    return "text"


def block_record(
    node: HtmlElement,
    main: HtmlElement,
    anchor: str,
    noise_nodes: set[HtmlElement],
    heading_context: str,
    structural_contexts: dict[HtmlElement, str],
) -> dict[str, str] | None:
    text = node_text(node, noise_nodes)
    if not text:
        return None

    return {
        "anchor": anchor,
        "context": block_context(node, main, heading_context, structural_contexts),
        "kind": block_kind(node),
        "html": html.tostring(node, encoding="unicode") if any(child.tag == "math" for child in node.iter()) else "",
        "text": text,
        "textNormalized": normalize_text(text),
    }


def collect_pages(dist_dir: Path) -> list[dict[str, object]]:
    pages: list[dict[str, object]] = []

    for path in sorted(dist_dir.rglob("*.html")):
        rel_path = path.relative_to(dist_dir).as_posix()
        if rel_path in SKIP_PATHS:
            continue

        document = html.parse(str(path))
        root = document.getroot()
        main = next(
            (
                node
                for node in root.iter("main")
                if "content" in node_classes(node)
            ),
            None,
        )
        if main is None:
            continue

        title_node = next(
            (node for node in main.iterdescendants() if "page-title" in node_classes(node)),
            None,
        )
        title = normalize_whitespace(" ".join(title_node.itertext()) if title_node is not None else "")
        if not title:
            title_tag = next(root.iter("title"), None)
            title = normalize_whitespace(" ".join(title_tag.itertext()) if title_tag is not None else "Untitled")

        noise_nodes = {node for node in main.iterdescendants() if is_noise_node(node)}
        used_anchors = {str(node.get("id")) for node in root.iter() if node.get("id")}
        blocks = []
        anchors_added = False
        heading_context = ""
        structural_contexts: dict[HtmlElement, str] = {}
        block_nodes = (node for node in main.iterdescendants() if is_block_node(node))
        for ordinal, node in enumerate(block_nodes, start=1):
            if node in noise_nodes or any(parent in noise_nodes for parent in node.iterancestors()):
                continue
            if has_indexable_descendant(node, noise_nodes):
                continue
            if node.tag in {"h2", "h3", "h4", "h5", "h6"}:
                heading_context = node_text(node, noise_nodes)
            anchor, added = block_anchor(node, ordinal, used_anchors)
            record = block_record(
                node,
                main,
                anchor,
                noise_nodes,
                heading_context,
                structural_contexts,
            )
            if record is not None:
                blocks.append(record)
                anchors_added = anchors_added or added

        route = "" if rel_path == "index.html" else rel_path.removesuffix("index.html").rstrip("/")

        pages.append(
            {
                "title": title,
                "titleNormalized": normalize_text(title),
                "path": rel_path,
                "route": route,
                "blocks": blocks,
            }
        )

        if anchors_added:
            doctype = document.docinfo.doctype or "<!DOCTYPE html>"
            path.write_text(
                etree.tostring(root, encoding="unicode", method="html", doctype=doctype),
                encoding="utf-8",
            )

    return pages


def write_search_index(dist_dir: Path, pages: list[dict[str, object]]) -> None:
    payload = {"pages": pages}
    index_js = "window.SEARCH_INDEX = " + json.dumps(payload, ensure_ascii=False, separators=(",", ":")) + ";\n"
    asset_dir = dist_dir / "assets"
    asset_dir.mkdir(parents=True, exist_ok=True)
    (asset_dir / "search-index.js").write_text(index_js, encoding="utf-8")


def copy_search_assets(root_dir: Path, dist_dir: Path) -> None:
    asset_dir = dist_dir / "assets"
    asset_dir.mkdir(parents=True, exist_ok=True)
    for name in ("search.css", "search.js"):
        source = root_dir / "src" / "assets" / name
        (asset_dir / name).write_text(source.read_text(encoding="utf-8"), encoding="utf-8")


def main() -> None:
    root_dir = Path(__file__).resolve().parent
    dist_dir = root_dir / "dist"
    if not dist_dir.exists():
        raise SystemExit("dist directory not found; compile the Typst bundle first.")

    pages = collect_pages(dist_dir)
    copy_search_assets(root_dir, dist_dir)
    write_search_index(dist_dir, pages)
    print(f"indexed {len(pages)} pages into {dist_dir / 'assets' / 'search-index.js'}")


if __name__ == "__main__":
    main()
