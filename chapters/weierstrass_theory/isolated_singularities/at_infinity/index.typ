#import "/lib.typ": *

=== At the $oo$ Point

Given the one-point compactification of $CC$, $extcomplex$, we can now define and analyze the behavior of functions near the point at oo. Similar to the classification of isolated singularities in $CC$, we can classify $oo$ as a removable singularity, a pole, or an essential singularity of a holomorphic function.

Let $f:CC without overline(D(0, R)) -> CC$ be holomorphic for some $R > 0$. Then $z = oo$ is an _isolated singularity_ of $f$. To analyze the nature of the singularity, let $zeta = 1 / z$. We define a new function $g(zeta) = f(1 / zeta) = f(z)$, which is holomorphic on $D^*(0, 1 / R)$. Then at $zeta = 0$, $g(zeta)$ has the Laurent expansion of
$
  g(zeta) = sum_(n = -oo)^oo c_(-n) zeta^n = sum_(n = 0)^oo c_(-n) zeta^n + sum_(n = 1)^oo c_n zeta^(-n) = phi(zeta) + psi(zeta),
$
where $phi$ and $psi$ are the holomorphic and principal parts of $g$, respectively. Let $tilde(phi)(z) = phi(1 / z)$, $tilde(psi)(z) = psi(1 / z)$. At $z = 0$, $f$ then has the Laurent expansion of
$
  f(z) = sum_(n = -oo)^oo c_n z^n = sum_(n = 0)^oo c_(-n) z^(-n) + sum_(n = 1)^oo c_n z^n = tilde(phi)(z) + tilde(psi)(z).
$

The classification of the singularity at $oo$ is then reduced to the classification of the singularity of $g$ at $0$:

1. If $z = oo$ is a removable singularity of $f(z)$, then $f(z)$ has the form of
  $ f(z) = c_0 + c_(-1) / z + c_(-2) / z^2 + c_(-3) / z^3 + dots.c. $
2. If $z = oo$ is a pole of $f(z)$ with degree $m in NN$, then $f(z)$ can be written as
  $ f(z) = c_m z^m + c_(m - 1) z^(m - 1) + dots.c + c_0 + c_(-1) / z + dots.c, $
  where $c_m != 0$.
3. If $z = oo$ is an essential singularity of $f(z)$, then $f(z)$ can be expanded as
  $ f(z) = sum_(n = -oo)^oo c_n z^n, $
  where $forall N in NN$, $exists n > N$ such that $c_n != 0$ (infinitely many coefficients of $psi$ or $tilde(psi)$ are nonzero).

#remark[
  Under stereographic projection from the point $(0, 0, 1)$ of the unit sphere $S^2$, a neighborhood of that point maps to a subset of the extended complex plane of the form $extcomplex without K$, where $K$ is a compact and connected subset of $CC$. Such sets are referred to as _neighborhoods of $oo$_ in the Riemann sphere.
]

#example[
  The function $z mapsto 1 / z$ has a removable singularity at $z = oo$, the function $z mapsto z^2$ has a pole at $z = oo$, and $z mapsto ee^z$ has an essential singularity at $z = oo$.
]
