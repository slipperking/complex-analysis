#import "/lib.typ": *

#import "/build/visual_output/mergelyan_erosion/lib.typ" as visual-data

== Mergelyan's Theorem

Although many mathematicians have since tried after the efforts of Weierstrass and Runge to approximation continuous functions holomorphic on the interior restriction, it was only 67 years later when Armenian mathematician provided the first widely accepted proof. The proof of Runge's Theorem (specifically in @prop:rungesimplepolesandremovablesingularityatinfinity) relied heavily on the assumption of holomorphy on a neighborhood, a rational function was created by placing poles in prescribed points of a contour that lay outside of $K$ but within its domain of holomorphy. Obviously, these assumptions are null under the context of this new formulation.

The proof proposed by Mergelyan is almost trivial when compared with the results of many other mathematicians at the time. It even uses the concepts previously proposed by Runge. This begs the question: why was there such a prolonged time gap between the two similar formulations? Many mathematicians felt that the conclusion was "too good to be true"; during this elapsed time period there were many efforts of mathematicians that resulted in many technical partial results. Mergelyan's Theorem came as a surprise as it encapsulated many of those results with simplicity.

As we have previously seen, there is a prevalent notion in complex analysis that regards $oo$ intrinsically as essentially any other point of $extcomplex$. An appertaining question relates to the complex derivative at $oo$. Although
$
  f'(oo) attach(=, t: ?) lim_(z -> oo) f'(z)
$
may seem to be a natural object to consider, it is quite impractical; there exist functions which decay quickly to $0$, while $f'(z)$ is unbounded as $z -> oo$ (take $z mapsto sin(z^2) / sqrt(z)$ as an example). Even the assumption that $lim_(z -> oo) f'(z) = 0$ does not imply that $f(z)$ has a removable singularity at $oo$ (consider $z mapsto sqrt(z)$).

#definition[
  Let $R > 0$, $f:CC without overline(D(0, R)) -> CC$ be holomorphic such that $f$ has a removable singularity at $oo$. Then we define the derivatives of $f$ at $oo$ to be
  $
    f^((n)) (oo) = evaluated(dv((f(1 / z)), z, n, style: "large"))_(z=0).
  $
  In the case that $n = 1$, we have
  $
    f'(oo) = -lim_(z -> oo) z^2 f'(z).
  $ <eq:derivativeatinfinity>
]

This is precisely the first singular term of the Laurent expansion of $f$ at $oo$.

#remark[
  This definition may feel unsatisfactory, but the underlying logic here is similar to the method used to generalize residues to $oo$.
]

If $f$ is bijective and meromorphic on some neighborhood of a point $a in CC$ such that $f(a) = oo$, then we informally define the derivative at the pole $a$ to be
$
  f'(a) = 1 / ((f^(-1))'(oo)) & = -lim_(w -> oo) 1 / (w^2 (f^(-1))'(w)) \
                              & = -lim_(w -> oo) (f'(f^(-1)(w))) / w^2.
$ <eq:derivativeatpole1>
Let $z = (f^(-1))(w)$. Then we have
$
  f'(a) = -lim_(z -> a) (f'(z)) / f(z)^2 = evaluated(dv((1 / f(z)), z, style: "large"))_(z=a).
$ <eq:derivativeatpole2>

#proposition[
  For any connected compact set $K subset.eq CC$ containing at least two distinct points such that $extcomplex without K$ is connected, let $phi.alt$ be an arbitrary biholomorphism mapping $extcomplex without K$ to $DD$ such that $phi.alt(oo) = lim_(z -> oo) phi.alt(z) = 0$. It follows that
  $
    abs(phi.alt'(oo)) gt.eq 1 / 4 diam(K),
  $
  where $diam(K) = sup_(z, zeta in K) abs(zeta - z)$.
] <prop:complementbiholomorphismquarterestimate>

#proof[
  Denote the derivative of $phi.alt$ at the infinity to be $alpha$. By @eq:derivativeatpole1, we have
  $
    (phi.alt^(-1))'(0) = 1 / phi.alt'(oo) = 1 / alpha = -lim_(z -> 0) ((phi.alt^(-1))'(z)) / (phi.alt^(-1)(z)^2) <==> -lim_(z -> 0) ((phi.alt^(-1))(z)^2) / (alpha (phi.alt^(-1))'(z)) = 1.
  $
  Fix $tau in K$ and let $psi(z) = alpha / ((phi.alt^(-1))(z) - tau)$, univalent on $DD$. By direct calculation, we have $psi(0) = 0$. Additionally,
  $
    psi'(0) &= -lim_(z -> 0) alpha (phi.alt^(-1))'(z) / ((phi.alt^(-1))(z) - tau)^2 \ &= lim_(z -> 0) alpha (phi.alt^(-1))'(z) / ((phi.alt^(-1))(z) - tau)^2 dot ((phi.alt^(-1))(z))^2 / (alpha (phi.alt^(-1))'(z)) = 1.
  $
  By the Koebe Quarter Theorem (@ thm:koebequarter), whose proof is independent of results of this section, in accordance, $D(0, 1 / 4) subset.eq psi(DD)$. Let $mu in K without {tau}$. Obviously, $mu in.not (phi.alt^(-1))(DD) = extcomplex without K$.

  Let $z mapsto alpha / (z - tau)$ be injective on $extcomplex$. For the sake of contradiction, assume that $(z mapsto alpha / (z - tau))(mu) in psi(DD)$. Then $exists zeta in (phi.alt^(-1))(DD)$ such that $alpha / (zeta - tau) = alpha / (mu - tau)$. By injectivity, $zeta = mu$, which contradicts $mu in K$, and accordingly, $alpha / (mu - tau) in.not psi(DD) supset.eq D(0, 1 / 4)$.

  Hence,
  $
    abs(alpha / (mu - tau)) gt.eq 1 / 4 <==> abs(alpha) gt.eq abs(mu - tau) / 4.
  $
  By taking the supremum for $mu, tau in K$, the proof is complete.
]

#remark[
  Such a biholomorphism will always exist; for arbitrary $zeta in K$, the map $z mapsto 1 / (z - zeta)$ maps $extcomplex without K$ to a simply connected, proper subset of $CC$, which is biholomorphic to $DD$ by the Riemann Mapping Theorem (@thm:riemannmapping).
]

