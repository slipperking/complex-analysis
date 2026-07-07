#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Analytic Capacity],
  route: "analytic-capacity",
)
The theory of rational approximation is essentially built upon the concept of _analytic capacity_, which was introduced in 1940 by Finnish mathematician Lars Ahlfors. Our purpose here is to give a brief and elementary introduction. Despite its importance, still many trivially simple results remain conjecture.

The uses of analytic capacity are present in many other topics of complex analysis. Analytic capacity serves as a natural framework for general rational approximation theory. Our purpose here is to hint at how analytic capacity theory relates to the proof of @thm:mergelyan and pertinent problems in general.

#definition("Analytic Capacity")[
  Let $K subset.eq CC$ be compact. The _analytic capacity_ of $K$ is defined as
  #lbl(
    $
      gamma(K) = sup {abs(f'(oo)): mat(
          delim: "[",
          f "is holomorphic on" extcomplex without K; f(extcomplex without K) subset.eq overline(DD); f(oo) = 0
        )},
    $,
    <def:analyticcapacity>,
  )
  where $f'(oo)$ is defined as in @eq:derivative-at-infinity. For an arbitrary set $U subset.eq CC$, we define
  $
    sup {gamma(K): K subset.eq U and K "is compact"}.
  $
]

Intuitively, $gamma$ measures the extent to which bounded analytic functions outside $K$ can deviate from constancy. Generally, the "larger" $K$ is, the greater the capacity is.

#lbl(
  proposition[
    If $K subset CC$ is a compact set of discrete points, then $lambda(K) = 0$.
  ],
  <prop:analytic-capacity_of_discrete_points>,
)

#proof[
  For any $f: extcomplex without K -> CC$ holomorphic with $f(extcomplex without K) subset.eq overline(DD)$, since $f$ is bounded, the Riemann's Theorem for removable singularities (@thm:riemann-removable-singularities) allows for an analytic continuation onto all of $extcomplex$. Then Liouville's Theorem (@thm:liouville) implies that $f$ is constant and $f'(oo) = 0$. Hence $gamma(K) = 0$.
]

#lbl(
  theorem[
    For $K_1 subset.eq K_2$ both compact in $CC$, $gamma(K_1) <= gamma(K_2)$.
  ],
  <thm:analyticcapacitymonotonicity>,
)

#proof[
  This follows directly from the definition and the fact that any function holomorphic on $extcomplex without K_1$ is also holomorphic on $extcomplex without K_2$.
]

The preceding results above hint at the monotonous behavior of capacity. However, currently it is not known whether a general _subadditivity_ property holds for analytic capacity, or that
$
  gamma(K_1 union K_2) attach(<=, t: ?) gamma(K_1) + gamma(K_2).
$
Recent results hint the affirmative, as many special cases of the relation have been proved; the question of subadditivity has been proved in the affirmative for disjoint compact continua, and recent findings by Xavier Tolsa show that capacity is (countably) semi-(sub)additive (the existence of an absolute constant $C$ such that $gamma(K_1 union K_2) <= C [gamma(K_1) + gamma(K_2)]$).

We now give some quantifying examples of how analytic capacity measures a type of "largeness" of compact sets, (rather much like area, which satisfies the subadditivity relation). First we define a specific classification of compact sets.

An alternative perspective of this "largeness" pertains to a certain _removability_ of sets. A compact set $K subset CC$ is considered to be _removable_ if every bounded holomorphic function on the complement can be extended to $CC$. For instance, the analytic capacity $gamma({a})$ of any singleton ${a}$ (any singular point) or set of discrete points is 0, as evidenced by @prop:analytic-capacity_of_discrete_points; and moreover, any singleton or compact set of discrete points is a removable set. In a heuristic sense, analytic capacity measures the irremovability of a set, and larger sets tend to be "less removable."

A compact set $K subset CC$ is a _continuum_ if it is connected, $CC without K$ is connected, and if it is not a singleton ($K$ contains at least 2 distinct points).

