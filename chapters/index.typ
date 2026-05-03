#import "/paper-styles.typ": chapter-section, html-show-rules, paper-styles

#chapter-section("prerequisites")[
  #include "/chapters/prerequisites_calc_top/index.typ"
]

#chapter-section("complex-prerequisites")[
  #include "/chapters/prerequisites_complex/index.typ"
]

#chapter-section("complex-integration")[
  #include "/chapters/complex_integration/index.typ"
]

// #chapter-section("weierstrass-theory")[
//   #include "/chapters/weierstrass_theory/index.typ"
// ]

// #chapter-section("riemann-theory")[
//   #include "/chapters/riemann_theory/index.typ"
// ]

// #chapter-section("rational-approximation")[
//   #include "/chapters/rational_approximation_theory/index.typ"
// ]

// #chapter-section("harmonic-functions")[
//   #include "/chapters/harmonic_functions/index.typ"
// ]

// #chapter-section("differential-geometry")[
//   #include "/chapters/differential_geometry/index.typ"
// ]

// #chapter-section("multivariable")[
//   #include "/chapters/multivariable/index.typ"
// ]

// #chapter-section("special-classes")[
//   #include "/chapters/special_classes_holomorphic/index.typ"
// ]

// #chapter-section("connections-nt")[
//   #include "/chapters/connections_to_nt/index.typ"
// ]

// #chapter-section("riemann-surfaces")[
//   #include "/chapters/riemann_surfaces/index.typ"
// ]

// #chapter-section("nevanlinna-theory")[
//   #include "/chapters/nevanlinna_theory/index.typ"
// ]

#chapter-section("bibliography")[
  #bibliography("/references.bib", full: true)
]
