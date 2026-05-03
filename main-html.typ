#import "/lib.typ": *
#import "paper-styles.typ": paper-styles, html-show-rules, chapter-section

#show: paper-styles
#show: html-show-rules

#set document(
  title: "Notes on Complex Analysis",
  author: "Slipper King",
)

#chapter-section("cover")[
  #include "chapters/cover.typ"
]

#chapter-section("prerequisites")[
  #include "chapters/prerequisites_calc_top/index.typ"
]

#chapter-section("complex-prerequisites")[
  #include "chapters/prerequisites_complex/index.typ"
]

#chapter-section("complex-integration")[
  #include "chapters/complex_integration/index.typ"
]

#chapter-section("bibliography")[
  #bibliography("references.bib", full: true)
]
