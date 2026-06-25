#import "/lib.typ": *
#show: docs-chapter.with(
  title: [The Geometric Theory of Conformal Mappings],
  route: "geometric-conformal-mappings",
  children: [
    #include "biholomorphy/index.typ"
    #include "normal-families/index.typ"
    #include "riemann-mapping-theorem/index.typ"
    #include "schwarz-christoffel-transformation/index.typ"
    #include "schwarz-reflection-principle/index.typ"
  ],
)
