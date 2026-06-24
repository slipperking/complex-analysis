#import "/lib.typ": *
#show: docs-chapter.with(
  title: [Analytic Continuation and Riemann Surfaces],
  route: "riemann_surfaces",
  children: [
    #include "analytic_continuation/index.typ"
    #include "continuation_along_curves/index.typ"
    #include "definition/index.typ"
    #include "analytic_function_elements/index.typ"
    #include "monodromy_theorem/index.typ"
    #include "sheaf_of_germs/index.typ"
    #include "uniformization/index.typ"

  ],
  label: <sec:riemannsurfaces>,
)
