#import "/lib.typ": *

= A Glimpse into the Function Theory of Multiple Complex Variables<sec:multivariatecomplexanalysis>
As in the single-variable case, there exist natural extensions of the definitions of holomorphy and of derivatives, as well as direct analogs of integral theorems.

Many other results, however, have to be separately derived.

Throughout mathematical history, many efforts were made to study the nature of complex functions in a multivariate setting. In the 20th century, Poincaré
proved that the unit ball $B^n={(z_1,dots,z_n) in CC^n : sum_(k=1)^n abs(z_k)^2<1}$ and the polydisk $DD^n=DD times dots.c times DD$ are not biholomorphically equivalent by comparison of their automorphism groups, under certain assumptions of the automorphisms on their respective boundaries; the proof was later formalized by Cartan, but is nonetheless largely attributed to Poincaré. As one of the first of many deviations, the miracle of the Riemann Mapping Theorem (@thm:riemann_mapping) fails in higher dimensions. Hartogs later also showed that poles and essential singularities cannot exist as isolated singularities of multivariate holomorphic functions. Perhaps these are the results of an unsatisfactory generalization.

Whereas the efforts of mathematicians of over two centuries give rise to the development of function theory of one complex variable, the theory of multivariate complex functions is still largely rudimentary. Many seemingly fundamental problems still largely remain as conjecture.

#chapter-section("holomorphy_consequences")[
  #include "holomorphy_consequences/index.typ"
]
#chapter-section("ball_polydisk_holomorphic_automorphisms")[
  #include "ball_polydisk_holomorphic_automorphisms/index.typ"
]
#chapter-section("topological_equiv_biholomorphic_equiv")[
  #include "topological_equiv_biholomorphic_equiv/index.typ"
]
#chapter-section("hartogs_phenomenon")[
  #include "hartogs_phenomenon/index.typ"
]
