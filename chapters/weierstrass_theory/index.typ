#import "/lib.typ": *
#show: docs-chapter.with(
  title: [The Theory of Weierstrass],
  route: "weierstrass_theory",
  children: [
    #include "laurent_series/index.typ"
    #include "isolated_singularities/index.typ"
    #include "entireness_meromorphy/index.typ"
    #include "properties_of_entire_meromorphic/index.typ"
    #include "residue_theorem/index.typ"
  ],
)
While Weierstrass' contributions in complex analysis are mainly characterized by his discoveries on uniform convergence, he also characterized entire and _meromorphic functions_ and a unique representation of entire functions, as well as his contributions toward the study of _essential singularities_.

To classify the behavior of non-removable singularities, mathematicians generalized Taylor series to _Laurent series_.
