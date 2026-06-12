# Notes on Complex Analysis

This repository contains a Typst version of the notes *Notes on Complex Analysis* by Slipper King.

## Build

To build both the HTML and PDF, run:

```bash
uv run web/build.py
```

The script relies on Typst 0.14.2. To build just the PDF directly, run:

```bash
typst compile --features html --package-path packages main.typ main.pdf
```

## Project Layout

- `main.typ` is the document entry point.
- `chapters/` contains the chapter content.
- `lib.typ` and `show-rules.typ` hold shared formatting and helpers.
- `references.bib` stores bibliography entries.

## License

See [LICENSE](LICENSE) for details.
