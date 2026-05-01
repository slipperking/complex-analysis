#import "/lib.typ": *

#set par(justify: true)
#set heading(numbering: "1.1")

#let math_numbering = dependent-numbering("(1.1)", levels: 2)

#show math.equation: it => {
  if it.fields().keys().contains("label") {
    math.equation(block: true, numbering: math_numbering, it)
  } else {
    it
  }
}

#show ref: it => {
  let el = it.element
  if el != none and el.func() == math.equation {
    link(el.location(), numbering(
      math_numbering,
      counter(math.equation).at(el.location()).at(0) + 1
    ))
  } else {
    it
  }
}

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