#proposition[
  Let $a in CC$, $r > 0$, and suppose $K subset.eq D(a, r)$ is compact such that $extcomplex without K$ is connected and $diam(K) gt.eq r / 2$. Then there is a family of holomorphic functions $cal(F) = {phi_zeta}_(zeta in D(a, r))$, where $forall zeta in D(a, r)$,
  $
    phi_zeta:extcomplex without K -> CC,
  $
  and
  + $abs(phi_zeta (z)) lt.eq 584 / r$ for any $z in extcomplex without K$. <itm:complementbiholomorphism584r4767r2estimates_absolute584>
  + $abs(phi_zeta (z) - 1 / (z - zeta)) lt.eq (4676 r^2) / abs(zeta - z)^3$ for any $z in extcomplex without (K union {zeta})$. <itm:complementbiholomorphism584r4767r2estimates_absolutedifference4676>
  + The function $phi(zeta, z) equiv phi_zeta (z)$ is jointly continuous in $zeta$ and $z$.
] <prop:complementbiholomorphism584r4767r2estimates>

#proof[
  For brevity, assume $a = 0$.

  Let $tilde(phi)$ be a conformal mapping from $extcomplex without K$ to $DD$, such that $tilde(phi)(oo) = 0$ and $alpha = tilde(phi)'(oo) in RR_(> 0)$. Let $phi(z) = 1 / alpha tilde(phi)(z)$. It follows that $phi'(oo) = 1$, $phi(oo) = 0$. By @prop:complementbiholomorphismquarterestimate,
  $
    abs(alpha) gt.eq 1 / 4 diam(K) <==> abs(phi(z)) lt.eq (4 abs(tilde(phi)(z))) / diam(K).
  $
  Consequently, we have the crucial estimate of $phi(extcomplex without K) subset.eq D(0, 4 / diam(K)) subset.eq D(0, 8 / r)$. For fixed $zeta in D(0, r)$, define
  $
    phi_zeta (z) = phi(z) + (zeta - beta) phi^2(z), quad z in extcomplex without K
  $
  where $beta = (phi''(oo)) / 2$. The application of Cauchy's Estimate (@thm:cauchysestimate) on $(z mapsto 1 / z)(extcomplex without D(0, r)) = D(0, 1 / r)$ gives:
  $
    abs(beta) = 1 / 2 abs(dv(phi(1 / z), z, deg: 2, eval: 0)) lt.eq sup_(D(0, 1 / r)) abs(phi(1 / z)) / op("dist")(0, partial D(0, 1 / r))^2 = 8 r.
  $
  Hence,
  $
    abs(phi_zeta (z)) &lt.eq abs(phi(z)) + abs(zeta - beta) abs(phi^2(z)) lt.eq abs(phi(z)) + abs(zeta - beta) abs(phi^2(z)) \ &lt.eq 8 / r + 9 r 64 / r^2 = 584 / r.
  $
  This is @itm:complementbiholomorphism584r4767r2estimates_absolute584. Suppose that $abs(z - zeta) > 2 r$. It follows from $abs(zeta) < r$ that $abs(z) > r$ (from the reverse triangle inequality) and hence disjoint from $K$ and $zeta$. On this infinite annulus, we have the Laurent expansion (from @thm:laurentexpansionofholomorphicfunction) that
  $
    phi(z) = sum_(k = 1)^oo mu_k / (z - zeta)^k = 1 / (z - zeta) + mu / (z - zeta)^2 + Order(1 / (z - zeta)^3)
  $
  where $mu_1 = 1$ because $phi ~ 1 / z$ as $z -> oo$. Since $abs(z) > r$, we have the global Laurent expansion
  $
    phi(z) = 1 / z + beta / z^2 + Order(1 / z^3).
  $
  Hence,
  $
    1 / (z - zeta) + mu / (z - zeta)^2 & = 1 / z + beta / z^2 + Order(1 / z^3) \
    z + zeta + mu & = z + zeta^2 / z + beta + (beta zeta^2) / z^2 - (2 beta zeta) / z + Order(1 / z) = z + beta + Order(1 / z) \
    mu & = beta - zeta
  $
  by letting $z -> oo$. Since
  $
    phi(z)^2 = (1 / (z - zeta) + Order(1 / (z - zeta)^2))^2 = 1 / (z - zeta)^2 + Order(1 / (z - zeta)^3),
  $
  from the definition of $phi_zeta$, we have
  $
    phi_zeta (z) - 1 / (z - zeta) = phi - mu phi^2 - 1 / (z - zeta) & = mu / (z - zeta)^2 + Order(1 / (z - zeta)^3) \
                                                                    & quad""- mu / (z - zeta)^2 - Order(mu / (z - zeta)^3) \
                                                                    & = Order(1 / (z - zeta)^3).
  $
  Hence, there exists some $M > 0$ such that
  $
    abs(phi_zeta (z) - 1 / (z - zeta)) < M / abs(z - zeta)^3 <==> abs(phi_zeta (z) - 1 / (z - zeta)) abs(z - zeta)^3 < M
  $
  for all $z$ satisfying $abs(z - zeta) > 2 r$. By @thm:riemannremovablesingularities, $(phi_zeta (z) - 1 / (z - zeta)) (z - zeta)^3$ has a removable singularity at $oo$. On the other hand, for $abs(z - zeta) lt.eq 2 r$ such that $z in extcomplex without (K union {zeta})$, we have
  $
    abs(phi_zeta (z) - 1 / (z - zeta)) abs(z - zeta)^3 & lt.eq abs(phi_zeta (z)) abs(z - zeta)^3 + abs(z - zeta)^2 \
                                                       & lt.eq 584 / r (2 r)^3 + (2 r)^2 = 4676 r^2
  $
  from @itm:complementbiholomorphism584r4767r2estimates_absolute584. The Maximum Modulus Principle (@thm:maximummodulus) implies that
  $
    sup_(abs(z - zeta) > 2 r) abs(phi_zeta (z) - 1 / (z - zeta)) abs(z - zeta)^3 lt.eq sup_(abs(z - zeta) = 2 r) abs(phi_zeta (z) - 1 / (z - zeta)) abs(z - zeta)^3 lt.eq 4676 r^2
  $
  and thus @itm:complementbiholomorphism584r4767r2estimates_absolutedifference4676 follows. The joint continuity of $phi_zeta$ is immediate from the definition.

  Lastly, if $a != 0$, we may define $phi_zeta (z) = tilde(phi)_(zeta - a) (z - a)$ where ${tilde(phi)_(zeta - a)}$ is the family constructed above for the set ${z - a : z in K} subset D(0, r)$.
]

