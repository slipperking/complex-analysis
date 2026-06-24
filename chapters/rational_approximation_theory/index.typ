#import "/lib.typ": *
#show: docs-chapter.with(
  title: [Rational Approximation Theory],
  route: "rational_approximation_theory",
  children: [
    #include "runges_theorem/index.typ"
    #include "mergelyans_theorem/index.typ"
    #include "analytic_capacity/index.typ"
  ],
)
By definition, a rational function is the quotient of two polynomials; and by @thm:rationalmeromorphicfunctions, in equivalent formulation, it is a function meromorphic on all of $extcomplex$. The poles and zeros may not accumulate in $extcomplex$, and thus there are finitely many as a consequence of Bolzano--Weierstrass (@thm:bolzanoweierstrass).

When we refer to approximation, we refer to the approximation of a function as the uniform limit (of a sequence) of functions. Let $K subset.eq CC$ be compact and suppose $f:K -> CC$ is a given function on $K$. As a consequence of Mergelyan's Theorem (@thm:mergelyan), sufficient conditions for $f$ to be the uniform limit of rational functions whose poles lie in (a subset of given points of) $extcomplex without K$ are the continuity of $f$ on $K$ and the holomorphy of $f$ on $interior(K)$.
