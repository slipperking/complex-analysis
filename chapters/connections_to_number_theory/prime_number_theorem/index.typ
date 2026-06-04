#import "/lib.typ": *

== Prime Number Theorem <sec:prime_number_theorem>

Prime numbers have been a central object of study in number theory since antiquity. From the times of Euclid, it was known that there were infinitely many primes. The _prime counting function_ $pi(n)$ is defined to be the number of primes not exceeding $n$. The _Prime Number Theorem_ states formally that:

#thm-state.thm-restate("thm:primenumber", final: true)

This result was first conjectured by Gauss and Legendre in the late 18th century based on empirical evidence, while early results given by P. L. Chebyshev and J. J. Sylvester proved that the ratio $(log(n) pi(n)) / n$ is bounded between two positive constants for large $n$. The full asymtotic relation was finally proven independently by Hadamard and de la Vallée Poussin in 1896 using complex analysis and properties of the Riemann $zeta$-function.

The logarithmic integral function, defined by

$ op("Li")(x) = integral_2^x dt / (log t) $

is of considerable interest as it much better approximates the prime counting function $pi(x)$ than $x / (log x)$ does. It can be trivially shown that $op("Li")(x) ~ x / (log x)$ by the realization that

$
  op("Li")(x) & = evaluated(t / (log t))_2^x + integral_2^x dt / (log^2 t) = x / (log x) + integral_2^x dt / (log^2 t) + Order(1) \
  & = x / (log x) + x / (log^2 x) + (2x) / (log^3 x) + (6x) / (log^4 x) + dots.c + Order(1) \
  & = x / (log x) + order(x / (log^2 x)).
$

We have previously seen how the Riemann $zeta$-function could be used to determine properties of the distribution of primes. The proof of the Prime Number Theorem depends on a more subtle connection between $zeta$ and $pi$. The most efficient way to construct such a connection has been the subject of much experimentation. The proof we proceed to provide may seem arbitrary, we provide this connection via auxiliary functions. But a look into history reveals the many failed experiments and attempts that ultimately led to the simplicity of the proof presented below.

Define the first and second _Chebyshev functions_ $theta.alt(x), psi(x)$ by

$
  theta.alt(x) = sum_(p <= x \ p "prime") log p, wide psi(x) = sum_(n <= x) Lambda(n) = sum_((p, k): p^k <= x \ p "prime") log p.
$

We hence derive that

$
  psi(x) = sum_(k = 1)^oo sum_(p^k <= x \ p "prime") log p = sum_(k = 1)^oo sum_(p <= root(k, x) \ p "prime") log p = sum_(k = 1)^oo theta.alt(x^(1 / k)) >= theta.alt(x).
$

Grouping by primes, we see that this is in fact equivalent to

$
  psi(x) &= sum_(p <= x \ p "prime") sum_(k: p^k <= x \ k in NN) log p = sum_(p <= x \ p "prime") sum_(forall k <= log_p x) log p \ &= sum_(p <= x \ p "prime") sum_(k = 1)^(floor((log x) / (log p))) log p = sum_(p <= x \ p "prime") floor((log x) / (log p)) log p<=sum_(p<= x\ p "prime") log x.
$ <eq:chebyshevfunction_psi_floor>

Hence we have for any $x > 1$,

$ 0 <= theta.alt(x) <= psi(x) <= pi(x) log x. $ <eq:chebyshevfunctions_bounds_primecounting>

#theorem[
  We have the following limit equivalences:
  $
    limsup_(x -> oo) (pi(x) log x) / x = limsup_(x -> oo) psi(x) / x = limsup_(x -> oo) theta.alt(x) / x
  $ <eq:chebyshevfunctions_limsup_inflim_equivalences_limsup>
  and
  $
    liminf_(x -> oo) (pi(x) log x) / x = liminf_(x -> oo) psi(x) / x = liminf_(x -> oo) theta.alt(x) / x.
  $ <eq:chebyshevfunctions_limsup_inflim_equivalences_liminf>
] <thm:chebyshevfunctions_limsup_inflim_equivalences>

#proof[
  Let $0 < alpha < 1$ be arbitrary and suppose $x > 1$. By definition, we have
  $
    theta.alt(x) & = sum_(p <= x \ p "prime") log p = sum_(p <= x^alpha \ p "prime") log p + sum_(x^alpha < p <= x \ p "prime") log p >= sum_(x^alpha < p <= x \ p "prime") log p \
    & = log(x^alpha) sum_(x^alpha < p <= x \ p "prime") (log p) / log(x^alpha) > log(x^alpha) sum_(x^alpha < p <= x \ p "prime") 1 \
    & = alpha log x (pi(x) - pi(x^alpha)) >= alpha log x (pi(x) - x^alpha).
  $
  Hence we have that
  $
    (alpha pi(x) log x) / x - alpha x^(alpha - 1) log x < theta.alt(x) / x <= psi(x) / x <= (pi(x) log x) / x
  $ <eq:chebyshevfunctions_limsup_inflim_equivalences_inequalities>
  by virtue of @eq:chebyshevfunctions_bounds_primecounting. Letting $x -> oo$ and taking the limit supremum yields
  $
    alpha limsup_(x -> oo) ((pi(x) log x) / x - x^(alpha - 1) log x) &= alpha limsup_(x -> oo) (pi(x) log x) / x <= limsup_(x -> oo) theta.alt(x) / x \
    &<= limsup_(x -> oo) psi(x) / x <= limsup_(x -> oo) (pi(x) log x) / x.
  $
  Letting $alpha -> 1^-$ yields @eq:chebyshevfunctions_limsup_inflim_equivalences_limsup. The proof of @eq:chebyshevfunctions_limsup_inflim_equivalences_liminf follows similarly by taking limit infimums in @eq:chebyshevfunctions_limsup_inflim_equivalences_inequalities and $alpha -> 1^-$.
]

