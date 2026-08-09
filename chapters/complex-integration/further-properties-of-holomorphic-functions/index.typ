#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Further Properties of Holomorphic Functions],
  route: "further-properties-of-holomorphic-functions",
  label: <sec:further-properties-of-holomorphic-functions>,
)
A useful corollary of @thm:cauchy-goursat-formula is the Maximum Modulus Principle.

In preparation for the result, we first introduce the _global mean-value property_ of holomorphic functions: the mean-value property holds on every disk compactly contained in the domain. The adjectives _global_ and _local_ are informal terminology adopted here for clarity; they are not necessarily standard in classical treatments.

#lbl(
  lemma[
    Let $U subset.eq CC$ be open and connected, and let $f:U -> CC$ be holomorphic. Then $forall z in U$ and $forall epsilon > 0$ such that $overline(D(z, epsilon)) subset U$, $f(z)$ is the average of all $f(zeta)$ for $zeta in partial D(z, epsilon)$. In other words,
    $ f(z) = 1 / (2 uppi epsilon) integral.cont_(partial D(z, epsilon)) f(zeta) abs(dzeta). $
  ],
  <lem:holomorphic-mean-value-property>,
)

#proof[
  By the Cauchy--Goursat Formula (@thm:cauchy-goursat-formula),
  $
    f(z) = 1 / (taui) integral.cont_(partial D(z, epsilon)) (f(zeta)) / (zeta - z) dzeta = 1 / (2 uppi) integral_0^(2 uppi) f(z + epsilon ee^(ii t)) dt.
  $

  Observe that
  $
    f(z) = 1 / (2 uppi epsilon) integral.cont_(partial D(z, epsilon)) f(zeta)abs(dzeta) & = 1 / (2 uppi epsilon) integral_0^(2 uppi) f(z + epsilon ee^(ii t))abs(ii epsilon ee^(ii t) dt) \
    & = 1 / (2 uppi) integral_0^(2 uppi) f(z + epsilon ee^(ii t)) dt,
  $
  and the conclusion follows.
]

#lbl(
  theorem[Maximum Modulus Principle][
    Let $f(z)$ be holomorphic on an open connected region $U subset.eq CC$. If $exists z_0 in U$ and an open neighborhood $V subset.eq U$ of $z_0$ such that $forall z in V$, $abs(f(z_0)) >= abs(f(z))$, then $f$ is a constant function on $U$.
  ],
  <thm:maximum-modulus>,
)

#proof[
  Assume that $z_0$ exists. We will first prove that the set
  $ S = {z : f(z) = f(z_0), z in V} $
  is all of $V$. This is equivalent to proving that $S$ is nonempty, open, and closed in $V$.

  Since $z_0 in S$, the first condition is satisfied (nonemptiness). For any sequence ${z_n} in S$ converging to some $z_infinity in V$, by the continuity of $f$,
  $ lim_(n -> oo) f(z_n) = f(lim_(n -> oo) z_n) = f(z_infinity) = f(z_0), $
  and $z_infinity in S$. Thus, $S$ contains all of its accumulation points in $V$ and is therefore closed (if $z_infinity in.not V$, then it is no longer relevant; we are concerned with its relative closedness in $V$).

  Since $S$ is a subset of $V$ and $V$ is open, $forall z in S$, $exists lambda > 0$ such that $D(z, lambda) subset.eq V$. By @lem:holomorphic-mean-value-property, $forall 0 < epsilon < lambda$,
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
  #todo[Justify integrand vanishing by continuity.]
  Since this integrand is strictly non-negative, we have equality. Thus, $forall z in S$, $exists lambda > 0$ such that $D(z, lambda) subset.eq S$. In other words, every $z in S$ has an open neighborhood that also lies in $S$. Therefore, $S$ is open and $S = V$ as it is a nonempty clopen subset (@thm:connected-topological-space-clopen-sets). Since $V$ is nonempty and open, it has an accumulation point in $U$. It follows that $f(z) equiv f(z_0)$ over $U$ by the Identity Theorem (@thm:identity).
]

