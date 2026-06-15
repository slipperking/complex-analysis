#import "/lib.typ": *

== A Spherical Generalization of Normal Families <sec:spherical_generalization_of_normal_families>

Picard's Great Theorem requires a more profound concept by generalizing normal families in the one-point compactification of $CC$.

#definition[
  Let ${f_n (z)}$ be a (not necessarily analytic) complex function sequence on a connected set $Omega subset.eq CC$. If $forall K subset Omega$ compact, $forall R > 0$, $exists N in NN$ such that $forall n > N$, $forall z in K$, $abs(f_n (z)) > R$, then _$f_n arrows.rr oo$ locally uniformly spherically on $Omega$_.
]

When the "locally uniform limit" is taken to be $oo$, the condition of $epsilon$-closeness is instead replaced by the requirement that the values eventually leave every fixed compact subset of $CC$ (the given definition is equivalent to: $forall K subset Omega$ compact, $forall L subset CC$ compact, $exists N in NN$ such that $forall n > N$, $forall z in K$, $f_n (z) in.not L$). In this way, convergence to infinity is treated symmetrically with convergence to finite values by working in the Riemann sphere $extcomplex$, where $oo$ is simply another accumulation point.

By equipping the extended complex plane $extcomplex$ with the spherical metric instead of the Euclidean metric, convergence to $oo$ can be treated like convergence to any finite point. In this setting, $oo$ is simply another accumulation point, so there is no need to handle it differently from other values.

Let ${a_n}_(n in NN) subset.eq extcomplex$ be a sequence. Then we say $a_n -> a_(oo)$ _spherically_ iff $forall epsilon > 0$, $exists N in NN$ such that $forall n > N$, $d_sigma (a_n, a_(oo)) < epsilon$, where $d_sigma$ is the spherical distance.

#definition[
  A family of meromorphic functions $cal(F)$ on some $Omega subset.eq CC$ is said to be _spherically normal_ iff every sequence has a locally uniformly spherically convergent subsequence on $Omega$.
]

Montel's Theorem for holomorphically normal families in @thm:montel can be generalized via the spherical metric by the statement of Marty's Criterion (@thm:marty).

#definition[Spherical Derivative][
  Let $Omega subset.eq CC$ be an open region or domain. Suppose $f:Omega -> extcomplex$ is meromorphic. Then the _spherical derivative_ of $f$ is given by
  $ f^sharp (z) = f^* sigma(z) = (2 abs(f'(z)))/(1 + abs(f(z))^2) $
  for $f(z) != oo$ and
  $ f^sharp (z) = lim_(zeta -> z) f^sharp (zeta) $
  otherwise.
] <def:sphericalderivative>

#remark[
  In certain normalizations (where the Riemann sphere has north pole $(0,0,1)$ and diameter 1), the spherical derivative will instead be defined by $f^sharp (z) = (abs(f'(z)))/(1 + abs(f(z))^2)$
]

#proposition[
  Any linear fractional transformation is spherically uniformly continuous on $CC$.
] <prop:linearfractionaltransformationuniformlysphericallycontinuous>

#proof[
  Let $psi(z) = (a z + b)/(c z + d)$, where $a d - b c != 0$. Then,
  $ psi'(z) = (a d - b c)/((c z + d)^2). $
  The spherical distance between two points $w_1 = psi(z_1), w_2 = psi(z_2)$ is given by
  $
    d_sigma (w_1, w_2) = inf_gamma integral_gamma psi^sharp (z) abs(dz) = inf_gamma integral_gamma (2 abs((a d - b c)/((c z + d)^2)))/(1 + abs((a z + b)/(c z + d))^2) abs(dz)
  $
  where $gamma$ joins $z_1$ and $z_2$. The spherical distance is bounded by the integral over the Euclidean straight line $gamma'$ joining $z_1$ and $z_2$:
  $ d_sigma (w_1, w_2) <= integral_(gamma') (2 abs(a d - b c))/(abs(c z + d)^2 + abs(a z + b)^2) abs(dz). $
  Since $(2 abs(a d - b c))/(abs(c z + d)^2 + abs(a z + b)^2) -> 0$ as $z -> oo$ and $z |-> (2 abs(a d - b c))/(abs(c z + d)^2 + abs(a z + b)^2) in C^0(CC)$, it is bounded by some constant $M$ on $CC$. Hence, we have
  $ d_sigma (w_1, w_2) <= M abs(z_1 - z_2). $
  Hence, $forall epsilon > 0$, $forall abs(z_1 - z_2) < epsilon / M$,
  $ d_sigma (psi(z_1), psi(z_2)) < epsilon. #qedhere $
]

#proposition[
  Let ${f_n}_(n in NN)$ be a sequence of holomorphic functions on a domain $Omega subset.eq CC$. If $f_n arrows.rr f$ locally uniformly spherically, then $f$ is either holomorphic on $Omega$ or identically $oo$.
] <prop:locallyuniformlysphericallyconvergentholomorphicsequenceuniformlimit>