#theorem[
  The Laplace transform of $psi compose exp$ defined as
  $ f(s) = integral_0^oo psi(ee^t) ee^(-s t) dt $ <eq:primenumbertheorem_laplacetransformchebyshevfunction_statement>
  converges for $Re s > 1$ and defines a holomorphic function on this domain. Moreover, the function $g$ defined by
  $ g(t) = lim_(sigma -> 1^+) [f(s) - 1 / (s - 1)], s = sigma + ii t $
  converges uniformly with respect to $t$ on compact subsets of $RR$ and is continuously differentiable thereon.
] <thm:primenumbertheorem_laplacetransformchebyshevfunction>

#proof[
  Let $u = ee^t$, $dif u = ee^t dt$. Then we obtain
  $
    f(s) & = integral_1^oo psi(u) u^(-s - 1) dif u = sum_(n=1)^oo integral_n^(n+1) psi(u) u^(-s - 1) dif u \
    & = sum_(n=1)^oo psi(n) integral_n^(n+1) u^(-s - 1) dif u = sum_(n=1)^oo sum_(m=1)^n Lambda(m) evaluated((u^(-s)) / (-s))_n^(n+1) \
    & = 1 / s sum_(n=1)^oo sum_(m=1)^n Lambda(m) [n^(-s) - (n+1)^(-s)] \
    & = 1 / s sum_(m=1)^oo Lambda(m) sum_(n=m)^oo [n^(-s) - (n+1)^(-s)] \
    & = 1 / s sum_(m=1)^oo Lambda(m) m^(-s) = 1 / s sum_(n=1)^oo Lambda(n) / (n^s).
  $
  by absolute convergence and the fact that the inner summation "telescopes." By @prop:riemannzetafunction_logarithmicderivativezetavonmangoldt, we have that for $Re s > 1$,
  $
    f(s) = -1 / s (zeta'(s)) / zeta(s) ==> f(s) - 1 / (s - 1) = -1 / s ((zeta'(s)) / zeta(s) + 1 / (s - 1)) - 1 / s.wide quad
  $ <eq:primenumbertheorem_laplacetransformchebyshevfunction_gfunction>
  The expression $(zeta'(s)) / zeta(s) + 1 / (s - 1)$ is meromorphic in $CC$. Because $zeta(s)$ has a simple pole at $s = 1$ with residue $1$, it follows that $ zeta(s) = 1 / (s - 1) + l(s) $ for some entire function $l:CC -> CC$. By @prop:riemannzetafunction_trivialzeros and @thm:riemannzetafunction_nozerosoncriticalstripboundary, the quantity $zeta(s) (s - 1) = 1 + (s - 1) l(s)$ does not vanish for $Re s >= 1$ (at $s = 1$, the simple pole $zeta$ cancels with the simple zero of $s - 1$). Hence,
  $
    (zeta'(s)) / zeta(s) + 1 / (s - 1) &= (zeta'(s) (s - 1) + zeta(s)) / (zeta(s) (s - 1)) = (dv(, s)(zeta(s) (s - 1))) / (1 + (s - 1) l(s)) \
    &= (l'(s) (s - 1) + l(s)) / (1 + (s - 1) l(s))
  $
  and the displayed expression define holomorphic functions on $Re s >= 1$ (observe that the numerator is entire).

  For a compact subset $I subset RR$, the complex rectangle $K = {x + ii y : 1 <= x <= 2, y in I}$ is compact in $CC$. Thus, by uniform continuity (given by @thm:heinecantor), $forall epsilon > 0$, $exists delta > 0$ such that $forall s_1 = sigma_1 + ii t_1 in K, forall s_2 = sigma_2 + ii t_2 in K : abs(s_1 - s_2) < delta,$
  $ abs(f(s_1) - 1 / (s_1 - 1) - f(s_2) + 1 / (s_2 - 1)) < epsilon. $
  In particular, for $sigma_1 = 1$ such that $t_2 = t_1$ ($= t$), we have
  $ s=sigma+ ii t in K: abs(sigma-1)<delta ==> abs(f(1 + ii t) - 1 / (ii t) - f(s) + 1 / (s - 1)) < epsilon, $
  where $delta$ is chosen independently of $t$. Therefore, $g(t)$ converges uniformly on compact subsets of $RR$ and is continuously differentiable thereon.
]

#chapter-section("wiener_ikehara_theorem")[
  #include "wiener_ikehara_theorem/index.typ"
]
