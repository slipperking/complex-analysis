#import "/lib.typ": *

== Consequences of Holomorphy

Obviously, we will first formally define the concept of holomorphy in higher dimensions.

#definition[
  A function $f : Omega subset.eq CC^n -> CC$ is _holomorphic_ if it is holomorphic in each variable when the others are held constant.
]

If we consider $f$ to be a function of $z_1, overline(z_1), z_2, overline(z_2), dots, z_n, overline(z_n)$, then $f$ is holomorphic iff $pdv(f, overline(z_k)) equiv 0$ for all $1 <= k <= n$ and $f$ has all continuous partial derivatives.

#theorem("Cauchy's Integral Formula on Polydisks")[
  Fix $bold(a) = (a_1, dots, a_n) in CC^n$ arbitrarily and suppose $r_1, r_2, dots, r_n > 0$ are the radii of the polydisk defined by $Omega = product_(k=1)^n D(a_k, r_k)$ (where the product here is the Cartesian product).
  Suppose $f : overline(Omega) -> CC$ is holomorphic. For fixed $k_1, k_2, dots, k_n in ZZ_(gt.eq 0)$, we have that
  $
    (product_(j=1)^n pdv(, z_j, [k_j])) f(bold(z)) = (product_(j=1)^n k_j !) / ((2 uppi ii)^n) integral.cont_(partial D(a_1, r_1)) dots.c integral.cont_(partial D(a_n, r_n)) (f (zeta_1, dots, zeta_n)dzeta_n dots.c dzeta_1) / (product_(j=1)^n (zeta_j - z_j)^(k_j + 1))
  $
  for any $z = (z_1, z_2, dots, z_n) in Omega$.
] <thm:cauchyintegralformulapolydisks>

#proof[
  By Cauchy--Goursat (@thm:cauchy_differentiation_formula), we have
  $
    pdv(, z_1, [k_1]) f(bold(z)) = (k_1 !) / (2 uppi ii) integral.cont_(partial D(a_1, r_1)) (f (zeta_1, z_2, dots, z_n)) / ((zeta_1 - z_1)^(k_1 + 1)) dzeta_1
  $
  for $z in Omega$, which is holomorphic. Thus, by the same application on $pdv(, z_1, [k_1]) f(bold(z))$, we have
  $
    pdv(, z_2, [k_2]) pdv(, z_1, [k_1]) f (bold(z)) = (k_2 ! k_1 !) / ((2 uppi ii)^2) integral.cont_(partial D(a_2, r_2)) integral.cont_(partial D(a_1, r_1)) (f (zeta_1, zeta_2, z_3, dots, z_n) dzeta_1 dzeta_2) / ((zeta_1 - z_1)^(k_1 + 1) (zeta_2 - z_2)^(k_2 + 1)).
  $
  By reiterating $n$ times and reversing the order of differentiation and integration, the conclusion follows.
]

By the boundedness assumption for $f$, we have:

#corollary("Cauchy's Estimate on Polydisks")[
  Let $bold(a) = (a_1, a_2, dots, a_n) in CC^n$ be fixed and suppose $r_1, r_2, dots, r_n > 0$ are the radii of the polydisk defined by $Omega = product_(k=1)^n D(a_k, r_k)$ (where the product here is the Cartesian product).
  Suppose $f : overline(Omega) -> CC$ is holomorphic. For fixed $k_1, k_2, dots, k_n in ZZ_(gt.eq 0)$, we have that
  $
    abs((product_(j=1)^n (partial^(k_j)) / (partial z_j^(k_j))) f (bold(z))) <= product_(j=1)^n ((k_j !) / (r_j^(k_j))) sup_(bold(zeta) in product_(j=1)^n partial D(a_j, r_j)) abs(f(bold(zeta)))
  $
  for any $bold(z) = (z_1, z_2, dots, z_n) in Omega$.
] <cor:cauchys_estimatepolydisks>