#proposition[
  Suppose
  $
    lambda(z) = cases(
      (1 - abs(z)^2)^2 & abs(z) < 1\,,
      0 & abs(z) gt.eq 1\,
    ) quad lambda_r (z) = 3 / (uppi r^2) lambda(z / r) quad forall r > 0
  $ <eq:diracdeltaapproximation_lambdadefinition>
  For fixed $r$, the function $lambda_r$ satisfies:
  + $integral.double_(CC) lambda_r (zeta) dif xi dif eta = 1$, where $zeta = xi + ii eta$. <itm:diracdeltaapproximation_integralto1>
  + $lambda_r in C^1(CC)$ and is compactly supported. <itm:diracdeltaapproximation_compactsupportcontinuousdifferentiability>
  + $integral.double_(CC) pdv(lambda_r, overline(zeta)) dif xi dif eta = 0$. <itm:diracdeltaapproximation_antiholomorphicderivativeintegral>
  + $integral.double_(CC) abs(pdv(lambda_r, overline(zeta))) dif xi dif eta lt.eq (2 uppi) / r$. <itm:diracdeltaapproximation_absoluteantiholomorphicderivativeintegral>
  + $norm(grad lambda_r (z)) lt.eq 4 / r^3$ for all $z$, where $grad = (pdv(, x), pdv(, y))$ denotes the vector differential operator. <itm:diracdeltaapproximation_gradientstatement>
  + For any $z in CC$ such that $f$ is a holomorphic function on $D(z, r)$, we have the integral formula. <itm:diracdeltaapproximation_integralformula>
    $
      f(z) = integral.double_(D(0, r)) f(z - zeta) lambda_r (zeta) dif xi dif eta.
    $ <eq:diracdeltaapproximation_integralformula>
] <prop:diracdeltaapproximation>

#proof[
  Let $zeta = rho ee^(ii theta)$. Then we have
  $
    integral.double_(CC) lambda_r (zeta) dif xi dif eta & = integral_0^(2 uppi) integral_0^r lambda_r (rho ee^(ii theta)) rho dr d theta \
    &= integral_0^(2 uppi) integral_0^r (3 rho) / (uppi r^2) (1 - (rho / r)^2)^2 dr d theta \
    & = 6 / r^2 integral_0^r (rho + rho^5 / r^4 - 2 rho^3 / r^2) dr \ &= 6 / r^2 (r^2 / 2 + r^6 / (6 r^4) - r^4 / (2 r^2)) = 1,
  $
  which confirms @itm:diracdeltaapproximation_integralto1. Let $z in CC$ be arbitrary. The integral in @eq:diracdeltaapproximation_integralformula is equal to
  $
    &integral.double_(D(0, R)) f(z - zeta) lambda_r (zeta) dif xi dif eta \
    & wide"" = integral_0^r (3 rho) / (uppi r^2) (1 - (rho / r)^2)^2 integral_0^(2 uppi) f(z - rho ee^(ii theta)) d theta dr \
    & wide""= 2 uppi f(z) integral_0^r (3 rho) / (uppi r^2) (1 - (rho / r)^2)^2 dr = f(z)
  $
  by the mean-value property (@lem:holomorphicmeanvalueproperty), proving @itm:diracdeltaapproximation_integralformula. For $z in DD$, we have
  $
    norm(grad lambda(z)) & = 2 (1 - abs(z)^2) norm(grad(abs(z)^2)) \
                         & = 2 (1 - abs(z)^2) 2 abs(z) norm(grad sqrt(x^2 + y^2)) = 4 (1 - abs(z)^2) abs(z).
  $
  Hence,
  $
    norm(grad lambda_r (z)) & = 3 / (uppi r^2) norm(grad(lambda(z / r))) = 3 / (uppi r^2) norm((grad lambda)(z / r)) 1 / r \
                            & = 12 / (uppi r^3) (1 - abs(z)^2) abs(z) < 4 / r^3,
  $
  which confirms @itm:diracdeltaapproximation_gradientstatement. Since $abs(pdv(lambda_r, overline(zeta))) = abs(1 / 2 (pdv(lambda_r, xi) + ii pdv(lambda_r, eta))) = 1 / 2 norm(grad lambda_r (zeta)) < 2 / r^3$, we have
  $
    integral.double_(CC) abs(pdv(lambda_r, overline(zeta))) dif xi dif eta = integral.double_(D(0, r)) abs(pdv(lambda_r, overline(zeta))) dif xi dif eta < uppi r^2 2 / r^3 = (2 uppi) / r
  $
  since $supp(lambda_r) = overline(D(0, r))$ which verifies the inequality in @itm:diracdeltaapproximation_absoluteantiholomorphicderivativeintegral.

  The @itm:diracdeltaapproximation_antiholomorphicderivativeintegral is also true since
  $
    integral.double_(CC) pdv(lambda_r, overline(zeta)) dif xi dif eta & = 1 / 2 integral_(-r)^r integral_(-r)^r pdv(lambda_r, xi) dif xi dif eta + ii / 2 integral_(-r)^r integral_(-r)^r pdv(lambda_r, eta) dif eta dif xi \
    & = 1 / 2 integral_(-r)^r [lambda_r (r + ii eta) - lambda(-r + ii eta)] dif eta \
    & quad ""+ ii / 2 integral_(-r)^r [lambda_r (xi + ii r) - lambda_r (xi - ii r)] dif xi = 0.
  $
  Trivially, $lambda_r$ is continuous on $D(0, r)$ and $CC without overline(D(0, r))$. Thus, we only need to prove the joint continuity of $lambda$ (the continuity of $lambda_r$ implies that of $lambda$) on an open neighborhood of $partial D(0, r)$.

  Let $lambda(x, y) = (1 - x^2 - y^2)^2$. By simple calculation, we have
  $
    pdv(lambda, x) = -4 (1 - x^2 - y^2) x, quad pdv(lambda, y) = -4 (1 - x^2 - y^2) y.
  $
  At $x^2 + y^2 = 1$, both partial derivatives vanish, and hence, they match the vanishing derivative on the complement of $supp(lambda)$, completing the proof of @itm:diracdeltaapproximation_compactsupportcontinuousdifferentiability.
]

#theorem("Tietze" + sym.dash.en + "Urysohn" + sym.dash.en + "Brouwer")[
  Let $K subset.eq CC$ be compact and $f:K -> RR$ be continuous. Then $exists g in C^0(CC)$ such that $g equiv f$ on $K$.
] <thm:tietzeextension>

