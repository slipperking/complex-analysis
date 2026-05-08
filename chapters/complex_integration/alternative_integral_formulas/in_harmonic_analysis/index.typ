#import "/lib.typ": *

=== In Harmonic Analysis

Consider $R = 1$, $zeta = ee^(ii tau)$, and $z = rho ee^(ii theta)$ in @eq:poissonintegralformula2:

$
  u(z)
  &= 1 / (2 uppi) integral_0^(2 uppi) u(zeta) (1 - abs(z)^2) / abs(zeta - z)^2 dif tau \
  &= 1 / (2 uppi) integral_0^(2 uppi) ((1 - rho^2) u(ee^(ii tau)) dif tau) / ((ee^(ii tau) - rho ee^(ii theta)) (ee^(-ii tau) - rho ee^(-ii theta))) \
  &= 1 / (2 uppi) integral_0^(2 uppi) ((1 - rho^2) u(ee^(ii tau)) dif tau) / (1 + rho^2 - 2 rho cos(theta - tau)). #<eq:poissonintegralformulatrigonometricsubstitution>
$

Since $u(z)$ is continuous on $partial DD$ and $u(ee^(ii theta))$ is periodic with period $2 uppi$, it admits a Fourier series representation with coefficients

$
  a_n = 1 / (2 uppi) integral_0^(2 uppi) u(ee^(ii tau)) ee^(-ii n tau) dif tau,
$ <eq:poissonintegralformulafourierseries>

so that the corresponding Fourier series is

$ sum_(n = -infinity)^infinity a_n ee^(ii n theta). $

This series may diverge. Observe that continuity of $u$ on the compact set $partial DD$ implies uniform boundedness: $exists M > 0$ such that $abs(u(ee^(ii theta))) <= M$ for all $theta$ (@thm:continuous_function_bounded_on_compact). Consequently, $abs(a_n) <= M$. Introducing factors $rho^(abs(n))$ with $abs(rho) < 1$ yields a convergent series:

$
  sum_(n = -infinity)^infinity a_n ee^(ii n theta) rho^(abs(n)),
  quad
  abs(sum_(n = -infinity)^infinity a_n ee^(ii n theta) rho^(abs(n))) <= sum_(n = -infinity)^infinity abs(a_n) rho^(abs(n)) <= M (1 + abs(rho)) / (1 - abs(rho)).
$

Substituting the coefficients gives

$
  sum_(n = -infinity)^infinity a_n ee^(ii n theta) rho^(abs(n))
  &= sum_(n = -infinity)^infinity (1 / (2 uppi) integral_0^(2 uppi) u(ee^(ii tau)) ee^(-ii n tau) dif tau) ee^(ii n theta) rho^(abs(n)) \
  &= 1 / (2 uppi) sum_(n = -infinity)^infinity integral_0^(2 uppi) rho^(abs(n)) u(ee^(ii tau)) ee^(ii n (theta - tau)) dif tau.
$

By @thm:weierstrassmtest and @thm:limitintegralswitch,

$
  1 / (2 uppi) sum_(n = -infinity)^infinity integral_0^(2 uppi) rho^(abs(n)) u(ee^(ii tau)) ee^(ii n (theta - tau)) dif tau
  = 1 / (2 uppi) integral_0^(2 uppi) u(ee^(ii tau)) sum_(n = -infinity)^infinity rho^(abs(n)) ee^(ii n (theta - tau)) dif tau. #<eq:poissonintegralformulafourierseriespostintegralsummationswitch>
$

The summation simplifies as follows:

$
  sum_(n = -infinity)^infinity rho^(abs(n)) ee^(ii n (theta - tau))
  &= sum_(n = 0)^infinity rho^n ee^(ii n (theta - tau)) + sum_(n = 1)^infinity rho^n ee^(-ii n (theta - tau)) \
  &= 1 + 2 sum_(n = 1)^infinity rho^n cos(n (theta - tau)) \
  &= 1 + 2 Re(sum_(n = 1)^infinity rho^n ee^(ii n (theta - tau))) \
  &= 1 + 2 Re((rho ee^(ii (theta - tau))) / (1 - rho ee^(ii (theta - tau)))) \
  &= (1 - rho^2) / (1 + rho^2 - 2 rho cos(theta - tau)).
$

Substituting into @eq:poissonintegralformulafourierseriespostintegralsummationswitch yields

$
  sum_(n = -infinity)^infinity a_n ee^(ii n theta) rho^(abs(n)) = 1 / (2 uppi) integral_0^(2 uppi) ((1 - rho^2) u(ee^(ii tau))) / (1 + rho^2 - 2 rho cos(theta - tau)) dif tau = u(rho ee^(ii theta)).
$

Furthermore, by the proof of @thm:dirichletproblemwithlaplaceequationsolution (specifically @eq:dirichletproblemwithlaplaceequationsolution_limittoboundary),

$ lim_(rho -> 1^-) sum_(n = -infinity)^infinity a_n ee^(ii n theta) rho^(abs(n)) = u(ee^(ii theta)). $

Thus, for any continuous function $u$ on $partial DD$, its Fourier series is _Abel summable_ to $u$.

We now establish that real-valued continuous functions satisfying the mean-value property are harmonic.

#theorem[
  Let $U subset.eq CC$ be open and $f:U -> RR$ continuous. Suppose for every $z_0 in U$, there exists $lambda > 0$ with $overline(D(z_0, lambda)) subset.eq U$ such that for all $0 < epsilon <= lambda$,
  $ f(z_0) = 1 / (2 uppi) integral_0^(2 uppi) f(z_0 + epsilon ee^(ii t)) dt. $
  Then $f$ is harmonic on $U$.
] <thm:mean_value_property_solutions_are_harmonic>

#proof[
  Fix $z_0 in U$ arbitrarily and choose $lambda > 0$ such that $overline(D(z_0, lambda)) subset.eq U$. Because $f in C^0 (partial D(z_0, lambda))$, @thm:dirichletproblemwithlaplaceequationsolution guarantees the existence of a unique harmonic function $u$ on $D(z_0, lambda)$ satisfying
  $ u(z) = integral_0^(2 uppi) f(zeta) P(zeta, z) dif tau, $
  with $u = f$ on $partial D(z_0, lambda)$. Define $psi = f - u$ on $overline(D(z_0, lambda))$. Then $psi$ is continuous, satisfies the mean-value property, and vanishes on $partial D(z_0, lambda)$. By the proof of @thm:maximummodulus, which relies solely on the mean-value property, $psi equiv 0$ on $overline(D(z_0, lambda))$. Thus, $f equiv u$ on $overline(D(z_0, lambda))$, implying $f$ is harmonic at $z_0$. The arbitrariness of $z_0$ establishes harmonicity on $U$.
]
