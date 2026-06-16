#import "/lib.typ": chapter-section
#let test-section = false
#set heading(numbering: "1.1")

#if test-section {
  chapter-section("test")[
    #include "test/index.typ"
  ]
} else {
  [
    #chapter-section("prerequisites")[
      #include "prerequisites_calc_top/index.typ"
    ]

    #chapter-section("introduction_to_complex_functions")[
      #include "introduction_to_complex_functions/index.typ"
    ]

    #chapter-section("complex_integration")[
      #include "complex_integration/index.typ"
    ]

    #chapter-section("weierstrass_theory")[
      #include "weierstrass_theory/index.typ"
    ]

    #chapter-section("geometric_conformal_mappings")[
      #include "geometric_conformal_mappings/index.typ"
    ]

    #chapter-section("rational_approximation")[
      #include "rational_approximation_theory/index.typ"
    ]

    #chapter-section("harmonic_functions")[
      #include "harmonic_functions/index.typ"
    ]

    #chapter-section("differential_geometry")[
      #include "differential_geometry/index.typ"
    ]

    #chapter-section("multivariable")[
      #include "multivariable/index.typ"
    ]

    #chapter-section("special_classes_of_holomorphic_functions")[
      #include "special_classes_of_holomorphic_functions/index.typ"
    ]

    #chapter-section("connections_to_number_theory")[
      #include "connections_to_number_theory/index.typ"
    ]

    #chapter-section("riemann_surfaces")[
      #include "riemann_surfaces/index.typ"
    ]

    #chapter-section("nevanlinna_theory")[
      #include "nevanlinna_theory/index.typ"
    ]
    #pagebreak()
    #set heading(numbering: "A.1")
    #counter(heading).update(0)
    #include "appendices/index.typ"

    #chapter-section("bibliography")[
      #bibliography("/references.bib", full: true)
    ]
  ]
}
