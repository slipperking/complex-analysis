#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [The Perron Method and the Solution to the Dirichlet Problem],
  route: "perron-method-and-the-solution-to-the-dirichlet-problem",
)
The method we provide here is due to Oskar Perron, which will subsequently apply to a large variety of curves (although it is not of highest possible generality, it will suffice for our general purposes).

Similar to the Riemann Mapping Theorem, the solution here will also pertain largely to solving an extremal problem. Moreover, as a corollary to the problem, one also will obtain a proof of the Riemann Mapping Theorem (which in spirit, is much closer to the original proof of the mapping theorem).
#theorem[Solution to the Dirichlet Problem][
  Let $U$ be an open region such that for each point $p in partial U$, there is a barrier $b_p : overline(U) -> RR$. Then $forall f in C(partial U, RR)$, $exists! u in C(overline(U), RR)$ harmonic in $U$ such that $u equiv f$ on $partial U$.
]
#proof[
  Let
  $ S = {psi : psi "is subharmonic on" U "and" forall p in partial U, limsup_(z -> p \ z in U) psi(z) <= f(p)} $
  By the compactness of $partial U$, $exists m in RR$ such that $f(z) <= m$ for any $z in partial U$. Then $(z mapsto m) in S$, meaning $S != emptyset$. Let $u:U -> RR$ be defined by
  $ u(z) = sup_(psi in S) psi(z). $
]
