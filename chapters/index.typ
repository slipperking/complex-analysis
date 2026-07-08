#import "/lib.typ": *
#set heading(numbering: none)
#route-folders.update(())
#thm-counter.thm-counters.update((:))
#thm-state.thm-stored.update(())

#include "cover.typ"
#set heading(numbering: "1.1")
#counter(heading).update(0)
#include "prerequisites-calculus-topology/index.typ"
#include "introduction-to-complex-functions/index.typ"
#include "complex-integration/index.typ"
#include "weierstrass-theory/index.typ"
#include "geometric-conformal-mappings/index.typ"
#include "rational-approximation-theory/index.typ"
#include "harmonic-functions/index.typ"
#include "differential-geometry/index.typ"
#include "multivariable/index.typ"
#include "special-classes-of-holomorphic-functions/index.typ"
#include "connections-to-number-theory/index.typ"
#include "analytic-continuation-and-riemann-surfaces/index.typ"
#include "nevanlinna-theory/index.typ"

#context if render-mode.get() == "pdf" {
  pagebreak()
}

#set heading(numbering: "A.1")
#counter(heading).update(0)
#route-folders.update(("appendices",))
#include "appendices/index.typ"

#docs-backmatter(title: [Bibliography], route: "bibliography")[
  #bibliography("/references.bib", full: true)
]