#remark[
  If $f$ is holomorphic and non-constant on an open region $U subset.eq CC$, then for any compact set $K subset.double U$, the maximum of $f$ in $K$ lies on $partial K$. Otherwise, $f$ would attain a maximum at some $z in interior(K)$, and contradict the statement of @thm:maximum-modulus under the assumption of being non-constant.
]

By nature of the proof, it follows that a similar theorem holds for any continuous function that satisfies the global mean-value property.

#lbl(
  theorem[
    Let $U subset.eq CC$ be open and connected and let $f:U -> RR$ be continuous such that $forall z in U$ and $forall epsilon > 0$ such that $overline(D(z, epsilon)) subset U$,
    $ f(z) = 1 / (2 uppi epsilon) integral.cont_(partial D(z, epsilon)) f(zeta) abs(dzeta) $ is true. Suppose that $exists z_0 in U$ and a neighborhood $V subset.eq U$ of $z_0$ such that
    $ f(z_0) >= f(z) quad forall z in V. $
    Then $f$ is constant on $U$.
  ],
  <thm:maximum-principle-for-real-functions-satisfying-mean-value-property>,
)

#lbl(
  theorem[
    Let $U subset.eq CC$ be an open disk centered at $z_0$. If $u: U -> RR$ is harmonic, then there exists a holomorphic function $f: U -> CC$ such that $u equiv Re f$.
  ],
  <thm:harmonic-conjugate-existence-on-a-disk>,
)

#proof[
  Let $u$ be harmonic on the open disk $U$. Then define a complex-valued function $g: U -> CC$ by
  $ g equiv pdv(u, x) - ii pdv(u, y). $
  Then
  $
    pdv(g, overline(z)) equiv 1 / 2 [pdv(, x) (pdv(u, x) - ii pdv(u, y)) + ii pdv(, y) (pdv(u, x) - ii pdv(u, y))] equiv 0
  $
  because $u$ is harmonic. Therefore, $g$ is holomorphic. Since $U$ is simply connected, $g$ has a holomorphic antiderivative. Then let
  $ f(z) = integral_(z_0)^z g(zeta) dzeta + u(z_0). $
  Then for all $z in U$, letting $zeta = xi + ii eta$, $z_0 = x_0 + ii y_0$, $z = x + ii y$, and integrating on the curve $z_0 -> x + ii y_0 -> z$, we have
  $
    Re f(z) & = Re integral_(z_0)^z (pdv(u, xi) - ii pdv(u, eta)) (dif xi + ii dif eta) + u(z_0) \
            & = integral_(x_0)^x pdv(u(xi + ii y_0), xi) dif xi + integral_(y_0)^y pdv(u(x + ii eta), eta) dif eta + u(z_0) \
            & = u(x + ii y_0) - u(x_0 + ii y_0) + u(x + ii y) - u(x+ ii y_0) + u(z_0) \
            & = u(z)
  $
  by the Fundamental Theorem of Calculus.
]

Therefore, for any real harmonic function $u$ on an open region $U$, in each small disk $D subset.eq U$, there exists a holomorphic function $f: D -> CC$ such that $u equiv Re f$. Then taking the real part of both sides in @lem:holomorphic-mean-value-property on $f$, we find that $u$ satisfies the global mean-value property as well.

Because harmonic functions satisfy the global mean-value property, @thm:maximum-principle-for-real-functions-satisfying-mean-value-property is equivalent to:

#lbl(
  theorem[Maximum Principle for Harmonic Functions][
    Let $U subset.eq CC$ be open and connected and let $u:U -> RR$ be harmonic. Suppose that $exists z_0 in U$ and a neighborhood $V subset.eq U$ of $z_0$ such that
    $ u(z) <= u(z_0) quad forall z in V. $
    Then $u$ is constant on $U$.
  ],
  <thm:maximum-principle-for-real-harmonic-functions>,
)