#proof[
  For any two disjoint closed $A, B subset.eq CC$, consider the continuous separation function
  $
    eta_(A, B)(z) = (op("dist")(z, A) - op("dist")(z, B)) / (op("dist")(z, A) + op("dist")(z, B))
  $
  so that $eta_(A, B)(A) = {-1}$ and $eta_(A, B)(B) = {1}$.

  For simplicity, by the boundedness of $f$, we may assume that $f(K) = [-1, 1]$ (by a scaling and shift). We now aim to construct a sequence ${g_n}_(n in NN_(>= 0))$ inductively such that
  $
    abs(g_n) lt.eq 2^n / 3^(n + 1) "on" CC, quad abs(f - sum_(k = 0)^n g_k) lt.eq (2 / 3)^(n + 1) "on" K quad forall n in NN.
  $
  In the case that $n = 0$, define the disjoint closed sets
  $
    A_0 = {z in K: f(z) lt.eq -1 / 3} quad "and" quad B_0 = {z in K: f(z) gt.eq 1 / 3}.
  $
  Let $g_0(z) = 1 / 3 eta_(A_0, B_0)(z)$. It is clear that $abs(g_0) lt.eq 1 / 3$ on $CC$. If $z in A_0$, then $-1 lt.eq f(z) lt.eq -1 / 3$, $g_0(z) = -1 / 3$, and hence $abs(f - g_0) lt.eq 2 / 3$. If $z in B_0$, then $1 / 3 lt.eq f(z) lt.eq 1$, $g_0(z) = 1 / 3$, and thus $abs(f - g_0) lt.eq 2 / 3$. If $z in.not A_0 union B_0$, then $-1 / 3 < f(z) < 1 / 3$ and $abs(f - g_0) lt.eq abs(f) + abs(g_0) < 1 / 3 + 1 / 3 = 2 / 3$. Thus, $forall z in K$,
  $
    abs(f(z) - g_0(z)) lt.eq 2 / 3.
  $
  This proves the base case. For the inductive step, assume the claim holds for each $g_0, g_1, dots, g_(n - 1)$. Define
  $
    h_n(z) = f(z) - sum_(k = 0)^(n - 1) g_k(z)
  $
  for $z in K$. By the inductive hypothesis, we have $abs(h_n) lt.eq (2 / 3)^n$ on $K$. Define the disjoint closed sets
  $ A_n = {z in K: -(2^n) / 3^n lt.eq h_n(z) lt.eq -(2^n) / 3^(n + 1)} $ and $ B_n = {z in K: (2^n) / 3^n gt.eq h_n(z) gt.eq (2^n) / 3^(n + 1)}. $
  Let $g_n(z) = 2^n / 3^(n + 1) eta_(A_n, B_n)(z)$, so that $abs(g_n) lt.eq 2^n / 3^(n + 1)$ on $CC$, and
  $
    abs(h_n(z) - g_n(z)) lt.eq 2^(n + 1) / 3^(n + 1)
  $
  for all $z in K$ by the same argument as in the base case. Hence,
  $
    abs(f(z) - sum_(k = 0)^n g_k(z)) = abs(h_n(z) - g_n(z)) lt.eq (2 / 3)^(n + 1)
  $
  for all $z in K$, completing the induction. Because
  $
    abs(g(z)) lt.eq sum_(n = 0)^oo abs(g_n(z)) lt.eq 1 / 3 sum_(n = 0)^oo 2^n / 3^n = 1 quad forall z in CC,
  $
  the Weierstrass $M$--Test (@thm:weierstrassmtest) implies that the series $sum_(n = 0)^oo g_n(z)$ converges uniformly on $CC$ to $g$. Since each $g_n$ is continuous, @thm:uniformlimit gives the continuity of $g$ on $CC$. Finally, for any $z in K$, we have
  $
    abs(f(z) - g(z)) lt.eq lim_(n -> oo) 2^(n + 1) / 3^(n + 1) = 0. #qedhere
  $
]

#corollary[
  If $K subset.eq CC$ is compact and $f:K -> CC$ is continuous, then $exists g in C^0(CC)$ such that $g equiv f$ on $K$ and has compact support.
] <cor:tietzeextensioncomplexcompactsupport>

#proof[
  Let $f = u + ii v$ where $u, v:K -> RR$ are continuous. By Tietze--Urysohn--Brouwer (@thm:tietzeextension), $exists tilde(u), tilde(v) in C^0(CC)$ such that $tilde(u) equiv u$ and $tilde(v) equiv v$ on $K$. Let $R > 0$ be such that $K subset D(0, R)$, provided by compactness. Define the piecewise-linear function
  $
    psi(z) = cases(
      1 & abs(z) lt.eq R\,,
      2 - abs(z) / R & R < abs(z) < 2 R\,,
      0 & abs(z) gt.eq 2 R,
    )
  $
  such that $psi in C^0(CC)$ and is compactly supported. Let $g(z) = (tilde(u)(z) + ii tilde(v)(z)) psi(z)$, and the assertion follows.
]

Let $f in C^0(K)$ be holomorphic on $interior(K)$. Then $f$ has a continuous extension to all of $CC$ by virtue of @cor:tietzeextensioncomplexcompactsupport. Define the _modulus of continuity_ of $f$ to be the function $omega_f:RR_(>= 0) -> RR_(>= 0)$ with
$
  omega_f (delta) = sup_(
  z, zeta in CC \
  abs(z - zeta) lt.eq delta
  ) abs(f(z) - f(zeta)).
$
Because $f$ has compact support, it must be uniformly continuous; hence we have $lim_(delta -> 0^+) omega_f (delta) = 0$.

For $r > 0$, define
$
  Phi(z) = integral.double_(CC) lambda_r (z - zeta) f(zeta) dif xi dif eta quad "where" quad zeta = xi + ii eta,
$ <eq:integralofcontinuousextensionofholomorphic>
where $lambda_r$ employs the same definition as in @eq:diracdeltaapproximation_lambdadefinition.

