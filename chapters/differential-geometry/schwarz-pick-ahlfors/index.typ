#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [From Schwarz--Pick to Ahlfors and Value Distribution of Entire Functions],
  route: "schwarz-pick-ahlfors",
)
While Schwarz Lemma in @lem:schwarz concerns self-maps of $DD$ with a fixed point at the origin, the Schwarz--Pick Lemma in @lem:schwarzpick generalizes this to arbitrary points in $DD$ as well as the hyperbolic contraction property of holomorphic maps.

In 1938, Lars Ahlfors provided a further generalization by curvature, prompting the study of complex functions from a differential-geometric approach.

The hyperbolic metric $lambda$ in @eq:poincare-metric-definition does not increase under any holomorphic $f:DD -> DD$. It was realized that this was a consequence of the constant negative curvature $-1$ of $lambda$. The results we now provide are simplifications of those from~@ahlforsanextensionofschwarzlemma.

#lbl(
  theorem[Schwarz--Ahlfors--Pick][
    Let $f$ be holomorphic on $DD$. Suppose that $rho$ is a regular metric defined on an open neighborhood $U$, where $f(DD) subset.eq U$, $dif s_rho^2 = rho^2(w) abs(dif w)^2$, and $K_rho (w) <= -1$ for all $w in U$. Then
    $ f^* rho(z) <= lambda(z) quad forall z in DD, $
    where $lambda$ is the Poincaré metric, and equivalently,
    $ dif s_(f^* rho)^2 <= dif s_lambda^2, $
    or that the metric $rho$ does not exceed the hyperbolic metric under the map $f$.
  ],
  <thm:schwarz-ahlfors-pick>,
)

#proof[
  Define
  #lbl(
    $
      lambda_r (z) = (z |-> z / r)^* lambda(z) = (2 r)/(r^2 - abs(z)^2), quad 0 < r < 1
    $,
    <eq:poincaremetriconscaleddisks>,
  )
  to generalize the Poincaré metric to $D(0, r)$. @eq:curvatureinvarianceunderholomorphicpullback gives that $K_(lambda_r) (z) = K_lambda (z / r) = -1$ for any $z in D(0, r)$. Define the real-valued function
  $ u_r (z) = (f^* rho(z))/(lambda_r (z)) quad "for" quad z in D(0, r), $
  which is nonnegative and continuous on $D(0, r)$. The pullback metric $f^* rho = (rho compose f) abs(f')$ is continuous on $DD$ and thus bounded on $overline(D(0, r))$ (as a consequence of @thm:continuous-function-bounded-on-compact). As $abs(z) -> r^-$, $lambda_r (z) -> oo$, and hence $lim_(abs(z) -> r^-) u_r (z) = 0$. Thus,
  $ M_r = max_(z in overline(D(0, r))) u_r (z) $
  must be attained at some $z = tau_r in D(0, r)$ (within the interior).

  If $M_r = 0$, then $forall z in D(0, r)$, $(f^* rho(z))/(lambda_r (z)) = 0 ==> M_r = 0 <= 1$ by maximality. On the contrary, if $M_r > 0$, $f^* rho$ has well-defined Gaussian curvature at $tau_r$. Since
  #lbl(
    $
      (laplacian log(u_r))(tau_r) & = (laplacian log(f^* rho))(tau_r) - (laplacian log(lambda_r))(tau_r) \
                                  & = -K_(f^* rho) (tau_r) f^* rho(tau_r)^2 + K_(lambda_r) (tau_r) lambda_r (tau_r)^2 \
                                  & = -K_(f^* rho) (tau_r) f^* rho(tau_r)^2 - lambda_r (tau_r)^2.
    $,
    <eq:schwarz-ahlfors-pick-curvature-numerator-at-maximum>,
  )
  By assumption, we have $-K_(f^* rho) (tau_r) >= 1$. Hence, $(laplacian log(u_r))(tau_r) >= f^* rho(tau_r)^2 - lambda_r (tau_r)^2$. Since $log$ is increasing in $RR$, $tau_r$ is a local maximum of $log compose u_r$ and hence $(laplacian log(u_r))(tau_r) <= 0$. Thus, we have
  $ f^* rho(tau_r)^2 - lambda_r (tau_r)^2 <= 0 <==> M_r <= 1. $
  Now let $r -> 1^-$, and it follows that $M_r -> sup_(z in DD) (f^* rho(z))/(lambda(z)) <= 1$.
]

