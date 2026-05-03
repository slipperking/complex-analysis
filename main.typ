#import "/lib.typ": *
#import "paper-styles.typ": paper-styles
#show: paper-styles

#align(center)[
  #v(2cm)
  #text(size: 24pt, weight: "bold")[Notes on Complex Analysis]

  #text(size: 13pt)[Slipper King]

  #text(size: 11pt)[May 15, 2025]

  `Source: https://github.com/slipperking/complex-analysis-latex`
]
#outline()
#include "chapters/index.typ"
#bibliography("references.bib", full: true)
