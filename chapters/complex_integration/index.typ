#import "/lib.typ": *
#show: docs-chapter.with(
  title: [Complex Integration],
  route: "complex_integration",
  children: [
    #include "cauchy_goursat/index.typ"
    #include "analyticity_holomorphy/index.typ"
    #include "zeros_of_holomorphic/index.typ"
    #include "properties_of_holomorphic/index.typ"
    #include "unit_disk_holomorphic_automorphisms/index.typ"
    #include "alternative_integral_formulas/index.typ"
  ],
)
While differentiability in the complex plane is substantially more restrictive than in the real setting, this rigidity gives rise to powerful integral theorems that govern the behavior of holomorphic functions.

To formulate these results, we first extend the notion of integration to curves in the complex plane. Let $f(z)=u(z) + ii v(z)$ be a complex-valued continuous function (not necessarily holomorphic), and let $gamma:[a,b] -> CC$ be piecewise $C^1$ function whose image (denote by $gamma$ as well) is a curve in $CC$. Then we define
$
  integral_gamma f(z) dz = integral_a^b f compose gamma(t) gamma'(t) dt = integral_a^b u compose gamma(t) gamma'(t) dt + ii integral_a^b v compose gamma(t) gamma'(t) dt.
$
Notably, this integral is independent of orientation-preserving parameterizations of $gamma$.

The orientation of curves are explicitly represented by superscripted signs and have properties analogous to line integrals of real functions. For instance, if $gamma$ is positively oriented, $ integral_gamma f(z) dz = -integral_(gamma^-) f(z) dz. $