#lbl(
  theorem[
    Let $f:DD -> U subset.eq CC$ be holomorphic. Let $dif s = rho(w) abs(dif w)$ (where $rho:U -> RR_(> 0)$) define a regular metric such that at every point $w in U$, either

    1. The second derivatives of $log lambda$ are continuous ($C^2$) and
      $ laplacian(log lambda)(w) >= lambda^2 $
    2. There exist two opposite directions $vu(n)'$, $vu(n)''$ such that
      #lbl(
        $
          nabla_(vu(n)') (log rho)(w) + nabla_(vu(n)'') (log rho)(w) > 0
        $,
        <eq:schwarz-ahlfors-pickextension1_directionalderivatives>,
      )
      (the directional derivatives).

    Then the metric $f^* rho$ does not exceed the hyperbolic metric $lambda$.
  ],
  <thm:schwarz-ahlfors-pickextension1>,
)

#proof[
  The first case is equivalent to $K_rho <= -1$.

  The only modification to the proof of @thm:schwarz-ahlfors-pick is to consider the case of the inequality involving directional derivatives for each $tau_r$ (which by definition, is where the maximum value of $u_r$ is attained within $D(0, r)$). By the increasing nature of $log$, $tau_r$ is also a local maximum of $phi.alt equiv log u_r equiv log(f^* rho) - log lambda_r$.

  Since $tau_r$ is a local maximum, we must have
  $
    nabla_(vu(n)') phi.alt(tau_r) <= 0, quad nabla_(vu(n)'') phi.alt(tau_r) <= 0 ==> nabla_(vu(n)') phi.alt(tau_r) + nabla_(vu(n)'') phi.alt(tau_r) <= 0.
  $
  This implies that
  $
    & nabla_(vu(n)') (log f^* rho)(tau_r) + nabla_(vu(n)'') (log f^* rho)(tau_r) \
    & wide""<= nabla_(vu(n)') (log lambda_r)(tau_r) + nabla_(vu(n)'') (log lambda_r)(tau_r) = 0
  $
  by the symmetry of the hyperbolic metric and the fact that the two directions are opposite to each other. Pulling back to $rho$ contradicts with @eq:schwarz-ahlfors-pickextension1_directionalderivatives. Thus, $tau_r$ cannot both simultaneously be the location of a maximum while satisfying said inequality; therefore the theorem follows.
]

#lbl(
  theorem[
    Let $f:DD -> U$ be holomorphic. Let
    $ rho:U subset.eq CC -> RR_(> 0), quad dif s_rho = rho(w) abs(dif w) $
    be a continuous conformal metric (but not necessarily $C^2$) such that at each point $w$, there exists a neighborhood $V_w in.rev w$ in $U$ and a regular metric $rho_w$ thereon such that $rho_w (w) = rho(w)$ and $rho_w <= rho$ everywhere else (referred to as a "supporting metric"). If each $K_(rho_w) <= -1$ everywhere, then the conclusion of @thm:schwarz-ahlfors-pick continues to hold for $rho$.
  ],
  <thm:schwarz-ahlfors-picksupportingmetric>,
)

#proof[
  By assumption, we have
  $ f^* rho_(tau_r) (tau_r) = f^* rho(tau_r), quad f^* rho_(tau_r) (z) <= f^* rho(z) quad "for" quad z != tau_r. $
  Let $tilde(u)_r (z) = (f^* rho_(tau_r) (z))/(lambda_r (z))$, which attains is maximum of $M_r$ at $tau_r$ as well.

  The calculations in @thm:schwarz-ahlfors-pick on $tilde(u)_r (z)$ (whose curvature calculations are now valid by $C^2$) give that $f^* rho_(tau_r) (tau_r)^2 - lambda_r (tau_r)^2 <= 0$, which implies $M_r <= 1$. (We have used the supporting metric, rather than $rho$, to derive this inequality) The rest of the theorem follows naturally.
]

