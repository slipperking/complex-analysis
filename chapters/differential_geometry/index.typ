#import "/lib.typ": *
#show: docs-chapter.with(
  title: [Differential Geometry],
  route: "differential_geometry",
  children: [
    #include "gaussian_curvature_of_surface/index.typ"
    #include "metrics_and_curvature/index.typ"
    #include "schwarz_pick_ahlfors/index.typ"
    #include "spherically_normal_families/index.typ"
    #include "picard_bloch_landau_schottky/index.typ"
  ],
  label: <sec:differential_geometry>,
)