#proof[
  For each $j$, let $epsilon_j$ satisfy $D(z_j, epsilon_j) subset.eq D(a_j, r_j)$. By Cauchy's Integral Formula (@thm:cauchyintegralformulapolydisks), we have
  $
    &abs((product_(j=1)^n pdv(, z_j, [k_j])) f(bold(z))) \ & wide ""<= (product_(j=1)^n k_j !) / ((2 uppi)^n) integral.cont_(partial D(a_1, r_1)) dots.c integral.cont_(partial D(a_n, r_n)) abs((f (zeta_1, dots, zeta_n)) / (product_(j=1)^n (zeta_j - z_j)^(k_j + 1))) abs(dzeta_n) dots.c abs(dzeta_1).
  $
  For each $j$, let $zeta_j = a_j + r_j ee^(ii t_j)$, and it follows that $dif zeta_j = ii r_j ee^(ii t_j) dif t_j$. Because $abs(zeta_j - z_j) > epsilon_j$, we have, after substitution,
  $
    &abs((product_(j=1)^n pdv(, z_j, [k_j])) f(bold(z)))<= (product_(j=1)^n (r_j k_j !)) / (2 uppi)^n integral_0^(2 uppi) dots.c integral_0^(2 uppi) abs((f (zeta_1, dots, zeta_n)) / (product_(j=1)^n epsilon_j^(k_j + 1))) dif t_n dots.c dif t_1 \
    &wide""<= product_(j=1)^n ((r_j k_j !) / (2 uppi epsilon_j^(k_j + 1))) sup_(bold(zeta) in product_(j=1)^n partial D(a_j, r_j)) abs(f(bold(zeta))) integral #h(-0.3em) dots.c #h(-0.3em) integral_([0, 2 uppi]^n) dif t_n dots.c dif t_1 \ // TODO: make the iterated integral bounds align correctly
    &wide""<= product_(j=1)^n ((k_j !) / (r_j^(k_j))) sup_(bold(zeta) in product_(j=1)^n partial D(a_j, r_j)) abs(f (bold(zeta))),
  $
  since $epsilon_j <= r_j$ for all $j$.
]

Similar to the univariate case, there are Taylor expansions of holomorphic functions in several complex variables.

#theorem[
  Let $f : CC^n -> CC$ be holomorphic on (a neighborhood of) the closure $overline(Omega)$ of a polydisk $Omega = product_(k=1)^n D(a_k, r_k)$ centered at $bold(a) = (a_1, a_2, dots, a_n) in CC^n$. Then, for any $bold(z) = (z_1, z_2, dots, z_n) in Omega$, we have the expansion
  $
    f (bold(z)) = sum_(k_1=0)^oo dots.c sum_(k_n=0)^oo a_(k_1, dots, k_n) (z_1 - a_1)^(k_1) dots.c (z_n - a_n)^(k_n),
  $ <eq:taylorexpansionmultivariable_series>
  where $forall k_1, dots, k_n in ZZ_(gt.eq 0)$,
  $
    a_(k_1, dots, k_n) = 1 / (product_(j=1)^n k_j !) (product_(j=1)^n pdv(, z_j, [k_j])) f (bold(a)).
  $
  The series converges absolutely and uniformly on $Omega$.
] <thm:taylorexpansionmultivariable>

