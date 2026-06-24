#import "/lib.typ": *
#show: docs-chapter.with(
  title: [The Geometric Theory of Conformal Mappings],
  route: "geometric_conformal_mappings",
  children: [
    #include "biholomorphy/index.typ"
    #include "normal_families/index.typ"
    #include "riemann_mapping_theorem/index.typ"
    #include "schwarz_christoffel/index.typ"
    #include "schwarz_reflection_principle/index.typ"
  ],
)