#proof[
  A result analogous to @thm:uniformlimit can be used to show that $f$ is spherically continuous. Let $z in Omega$ be arbitrary.

  1. If $f(z) != oo$, then by spherical continuity, $exists delta > 0$ such that $forall zeta in D(z, delta)$,
    $ d_sigma (f(zeta), f(z)) < (1)/(2) d_sigma (oo, f(z)). $
    Similarly, $exists N in NN$ such that $forall n > N$,
    $ d_sigma (f(zeta), f_n (zeta)) < (1)/(2) d_sigma (oo, f(z)). $
    Hence, we have
    $ d_sigma (oo, f(z)) - d_sigma (f(z), f_n (zeta)) > 0. $
    By the reverse triangle inequality, we have
    $ d_sigma (oo, f_n (zeta)) > 0. $
    By Weierstrass (@thm:weierstrass_convergence), $f$ is holomorphic on $D(z, delta)$.
  2. Consider $f(z) = oo$. Assume, for the sake of contradiction, $z$ is an isolated pole of $f$. Hence, $exists delta$ such that $f$ is holomorphic on $D^*(z, delta)$.

    Because each $f_n$ is holomorphic on $D(z, delta)$, by the Maximum Modulus Principle (@thm:maximum_modulus), $forall n in NN$,
    $ abs(f_n (zeta)) <= sup_(xi in partial D(z, delta)) abs(f_n (xi)) quad forall zeta in D(z, delta). $
    By letting $n -> oo$, we have
    $ abs(f(zeta)) <= sup_(xi in partial D(z, delta)) abs(f(xi)) < oo quad forall zeta in D(z, delta), $
    contradicting the assumption that $f(z) = oo$ is an isolated pole. Hence, $z$ must be an accumulation of values evaluating to $oo$. By spherical continuity, $exists delta > 0$ such that
    $ d_sigma (f(zeta), oo) < uppi / 2 quad forall zeta in D(z, delta). $
    Similarly, $exists N in NN$ such that $forall n > N$,
    $ d_sigma (f(zeta), f_n (zeta)) < uppi / 2. $
    Hence, we have
    $ uppi - d_sigma (oo, f_n (zeta)) = d_sigma (oo, 0) - d_sigma (oo, f_n (zeta)) > 0. $
    By the reverse triangle inequality, we have
    $ d_sigma (0, f_n (zeta)) > 0. $
    Hence each $(1)/(f_n)$ is holomorphic on $D(z, delta)$ and converges locally uniformly spherically to $(1)/(f)$ on $D(z, delta)$. By Weierstrass (@thm:weierstrass_convergence), $(1)/(f)$ is holomorphic on $D(z, delta)$ and has zeros that accumulate at $z$. By the Identity Theorem, $(1)/(f) equiv 0 ==> f equiv oo$ on $D(z, delta)$.

  Let $S$ be the set of all $z in Omega$ such that $f(z)$ is finite. By the argument above, $S$ is open. The complement $Omega without S$ then consists of all points where $f(z) = oo$. By the argument above, $Omega without S$ is also open. Since $Omega$ is connected, by @thm:connected_topological_space_clopen_sets, either $S = emptyset$ or $S = Omega$. In the former case, $f equiv oo$ on $Omega$, and in the latter case, $f$ is holomorphic on $Omega$.
]

