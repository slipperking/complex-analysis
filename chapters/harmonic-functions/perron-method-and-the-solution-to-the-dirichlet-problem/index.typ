#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [The Perron Method and the Solution to the Dirichlet Problem],
  route: "perron-method-and-the-solution-to-the-dirichlet-problem",
)
The method we provide here is due to Oskar Perron, which will subsequently apply to a large variety of curves (although it is not of highest possible generality, it will suffice for our general purposes).

Similar to the Riemann Mapping Theorem, the solution here will also pertain largely to solving an extremal problem. Moreover, as a corollary to the problem, one also will obtain a proof of the Riemann Mapping Theorem (which in spirit, is much closer to the original proof of the mapping theorem).
#theorem[Solution to the Dirichlet Problem][
  Let $U$ be a bounded open region such that for each point $p in partial U$, there is a barrier $b_p : overline(U) -> RR$. Then $forall f in C(partial U, RR)$, $exists! u in C(overline(U), RR)$ harmonic in $U$ such that $u equiv f$ on $partial U$.
]
#proof[
  Let
  $ S = {psi : psi "is subharmonic on" U "and" forall p in partial U, limsup_(z -> p \ z in U) psi(z) <= f(p)} $
  By the compactness of $partial U$, $exists m in RR$ such that $f(z) >= m$ for any $z in partial U$. Then $(z mapsto m) in S$, meaning $S != emptyset$. Let $u:U -> RR$ be defined by
  $ u(z) = sup_(psi in S) psi(z). $
  It will turn out to be the case that $u$ is the precise solution for which we are searching, it remains to verify its harmonicity and extension to $f$.
  #claim[
    $exists M in RR$ (given by $sup_(z in partial U) f(z)$) such that $sup_(z in U) u(z) <= M$.
  ]
  #proof[
    Fix $psi in S$ and let $M = sup_(z in partial U) f(z)$ (which exists by compactness).

    For each $epsilon > 0$, define $ E_epsilon = {z in U : psi(z) >= M + epsilon} subset.eq U. $
    We aim to show that $E_epsilon = emptyset$.

    Let $z in CC without E_epsilon$. If we are able to show that a neighborhood of $z$ lies in $CC without E_epsilon$, then $CC without E_epsilon$ is open and $E_epsilon$ is then closed.

    + If $z in CC without overline(U)$, such a neighborhood holds trivially, in particular $exists V in.rev {z}$ open such that $V in CC without overline(U) subset,eq CC without E_epsilon$.

    + If $z in partial U$, then $exists delta > 0$ such that for all $forall zeta in U$ with $abs(z - zeta) < delta$,
      $ psi(zeta) < limsup_(zeta -> z \ zeta in U) psi(zeta) + epsilon <= f(z) + epsilon <= M + epsilon $
      by the definition of $limsup$, meaning that $U inter D(z, delta) subset.eq CC without E_epsilon$. Moreover, $D(z, delta) without U subset.eq CC without E_epsilon$ as well since $E_epsilon subset.eq U$. Therefore, $D(z, delta) subset.eq CC without E_epsilon$.

    + If $z in U without E_epsilon$, then $psi(z) < M + epsilon$. By continuity, there exists a neighborhood $V in.rev z$ on which $psi < M + epsilon$ holds.

    Therefore, $CC without E_epsilon$ is open; then $E_epsilon$ is closed in $CC$. Since $U$ is bounded, $E_epsilon$ is compact. Then $psi$ attains a finite maximum $M'$ within $E_epsilon$ by continuity (by the Extreme Value Theorem, @thm:extreme-value) at some point $z$. By definition of $E_epsilon$, $M' >= psi(z) >= M + epsilon$ for $z in E_epsilon$. Outside of $E_epsilon$, $M' >= psi$ continues to hold as $M + epsilon >= psi$. Therefore $M'$ is an absolute maximum of $psi$ on all of $U$. By the Maximum Principle for subharmonic functions (@thm:maximum-principle-for-subharmonic-functions), $psi equiv M' >= M + epsilon$ must be constant on $U$, and therefore $limsup_(zeta -> z \ zeta in U) psi(zeta) = M' > M >= f(z)$,
    which contradicts $psi in S$. Therefore, $E_epsilon$ must be the emptyset.

    Hence, for any $epsilon > 0$, $E_epsilon = emptyset$; which implies that $forall z in U$, $psi(z) <= M$. Since $psi$ was arbitrary, we have $u <= M$.
  ]
  #claim[
    The function $u$ is harmonic in $U$.
  ]
  #proof[
    Let $overline(D(a,r)) subset.double U$ be arbitrary. Then for each $p in overline(D(a,r))$, since $u(p) = sup_(psi in S) psi(p)$, there is some sequence of functions ${psi_(p,k)}_k$ such that $lim_(k -> oo) psi_(p,k) (p) = u(p)$.

    For $z in U$, define the function sequence ${Psi_(p,n)}_n$ of partial maximums $ Psi_(p,n) (z) = max_(k = 1)^n psi_(p,k) (z). $
    By @prop:subharmonic-pointwise-maximum-is-subharmonic, ${Psi_(p,n)}_n$ is a pointwise-increasing sequence of subharmonic functions on $U$.

    For each $n$, the function $Psi_(p,n)$ is continuous on $partial D(a,r)$. Then by the Poisson Integral Formula (@eq:poisson-integral-formula-2), there is a continuous function $phi_(p,n)$ on $overline(D(a,r))$ which is identical to $Psi_(p,n)$ on the boundary and harmonic on the interior. Now let
    $
      Phi_(p,n) (z) = cases(Psi_(p,n) (z) & quad "if" quad z in.not D(a,r), phi_(p,n)(z) & quad "if" quad z in D(a,r)",")
    $
  ]
  #claim[
    The function $u$ extends continuously to $f$: for each $z in partial U$, $lim_(zeta -> z \ zeta in U) u(zeta) = f(z)$.
  ]
  #proof[

  ]
]
