#import "/lib.typ": *
#show: docs-chapter.with(
  title: [Differential Geometry],
  route: "differential-geometry",
  children: [
    #include "gaussian-curvature-of-a-surface/index.typ"
    #include "metrics-and-curvature/index.typ"
    #include "schwarz-pick-ahlfors/index.typ"
    #include "spherical-generalization-of-normal-families/index.typ"
    #include "picard-bloch-landau-schottky/index.typ"
  ],
  label: <sec:differential-geometry>,
)
