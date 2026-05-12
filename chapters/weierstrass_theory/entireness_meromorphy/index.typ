#import "/lib.typ": *

== Entireness and Meromorphy

We have previously defined the concept of an entire function in the chapter on complex differentiation. Let $f$ be entire with the unique Taylor expansion $sum_(n = 0)^oo c_n z^n$. Since $z = oo$ is an isolated singularity, by the uniqueness of the Laurent expansion, the expansion at $z = 0$ has the same form as the expansion at $z = oo$. We will now analyze the implications on the entire function $f$ given an isolated singularity.

1. If the infinity point is a removable singularity, then $lim_(z -> oo) f(z)$ exists and is finite.

  #proposition[
    If $f(z)$ is entire and has a removable singularity at $z = oo$, then $f$ is constant.
  ] <prop:removablesingularityatinftyentireconstant>

  #proof[
    Let $z = 1 / zeta$, and let $g(zeta) = f(1 / (zeta))$, which has a removable singularity at $zeta = 0$. By @thm:riemannremovablesingularities, $g$ can be analytically continued to all of $CC$, especially at $zeta = 0$. Let $w = g(0)$. Then, $forall epsilon > 0$, $exists delta > 0$ such that $forall zeta in D(0, delta)$, $abs(g(zeta) - w) < epsilon$. It follows that $forall abs(z) > 1 / delta$, $abs(f(z)) < abs(w) + epsilon$, and is bounded. For the complement, $forall z in overline(D((0, 1 / delta)))$, $f(z)$ is continuous on a compact set, and by @thm:continuous_function_bounded_on_compact, is also bounded.

    Then by Liouville's Theorem (@thm:liouville), $f$ is constant.
  ]

2. If $f(z)$ has a pole at $z = oo$ of order $m in NN$, then $f$ is a polynomial of degree $m$.

  #proof[
    By the classification of a pole at $oo$, $f$ can be written as
    $
      f(z) = c_m z^m + c_(m - 1) z^(m - 1) + dots.c + c_0 + c_(-1) / z + dots.c.
    $
    Since $f(z)$ is entire, it is holomorphic at $z = 0$ and has a convergent Taylor expansion. By the uniqueness of Laurent expansions (@thm:laurentexpansionofholomorphicfunction), the two expansions are equivalent and therefore all terms with negative exponents vanish, and
    $
      f(z) = c_m z^m + c_(m - 1) z^(m - 1) + dots.c + c_0,
    $
    and since $c_m != 0$, the statement is confirmed.
  ]

3. If $f(z)$ has an essential singularity at $z = oo$, $f(z)$ is known as a _transcendental entire function_.

#example[
  The entire functions $sin(z)$, $cos(z)$, $sinh(z)$, $cosh(z)$, and $exp(z)$ are transcendental.
]

#definition("Meromorphy")[
  Let $U subset.eq CC$ be open, and let ${a_n}_(n in NN) subset U$ be a set of isolated points. Suppose $f:U without {a_n}_(n in NN) -> CC$ is holomorphic and has a pole at each of $z in {a_n}$. Then $f$ is _meromorphic_ in $U$.
] <def:meromorphicfunction>

Similar to holomorphy, meromorphy on a compact set can be defined as meromorphy on a neighborhood of the set. In general, we imply for the set to be open unless stated otherwise. If the set is not implicitly specified, we assume meromorphy on $CC$.

All holomorphic functions are meromorphic functions (with poles on $emptyset$). Consequently, entire functions are meromorphic on $CC$. All rational functions (including polynomials) are also meromorphic on $CC$. In the study of meromorphic functions with an isolated singularity at $oo$, rational functions are of important interest.

Let $f(z)$ be rational, written as $f(z) = p(z) / q(z)$, where $p$ and $q$ are polynomials. Let
$
  p(z) = a_n z^n + a_(n - 1) z^(n - 1) + dots.c + a_0 \
  q(z) = b_m z^m + b_(m - 1) z^(m - 1) + dots.c + b_0,
$
where $a_n, b_m != 0$. Trivially, the poles of $f$ are the zeros of $q$. Since
$
  f(z) = (z^n) / (z^m) dot (a_n + a_(n - 1) / z + dots.c + a_0 / z^n) / (b_m + b_(m - 1) / z + dots.c + b_0 / z^m),
$
we have
$
  lim_(z -> oo) f(z) =
  cases(
    a_n / b_m & "if" n = m,
    0 & "if" n < m,
    oo & "if" n > m.
  )
$
Conversely, we have:

#theorem[
  If $f(z)$ is meromorphic on $CC$ and has a pole or removable singularity at $z = oo$, then $f$ is a rational function.
] <thm:rationalmeromorphicfunctions>

