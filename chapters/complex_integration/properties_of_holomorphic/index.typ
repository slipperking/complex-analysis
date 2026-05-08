#import "/lib.typ": *

== Further Properties of Holomorphic Functions

A useful corollary of @thm:cauchygoursatformula is the Maximum Modulus Principle.

Before the theorem, we first introduce the mean-value property of holomorphic functions.

#lemma[
  Let $U subset.eq CC$ be open and simply connected, and let $f:U -> CC$ be holomorphic. Then $forall z in U$ and $forall epsilon > 0$ such that $overline(D(z, epsilon)) subset U$, $f(z)$ is the average of $f(zeta)$ where $zeta in D(z, epsilon)$ is uniform. In other words,
  $ f(z) = 1 / (2 uppi epsilon) integral.cont_(partial D(z, epsilon)) f(zeta) abs(dzeta). $
] <lem:holomorphicmeanvalueproperty>

#proof[
  By the Cauchy--Goursat Formula (@thm:cauchygoursatformula),
  $ f(z) = 1 / (taui) integral.cont_(partial D(z, epsilon)) (f(zeta)) / (zeta - z) dzeta = 1 / (2 uppi) integral_0^(2 uppi) f(z + epsilon ee^(ii t)) dt. $

  Observe that
  $
    f(z) = 1 / (2 uppi epsilon) integral.cont_(partial D(z, epsilon)) f(zeta)abs(dzeta) & = 1 / (2 uppi epsilon) integral_0^(2 uppi) f(z + epsilon ee^(ii t))abs(ii epsilon ee^(ii t) dt) \
    & = 1 / (2 uppi) integral_0^(2 uppi) f(z + epsilon ee^(ii t)) dt,
  $
  and the conclusion follows.
]

Since the real and imaginary parts of holomorphic functions are real-valued harmonic functions, they also satisfy the mean-value property. Furthermore, if a real continuous function satisfies the mean-value property, it is harmonic (to be proved in @thm:mean_value_property_solutions_are_harmonic). This equivalence allows for the alternative definition of harmonic functions.

#theorem("Maximum Modulus Principle")[
  Let $f(z)$ be holomorphic on an open connected region $U subset.eq CC$. If $exists z_0 in U$ and an open neighborhood $V subset.eq U$ of $z_0$ such that $forall z in V$, $abs(f(z_0)) gt.eq abs(f(z))$, then $f$ is a constant function on $U$.
] <thm:maximummodulus>

#proof[
  Assume that $z_0$ exists. We will first prove that the set
  $ S = {z : f(z) = f(z_0), z in V} $
  is all of $V$. This is equivalent to proving that $S$ is nonempty, open, and closed in $V$.

  Since $z_0 in S$, the first condition is satisfied (nonemptiness). For any sequence ${z_n} in S$ converging to some $z_infinity in V$, by the continuity of $f$,
  $ lim_(n -> infinity) f(z_n) = f(lim_(n -> infinity) z_n) = f(z_infinity) = f(z_0), $
  and $z_infinity in S$. Thus, $S$ contains all of its accumulation points in $V$ and is therefore closed (if $z_infinity in.not V$, then it is no longer relevant; we are concerned with its relative closedness in $V$).

  Since $S subset.eq V$ and $V$ are both open, $forall z in S$, $exists lambda > 0$ such that $D(z, lambda) subset.eq V$. By @lem:holomorphicmeanvalueproperty, $forall 0 < epsilon < lambda$,
  $
    abs(f(z)) & = abs(1 / (2 uppi) integral_0^(2 uppi) f(z + epsilon ee^(ii t)) dt) <= 1 / (2 uppi) integral_0^(2 uppi) abs(f(z + epsilon ee^(ii t))) dt \
    & <= 1 / (2 uppi) integral_0^(2 uppi) abs(f(z)) dt = abs(f(z)).
  $
  It follows that all inequalities above are equalities, or that
  $
    abs(f(z)) & = abs(1 / (2 uppi) integral_0^(2 uppi) f(z + epsilon ee^(ii t)) dt) = 1 / (2 uppi) integral_0^(2 uppi) abs(f(z + epsilon ee^(ii t))) dt \
    & = 1 / (2 uppi) integral_0^(2 uppi) abs(f(z)) dt = abs(f(z)).
  $
  From the equality of the last two integrals,
  $ integral_0^(2 uppi) [abs(f(z)) - abs(f(z + epsilon ee^(ii t)))] dt = 0. $
  Since this integrand is strictly non-negative, we have equality. Thus, $forall z in S$, $exists lambda > 0$ such that $D(z, lambda) subset.eq S$. In other words, every $z in S$ has an open neighborhood that also lies in $S$. Therefore, $S$ is open and $S = V$ as it is a nonempty clopen subset. Since $V$ is nonempty and open, it has an accumulation point in $U$. It follows that $f(z) equiv f(z_0)$ over $U$ by the Identity Theorem (@thm:identity).
]

#remark[
  If $f$ is holomorphic and non-constant on an open region $U subset.eq CC$, then for any compact set $K subset U$, the maximum of $f$ in $K$ lies on $partial K$. Otherwise, $f$ would attain a maximum at some $z in interior(K)$, and contradict the statement of @thm:maximummodulus under the assumption of being non-constant.
]

A similar theorem exists for real-valued harmonic functions. The proof follows in the same way as the one for holomorphic functions. We will state it formally below.

#theorem[
  Let $U subset.eq CC$ be open and connected and let $f:U -> RR$ be harmonic. Suppose that $exists z_0 in U$ and a neighborhood $V subset.eq U$ of $z_0$ such that either
  $ f(z) gt.eq f(z_0) quad forall z in V quad "or" quad f(z_0) gt.eq f(z) quad forall z in V. $
  Then $f$ is constant on $U$.
] <thm:maximumprincipleforrealharmonicfunctions>

By nature of the proof, the result holds for any continuous function satisfying the mean-value property.