#proposition[
  The function $Phi$ as in @eq:integralofcontinuousextensionofholomorphic satisfies:
  + $Phi in C^1(CC)$ and has compact support. <itm:integralofcontinuousextensionofholomorphicproperties_continuousdifferentiabilitycompactsupport>
  + $Phi equiv f$ on $U = {z in K: op("dist")(z, CC without K) > r}$. <itm:integralofcontinuousextensionofholomorphicproperties_equivalenceonU>
  + $abs(f(z) - Phi(z)) lt.eq omega_f (r)$ for all $z in CC$. <itm:integralofcontinuousextensionofholomorphicproperties_differbymodulusofcontinuity>
  + For all $z in CC$, $abs(pdv(Phi, overline(z))(z)) lt.eq (4 uppi omega_f (r)) / r$. <itm:integralofcontinuousextensionofholomorphicproperties_antiholomorphicderivativebound>
  + $Phi(z) = -1 / uppi integral.double_H pdv(Phi, overline(zeta))(zeta) (dif xi dif eta) / (zeta - z)$ for $z in CC$, where $H = supp(Phi) without U$. <itm:integralofcontinuousextensionofholomorphicproperties_integralformula>
] <prop:integralofcontinuousextensionofholomorphicproperties>

#proof[
  Because $supp(lambda_r (z - zeta)) = overline(D(z, r))$ and $supp f$ is compact, for sufficiently large $z$, the two supports will be disjoint and hence the integrand vanishes for all $zeta$. We can explicitly find that
  $
    pdv(Phi, x) &= lim_(
    Delta x -> 0 \
    Delta x in RR
    ) (Phi(z + Delta x) - Phi(Delta x)) / (Delta x) \
    &= lim_(
    Delta x -> 0 \
    Delta x in RR
    ) integral_(CC) (lambda_r (z + Delta x - zeta) - lambda_r (z - zeta)) / (Delta x) f(zeta) dif xi and dif eta.
  $
  Because $f$ is continuous and vanishes on a compact set, it is bounded. Similarly, @itm:diracdeltaapproximation_compactsupportcontinuousdifferentiability of @prop:diracdeltaapproximation implies that $pdv(lambda_r, x)$ is bounded. Hence, by Lebesgue's Dominated Convergence Theorem, we have
  $
    pdv(Phi, x) = integral_(CC) pdv(lambda_r, x)(z - zeta) f(zeta) dif xi and dif eta,
  $
  and similarly,
  $
    pdv(Phi, y) = integral_(CC) pdv(lambda_r, y)(z - zeta) f(zeta) dif xi and dif eta.
  $
  Hence, $Phi in C^1(CC)$ and this is @itm:integralofcontinuousextensionofholomorphicproperties_continuousdifferentiabilitycompactsupport. Because
  $
    Phi(z) = integral.double_(CC) lambda_r (z - zeta) f(zeta) dif xi dif eta = integral.double_(CC) lambda_r (zeta) f(z - zeta) dif xi dif eta,
  $
  by @itm:diracdeltaapproximation_integralto1 of @prop:diracdeltaapproximation, we have
  $
    abs(f(z) - Phi(z)) & lt.eq abs(integral_(CC) f(z) lambda_r (zeta) dif xi and dif eta - integral_(CC) f(z - zeta) lambda_r (zeta) dif xi and dif eta) \
    & = abs(integral_(CC) lambda_r (zeta) (f(z) - f(z - zeta)) dif xi and dif eta) \
    & lt.eq integral_(D(0, r)) lambda_r (zeta) abs(f(z) - f(z - zeta)) dif xi and dif eta lt.eq omega_f (r),
  $ <eq:integralofcontinuousextensionofholomorphicproperties_differencebound>
  which implies @itm:integralofcontinuousextensionofholomorphicproperties_differbymodulusofcontinuity. For $z in U$, $zeta in D(0, r)$ now implies that $z - zeta in interior(K)$ and hence $f(z) - f(z - zeta)$ is holomorphic in $zeta$ on $D(z, r)$. By @itm:diracdeltaapproximation_integralformula of @prop:diracdeltaapproximation, @eq:integralofcontinuousextensionofholomorphicproperties_differencebound becomes
  $
    abs(integral_(CC) lambda_r (zeta) (f(z) - f(z - zeta)) dif xi and dif eta) = abs(f(z) - f(z - 0)) = 0,
  $
  which proves @itm:integralofcontinuousextensionofholomorphicproperties_equivalenceonU. Because $forall z in CC$,
  $
    pdv(Phi, overline(z))(z) & = 1 / 2 (pdv(Phi, x) + ii pdv(Phi, y)) = integral_(CC) pdv(lambda_r, overline(z))(z - zeta) f(zeta) dif xi and dif eta \
    & = integral_(CC) pdv(lambda_r, overline(zeta))(zeta) f(z - zeta) dif xi and dif eta \
    & = integral_(CC) pdv(lambda_r, overline(zeta))(zeta) f(z - zeta) dif xi and dif eta - f(z) integral_(CC) pdv(lambda_r, overline(zeta)) dif xi and dif eta \
    & = integral_(CC) pdv(lambda_r, overline(zeta))(zeta) (f(z - zeta) - f(z)) dif xi and dif eta
  $
  by @itm:diracdeltaapproximation_antiholomorphicderivativeintegral of @prop:diracdeltaapproximation. Hence,
  $
    abs(pdv(Phi, overline(z))) & lt.eq integral.double_(D(0, r)) abs(pdv(lambda_r, overline(zeta))) abs(f(z - zeta) - f(z)) dif xi dif eta \
    & lt.eq omega_f (r) integral.double_(D(0, r)) norm(grad lambda_r) dif xi dif eta \
    & lt.eq (4 omega_f (r)) / r^3 integral.double_(D(0, r)) dif xi dif eta lt.eq (4 omega_f (r)) / r^3 dot uppi r^2 = (4 uppi omega_f (r)) / r,
  $
  by @itm:diracdeltaapproximation_gradientstatement of @prop:diracdeltaapproximation, confirming @itm:integralofcontinuousextensionofholomorphicproperties_antiholomorphicderivativebound. Finally, @itm:integralofcontinuousextensionofholomorphicproperties_integralformula follows from @cor:pompeiuwithoutcauchyterm (since outside the support the integral trivially vanishes and within $U$, $pdv(Phi, overline(zeta))$ vanishes as a consequence of holomorphy).
]

#theorem("Mergelyan")[
  Let $K subset.eq CC$ be compact such that $extcomplex without K$ has finitely many connected components. Let $E subset.eq extcomplex without K$ contain exactly one point from each of the connected components of $extcomplex without K$. Suppose $f in C^0(K)$ is holomorphic on $interior(K)$. Then $forall epsilon > 0$, there exists a rational function $psi(z)$ with poles in $E$ such that
  $
    sup_(z in K) abs(psi(z) - f(z)) < epsilon.
  $
] <thm:mergelyan>

