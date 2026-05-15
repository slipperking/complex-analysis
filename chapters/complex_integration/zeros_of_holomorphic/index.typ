#import "/lib.typ": *

== Zeros of a Holomorphic Function

For a region $U subset.eq CC$ and a holomorphic function $f:U -> CC$, a point $z_0 in U$ is a _zero_ of $f$ iff $f (z_0) = 0$. Furthermore, if $f$ has the Taylor expansion at $z_0$ of
$ a_m (z - z_0)^m + a_(m + 1) (z - z_0)^(m + 1) + dots.c, quad m in NN, a_m eq.not 0, $
then the zero at $z_0$ has multiplicity $m$.

We will introduce a fundamental application of Liouville's Theorem (@thm:liouville) below.

#theorem("Fundamental Theorem of Algebra")[
  Every non-constant polynomial $p(z)$ with complex coefficients has at least one complex zero.
] <thm:fundamentaltheoremofalgebra>

#proof[
  For the sake of contradiction, suppose that $p(z)$ has no complex zeros. Then the function $f(z) = 1 / (p(z))$ is continuous and entire, because $p(z)$ has no zeros in $CC$. Moreover, as $z -> oo$, $p(z) -> oo$, so $f(z) -> 0$, and thus $f(z)$ is bounded. By Liouville's Theorem (@thm:liouville), every bounded entire function is constant. Thus, $f(z)$ is constant, and so $p(z)$ must also be constant. By contradiction, $p(z)$ has at least one complex zero.
]

#theorem[
  Let $U subset.eq CC$ be open and connected, and $f:U -> CC$ be holomorphic over $U$. Then if the set defined by
  $ S = {z in U : f(z) = 0} $
  has an accumulation point in $U$, then $f equiv 0$ over $U$.
] <thm:identityaccumulationofzeros>

#proof[
  Let ${z_n}_(n in NN)$ be a subset of $S$ and assume it has an accumulation point $z_infinity$ in $U$. Since $f$ is holomorphic over $U$, $exists epsilon > 0$ such that $f$ is holomorphic over $D(z_infinity, epsilon) subset.eq U$. Then over this disk, $f$ has the Taylor expansion

  $ f(z) = sum_(n = 0)^oo a_n (z - z_infinity)^n. $ <eq:identityaccumulationofzeros_taylorexpansion>

  By @def:accumulationpoint, $exists N in NN$ such that $forall n > N$, $z_n in D(z_infinity, epsilon)$. Since $z_n$ is a zero of $f$, $f (z_n) = 0$. Then, by the continuity of $f$,
  $ lim_(n -> oo) f (z_n) = f(lim_(n -> oo) z_n) = f (z_infinity) = 0. $
  Using this result in comparison to @eq:identityaccumulationofzeros_taylorexpansion, we get that $a_0 = 0$.

  The function
  $ f_1 (z) = (f(z)) / (z - z_infinity) $
  has a Taylor expansion over $D(z_infinity, epsilon)$ of

  $ f_1 (z) = sum_(n = 0)^oo a_(n + 1) (z - z_infinity)^n. $

  Let $z = z_n eq.not z_infinity$ for some $n > N$. Then $f_1$ vanishes, leaving
  $ 0 = a_1 + Order(z_n - z_infinity). $

  Letting $n -> oo$, $z_n -> z_infinity$, and $a_1 = 0$. Define
  $ f_2 (z) = (f_1 (z)) / (z - z_infinity). $
  Then,
  $ f_2 (z) = sum_(n = 0)^oo a_(n + 2) (z - z_infinity)^n. $

  Similarly, $a_2 = 0$. Letting
  $ f_n (z) = (f(z)) / ((z - z_infinity)^n), $
  the sequence ${a_n}_(n in ZZ_(gt.eq 0))$ vanishes, and $f equiv 0$ on $D(z_infinity, epsilon)$.

  Let
  $ tilde(S) = {z in U : forall n in ZZ_(gt.eq 0), f^((n))(z) = 0}. $
  For all $z in D(z_infinity, epsilon)$, since $f(z)$ locally vanishes (and has vanishing derivatives as a consequence),
  $ D(z_infinity, epsilon) subset.eq tilde(S). $
  Furthermore, for all $z' in tilde(S)$, $exists epsilon' > 0$ such that $f(z)$ has a convergent Taylor series with vanishing coefficients on $D(z', epsilon') subset.eq U$. Then $f equiv 0$ on $D(z', epsilon')$. Then for all $z in D(z', epsilon')$, since $f$ is constant at $z$, it also has vanishing derivatives. It follows that
  $ D(z', epsilon') subset.eq tilde(S). $
  Since every point in $tilde(S)$ has an open neighborhood also in $tilde(S)$, $tilde(S)$ is open.

  It is evident that for all $k in ZZ_(gt.eq 0)$, $f^((k))$ is continuous in $U$ by the holomorphy of $f$. Let
  $ S_k = {z in U : f^((k))(z) = 0}. $
  For any sequence ${tilde(z)_n} in S_k$ converging to some $tilde(z)_infinity in U$, by the continuity of $f$,
  $ lim_(n -> oo) f^((k))(tilde(z)_n) = f^((k))(lim_(n -> oo) tilde(z)_n) = f^((k))(tilde(z)_infinity) = 0, $
  and therefore $tilde(z)_infinity in S_k$. Thus, $S_k$ contains all of its accumulation points in $U$ and is therefore closed in $U$ (if $tilde(z)_infinity in.not U$, then it is no longer relevant; we are concerned about it being closed within $U$). Since
  $ tilde(S) = inter.big_(k in ZZ_(gt.eq 0)) S_k $
  and each of $S_k$ is closed in $U$, $tilde(S)$ is the intersection of closed sets and consequently closed.

  Since $tilde(S)$ is nonempty and clopen in the connected set $U$, $tilde(S) = U$ (by @thm:connected_topological_space_clopen_sets). It follows that $f equiv 0$ on $U$.
]

