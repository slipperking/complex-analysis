#import "/lib.typ": *
#show: docs-chapter.with(
  title: [Introduction to Complex Functions],
  route: "introduction-to-complex-functions",
  children: [
    #include "extended_plane_sphericality/index.typ"
    #include "complex_differentiation/index.typ"
    #include "complex_power_series/index.typ"
    #include "conformality/index.typ"
    #include "elementary_functions/index.typ"
  ],
)
