#import "/lib.typ": *

#set par(justify: true)
#set heading(numbering: "1.1")

#show: equate.with(number-mode: "label")
#set math.equation(numbering: dependent-numbering("(1.1)", levels: 2))
#show heading: reset-counter(counter(math.equation), levels: 2)
#show: thmrules.with(qed-symbol: $square$)
#set figure(placement: alignment.top)

#align(center)[
  #v(2cm)
  #text(size: 24pt, weight: "bold")[Notes on Complex Analysis]

  #text(size: 13pt)[Slipper King]

  #text(size: 11pt)[May 15, 2025]

  `Source: https://github.com/slipperking/complex-analysis-latex`
]
#outline()
#include "sections/index.typ"
#bibliography("references.bib", full: true)