#remark[
  This is a trivial property of holomorphic functions that allows for the uniqueness of analytic continuations. It is oftentimes stated in the form below:
]

#theorem("Identity Theorem")[
  Let $U subset.eq CC$ be open and connected, and define $f(z)$ and $g(z)$ to be two holomorphic functions on $U$. For a set $S subset.eq U$ with an accumulation point in $U$, if $f equiv g$ on $S$, then $f equiv g$ on $U$.
] <thm:identity>

#proof[
  Let $h = f - g$ be holomorphic over $U$. Since $S$ has an accumulation point in $U$, and $h equiv 0$ over $S$, then by @thm:identityaccumulationofzeros, $h equiv 0$ over $U$.
]

#theorem("Holomorphic Argument Principle")[
  Let $U subset.eq CC$ be a region and $f:U -> CC$ be holomorphic. Let $gamma subset U$ be a simple, closed, positively oriented curve that is null-homotopic in $U$. If $f$ has no zeros on $gamma$, then $f$ has finitely many zeros in the region bounded by $gamma$, and this number, counting multiplicities, is given by

  $ k = 1 / (taui) integral.cont_Gamma (f'(z)) / (f(z)) dz. $

  Let $Gamma$ be the image of $gamma$ under the map $w = f(z)$. Then
  $ k = 1 / (2 uppi) Delta_Gamma arg(w), $
  where $Delta_Gamma arg(w)$ denotes the total change in argument of $w$ as it traverses $Gamma$.
] <thm:argumentprincipleholomorphic>