#figure-wrapper([
  #figure(
    cetz.canvas({
      import cetz.draw: *

      let length-mark = (start: (pos: 5%, symbol: "|", inset: 0%), end: (pos: 5%, symbol: "|", inset: 0%))
      let var-r-label-coordinates = (coord_from, coord_to, offset: 10pt) => {
        (coord_from, 100%)
      }

      compound-path(
        {
          for region in visual-data.pre-erosion-region-list {
            catmull(
              ..region,
              close: true,
              tension: 0.5,
            )
          }
        },
        stroke: 1pt,
        fill: diagonal-stripes(
          size: 3pt,
          angle: 45deg,
          thickness: 0.2pt,
        ),
        fill-rule: "even-odd",
      )
      compound-path(
        {
          for region in visual-data.eroded-region-list {
            catmull(
              ..region,
              close: true,
              tension: 0.5,
            )
          }
        },
        stroke: 0.5pt,
        fill: dot-tiling(),
        fill-rule: "even-odd",
      )

      content((4.2, 1.4), [$K$], anchor: "center")

      for disk in visual-data.input-disk-list {
        catmull(..disk, close: true, tension: 0.5, stroke: (dash: "dashed", thickness: 0.5pt))
      }

      for (i, center) in visual-data.input-disk-centers.enumerate(start: 1) {
        circle(center, radius: 1pt, fill: black)
        content(center, $p_#i$, anchor: "south", padding: 2pt)
      }

      for ind in visual-data.erosion-radius-indicator-list {
        line(ind.at(0), ind.at(1), stroke: 0.5pt, mark: length-mark)
        content(
          ((ind.at(0), 50%, ind.at(1)), 4pt, 90deg, ind.at(0)),
          [$r$],
          anchor: "center",
        )
      }

      line(..visual-data.input-disk-radius-indicator-list.at(0), stroke: 0.5pt, mark: length-mark)

      let midpoint-coord = (
        visual-data.input-disk-radius-indicator-list.at(0).at(0),
        50%,
        visual-data.input-disk-radius-indicator-list.at(0).at(1),
      )
      get-ctx(ctx => {
        let midpoint-coord = cetz.coordinate.resolve(ctx, midpoint-coord).at(1)
        let label-coord = cvector.add(midpoint-coord, (-1.5, 1))
        line(
          label-coord,
          midpoint-coord,
          mark: (end: ">>", fill: black),
          stroke: 0.5pt,
        )
        content(label-coord, [$3 / 4 r$], anchor: "south")
      })
    }),
    caption: [The striped region bounds $K$, while the thin lines bound the dotted region $U$.],
  ) <fig:mergelyan_kseterosions>
])