#theorem[Marty's Criterion][
  A family of meromorphic functions $cal(F)$ on some $Omega subset.eq CC$ is spherically normal iff
  $ {f^sharp:f in cal(F)}, $
  or the family of spherical derivatives, is locally uniformly bounded in $Omega$.
] <thm:marty>

#proof[
  The condition is equivalent to that of
  $ (2 abs(f'(z)))/(1 + abs(f(z))^2) <= M quad forall f in cal(F) $
  for all compact $K subset Omega$, $forall z in K$, where $M$ depends only on $K$. Under the assumption that this holds, then
  $ d_sigma (f(z_1), f(z_2)) = inf_gamma integral_gamma dif s_sigma <= M abs(z_2 - z_1) quad forall f in cal(F) $
  where $gamma$ joins $f(z_1)$ and $f(z_2)$ where $z_1, z_2 in K$. Hence, $forall epsilon > 0$, $forall z_1, z_2 in K$ such that $abs(z_1 - z_2) < epsilon / M$, $d_sigma (f(z_1), f(z_2)) < epsilon$, and hence $cal(F)$ is _uniformly spherically equicontinuous_. Since $d_sigma <= uppi$ for any two points by geometry of $S^2$, $cal(F)$ is also _uniformly spherically bounded_ (the compactness of $S^2$). Then the Arzelà--Ascoli Theorem (@thm:arzela_ascoli) under the spherical metric gives that $cal(F)$ is a normal family.

  Conversely, assume for the sake of contradiction that $cal(F)$ is a normal family such that conclusion is not satisfied. Then, $exists K subset Omega$ compact and a sequence ${f_n}_(n in NN) subset.eq cal(F)$ such that the sequence
  $ {sup_(z in K) f_n^sharp (z)}_(n in NN) $
  tends to $oo$ (specifically, suppose that $forall n in NN$, $sup_(z in K) f_n^sharp (z) > n$). By normality, we may extract a locally uniformly spherically convergent subsequence ${f_(n_k)}_(k in NN) subset.eq {f_n}_(n in NN)$. By @thm:uniformlimit under the spherical metric, the uniform spherical limit of ${f_(n_k)}_(k in NN)$, $f$, is spherically continuous on $Omega$. For every point $z in Omega$, there are two possibilities:

  1. If $f(z) != oo$, then by continuity, $exists delta > 0$ such that $forall zeta in D(z, delta)$,
    $ d_sigma (f(zeta), f(z)) < (1)/(2) d_sigma (oo, f(z)). $
    Similarly, $exists N in NN$ such that $forall k > N$,
    $ d_sigma (f(zeta), f_(n_k) (zeta)) < (1)/(2) d_sigma (oo, f(z)). $
    Hence, we have
    $ d_sigma (oo, f(z)) - d_sigma (f(z), f_(n_k) (zeta)) > 0. $
    By the reverse triangle inequality, we have
    $ d_sigma (oo, f_(n_k) (zeta)) > 0. $
    Hence, the meromorphy of each $f_(n_k)$ is actually holomorphy. By continuity, $f$ is locally uniformly bounded on $D(z, delta)$. Hence, ${f_(n_k)}_(k > N)$ locally uniformly converges on $D(z, delta)$. By a result of Weierstrass (@thm:weierstrass_convergence), $f$ is holomorphic on $D(z, delta)$ and the sequence ${f'_(n_k)}_(k > N)$ locally uniformly converges to $f'$ on $D(z, delta)$.

    By holomorphy of $f'$ on $overline(D(z, delta / 2))$, $exists M' > 0$ such that $sup_(zeta in overline(D(z, delta / 2))) abs(f'(zeta)) < M'$. Uniform convergence of ${f'_(n_k)}_(k > N)$ gives the existence of some $N' > N$ such that $forall k > N'$,
    $
      abs(f'_(n_k) (zeta) - f'(zeta)) < 1 ==> abs(f'_(n_k) (zeta)) <= M' + 1 quad forall zeta in overline(D(z, delta / 2)).
    $
    Therefore, ${f'_(n_k)}_(k > N)$ is uniformly bounded by
    $ M = max({M' + 1} union {sup_(zeta in overline(D(z, delta / 2))) abs(f'_(n_k) (zeta))}_(N < k <= N')) $
    on this compact disk. Hence, $forall k > N$,
    $
      f_(n_k)^sharp (zeta) = (2 abs(f'_(n_k) (zeta)))/(1 + abs(f_(n_k) (zeta))^2) <= 2 abs(f'_(n_k) (zeta)) <= 2 M quad forall zeta in D(z, delta / 2) subset overline(D(z, delta / 2)).
    $
  2. $f(z) = oo$, then by continuity, $exists delta > 0$ such that $forall zeta in D(z, delta)$,
    $ d_sigma (f(zeta), oo) < uppi / 2. $
    Similarly, $exists N in NN$ such that $forall k > N$,
    $ d_sigma (f(zeta), f_(n_k) (zeta)) < uppi / 2. $
    Hence, we have
    $ uppi - d_sigma (oo, f_(n_k) (zeta)) = d_sigma (oo, 0) - d_sigma (oo, f_(n_k) (zeta)) > 0. $
    By the reverse triangle inequality, we have
    $ d_sigma (0, f_(n_k) (zeta)) > 0. $
    Hence, each $g_(n_k) = (1)/(f_(n_k))$ is holomorphic on $D(z, delta)$. By continuity, $g = (1)/(f)$ is locally uniformly bounded on $D(z, delta)$. It can also be realized that ${g_(n_k)}_(k > N)$ locally uniformly converges on $D(z, delta)$. By a result of Weierstrass (@thm:weierstrass_convergence), $g$ is holomorphic on $D(z, delta)$ and the sequence ${g'_(n_k)}_(k > N)$ locally uniformly converges to $g'$ on $D(z, delta)$.

    By holomorphy of $g'$ on $overline(D(z, delta / 2))$, $exists M' > 0$ such that $sup_(zeta in overline(D(z, delta / 2))) abs(g'(zeta)) < M'$. Uniform convergence of ${g'_(n_k)}_(k > N)$ gives the existence of some $N' > N$ such that $forall k > N'$,
    $
      abs(g'_(n_k) (zeta) - g'(zeta)) < 1 ==> abs(g'_(n_k) (zeta)) <= M' + 1 quad forall zeta in overline(D(z, delta / 2)).
    $
    Therefore, ${g'_(n_k)}_(k > N)$ is uniformly bounded by
    $ M = max({M' + 1} union {sup_(zeta in overline(D(z, delta / 2))) abs(g'_(n_k) (zeta))}_(N < k <= N')) $
    on this compact disk. Hence, $forall k > N$,
    $
      f_(n_k)^sharp (zeta) = (2 abs(-(g'_(n_k) (zeta))/(g_(n_k) (zeta)^2)))/(1 + abs(g_(n_k) (zeta))^(-2)) = (2 abs(g'_(n_k) (zeta)))/(abs(g_(n_k) (zeta))^2 + 1) <= 2 abs(g'_(n_k) (zeta)) <= 2 M, quad forall zeta in D(z, delta / 2).
    $

  In essence, for any point $z$, there exists an open disk $D_z$ centered at $z$ on which the spherical derivatives $f_(n_k)^sharp$ are bounded by some constant $M_z$ for $k > N_z$. By Heine--Borel (@thm:heine_borel), there exists a finite collection of disks ${D_(z_j)}_(1 <= j <= n)$ that cover $K$. Thus, ${f_(n_k)^sharp (z)}_(k > N)$ is uniformly bounded on $K$ by $max_(1 <= j <= n) M_(z_j)$, where $N = max_(1 <= j <= n) N_(z_j)$, contradicting the assumption that $sup_(z in K) f_n^sharp (z) > n$ for all $n in NN$.
]

#theorem[Fundamental Normality Test][
  Let $Omega subset.eq CC$ be a region and suppose that $cal(F)$ is a family of holomorphic functions on $Omega$. If there exist two different points $alpha, beta in CC$ such that ${alpha, beta} inter union.big_(f in cal(F)) f(Omega) = emptyset$, then $cal(F)$ must be a spherically normal family.
] <thm:fundamentalnormalitytest>

#proof[
  Map $alpha$ and $beta$ to $0, 1$ by a linear function $phi(z) = (z - alpha)/(beta - alpha)$. Then the family of holomorphic functions
  $ tilde(cal(F)) = {phi compose f:f in cal(F)} $
  omits $0$ and $1$ for all $z in Omega$.

  By @prop:conformalmetricnegativecurvatureexistencewhenomits2points, $exists beta > 0$ such that for
  $
    rho(z) = (sqrt(1 + abs(z)^((1)/(3))) sqrt(1 + abs(z - 1)^((1)/(3))))/(abs(z)^((5)/(6)) abs(z - 1)^((5)/(6))), quad dif s_rho^2 = rho(z)^2 abs(dz)^2
  $
  as in @eq:conformalmetricnegativecurvatureexistencewhenomits2points_metric,
  $ K_rho (z) <= -beta quad forall z in CC without {0, 1}. $
  Therefore, if we let $mu = rho sqrt(beta)$, then
  $
    K_mu = -(laplacian(log compose mu))/(mu^2) = -(laplacian(log compose rho))/(rho^2 beta) = K_rho / beta <= -1 quad "on" quad CC without {0, 1}.
  $ <eq:fundamentalnormalitytest_f_mu_pullback_inequality>
  Let $zeta in Omega$ be arbitrary and let $r=r_zeta > 0$ satisfy $D(zeta, r_zeta) subset.eq Omega$. By @cor:generalized_ahlfors, the pullback of $mu$ from $CC without {0, 1}$ to $D(zeta, r_zeta) subset.eq Omega$ satisfies
  $ f^* mu(z) <= lambda_(r_zeta) (z - zeta) ==> mu(f(z)) abs(f'(z)) <= (2 r_zeta)/(r_zeta^2 - abs(z - zeta)^2) $ $forall z in D(zeta, r_zeta), f in tilde(cal(F))$. Since $forall w in CC without {0, 1}$,
  $
    (sigma)/(mu) = ((2)/(1 + abs(w)^2))/((sqrt(1 + abs(w)^((1)/(3))) sqrt(1 + abs(w - 1)^((1)/(3))))/(abs(w)^((5)/(6)) abs(w - 1)^((5)/(6)))) ->
    cases(
      0 & "as" w -> 0,
      0 & "as" w -> 1,
      (2 abs(w)^(-2))/(abs(w)^(-(4)/(3))) -> 0 & "as" w -> oo,
    ).
  $
  Hence, there exist open neighborhoods $U_0, U_1, U_(oo)$ of $0, 1, oo$ respectively on which $(sigma)/(mu) < 1$. Since $(sigma)/(mu) in C^0(CC)$, by @thm:continuous_function_bounded_on_compact, $exists M' > 0$ such that $(sigma)/(mu) < M'$ on $CC without (U_0 union U_1 union U_(oo))$. Let $M = max(M', 1)$, and
  $ therefore sigma <= M mu quad "on" quad CC without {0, 1}. $
  Hence, $forall f in tilde(cal(F))$, we have by virtue of @eq:fundamentalnormalitytest_f_mu_pullback_inequality,
  $
    f^sharp (z) = sigma compose f(z) abs(f'(z)) <= M mu compose f(z) abs(f'(z)) <= (2 r_zeta M)/(r_zeta^2 - abs(z - zeta)^2)
  $
  for any $z in D(zeta, r_zeta)$. Now restricting $z$ to $D(zeta, r_zeta / 2)$, we have
  $
    abs(z - zeta)^2 < r_zeta^2 / 4 ==> r_zeta^2 - abs(z - zeta)^2 > (3 r_zeta^2)/(4) ==> abs(f^sharp (z)) < (8 r_zeta M)/(3 r_zeta^2) = (8 M)/(3 r_zeta).
  $
  For any compact $K subset Omega$, the collection of open disks
  $ {D(zeta, r_zeta / 2)}_(zeta in K) $
  forms an open cover of $K$. Hence, by Heine--Borel (@thm:heine_borel), it admits a finite subcover
  $ {D(zeta_k, r_(zeta_k) / 2)}_(1 <= k <= n) $
  for some $n in NN$. Then ${f^sharp:f in tilde(cal(F))}$ is uniformly bounded on $K$ by
  $ M_K = max{(8 M)/(3 r_(zeta_k)) : 1 <= k <= n} $
  and is thus locally uniformly bounded on $Omega$. Marty's Criterion (@thm:marty) gives the normality of $tilde(cal(F))$; since $phi$ is linear, it follows that $cal(F)$ is also normal on $Omega$.
]

#corollary[Montel--Carathéodory][
  Let $Omega subset.eq CC$ be a region and suppose that $cal(F)$ is a family of meromorphic functions on $Omega$. If there exist three different points $alpha, beta, gamma in extcomplex$ such that ${alpha, beta, gamma} inter union.big_(f in cal(F)) f(Omega) = emptyset$, then $cal(F)$ must be a spherically normal family.
] <cor:montelcaratheodory>

#proof[
  Let $phi(z) = ((z - alpha)(beta - gamma))/((z - gamma)(beta - alpha))$ be a Möbius transformation mapping $alpha, beta, gamma$ to $0, 1, oo$, respectively.
  Hence, the family of meromorphic functions
  $ tilde(cal(F)) = {phi compose f : f in cal(F)} $
  omits $0$, $1$, and $oo$ (and hence each function is holomorphic). By the Fundamental Holomorphic Normality Test (@thm:fundamentalnormalitytest), $tilde(cal(F))$ is normal.

  By @prop:linearfractionaltransformationuniformlysphericallycontinuous, $forall epsilon > 0$, $exists delta > 0$ such that $forall abs(w_1 - w_2) < delta$ in $CC$,
  $ d_sigma (phi^(-1) (w_1), phi^(-1) (w_2)) < epsilon. $
  Let ${tilde(f)_n}_(n in NN)$ be any function sequence in $cal(F)$ and let ${tilde(f)_(n_k)}_(k in NN)$ be locally uniformly convergent to $tilde(f)$ on a compact set $K subset Omega$. Then $exists N in NN$ such that $forall k > N$,
  $ abs(tilde(f)_(n_k) (z) - tilde(f)(z)) < delta wide forall z in K. $
  Therefore, $forall z in K$, $k > N$, we have
  $
    d_sigma (phi^(-1) compose tilde(f)_(n_k) (z), phi^(-1) compose tilde(f)(z)) = d_sigma (f_(n_k) (z), f(z)) < epsilon.
  $
  Hence, every sequence $f_n$ has a locally uniformly spherically convergent subsequence, and the normality of $cal(F)$ follows.
]