@thm:schwarz-ahlfors-pick generalizes the Schwarz--Pick Theorem when $rho$ is chosen to be $lambda$ and $f$ is chosen such that $f(DD) subset.eq DD$.

For the purpose of the proceeding generalization, we define the conformal metric
#lbl(
  $
    lambda_r^alpha (z) = (1)/(sqrt(alpha)) (z |-> z / r)^* lambda(z) = (2 r)/(sqrt(alpha) (r^2 - abs(z)^2)), quad r > 0, z in D(0, r).
  $,
  <eq:poincaremetricscaledcurvature>,
)
Its Gaussian curvature is
$
  K_(lambda_r^alpha) (z) & = -4 pdv([log((2 r)/(sqrt(alpha) (r^2 - abs(z)^2)))], overline(z), z, style: "large") ((sqrt(alpha) (r^2 - abs(z)^2))/(2 r))^2 \
  & = -4 alpha pdv([log((2 r)/(r^2 - abs(z)^2))], overline(z), z, style: "large") ((r^2 - abs(z)^2)/(2 r))^2 = alpha K_(lambda_r) (z) = -alpha,
$
via the results and definitions in @eq:poincaremetriconscaleddisks.

#lbl(
  corollary[
    Let $r > 0$ and suppose $f:D(0, r) -> U$ is holomorphic, where $U subset.eq CC$ is a region. For any $beta > 0$, define $rho$ to be a regular metric on $U$ with $dif s_rho^2 = rho^2(w) abs(dif w)^2$ such that
    $ K_rho (w) <= -beta, quad forall w in U. $
    Then $forall alpha > 0$,
    $ f^* rho(z) <= sqrt(alpha / beta) lambda_r^alpha (z) $
    for any $z in D(0, r)$, where $f^* rho(z) = (rho compose f) abs(f')$ is the metric pullback.
  ],
  <cor:generalized_ahlfors>,
)

#proof[
  Consider the $(z |-> z r)^* f^*(rho sqrt(beta))$, a conformal metric pullback of $rho sqrt(beta)$ to $DD$, which satisfies
  $ K_((z |-> z r)^* f^*(rho sqrt(beta))) <= -1. $
  By Schwarz--Ahlfors--Pick (@thm:schwarz-ahlfors-pick), we have
  $
    (z |-> z r)^* f^*(rho sqrt(beta))(z) <= lambda(z) = sqrt(alpha) ((z |-> r z)^* lambda_r^alpha)(z) quad "for" quad z in DD.
  $
  Since $r != 0$, this implies that
  $ f^*(rho sqrt(beta))(z) <= sqrt(alpha) lambda_r^alpha (z) quad "for" quad z in D(0, r). $
  Since $sqrt(beta)$ is a constant,
  $ sqrt(beta) f^* rho(z) <= sqrt(alpha) lambda_r^alpha (z), quad forall z in D(0, r). #qedhere $
]

#lbl(
  corollary[Generalized Liouville][
    If $f:CC -> U$ is entire and $U$ admits a regular metric of curvature bounded above by a negative constant, then $f$ must be constant.
  ],
  <cor:generalizedliouville>,
)

#proof[
  By assumption, $exists beta > 0$ such that $sup_(w in U) K_rho (w) <= -beta$. Then @cor:generalized_ahlfors gives that
  $ f^* rho(z) <= (1)/(sqrt(beta)) lambda_r (z) quad forall z in D(0, r) $
  for any $r > 0$. As $r -> oo$, $lambda_r -> 0$. Hence, $f^* rho(z) = 0$, implying that $(rho compose f)(z) abs(f') = 0$. Hence, $f$ is constant.
]

#remark[
  @cor:generalizedliouville implies Liouville's Theorem (@thm:liouville). To justify this differential-geometric generalization, suppose $f:CC -> U$ is entire such that $U$ is bounded. There then exists some $R > 0$ such that $U subset.eq D(0, R)$. The metric $lambda_R$ has constant negative curvature $K = -1$ on $D(0, R)$, and hence, under $beta = 1$, @cor:generalizedliouville implies that $f$ is constant.
]