#proof[
  Since $f$ is meromorphic on $CC$, its singularities are isolated poles. The assumption that $f$ has either a pole or a removable singularity at $oo$ implies that this singularity is also isolated. Thus, there exists some $R > 0$ such that $f$ is holomorphic on the punctured neighborhood ${z in CC : R < abs(z) < oo}$ of $oo$.

  Consider the Laurent expansion of $f$ at $oo$, obtained by substituting $w = 1 / z$ and expanding around $w = 0$:
  $
    f(z) = sum_(n = -oo)^oo a_n z^n,
  $
  where the series converges for sufficiently large $abs(z)$. If $oo$ is a removable singularity, the coefficients $a_n = 0$ for all $n > 0$. If $oo$ is a pole of order $m$, then $a_n = 0$ for all $n > m$, and $a_m != 0$. In either case, the principal part at $oo$ is
  $
    psi_infinity (z) = sum_(n = 1)^m a_n z^n,
  $
  which is a polynomial (identically zero if degree is $0$).

  Next, observe that $f$ has only finitely many poles in the closed disk $overline(D(0, R)) = {z : abs(z) <= R}$. Suppose otherwise. Then the set of poles in $overline(D(0, R))$ would be infinite. By Bolzano--Weierstrass (@thm:bolzanoweierstrass), this set would have an accumulation point in $overline(D(0, R))$. At such an accumulation point, $f$ would have a non-isolated singularity, a contradiction of the meromorphy of $f$ on $CC$.

  Let $z_1, dots, z_n$ denote these finitely many poles in $overline(D(0, R))$. For each $k = 1, dots, n$, the Laurent expansion of $f$ at $z_k$ has principal part
  $
    psi_k (z) = sum_(j = 1)^(m_k) c_(k, -j) / (z - z_k)^j,
  $
  where $m_k$ is the order of the pole at $z_k$. Define the auxiliary function
  $
    Phi(z) = f(z) - psi_infinity (z) - sum_(k = 1)^n psi_k (z),
  $
  which is meromorphic on $CC$, with potential singularities only at $z_1, dots, z_n$ and $oo$.

  We now show that each of these singularities is removable. First, fix $j in {1, dots, n}$ arbitrarily. Since the poles are isolated, there exists $epsilon_j > 0$ such that the punctured disk $D^*(z_j, epsilon_j) = {z : 0 < abs(z - z_j) < epsilon_j}$ contains no other poles $z_k$ for $k != j$.

  1. Since $f(z) - psi_j (z)$ is the holomorphic part of the Laurent expansion at $z_j$, it is holomorphic on $D(z_j, epsilon_j)$ (including at $z_j$).
  2. $sum_(k != j) psi_k (z)$ is holomorphic on $D(z_j, epsilon_j)$, as each $psi_k$ has its singularity elsewhere.
  3. $psi_infinity (z)$ is a polynomial, hence entire.

  Thus,
  $
    Phi(z) = [f(z) - psi_j (z)] - psi_infinity (z) - sum_(k != j) psi_k (z)
  $
  is holomorphic on $D(z_j, epsilon_j)$, including at $z_j$. Therefore, we can define $Phi(z_j)$ to make $Phi$ holomorphic at $z_j$.

  Since $f(z) - psi_infinity (z)$ is the holomorphic part of the expansion at $oo$, consisting of terms with nonpositive powers of $z$, $lim_(z -> oo) f(z) - psi_infinity (z)$ exists and is finite. Additionally, each $psi_k (z)$ consists of negative powers of $z - z_k$, so $lim_(z -> oo) psi_k (z) = 0$ for each $k$, and thus $lim_(z -> oo) sum_(k = 1)^n psi_k (z) = 0$. Therefore, $lim_(z -> oo) Phi(z)$ exists and is finite, so $oo$ is a removable singularity of $Phi$. Without the finite singularities at each $z_k$, $Phi$ is entire. Since $Phi$ has a finite limit at $oo$, it is bounded on $CC$. By Liouville's theorem, $Phi(z) equiv c$ for some constant $c$.

  Hence,
  $
    f(z) = c + psi_oo (z) + sum_(k = 1)^n psi_k (z).
  $
  The right-hand side is a sum of a constant, a polynomial, and finitely many principal parts (each a rational function with a single pole), so $f$ is rational.
]

If $z = oo$ is not a pole or removable singularity of a meromorphic function $f(z)$, then it is either an essential singularity or an accumulation point of poles. In this case, $f$ is not rational and is known as a _transcendental meromorphic function_.
