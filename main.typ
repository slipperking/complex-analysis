#import "/lib.typ": *
#import "paper-styles.typ": paper-styles

#show: paper-styles

#set document(
  title: "Notes on Complex Analysis",
  author: "Slipper King",
)
#{
  if not _is-html {
    align(center)[
      #v(2cm)
      #text(size: 24pt, weight: "bold")[Notes on Complex Analysis]

      #text(size: 13pt)[Slipper King]

      #text(size: 11pt)[May 15, 2025]

      `Source: https://github.com/slipperking/complex-analysis`
    ]
    outline()
  } else {
    chapter-section("cover")[
      #html.elem("header", attrs: (class: "paper-header"))[
        #html.elem("h1", attrs: (class: "paper-title"))[
          Notes on Complex Analysis
        ]
        #html.elem("p", attrs: (class: "author"))[by #smallcaps[Slipper King]]
        #html.elem("p", attrs: (class: "date"))[Original LaTeX Version - May 15, 2025]
        #html.elem("p", attrs: (class: "paper-misc"))[
          Original LaTeX Source: https://github.com/slipperking/complex-analysis-latex
        ]
        #html.elem("p", attrs: (class: "paper-misc"))[
          Typst Source: https://github.com/slipperking/complex-analysis
        ]
        #html.elem("p", attrs: (class: "pdf-download"))[
          #html.elem("a", attrs: (href: "../pdf/notes.pdf", class: "btn-pdf"))[
            Download PDF
          ]
        ]
        #html.elem("div", attrs: (class: "abstract"))[
          The conversion process was heavily facilitated by the use of LLMs; thus, there may be errors.
        ]
      ]
      //#outline()
    ]
  }
}

#include "chapters/index.typ"