It is understood that an entire function is guaranteed to be constant if it is bounded. This is a statement of sufficiency, but it begs the question of the capacity for possible generalization of boundedness under which constancy is still always satisfied.

Consider an entire function $f:CC -> U$, where $U$ is an unbounded region such that $CC without U$ has positive area. Fix $zeta in jinterior(CC without U)$. Then the map $z |-> 1 / (z - zeta)$ maps $U$ to a bounded region and hence $z |-> 1 / (f(z) - zeta)$ is constant by Liouville's Theorem (@thm:liouville), implying the constancy of $f$ (the essential proof of @thm:casorati-weierstrass-entire).

In contrast, if $f:CC -> U$ is entire and $CC without U$ has zero area (one readily considers sets consisting of curves or isolated points), we must be more specific in determining sufficient conditions that still imply constancy of $f$.

Similar to in the proof of the Riemann Mapping Theorem (@thm:riemann_mapping), one may use holomorphic square roots or other transformations to reduce to the bounded setting.

#proposition[
  If $f:CC -> CC without {x in RR: 0 <= x <= 1}$ is entire, then $f$ must be constant.
]

#proof[
  Consider the biholomorphism $phi (z) = 1 / z$, mapping $CC without {x in RR: 0 <= x <= 1}$ to $CC^* without RR_(>= 1)$. By simple connectivity of $CC without RR_(>= 1)$, there exists a univalent branch $psi$ of $z |-> sqrt(z - 1)$ on $CC without RR_(>= 1)$. Now omitting the origin, it is trivially realized that $psi(CC^* without RR_(>= 1)) inter -psi(CC^* without RR_(>= 1)) = emptyset$. If otherwise, then $exists xi in psi(CC^* without RR_(>= 1))$ such that $-xi in psi(CC^* without RR_(>= 1))$, implying that $exists z_1, z_2 in CC^* without RR_(>= 1)$ such that $phi.alt (z_1) = xi$ and $phi.alt (z_2) = -xi$, implying that $z_1 = z_2$ and $xi = 0 ==> z_1 = z_2 = 1$, which does not lie in $psi(CC^* without RR_(>= 1))$.

  Now fix $xi in psi(CC^* without RR_(>= 1))$. By the Open Mapping Theorem (@thm:open_mapping), $exists epsilon > 0$ such that $D(xi, epsilon) subset.eq psi(CC^* without RR_(>= 1))$. Consequently, $D(-xi, epsilon) inter psi(CC^* without RR_(>= 1)) = emptyset$. Lastly, the function $phi.alt(z) = epsilon / (z + xi)$ maps $psi(CC^* without RR_(>= 1))$ to $DD$. By Liouville (@thm:liouville), $phi.alt compose psi compose phi compose f$ is constant, which implies $f$ is constant by the injectivity of $phi.alt$, $psi$, and $phi$.
]

The preceding examples show that if the omitted set is sufficiently "large" (in the sense of having positive area or disconnecting the plane in certain ways), then any entire function avoiding it must reduce to a constant. However, there are natural limits to the smallness of the omitted set. For instance, the exponential function $exp$ is an entire non-constant function whose image is $CC^*$, omitting only a single point. Thus, the property that _an entire function omits a set_ is not by itself sufficient to guarantee constancy unless that set is suitably substantial. This observation is formalized by Picard's Little Theorem (@thm:little-picard), which as preluded to before, asserts that any non-constant entire function can omit at most one complex value.

#lbl(
  proposition[
    Let $U subset CC$ be an open set such that $CC without U$ contains at least two points. Then $U$ admits a conformal metric $rho in C^2(U)$, $dif s_rho^2 = rho^2(z) abs(dz)^2$ such that
    $ K_rho (z) <= -beta < 0 quad forall z in U $
    for some $beta > 0$.
  ],
  <prop:conformalmetricnegativecurvatureexistencewhenomits2points>,
)