#lbl(
  proposition[
    Let $K subset CC$ be a continuum. Then $gamma(K) = abs(f'(oo))$ where $f: extcomplex without K -> DD$ is a biholomorphism satisfying $f(oo) = 0$ (i. e. the maximal $abs(f'(oo))$ in the supremum of the definition of analytic capacity is attained when $f$ is biholomorphic).
  ],
  <prop:analytic-capacity_continuum_biholomorphism>,
)

#proof[
  Let $f$ be the biholomorphism, $g: extcomplex without K -> DD$ be holomorphic (not necessarily surjective) mapping $oo$ to $0$. Since $h equiv g compose f^(-1): DD -> DD$ and maps $0$ to $0$, the Schwarz Lemma (@lem:schwarz) implies that
  $
    abs(h(z)) <= abs(z)
  $
  for all $z in DD$. Thus, $abs(g(z)) <= abs(f(z))$, and
  $
    abs(g'(oo)) = lim_(z -> oo) abs(z g(z)) <= lim_(z -> oo) abs(z f(z)) = abs(f'(oo)). #qedhere
  $
]

#lbl(
  proposition[
    The analytic capacity of any closed disk is the radius.
  ],
  <prop:analyticcapacitycloseddisk>,
)

#proof[
  Since $overline(D(a, r))$ is a continuum, a biholomorphism $f: extcomplex without overline(D(a, r)) -> DD$ such that $f(oo) = 0$. One such biholomorphism is given by
  $
    f(z) = r / (z - a), quad f'(oo) = lim_(z -> 0) dv((r / (1 / z - a)), z, style: "large") = r.
  $
  Hence, @prop:analytic-capacity_continuum_biholomorphism, gives that $gamma(overline(D(a, r))) = r$.
]

#lbl(
  proposition[
    If $K subset CC$ is a continuum, then
    $
      (diam K) / 4 <= gamma(K) <= diam K.
    $
  ],
  <prop:analyticcapacitycontinuuminequalities>,
)

#proof[
  Assume $f: extcomplex without K -> DD$ is a biholomorphism mapping $oo$ to $0$. The lower bound follows directly from @prop:complement-biholomorphism-quarter-estimate. Let $p in K$ be arbitrary, then for any $q in K$, we obtain $abs(p - q) <= diam K$, implying that $K subset.eq overline(D(p, diam K))$. By @prop:analyticcapacitycloseddisk, we have $gamma(overline(D(p, diam K))) = diam K$, and @thm:analyticcapacitymonotonicity consequently gives the upper bound of
  $
    gamma(K) <= diam K. #qedhere
  $
]

We outline the precise connections to rational approximation:

#theorem[
  Let $K subset.eq CC$ be compact such that $exists c > 0$ such that $forall delta > 0$, $forall p in partial K$,
  $
    gamma(D(p, delta) without K) >= c delta.
  $
  Then $forall f in C^0(K)$ holomorphic on $interior(K)$ can be uniformly and rationally approximated on $K$ with poles in $extcomplex without K$.
]

#corollary[
  Let $K subset.eq CC$ be compact. If the connected components $U_j$ of $extcomplex without K$ give the uniform existence of some $delta > 0$ such that $forall j$, $diam U_j >= delta$, then $forall f in C^0(K)$ holomorphic on $interior(K)$ can be uniformly and rationally approximated on $K$ with poles in $extcomplex without K$.
]

Notice here that no restrictions are imposed on the finiteness of the number of connected components of the complement. The general conclusion given for Mergelyan's Theorem is not true for more general compact sets.

The counterexample we now provide due to~@gamelin2001, we provide the construction of the compact set $K$.

#example[
  There exists a compact set $K subset.eq CC$ and $f in C^0(K)$, such that $f$ is holomorphic on $interior(K)$ and cannot be rationally approximated on $K$.
]