#proof[
  By @thm:cauchyintegralformulapolydisks we have
  $
    f(bold(z)) = 1 / ((2 uppi ii)^n) integral.cont_(partial D(a_1, r_1)) dots.c integral.cont_(partial D(a_n, r_n)) (f(bold(zeta))) / ((zeta_1 - z_1) dots.c (zeta_n - z_n)) dzeta_n dots.c dzeta_1.
  $

  For each $j$, since $abs(z_j - a_j) < r_j = abs(zeta_j - a_j)$ on $partial D(a_j, r_j)$, the geometric series expansion holds:
  $
    1 / (zeta_j - z_j) = 1 / (zeta_j - a_j) dot 1 / (1 - (z_j - a_j) / (zeta_j - a_j)) = sum_(k_j=0)^oo ((z_j - a_j)^(k_j)) / ((zeta_j - a_j)^(k_j + 1)),
  $
  which converges uniformly in $zeta_j$ on $partial D(a_j, r_j)$. Hence, we have
  $
    f (bold(z)) = 1 / ((2 uppi ii)^n) sum_(k_1=0)^oo integral.cont_(partial D(a_1, r_1)) dots.c integral.cont_(partial D(a_n, r_n)) (f(bold(zeta)) (z_1 - a_1)^(k_1) dzeta_n dots.c dzeta_1) / ((zeta_1 - a_1)^(k_1 + 1) (zeta_2 - z_2) dots.c (zeta_n - z_n))
  $
  where uniform convergence has allowed the interchange of summation and integration. Reiteration of this process gives
  $
    f (bold(z)) = sum_(k_1=0)^oo dots.c sum_(k_n=0)^oo (product_(j=1)^n (z_j - a_j)^(k_j)) / ((2 uppi ii)^n) integral.cont_(partial D(a_1, r_1)) dots.c integral.cont_(partial D(a_n, r_n)) (f(bold(zeta)) dzeta_n dots.c dzeta_1) / (product_(j=1)^n (zeta_j - a_j)^(k_j + 1)).
  $
  By the Cauchy Integral Formula (@thm:cauchyintegralformulapolydisks), we have
  $
    (product_(j=1)^n pdv(, z_j, [k_j])) f (bold(a)) = (product_(j=1)^n k_j !) / ((2 uppi ii)^n) integral.cont_(partial D(a_1, r_1)) dots.c integral.cont_(partial D(a_n, r_n)) (f(bold(zeta))dzeta_n dots.c dzeta_1) / (product_(j=1)^n (zeta_j - a_j)^(k_j + 1)),
  $
  and hence if we let
  $
    a_(k_1, dots, k_n) = 1 / (product_(j=1)^n k_j !) (product_(j=1)^n pdv(, z_j, [k_j])) f (bold(a)),
  $
  then @eq:taylorexpansionmultivariable_series follows. Cauchy's Estimate (@cor:cauchys_estimatepolydisks) gives that
  $
    abs(a_(k_1, dots, k_n)) <= M product_(j=1)^n (1 / (rho_j^(k_j))),
  $
  where $M = sup_(bold(zeta) in product_(j=1)^n partial D(a_j, r_j)) abs(f(bold(zeta)))$ for some $rho_j > r_j$ for all $j$. Hence,
  $
    abs(sum_(k_1=0)^oo dots.c sum_(k_n=0)^oo a_(k_1, dots, k_n) product_(j=1)^n (z_j - a_j)^(k_j))
    &<= sum_(k_1=0)^oo dots.c sum_(k_n=0)^oo abs(a_(k_1, dots, k_n)) product_(j=1)^n abs(z_j - a_j)^(k_j) \
    &<= M sum_(k_1=0)^oo dots.c sum_(k_n=0)^oo product_(j=1)^n abs((r_j) / (rho_j))^(k_j) \
    &= M product_(j=1)^n sum_(k_j=0)^oo abs((r_j) / (rho_j))^(k_j) < oo.
  $
  By the Weierstrass $M$--Test (@thm:weierstrassmtest), the series converges absolutely and uniformly on $Omega$.
]

#theorem("Identity")[
  Let $f$ be a holomorphic function on $Omega subset.eq CC^n$. If the set ${z in Omega : f (z) = 0}$ has an accumulation point in $Omega$, then $f equiv 0$ on $Omega$.
] <thm:identitymultivar>

#theorem("Maximum Modulus Principle")[
  Let $Omega subset CC^n$ be a open bounded region, and suppose that $f : Omega -> CC$ is holomorphic. If
  $
    M = sup_(zeta in partial Omega) lim_(z -> zeta \ z in Omega) abs(f (z)),
  $
  then $abs(f (z)) < M$ for all $z in Omega$, unless $f$ is constant.
]

#theorem("Weierstrass")[
  Suppose that $Omega subset.eq CC^n$ is a region and that ${f_k}_(k in NN)$ is a sequence of holomorphic functions $Omega -> CC$. If ${f_k}_(k in NN)$ converges locally uniformly to $f$ on $Omega$, then $f$ is holomorphic on $Omega$. Moreover, $forall k_1, dots, k_n in ZZ_(gt.eq 0)$,
  $
    (product_(j=1)^n pdv(, z_j, [k_j])) f_k arrows.rr (product_(j=1)^n pdv(, z_j, [k_j])) f
  $
  on compact subsets of $Omega$.
] <thm:weierstrassconvergencemultivar>

#theorem("Montel")[
  A family $cal(F)$ of holomorphic functions on some region $Omega subset.eq CC^n$ is normal iff it is locally uniformly bounded on $Omega$.
] <thm:montelmultivar>