#proof[
  Without loss of generality, we may assume that ${0, 1} subset.eq CC without U$ (if not, a linear transformation $z |-> (z - xi_1)/(xi_2 - xi_1)$ where $xi_1, xi_2 in CC without U$ are distinct will suffice to transform $U$ to such a region).

  Define a regular metric with
  #lbl(
    $
      rho(z) = (sqrt(1 + abs(z)^(1 / 3)) sqrt(1 + abs(z - 1)^(1 / 3))) / (abs(z)^(5 / 6) abs(z - 1)^(5 / 6)), quad dif s_rho^2 = rho(z)^2 abs(dz)^2
    $,
    <eq:conformalmetricnegativecurvatureexistencewhenomits2points_metric>,
  )
  on $CC without {0, 1}$.

  Since $laplacian(log abs(z)^(5 / 6)) = (5)/(6) laplacian(log abs(z)) = (5)/(6) laplacian(Re log(z)) = 0$ by harmonicity,
  $
    laplacian log((sqrt(1 + abs(z)^(1 / 3))) / (abs(z)^(5 / 6))) & = 2 pdv((log(1 + abs(z)^(1 / 3))), overline(z), z, style: "large") = z^(-5 / 6) / 3 pdv(((overline(z)^(1 / 6)) / (1 + abs(z)^(1 / 3))), overline(z), style: "large") \
    & = z^(-5 / 6) / 3 pdv(((overline(z)^(1 / 6)) / (1 + abs(z)^(1 / 3))), overline(z), style: "large") = (z^(-5 / 6) overline(z)^(-5 / 6) (1 + abs(z)^(1 / 3)) - z^(-5 / 6) overline(z)^(1 / 6) z^(1 / 6) overline(z)^(-5 / 6)) / (18 (1 + abs(z)^(1 / 3))^2) \
    & = 1 / (18 abs(z)^(5 / 3) (1 + abs(z)^(1 / 3))^2),
  $
  and a similar calculation yields
  $
    laplacian log((sqrt(1 + abs(z - 1)^(1 / 3))) / (abs(z - 1)^(5 / 6))) = 1 / (18 abs(z - 1)^(5 / 3) (1 + abs(z - 1)^(1 / 3))^2).
  $
  Hence,
  $
    K_rho (z) = -1/(18) [(abs(z - 1)^(5 / 3)) / ((1 + abs(z)^(1 / 3))^3 (1 + abs(z - 1)^(1 / 3))) + (abs(z)^(5 / 3)) / ((1 + abs(z - 1)^(1 / 3))^3 (1 + abs(z)^(1 / 3)))],
  $
  and that

  + $K_rho in C^0(CC without {0, 1})$.
  + $forall z in CC without {0, 1}$, $K_rho (z) < 0$.
  + $lim_(z -> 0) K_rho (z) = -1/(36)$.
  + $lim_(z -> 1) K_rho (z) = -1/(36)$.
  + $lim_(z -> oo) K_rho (z) = -oo$ in any direction (as in the one-point compactification).

  Hence, $exists delta > 0$ such that $abs(K_rho (z) + 1 / 36) < 1 / 72$ for any $z in D^*(0, delta) union D^*(1, delta)$ and $exists R > 0$ such that $K_rho (z) < -1$ for any $z$ satisfying $abs(z) > R$. By compactness of $overline(D(0, R)) without (D(0, delta) union D(1, delta))$ and continuity, it attains its supremum of some value $-M < 0$ by @thm:extremevalue. Let $-beta = max{-1 / 72, -M} < 0$.
  $ therefore quad K_rho (z) <= -beta < 0 quad forall z in CC without {0, 1}. #qedhere $
]

And we have the final implication:

#lbl(
  theorem([Picard's Little Theorem], restate: true, restate-keys: ("thm:little-picard",))[
    Let $f:CC -> U$ be entire such that $CC without U$ contains two or more points. Then $f$ is constant.
  ],
  <thm:little-picard>,
)

#proof[
  By the result of @prop:conformalmetricnegativecurvatureexistencewhenomits2points, we may find a conformal metric $rho$ on $U$ such that $exists beta > 0$ satisfying $K_rho (U) subset.eq RR_(<= -beta)$. Then by the aforementioned generalization of Liouville (@cor:generalizedliouville), $f$ exhibits constancy on $CC$ and the assertion follows.
]

#remark[
  This is commonly stated in its contrapositive: the image of any non-constant entire function omits at most one value.
]