#proof[
  Let $z_1, dots, z_n$ be the distinct zeros of $f$ enclosed by $gamma$ with the respective multiplicities $k_1, dots, k_n$. Choose disjoint disks $D(z_j, epsilon_j)$ centered at each $z_j$ with radii $epsilon_j > 0$, each contained in the interior of $gamma$ and avoiding $gamma$. The function
  $ (f'(z)) / (f(z)) $

  is holomorphic on the domain
  $ jinterior(gamma) without union.big_(j = 1)^n overline(D(z_j, epsilon_j)), $

  where $jinterior(gamma)$ denotes the interior relative to $gamma$. The oriented boundary of this domain is
  $ gamma^+ union union.big_(j = 1)^n partial D(z_j, epsilon_j)^-. $
  By Cauchy--Goursat (@thm:cauchygoursattheorem),

  $ integral_(gamma^+ union union.big_(j = 1)^n partial D(z_j, epsilon_j)^-) (f'(z)) / (f(z)) dz = 0, $

  which rearranges to

  $
    integral.cont_(gamma^+) (f'(z)) / (f(z)) dz = sum_(j = 1)^n integral.cont_(partial D(z_j, epsilon_j)^+) (f'(z)) / (f(z)) dz.
  $

  Near each $z_j$, express
  $ f(z) = (z - z_j)^(k_j) h_j (z) $
  where $h_j$ is holomorphic and non-vanishing on $D(z_j, epsilon_j)$. Differentiation yields

  $ f'(z) = k_j (z - z_j)^(k_j - 1) h_j (z) + (z - z_j)^(k_j) h_j' (z), $

  and thus

  $ (f'(z)) / (f(z)) = (k_j) / (z - z_j) + (h_j' (z)) / (h_j (z)). $

  Since $h_j$ is holomorphic and non-vanishing on $D(z_j, epsilon_j)$, the function $frac(h_j', h_j, style: "horizontal")$ is holomorphic there. By the Cauchy--Goursat Theorem,

  $ integral.cont_(partial D(z_j, epsilon_j)) (h_j' (z)) / (h_j (z)) dz = 0. $

  The Cauchy--Goursat Formula (@thm:cauchygoursatformula) gives

  $ integral.cont_(partial D(z_j, epsilon_j)) (k_j) / (z - z_j) dz = taui k_j. $

  Combining results,

  $ integral.cont_Gamma (f'(z)) / (f(z)) dz = sum_(j = 1)^n taui k_j = taui k. $

  Finally, parameterize $Gamma$ by $w = f(z)$. Then $dif w = f'(z) dz$, and

  $
    k = 1 / (taui) integral.cont_Gamma (dif w) / (w) = 1 / (taui) Delta_Gamma log(w) = 1 / (2 uppi) Delta_Gamma arg(w),
  $
  which proves the result.
]

Thus, one defines the _winding index_ ($Ind$) to quantify how many times a closed curve winds counterclockwise around a given point in the complex plane. Formally, if $gamma = gamma([0, 1])$ is a counterclockwise-oriented closed curve and $z$ is a point satisfying $z in.not gamma$, then
$
  Ind_Gamma (z) = 1 / (taui) integral.cont_gamma dzeta / (zeta - z) = 1 / (taui) integral_0^1 (gamma'(t) dt) / (gamma(t) - z).
$

#theorem[
  Let ${f_n (z)}$ be a sequence of holomorphic functions on the open set $U subset.eq CC$ that uniformly converges to $f(z)$ on every compact subset of $U$. If $forall n in NN$, $f_n (z)$ has no zeros in $U$, then $f$ is either identically $0$ or has no zeros in $U$.
] <thm:hurwitzsimplecase>

#proof[
  By the holomorphy of $f_n (z)$, for any simple closed rectifiable curve $gamma subset U$ (whose interior is a subset of $U$), by the Cauchy--Goursat Theorem (@thm:cauchygoursattheorem),
  $ integral.cont_Gamma f_n (zeta) dzeta = 0. $
  Since $gamma$ is a subset of any compact subset of $U$, ${f_n (zeta)}$ uniformly converges on $gamma$, and by @thm:limitintegralswitch,

  $
    lim_(n -> oo) integral.cont_Gamma f_n (zeta) dzeta = integral.cont_Gamma lim_(n -> oo) f_n (zeta) dzeta = integral.cont_Gamma f(zeta) dzeta = 0.
  $ <eq:hurwitzsimplecase_integrallimitswitchforholomorphy>

  Then by Morera's Theorem (@thm:morera), $f(z)$ is holomorphic, and $f'(z)$ is holomorphic. We aim to show that $f'_n (z) arrows.rr f'(z)$.

  Let $K subset U$ be arbitrary and compact and $V supset K$ be open and relatively compact in $U$. Since ${f'_n (z)}$ is holomorphic, by @cor:nthderivativeboundedsupremum, there exists a finite constant $c > 0$ such that
  $
    lim_(n -> oo) sup_(z in K) abs(f'_n (z) - f'(z)) lt.eq c lim_(n -> oo) sup_(z in V) abs(f_n (z) - f(z)).
  $

  By the definition of uniform convergence, the right-hand side approaches $0$, and ${f'_n (z)}$ is then uniformly convergent to $f'(z)$ by the same reasoning.

  Through the proof of @thm:identityaccumulationofzeros, if $f equiv.not 0$ over $U$, then the zeros of $f$ do not have an accumulation point in $U$ and are therefore discrete. In this case, let $gamma subset U$ be a curve that does not pass through the zeros of $f$. Since each function in the sequence $f_n$ does not contain zeros in $U$, by the Argument Principle (@thm:argumentprincipleholomorphic),

  $ lim_(n -> oo) integral.cont_Gamma (f'_n (z)) / (f_n (z)) dz = 0. $ <eq:hurwitzsimplecase_argumentprinciple>

  Since $f$ and $f'$ are holomorphic over $gamma$, by @thm:continuous_function_bounded_on_compact, there exists a finite value $M > 0$ such that $forall z in gamma$, $max {abs(f(z)), abs(f'(z))} < M$.

  Since $gamma$ does not pass through the zeros of $f$, $exists lambda > 0$ such that $forall z in gamma$, $abs(f(z)) > lambda$. By the uniform convergence of ${f_n (z)}$, $exists N in NN$ such that

  $ abs(f_n (z) - f(z)) < lambda / 2, quad forall n > N, forall z in gamma. $

  Then $abs(f_n (z)) > lambda / 2$ on $gamma$. Hence, $1 / (f_n (z))$ and its limit are uniformly bounded;
  $
    abs(1 / (f(z))) < 1 / (lambda), quad abs(1 / (f_n (z))) < (2) / (lambda), quad forall z in gamma, forall n > N.
  $

  $
    abs((f') / (f) - (f'_n) / (f_n)) & = abs((f' f_n - f'_n f) / (f_n f)) \
                                     & < 2 (abs(f' f_n - f' f) + abs(f' f - f'_n f)) / (lambda^2) \
                                     & < (2 M) / (lambda^2) dot (abs(f_n - f) + abs(f' - f'_n)).
  $

  $
    sup_(z in gamma) abs((f'(z)) / (f(z)) - (f'_n (z)) / (f_n (z))) & lt.eq (2 M) / (lambda^2) (sup_(z in gamma) abs(f_n (z) - f(z)) + sup_(z in gamma) abs(f'(z) - f'_n (z))) \
    lim_(n -> oo) sup_(z in gamma) abs((f'(z)) / (f(z)) - (f'_n (z)) / (f_n (z))) & lt.eq (2 M) / (lambda^2) (lim_(n -> oo) sup_(z in gamma) abs(f_n (z) - f(z)) + abs(f'(z) - f'_n (z))) \
    & = 0.
  $

  Therefore, $(f'(z)) / (f(z))$ is uniformly convergent on $gamma$. By @thm:limitintegralswitch, we can pass the limit through the integral in @eq:hurwitzsimplecase_argumentprinciple. Then,

  $ lim_(n -> oo) integral.cont_gamma (f'_n (z)) / (f_n (z)) dz = integral.cont_gamma (f'(z)) / (f(z)) dz = 0. $
  By the Argument Principle (@thm:argumentprincipleholomorphic), $f(z)$ has no zeros in the interior of $gamma$. Since $gamma$ was arbitrarily chosen, either $f(z) equiv 0$ on $U$ or has no zeros in $U$.
]

#theorem("Rouché")[
  Let $U subset.eq CC$ be open and $f, g$ be two holomorphic functions over $U$. Let $gamma subset U$ be a simple, closed, rectifiable curve, and for all $z in gamma$

  $ abs(f(z) - g(z)) < abs(f(z)). $ <eq:rouche>

  Then $f$ and $g$ have the same number of zeros enclosed by $gamma$ and do not vanish on $gamma$.
] <thm:rouche>

#proof[
  It is obvious that $g(z)$ has no zeros on $gamma$. Otherwise, $exists z_0 in gamma$ such that $g (z_0) = 0$, implying that $abs(f (z_0)) < abs(f (z_0))$ which is impossible. Similarly, $f(z)$ has no zeros on $gamma$, since $abs(g(z)) < 0$ is an impossibility.

  Let $k_f$ and $k_g$ denote the number of zeros of $f$ and $g$ enclosed by $gamma$, respectively. By the Argument Principle (@thm:argumentprincipleholomorphic),

  $
    k_g - k_f & = integral.cont_Gamma (g'(z)) / (g(z)) dz - integral.cont_gamma (f'(z)) / (f(z)) dz \
    & = integral.cont_gamma (g'(z) f(z) - f'(z) g(z)) / (g(z) f(z)) dz = integral.cont_gamma (((g(z)) / (f(z)))') / ((g(z)) / (f(z))) dz.
  $

  Let $w = h(z) = (g(z)) / (f(z))$ with $Gamma = h(gamma)$. Then,
  $ k_g - k_f = integral.cont_Gamma (dif w) / (w). $

  From @eq:rouche, by dividing both sides by $f(z)$, we obtain $abs(w - 1) < 1$. Then $Gamma$ lies in the open disk $D(1, 1)$, which will never intersect or enclose $0$. Then by @lem:cauchyintegraltheoremoversimplyconnectedset,
  $ k_g - k_f = integral.cont_Gamma (dif w) / (w) = 0, $
  as desired.
]

By the Fundamental Theorem of Algebra (@thm:fundamentaltheoremofalgebra), any polynomial in the form $p(z) = sum_(k = 0)^n a_k z^k$ ($n in NN$, $a_n eq.not 0$, $a_k in CC$ where $k = 1, dots n$) has at least one complex zero. Consider the function $q(z) = a_n z^n$, with a zero at $z = 0$ with multiplicity $n$. By Rouché's Theorem (@thm:rouche), since $exists R in RR$ such that $abs(q(z) - p(z)) = abs(sum_(k = 0)^(n - 1) a_k z^k) < abs(a_n z^n)$ over $abs(z) = R$, $p$ and $q$ have the same number of zeros, counting multiplicity.

#theorem[
  Let $U subset.eq CC$ be open and connected, and $f(z)$ be holomorphic and non-constant on $U$.

  If $z_0 in U$ and $w_0 = f (z_0)$, and the multiplicity of the zero at $z_0$ of $f - w_0$ is $m$, then for all $rho > 0$ such that $f - w_0$ is non-vanishing on $overline(D(z_0, rho)) without {z_0}$, $exists delta > 0$ such that $forall xi in D(w_0, delta)$, $f - xi$ has $m$ zeros in $D(z_0, rho)$, counting multiplicity.
] <thm:hurwitzshifts>

#proof[
  The zero at $z_0$ is isolated by @thm:identityaccumulationofzeros. Furthermore, $abs(f - w_0)$ is continuous on $partial D(z_0, rho)$ and attains a positive infimum $delta$. In other words, on this set, $abs(f - w_0) gt.eq delta$. Hence, $forall xi in D(w_0, delta)$, we have $abs(xi - w_0) < delta lt.eq abs(f(z) - w_0)$ for any $z in partial D(z_0, rho)$.

  By Rouché's Theorem, since $abs((f(z) - w_0) - (f(z) - xi)) < abs(f(z) - w_0)$, it follows that $f - xi$ and $f - w_0$ have the same number of zeros in $D(z_0, rho)$.
]

We also have the following generalization of @thm:hurwitzsimplecase, which is a heuristic restatement of @thm:hurwitzshifts:

#theorem("Hurwitz")[
  Let $U subset.eq CC$ be an open and connected set, and suppose ${f_n (z)}_(n in NN)$ is a holomorphic function sequence that uniformly converges to a non-constant function $f(z)$ on all compact sets of $U$.

  If $z_0 in U$ and $w_0 = f (z_0)$, and the multiplicity of the zero at $z_0$ of $f - w_0$ is $m$, then for all $rho > 0$ such that $f - w_0$ is non-vanishing on $overline(D(z_0, rho)) without {z_0}$, $exists N in NN$ such that $forall n > N$, $f_n - w_0$ has $m$ zeros in $D(z_0, rho)$, counting multiplicity.
] <thm:hurwitz>

#proof[
  The zero at $z_0$ is isolated by @thm:identityaccumulationofzeros. Furthermore, $abs(f - w_0)$ is continuous on $partial D(z_0, rho)$ and attains a positive infimum $delta$. In other words, on this set, $abs(f - w_0) gt.eq delta$. By uniform convergence, $exists N in NN$ such that $forall n > N$, we have $abs(f(z) - f_n (z)) < delta lt.eq abs(f(z) - w_0)$ for any $z in partial D(z_0, rho)$.

  By Rouché's Theorem (@thm:rouche), since
  $ abs((f(z) - w_0) - (f_n (z) - w_0)) < abs(f(z) - w_0), $
  it follows that $f_n - w_0$ and $f - w_0$ have the same number of zeros in $D(z_0, rho)$.
]