#proof[
  Let $F = {p_k}_(1 <= k <= n)$ contain precisely one point from each connected component of $extcomplex without K$ (such that each $p_k != oo$ is finite). Suppose that $r$ is chosen such that $0 < 3 / 4 r < op("dist")(K, F)$ so that for each $p_k in F$ not equal to $oo$,
  $
    overline(D(p_k, 3 / 4 r)) subset extcomplex without K.
  $

  #figure-wrapper([
    #figure(
      cetz.canvas({
        import cetz.draw: *

        compound-path(
          {
            for region in visual-data.covered-region-list {
              catmull(
                ..region,
                close: true,
                tension: 0.5,
              )
            }
          },
          stroke: 1pt,
          fill: diagonal-stripes(
            size: 3pt,
            angle: 45deg,
            thickness: 0.2pt,
          ),
          fill-rule: "even-odd",
        )

        compound-path(
          {
            for region in visual-data.no-centers-region-list {
              catmull(
                ..region,
                close: true,
                tension: 0.5,
              )
            }
          },
          stroke: 0.5pt,
          fill: color.black.transparentize(60%),
          fill-rule: "even-odd",
        )

        compound-path(
          {
            for center in visual-data.subcover-disk-centers {
              circle(center, radius: visual-data.subcover-disk-radius)
            }
          },
          stroke: 0.2pt,
          fill: dot-tiling(
            pattern_dist: 1.8pt,
            radius: 0.16pt,
          ),
          fill-rule: "non-zero",
        )

        for center in visual-data.subcover-disk-centers {
          n-star(center, 5, radius: 1pt, fill: black)
        }

        for (i, center) in visual-data.input-disk-centers.enumerate(start: 1) {
          circle(center, radius: 1pt, fill: black)
          content(center, math-rect($p_#i$), anchor: "south", padding: 2pt)
        }
      }),
      caption: [The striped region represents $H$ while the unshaded regions represent the set which $zeta_k$ can be in, each of which are denoted by small stars. The dotted disks represent the finite subcover of $H$: notice that every striped region is also dotted.],
    ) <fig:mergelyan_hset>
  ])

  Define the extension of $f$, $Phi$, $U$, and $H$ as in the previous results. Hence, (see @fig:mergelyan_kseterosions, @fig:mergelyan_hset)
  $
    {D(zeta_k, 5 / 4 r): (forall) zeta_k in extcomplex without (K union overline(D(p_k, 3 / 4 r))), 1 <= k <= n}
  $
  covers a (compact) $r$-neighborhood of $extcomplex without K$ (so that each $zeta_k in.not K$, and is labeled so that each $zeta_k$ is in the same connected component as $p_k$) (in the case that $p_k = oo$, let the disk inside be the empty set). Thus, the collection also covers $H$. A finite subcover ${D(zeta_k^((j)), 5 / 4 r)}_(1 <= j <= m_k\ 1 <= k <= n)$ covering $H$ exists by the Heine--Borel Theorem (@thm:heineborel).

  By the connectivity of each component of $extcomplex without K$, there exists a piecewise-linear simple curve $gamma_k^((j))$ for all $1 <= k <= n$, $1 <= j <= m_k$, joining $zeta_k^((j))$ and $p_k$, which lies entirely within $extcomplex without K$. The compact disks $D(zeta_k^((j)), 3 / 4 r)$ are all disjoint from their corresponding $p_k$ since each $zeta_k^((j)) in.not overline(D(p_k, 3 / 4 r))$ by definition.

  #figure-wrapper(
    [
      #figure(
        cetz.canvas({
          import cetz.draw: *

          let var-r = 2
          let var-zeta = (-1.7, -1.9)

          let curve = (
            (0, 0),
            (-0.25, 0.5),
            (0.125, 0.25),
            (0.5, 0.4),
            (0.3, -0.2),
            (0.85, -0.35),
            (0.5, -0.6),
            (0.8, -1),
            (0.2, -0.7),
            (0.0, -1.3),
            (-0.2, -0.6),
            (-0.3, -1.1),
            (-0.6, -0.1),
            cvector.scale(var-zeta, 1 / var-r),
          ).map(point => cvector.scale(point, var-r))

          let seg-dist(a, b) = calc.sqrt(
            calc.pow(a.at(0) - b.at(0), 2) + calc.pow(a.at(1) - b.at(1), 2),
          )
          let arc-length-to(pts, sp, eps: 1e-4) = {
            let total = 0.0
            for i in range(pts.len() - 1) {
              let (a, b) = (pts.at(i), pts.at(i + 1))
              let dab = seg-dist(a, b)
              if calc.abs(seg-dist(a, sp) + seg-dist(sp, b) - dab) < eps {
                return total + seg-dist(a, sp)
              }
              total += dab
            }
            return none
          }

          let split-at(pts, sp, eps: 1e-4) = {
            for i in range(pts.len() - 1) {
              let (a, b) = (pts.at(i), pts.at(i + 1))
              if calc.abs(seg-dist(a, sp) + seg-dist(sp, b) - seg-dist(a, b)) < eps {
                return (pts.slice(0, i + 1) + (sp,), (sp,) + pts.slice(i + 1))
              }
            }
            return (pts, ())
          }

          circle((0, 0), radius: var-r, stroke: (dash: "dotted"))
          hide({
            circle((0, 0), radius: var-r, name: "big-circle")
            line(..curve, name: "gamma-hidden")
          })
          intersections("i", "big-circle", "gamma-hidden")

          let omitted-section-stroke = (dash: (3pt, 3pt), thickness: 0.8pt)

          get-ctx(ctx => {
            let anchor-names = (ctx.nodes.at("i").anchors)(())
            if anchor-names.len() > 0 {
              let best-sp = none
              let best-len = none
              for name in anchor-names {
                let pt = (ctx.nodes.at("i").anchors)(name)
                let sp = (pt.at(0), pt.at(1))
                let len = arc-length-to(curve, sp)
                if len != none and (best-len == none or len < best-len) {
                  best-len = len
                  best-sp = sp
                }
              }
              if best-sp != none {
                let (solid, dashed) = split-at(curve, best-sp)
                (
                  line(..solid, stroke: 1pt, name: "gamma-k-(j)-without-E-k-(j)")
                    + if dashed.len() >= 2 {
                      line(..dashed, stroke: omitted-section-stroke)
                    } else { () }
                )
              } else {
                line(..curve, stroke: 1pt, name: "E-k-(j)")
              }
            } else {
              line(..curve, stroke: 1pt, name: "E-k-(j)")
            }
          })

          circle((0, 0), radius: 1pt, fill: black)
          content((0, 0), [$p_k$], anchor: "north", padding: 2pt)
          circle(var-zeta, radius: 1.2pt, fill: black)
          content(var-zeta, [$zeta_k^((j))$], anchor: "east", padding: 2pt)
          content((name: "gamma-k-(j)-without-E-k-(j)", anchor: 50%), [$E_k^((j))$], anchor: "west", padding: 2pt)
        }),
        caption: [The construction of $E_k^j$. The entire polyline from $p_k$ to $zeta_k^((j))$ is $gamma_k^((j))$],
      ) <fig:mergelyan_eset>
    ],
    [
      #figure(
        cetz.canvas(length: 0.6cm, {
          import cetz.draw: *
          for region in visual-data.covered-disjoint-union-region-list {
            catmull(..region, close: true, tension: 0.5, stroke: 0.2pt, fill: diagonal-stripes(
              size: 2pt,
              angle: 45deg,
              thickness: 0.2pt,
            ))
          }
        }),
        caption: [A conceptual construction of ${H_k^((j))}$, which unions to $H$.],
      ) <fig:mergelyan_hkjsets>
    ],
  )

  Hence, the intersection $overline(D(zeta_k^((j)), 3 / 4 r)) inter gamma_k^((j))$ consists of at least one connected component joining $zeta_k^((j))$ to a point on $partial D(zeta_k^((j)), 3 / 4 r)$. Denote the connected component of this intersection by $E_k^((j))$, satisfying $diam E_k^((j)) gt.eq 3 / 4 r > r / 2$ and $E_k^((j)) inter K = emptyset$.

  Now for each $j$ and $k$, @prop:complementbiholomorphism584r4767r2estimates now provides the existence of a family of holomorphic functions $phi_(zeta, k)^((j)):extcomplex without E_k^((j)) -> CC$ given with $zeta in D(zeta_k^((j)), 5 / 4 r)$ such that
  $
    abs(phi_(zeta, k)^((j)) (z)) lt.eq 584 / r, quad abs(phi_(zeta, k)^((j)) (z) - 1 / (z - zeta)) lt.eq 4676 / abs(z - zeta)^3, quad forall z in extcomplex without E_k^((j)).
  $ <eq:mergelyan_familybounds>
  Let $tilde(H)_k^((j)) = H inter D(zeta_k^((j)), 5 / 4 r)$, for each $j, k$ and construct the disjoint sets
  $
    H_k^((j)) = tilde(H)_k^((j)) without (union.big_(j' < j) tilde(H)_k^((j')) union union.big_(k' < k) union.big_(j' <= m_(k')) tilde(H)_(k')^((j'))) "if" j != 1, quad H_1^((1)) = tilde(H)_1^((1)).
  $
  Thus the union
  $
    union.big_(k = 1)^n union.big_(j = 1)^(m_k) H_k^((j)) = H inter (union.big D(zeta_k^((j)), 5 / 4 r)) = H
  $
  since the set of all $D(zeta_k^((j)), 5 / 4 r)$ covers $H$. Let
  $
    Psi(z) = 1 / uppi sum_(k = 1)^n sum_(j = 1)^(m_k) integral_(H_k^((j))) pdv(Phi, overline(zeta)) phi_(zeta, k)^((j)) (z) dif xi and dif eta,
  $
  where $zeta = xi + ii eta, forall z in.not union.big E_k^((j))$. Because
  $
    (Psi(z + Delta x) - Psi(z)) / (Delta x) = 1 / uppi sum_(k = 1)^n sum_(j = 1)^(m_k) integral_(H_k^((j))) pdv(Phi, overline(zeta)) (phi_(zeta, k)^((j)) (z + Delta x) - phi_(zeta, k)^((j)) (z)) / (Delta x) dif xi and dif eta,
  $
  and both $partialderivative(Phi, overline(zeta), style: "horizontal")$ and the integrand is continuous on a set (we only need to consider the factors involving $phi_(zeta, k)^((j))$ since $partialderivative(Phi, overline(zeta), style: "horizontal")$ is independent from $z$) by Cauchy's Estimates and the first bound of @eq:mergelyan_familybounds, Lebesgue's Dominated Convergence gives that
  $
    pdv(Psi, x) = 1 / uppi sum_(k = 1)^n sum_(j = 1)^(m_k) integral_(H_k^((j))) pdv(Phi, overline(zeta)) pdv(phi_(zeta, k)^((j)), x)(z) dif xi and dif eta,
  $
  and in analogous fashion,
  $
    pdv(Psi, y) = 1 / uppi sum_(k = 1)^n sum_(j = 1)^(m_k) integral_(H_k^((j))) pdv(Phi, overline(zeta)) pdv(phi_(zeta, k)^((j)), y)(z) dif xi and dif eta.
  $
  Hence, $Psi$ is holomorphic on $extcomplex without union.big_(k = 1)^n union.big_(j = 1)^(m_k) E_k^((j))$, a neighborhood of $K$. Since $forall z in extcomplex without union.big E_k^((j))$, by @itm:complementbiholomorphism584r4767r2estimates_absolutedifference4676 of @prop:complementbiholomorphism584r4767r2estimates,
  $
    abs(Psi(z) - Phi(z)) & = abs(1 / uppi sum_(k = 1)^n sum_(j = 1)^(m_k) integral.double_(H_k^((j))) pdv(Phi, overline(zeta)) phi_(zeta, k)^((j)) (z) dif xi dif eta - 1 / uppi integral.double_H pdv(Phi, overline(zeta)) (dif xi dif eta) / (z - zeta)) \
    & = 1 / uppi abs(sum_(k = 1)^n sum_(j = 1)^(m_k) integral.double_(H_k^((j))) pdv(Phi, overline(zeta)) (phi_(zeta, k)^((j)) (z) - 1 / (z - zeta)) dif xi dif eta) \
    & lt.eq 1 / uppi sum_(k = 1)^n sum_(j = 1)^(m_k) integral.double_(H_k^((j))) abs(pdv(Phi, overline(zeta))) abs(phi_(zeta, k)^((j)) (z) - 1 / (z - zeta)) dif xi dif eta \
    & lt.eq 1 / uppi sum_(k = 1)^n sum_(j = 1)^(m_k) (integral.double_(H_k^((j)) inter D(z, 2 r)) + integral.double_(H_k^((j)) without D(z, 2 r)))\
    &wide""dot abs(pdv(Phi, overline(zeta))) abs(phi_(zeta, k)^((j)) (z) - 1 / (z - zeta)) dif xi dif eta
  $
  The estimates in @itm:integralofcontinuousextensionofholomorphicproperties_antiholomorphicderivativebound of @prop:integralofcontinuousextensionofholomorphicproperties, in tandem with those from @eq:mergelyan_familybounds now give that
  $
    abs(Psi(z) - Phi(z)) & lt.eq 18704 r omega_f (r) sum_(k = 1)^n sum_(j = 1)^(m_k) integral.double_(H_k^((j)) without D(z, 2 r)) 1 / abs(z - zeta)^3 dif xi dif eta \
    & quad ""+ (4 omega_f (r)) / r sum_(k = 1)^n sum_(j = 1)^(m_k) integral.double_(H_k^((j)) inter D(z, 2 r)) (584 / r + 1 / abs(z - zeta)) dif xi dif eta \
    & lt.eq 18704 r omega_f (r) integral.double_(abs(zeta) > 2 r) (dif xi dif eta) / abs(zeta)^3 \
    & quad""+ (4 omega_f (r)) / r integral.double_(abs(zeta) < 2 r) (584 / r + 1 / abs(zeta)) dif xi dif eta
  $
  through a linear change of variables. Now evaluation via polar coordinates (with $rho ee^(ii theta) = xi + ii eta$, $dif xi and dif eta = rho dr and d theta$) yields a revised upper bound of
  $
    &18704 r omega_f (r) integral_0^(2 uppi) integral_(2 r)^oo (dr dtheta) / rho^2 \
    &wide""+ (4 omega_f (r)) / r (584 / r op("area") D(0, 2 r) + integral_0^(2 uppi) integral_0^(2 r) dr d theta) \
    &quad""= 18704 r omega_f (r) 2 uppi [1 / rho]_oo^(2 r) + (9344 uppi omega_f (r) r^2) / r^2 + (4 omega_f (r)) / r 4 r uppi \
    &quad""= 18704 uppi omega_f (r) + 9344 uppi omega_f (r) + 16 uppi omega_f (r) = 28064 uppi omega_f (r).
  $
  Runge's Theorem (@thm:runge) provides the existence of some rational function $psi$ with poles in $E$ such that
  $
    sup_(z in K) abs(psi(z) - Psi(z)) lt.eq uppi omega_f (r)
  $
  since $Psi$ is holomorphic on a neighborhood of $K$ (to assure this bound is positive, we assume $f$ is not identically zero, otherwise the assertion is trivial). Therefore, for all $z in K$, we have (the third supremum term coming from @itm:integralofcontinuousextensionofholomorphicproperties_differbymodulusofcontinuity of @prop:integralofcontinuousextensionofholomorphicproperties)
  $
    sup_(z in K) abs(psi(z) - f(z)) & lt.eq sup_(z in K) abs(psi(z) - Psi(z)) + abs(Psi(z) - Phi(z)) + abs(Phi(z)-f(z)) \
                                    & lt.eq 28065 uppi omega_f (r) + omega_f (r) <= 28066 uppi omega_f (r).
  $
  Because $lim_(r -> 0^+) omega_f (r) = 0$, for any $epsilon > 0$, there exists a $r > 0$ such that
  $
    omega_f (r) < epsilon / (28066 uppi).
  $
  Hence for any such $epsilon$, we now construct $psi$ in accordance with an $r$ satisfying $28066 uppi omega_f (r) < epsilon$.
]