#proof[
  Let $S = {s_k}_(k in NN)$ be a countably dense set of points in $DD$ (use a bijection $NN -> QQ$ and Cantor's pairing function $NN -> NN^2$ to get a surjection $NN -> QQ^2 inter DD$).

  Fix $0 < epsilon' < 1$. Let $z_1 = s_1$ and $r_1 = epsilon / 2 < epsilon'$, $r_1^2 < 1 / 2$. For each $k in NN$, let $z_k$ be the first to be the first point in the dense sequence $S$ such that
  $
    c_k in.not union.big_(j = 1)^(k - 1) overline(D(z_j, r_j)).
  $
  Then choose $r_k$ such that $D(z_k, r_k)$ lies in $DD$ and does not intersect any previous $D(z_j, r_j)$ for $j < k$ (possible by the fact that each $z_j$ does not lie on the boundary of the previous disks) and so that
  $
    0 < r_k <= epsilon / 2 - 1 / 2 sum_(j = 1)^(k - 1) r_j < epsilon' - sum_(j = 1)^(k - 1) r_j ==> sum_(j = 1)^k < epsilon'
  $
  under the inductive hypothesis that $sum_(j = 1)^(k - 1) r_j < epsilon'$. Apply another bound, so that
  $
    0 < r_k^2 <= 1 / 4 - 1 / 2 sum_(j = 1)^(k - 1) r_j^2 < 1 / 2 - sum_(j = 1)^(k - 1) r_j^2 ==> sum_(j = 1)^k r_j^2 < 1 / 2
  $
  under the additional assumption that $sum_(j = 1)^(k - 1) r_j^2 < 1 / 2$. Repeat this process inductively for all $k in NN$. Define
  $
    K = overline(DD) without union.big_(j = 1)^oo D(z_j, r_j),
  $
  which is compact. For any point $z in K$, no disk centered at $z$ exists such that $D(z, delta)$ is contained in $K$, since a subsequence of $S$ accumulating to $z$ in $overline(DD)$ is removed from $K$. Hence, $interior(K) = emptyset$. Hence, any $f in C^0(K)$ is holomorphic on the interior.

  (This general construction of $K$ is known as the _Swiss cheese set_)

  We now show that $z mapsto overline(z)$ cannot be uniformly rationally approximated on $K$. By explicit calculation or Green's Theorem (@thm:complex-green), we have
  $
    integral.cont_(partial D(z_j, r_j)) overline(z) dz &= integral.double_(D(z_j, r_j)) dif(overline(z) dz) = 2 ii integral.double_(D(z_j, r_j)) dx and dy \
    &= 2 uppi ii r_j^2 ==> abs(sum_(j = 1)^oo integral.cont_(partial D(z_j, r_j)) overline(z) dz) <= uppi,
  $
  and by similar reasoning
  $
    abs(integral.cont_(partial DD) overline(z) dz) = 2 uppi ==> abs((integral.cont_(partial DD) - sum_(j = 1)^oo integral.cont_(partial D(z_j, r_j))) overline(z) dz) >= uppi.
  $
  For any rational $psi$ with poles off $K$,
  $
    (integral.cont_(partial DD) - sum_(j = 1)^oo integral.cont_(partial D(z_j, r_j))) psi(z) dz = 0
  $
  by @thm:cauchy-integral-theorem. The summation's convergence follows from $abs(sum integral.cont_(partial D(z_j, r_j)) psi(z) dz)$ being termwise absolutely bounded by $sum 2 uppi M r_j$, which converges by construction. Now, if $abs(overline(z) - psi(z)) < 1 / 4$ on $K$, then
  $
    uppi &<= abs((integral.cont_(partial DD) - sum_(j = 1)^oo integral.cont_(partial D(z_j, r_j))) overline(z) dz) <= abs(integral.cont_(partial DD) - sum_(j = 1)^oo integral.cont_(partial D(z_j, r_j))) abs(psi(z) - overline(z)) abs(dz) \
    &<= 2 uppi (1 - sum_(j = 1)^oo r_j) 1 / 4 <= uppi / 2,
  $
  which is impossible.
]
