#import "/lib.typ": *
#set heading(numbering: none)
#route-folders.update(())
#thm-counter.thm-counters.update((:))
#thm-state.thm-stored.update(())

#include "cover.typ"
#set heading(numbering: "1.1")
#counter(heading).update(0)
#include "prerequisites_calc_top/index.typ"
#include "introduction_to_complex_functions/index.typ"
#include "complex_integration/index.typ"
#include "weierstrass_theory/index.typ"
#include "geometric_conformal_mappings/index.typ"
#include "rational_approximation_theory/index.typ"
#include "harmonic_functions/index.typ"
#include "differential_geometry/index.typ"
#include "multivariable/index.typ"
#include "special_classes_of_holomorphic_functions/index.typ"
#include "connections_to_number_theory/index.typ"
#include "riemann_surfaces/index.typ"
#include "nevanlinna_theory/index.typ"

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
