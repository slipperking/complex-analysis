#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [The Schwarz--Christoffel Transformation],
  route: "schwarz_christoffel",
  label: <sec:schwarz_christoffel_transformation>,
)
The Riemann Mapping Theorem is elegant in its own simplicity and definitions. However, it is only a theorem that guarantees existence of biholomorphisms. No information whatsoever can be straightforwardly extracted regarding the explicit construction of such biholomorphisms. However, in the explicit case that $U$ is the open interior of a polygon, the result is provided by the Schwarz--Christoffel Transformation.

Let $a_1 < a_2 < dots.c < a_n$ be $n in NN$ distinct real numbers. Suppose $alpha_1, alpha_2, dots, alpha_n$ are $n$ positive real numbers satisfying $sum_(k = 1)^n alpha_k < n - 1$. Let
$
  beta(zeta) = (zeta - a_1)^(alpha_1 - 1) dots.c (zeta - a_n)^(alpha_n - 1) = product_(k = 1)^n (zeta - a_k)^(alpha_k - 1),
$
where the branch of each factor is selected to be
$
  (zeta - a_k)^(alpha_k - 1) = ee^((alpha_k - 1) (log(zeta - a_k))),
$
where the branch of $log(z)$ is selected such that $-uppi / 2 < Im(log(z)) <= 3 uppi / 2$, holomorphic on $CC without ii RR_(<= 0)$ (the lower imaginary axis is known as a _branch cut_). For $zeta < a_k$, the argument of this factor is $uppi (alpha_k - 1)$. For $zeta < a_1$,
$
  arg(beta(zeta)) = uppi (-n + sum_(k = 1)^n alpha_k),
$
achieved by selecting branches of each factor by the method described earlier.

Let $k$ be fixed. If $zeta in (a_(k - 1), a_k)$, the branches of all $(zeta - a_j)^(alpha_j - 1)$ where $1 <= j <= k - 1$ have vanishing arguments; hence,
$
  arg(beta(zeta)) = uppi (-n + k - 1 + sum_(j = k)^n alpha_j).
$
If $zeta > a_n$, we have
$
  arg(beta(zeta)) = 0.
$
Therefore, we can define $n + 2$ complex numbers via
$
  w_0 = c integral_0^(-oo) beta(zeta) dzeta, quad w_k = c integral_0^(a_k) beta(zeta) dzeta, quad w_(n + 1) = c integral_0^oo beta(zeta) dzeta
$
where $c in RR_(> 0)$ is fixed.

The absolute integrability of $beta(zeta)$ along the real axis concerns only the convergence at each singularity $zeta = a_k$ and the behavior as $zeta -> plus.minus oo$. For a fixed $k$, $beta(zeta) = h_k (zeta) (zeta - a_k)^(alpha_k - 1)$ (where $h_k$ is holomorphic and nonzero in a compact neighborhood of $a_k$). Since $alpha_k - 1 > -1$, it is an integrable singularity. Since $beta(zeta) tilde zeta^(sum alpha_k - n)$ as $zeta -> plus.minus oo$ and $sum_(k = 1)^n alpha_k - n < -1$, $beta$ is integrable on $RR$.

Let
#lbl(
  $
    f(z) = c integral^z beta(zeta) dzeta.
  $,
  <eq:schwarz_christoffel_transformation_statement>,
)
Since $beta$ is holomorphic on $HH^+$,

// TBC
