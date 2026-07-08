#import "/lib.typ": *
#show: docs-chapter.with(
  title: [Analytic Continuation and Riemann Surfaces],
  route: "analytic-continuation-and-riemann-surfaces",
  children: [
    #include "analytic-function-elements/index.typ"
    #include "analytic-continuation-along-curves/index.typ"
    #include "monodromy-theorem/index.typ"
    #include "sheaf-of-germs/index.typ"

  ],
  label: <sec:analytic-continuation-and-riemann-surfaces>,
)
