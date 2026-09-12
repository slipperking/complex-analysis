# Notes on Complex Analysis

*Disclaimer: Readme was written with LLMs.*

A set of complex analysis notes, written in Typst and published
from a single source as both a paged PDF and a website. The web
build uses Typst's experimental `html` and `bundle` features.

Project links: [source repository](https://github.com/slipperking/complex-analysis)
and [published website](https://slipperking.github.io/complex-analysis/).

## Requirements

- Python 3.12 or newer, with the packages in `requirements.txt`.
- The repository's modified Typst 0.15 compiler. On Windows, this is
  `typst.exe`.

The patched compiler raises Typst's convergence limit from 5 to 25 passes and adds selector targets for references. 

## Building

Install the Python dependencies once:

```powershell
python -m pip install -r requirements.txt
```

A complete production build consists of preprocessing, Typst compilation, and
search-index generation:

```powershell
python scripts/build.py
./typst.exe compile --features bundle,html --format bundle --package-path packages main.typ dist
python build-search-index.py
```

The result is a static website in `dist/`, including the routed HTML pages,
assets, search index, and the downloadable PDF at `dist/pdf/notes.pdf`.

`scripts/build.py` runs every other Python script below `scripts/`. These scripts generate the geometric data for visuals under `build/visual-output/`.

`build-search-index.py` runs after the bundle exists by scanning the generated
HTML, copying the search assets, and writing the index. A list of todos exist at the `/todo` subdirectory.

The optional `hide-figures` input may be passed to skip drawings produced through the
project's `canvas` helper (including `quick-plot`) while working on prose,
equations, or layout:

```powershell
./typst.exe compile --features bundle,html --format bundle --package-path packages --input hide-figures=true main.typ dist
```

This only shortens the Typst compilation step; preprocessing and search-index
generation are unchanged when they are needed. Figures are rendered normally
when the input is omitted or has any value other than the string `true`.
Individual canvases can be opted back in during a hidden-figure build with
`canvas(debug-show: true, ...)`.

To build with the older modified compiler that only raises the convergence
limit, enable the legacy synthetic-label routing used by `lbl`:

```powershell
./typst.exe compile --features bundle,html --format bundle --package-path packages --input legacy-label-routing=true main.typ dist
```

In this compatibility mode, repeated PDF/HTML labels should continue to use
`lbl`; ordinary labels shared by both outputs require the newer compiler.

## Project structure

```text
.
|-- main.typ                 # Build entry point; calls notes()
|-- lib.typ                  # Shared public imports used by chapters
|-- chapters/                # Hierarchical mathematical content and routes
|   |-- index.typ            # Chapter order, numbering, and bibliography
|   `-- appendices/          # Table of figures and theorem list
|-- src/
|   |-- source.typ           # Title, authors, abstract, cover, and source URL
|   |-- components/
|   |   |-- web.typ          # PDF/bundle orchestration and routed page helpers
|   |   |-- styles.typ       # Shared PDF and web document styles
|   |   |-- references.typ   # Cross-output labels and reference formatting
|   |   |-- theorems.typ     # Theorem environments
|   |   |-- graphics.typ     # CetZ helpers and figure collection
|   |   |-- math.typ         # Project-wide mathematical helpers
|   |   |-- packages.typ     # Typst package imports
|   |   `-- ctheorems/       # Local customized theorem implementation
|   `-- assets/              # CSS, JavaScript, icons, and bundled fonts
|-- scripts/                 # Python visual-data preprocessors and runner
|-- build-search-index.py    # Post-processes dist/ for client-side search
|-- references.bib           # Bibliography database
|-- requirements.txt         # Python preprocessing dependencies
|-- packages/                # Local Typst package path (currently empty)
|-- build/                   # Generated preprocessing output (ignored)
`-- dist/                    # Generated website and PDF bundle (ignored)
```

Chapter files import `lib.typ` and declare their place in the output with
helpers such as `docs-chapter`, `docs-subchapter`, `docs-subsubchapter`, and
`docs-appendix`. `src/components/web.typ` uses those declarations to produce
one continuous PDF document and the corresponding nested website routes.

The `--package-path packages` option is retained for local-package support,
although the custom packages previously stored there have now been incorporated
or refactored into `src/components/`.

## License

See [LICENSE](LICENSE) for details.
