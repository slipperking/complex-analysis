#import "/lib.typ": *
#show: docs-chapter.with(
  title: [Differential Geometry],
  route: "differential-geometry",
  children: [
    #include "gaussian_curvature_of_surface/index.typ"
    #include "metrics_and_curvature/index.typ"
    #include "schwarz-pick-ahlfors/index.typ"
    #include "spherical-generalization-of-normal-families/index.typ"
    #include "picard_bloch_landau_schottky/index.typ"
  ],
  label: <sec:differential-geometry>,
)
