#import "/lib.typ": *

== Analyticity and Holomorphy<sec:analyticity_and_holomorphy>

The Cauchy--Goursat Formula (@thm:cauchygoursatformula) can be generalized into a result that directly relates complex integration and differentiation.

#theorem("Cauchy" + sym.dash.en + "Goursat")[
  Let $U subset CC$ be an open region bounded by a simple closed boundary $partial U$, and let $f:U -> CC$ be holomorphic and continuous on $overline(U)$. Then for every $z in U$ and every $n in NN$,
  $
    f^(n)(z) = (n!) / (taui) integral.cont_(partial U) (f(zeta)) / ((zeta - z)^(n + 1)) dzeta.
  $ <eq:cauchy_differentiation_formula_statement>

  Additionally, since $U$ is open, for every $z_0 in U$ and every $r > 0$ such that $overline(D(z_0, r)) subset U$, $f$ has the uniformly and absolutely convergent Taylor expansion
  $ f(z) = sum_(j = 0)^infinity a_j (z - z_0)^j, $ <eq:cauchy_differentiation_formula_taylorseries>

  where
  $
    a_j = (1) / (taui) integral.cont_(partial U) (f(zeta)) / ((zeta - z_0)^(j + 1)) dzeta
  $ <eq:cauchy_differentiation_formula_taylorseriescoefficients>
  on $overline(D(z_0, r))$.
] <thm:cauchydifferentiationformula>

#proof[
  Fix $z_0 in U$, and choose $r > 0$ such that $overline(D(z_0, r)) subset U$. For $z in D(z_0, r)$, by @thm:cauchygoursatformula,
  $
    f(z) - f(z_0) &= (1) / (taui) integral.cont_(partial U) (f(zeta)) / (zeta - z) dzeta - (1) / (taui) integral.cont_(partial U) (f(zeta)) / (zeta - z_0) dzeta \
    &= (z - z_0) / (taui) integral.cont_(partial U) f(zeta) / ((zeta - z)(zeta - z_0)) dzeta.
  $

  Dividing by $z - z_0$, we obtain
  $ (f(z) - f(z_0)) / (z - z_0) = (1) / (taui) integral.cont_(partial U) f(zeta) / ((zeta - z)(zeta - z_0)) dzeta. $

  Hence,
  $
    (f(z) - f(z_0)) / (z - z_0) - (1) / (taui) integral.cont_(partial U) (f(zeta)) / ((zeta - z_0)^2) dzeta
    &= (1) / (taui) integral.cont_(partial U) (f(zeta)) / (zeta - z_0) ((1) / (zeta - z) - (1) / (zeta - z_0)) dzeta \
    &= (z - z_0) / (taui) integral.cont_(partial U) f(zeta) / ((zeta - z)(zeta - z_0)^2) dzeta.
  $ <eq:cauchydifferentiationformula_differenceoffirstorderdifferences>

  Let $d$ be the distance from $z_0$ to $partial U$. Then $0 < r < d$. Since $abs(z - z_0) < r$ and $abs(zeta - z_0) gt.eq d$ for $zeta in partial U$, we have $abs(zeta - z) gt.eq d - r$. If $M = max_(zeta in partial U) abs(f(zeta))$, then the integrand in @eq:cauchydifferentiationformula_differenceoffirstorderdifferences is bounded above by $M / (d^2 (d - r))$. Therefore,
  $
    abs((z - z_0) / (taui) integral.cont_(partial U) f(zeta) / ((zeta - z)(zeta - z_0)^2) dzeta)
    <= abs(z - z_0) / (2 uppi) (M) / (d^2 (d - r)) integral.cont_(partial U) abs(dzeta).
  $

  As $z -> z_0$, the right-hand side tends to $0$. Thus,
  $ f'(z_0) = (1) / (taui) integral.cont_(partial U) (f(zeta)) / ((zeta - z_0)^2) dzeta. $

  Now suppose
  $ f^(k)(z) = (k!) / (taui) integral.cont_(partial U) (f(zeta)) / ((zeta - z)^(k + 1)) dzeta $
  for some $k in NN$. Since $abs(z - z_0) < abs(zeta - z_0)$ for $z in D(z_0, r)$ and $zeta in partial U$, we have the kernel expansion
  $
    1 / (zeta - z) & = 1 / (zeta - z_0) dot (1) / (1 - (z - z_0) / (zeta - z_0)) \
                   & = 1 / (zeta - z_0) sum_(j = 0)^infinity ((z - z_0) / (zeta - z_0))^j.
  $ <eq:cauchydifferentiationformula_kernelexpansion>

  Substituting into the inductive formula gives
  $
    f^(k)(z)
    &= (k!) / (taui) integral.cont_(partial U) (f(zeta)) / ((zeta - z)^(k + 1)) dzeta \
    &= (k!) / (taui) integral.cont_(partial U) (f(zeta)) / ((zeta - z_0)^(k + 1)) (sum_(j = 0)^infinity ((z - z_0) / (zeta - z_0))^j)^(k + 1) dzeta \
    &= f^(k)(z_0) + ((k + 1)! (z - z_0)) / (taui) integral.cont_(partial U) (f(zeta)) / ((zeta - z_0)^(k + 2)) dzeta + Order(abs(z - z_0)^2).
  $

  Therefore,
  $
    (f^(k)(z) - f^(k)(z_0)) / (z - z_0) = ((k + 1)!) / (taui) integral.cont_(partial U) (f(zeta)) / ((zeta - z_0)^(k + 2)) dzeta + Order(abs(z - z_0)).
  $

  Letting $z -> z_0$, we obtain
  $ f^((k + 1))(z_0) = ((k + 1)!) / (taui) integral.cont_(partial U) (f(zeta)) / ((zeta - z_0)^(k + 2)) dzeta. $

  By induction, @eq:cauchy_differentiation_formula_statement is valid for all $n in NN$.

  For the Taylor expansion, substitute @eq:cauchydifferentiationformula_kernelexpansion into @thm:cauchygoursatformula:
  $
    f(z)
    &= (1) / (taui) integral.cont_(partial U) (f(zeta)) / (zeta - z_0) sum_(j = 0)^infinity ((z - z_0) / (zeta - z_0))^j dzeta \
    &= (1) / (taui) integral.cont_(partial U) sum_(j = 0)^infinity (z - z_0)^j (f(zeta)) / ((zeta - z_0)^(j + 1)) dzeta.
  $

  Since $f$ is continuous on $partial U$, it is bounded there by some constant $M$. Also, for $z in overline(D(z_0, r))$ and $zeta in partial U$,
  $ abs((z - z_0)^j (f(zeta)) / ((zeta - z_0)^(j + 1))) <= (M r^j) / (inf_(xi in partial U) abs(xi - z_0)^(j + 1)). $

  The majorant series
  $ sum_(j = 0)^infinity (M r^j) / (inf_(xi in partial U) abs(xi - z_0)^(j + 1)) $
  converges, so by the Weierstrass $M$-Test (@thm:weierstrassmtest), the series is uniformly convergent. Hence we may interchange summation and integration:
  $
    (1) / (taui) integral.cont_(partial U) sum_(j = 0)^infinity (z - z_0)^j (f(zeta)) / ((zeta - z_0)^(j + 1)) dzeta
    &= (1) / (taui) sum_(j = 0)^infinity integral.cont_(partial U) (z - z_0)^j (f(zeta)) / ((zeta - z_0)^(j + 1)) dzeta \
    &= sum_(j = 0)^infinity a_j (z - z_0)^j.
  $

  This proves @eq:cauchy_differentiation_formula_taylorseries and @eq:cauchy_differentiation_formula_taylorseriescoefficients.
]

#remark[
  We have shown that once the first complex derivative of a holomorphic function exists, all higher derivatives exist as well and remain holomorphic on the same region. Furthermore, every holomorphic function admits a convergent Taylor series expansion in a neighborhood of each point of its domain. This property is called _analyticity_.

  Conversely, a power series is termwise differentiable inside its disk of convergence, so every analytic function is holomorphic. Thus analyticity and holomorphy are equivalent in complex analysis, which is a fundamental contrast with the real-variable setting.
]

The differentiation formula above can be viewed as a higher-order version of @thm:cauchygoursatformula and is often useful in evaluating integrals.

#example[
  A _Legendre polynomial_ is defined by
  $ P_n(z) = (1) / (2^n n!) dv((z^2 - 1)^n, z, n). $ <eq:legendrepolynomialintegralformula_rodriguesformula>

  Prove the integral representation
  $ P_n(z) = (1) / (taui) integral.cont_gamma ((zeta^2 - 1)^n) / (2^n (zeta - z)^(n + 1)) dzeta, $
  where $gamma$ is a simple closed curve enclosing $z$.
] <ex:legendrepolynomialintegralformula>

#proof[
  Apply @thm:cauchydifferentiationformula to the polynomial $(z^2 - 1)^n$. Then
  $
    P_n(z) = (1) / (2^n n!) dot (n!) / (taui) integral.cont_gamma ((zeta^2 - 1)^n) / ((zeta - z)^(n + 1)) dzeta = (1) / (taui) integral.cont_gamma ((zeta^2 - 1)^n) / (2^n (zeta - z)^(n + 1)) dzeta. #qedhere
  $
]

#theorem("Cauchy's Estimate")[
  Let $f:U -> CC$ be holomorphic on $U subset.eq CC$. For every $z_0 in U$ and every $R > 0$ such that $overline(D(z_0, R)) subset.eq U$, and for every $n in NN$,
  $ abs(f^(n)(z_0)) <= (n! M) / (R^n), $
  where
  $ M = max_(z in overline(D(z_0, R))) abs(f(z)). $
] <thm:cauchysestimate>

#proof[
  By @thm:cauchydifferentiationformula,
  $ f^(n)(z_0) = (n!) / (taui) integral.cont_(partial D(z_0, R)) (f(zeta)) / ((zeta - z_0)^(n + 1)) dzeta. $

  Parameterize $partial D(z_0, R)$ by $zeta = z_0 + R ee^(ii theta)$ for $0 <= theta <= 2 uppi$. Since $abs(f(zeta)) <= M$ on the circle,
  $
    abs(f^(n)(z_0))
    &<= (n!) / (2 uppi) integral_0^(2 uppi) M / abs((R ee^(ii theta))^(n + 1)) abs(ii R ee^(ii theta)) dif theta \
    &= (n! M) / (2 uppi) integral_0^(2 uppi) (1) / (R^n) dif theta \
    &= (n! M) / (R^n). #qedhere
  $
]

The relationship between a holomorphic function and its derivatives is one of the strongest structural properties in complex analysis. Later, @thm:nthderivativeboundedl1norm will generalize this estimate substantially.

#example[
  Let $f$ be entire and suppose that $forall z in CC$, $abs(f(z)) <= M ee^(abs(z))$. Prove that $abs(f(0)) <= M$ and that for every $n in NN$,
  $ abs(f^(n)(0)) <= M n! ((ee) / (n))^n. $
]

#proof[
  The bound $abs(f(0)) <= M$ follows immediately by setting $z = 0$.

  For every $R > 0$, @thm:cauchysestimate gives
  $ abs(f^(n)(0)) <= M n! (ee^R) / (R^n). $

  Setting $R = n$ yields
  $ abs(f^(n)(0)) <= M n! ((ee) / (n))^n. $

  This is in fact the optimal choice of $R$. If $phi(R) = M n! ee^R / R^n$, then
  $ phi'(R) = M n! (ee^R R^n - n ee^R R^(n - 1)) / (R^(2 n)) = 0 $
  if and only if $R = n$. Moreover,
  $ phi''(R) = M n! ee^R ((1) / (R^n) - (2 n) / (R^(n + 1)) + (n (n + 1)) / (R^(n + 2))) $
  so that
  $ phi''(n) = M (n - 1)! (ee^n) / (n^n) > 0. $

  Hence $R = n$ indeed minimizes the bound.
]

#theorem("Liouville")[
  Every bounded entire function is constant.
] <thm:liouville>

#proof[
  Let $f:CC -> CC$ be entire and bounded. Fix $z_0 in CC$. For every $R > 0$, @thm:cauchysestimate gives
  $ abs(f'(z_0)) <= M / R, $
  where $M = sup_(z in CC) abs(f(z))$.

  Letting $R -> infinity$, we obtain $f'(z_0) = 0$. Since $z_0$ was arbitrary, $f' equiv 0$ on $CC$, so $f$ is constant.
]

#proof[
  Alternative proof.

  Let $a, b in CC$ be distinct. Since $f$ is entire, for any $R > max(abs(a), abs(b))$, the function
  $ z |-> f(z) / ((z - a)(z - b)) $
  is holomorphic on the annular region between $partial D(0, R)$ and the two small circles $partial D(a, epsilon)$ and $partial D(b, epsilon)$, where $epsilon > 0$ is chosen so that the closed disks around $a$ and $b$ are disjoint. By @thm:cauchygoursattheorem,
  $
    integral.cont_(partial D(0, R)) f(z) / ((z - a)(z - b)) dz
    = integral.cont_(partial D(a, epsilon)) f(z) / ((z - a)(z - b)) dz + integral.cont_(partial D(b, epsilon)) f(z) / ((z - a)(z - b)) dz.
  $

  Applying @thm:cauchygoursatformula to the two small circles yields
  $
    integral.cont_(partial D(0, R)) f(z) / ((z - a)(z - b)) dz = taui ((f(a)) / (a - b) + (f(b)) / (b - a)) = taui (f(a) - f(b)) / (a - b).
  $

  On the other hand, if $abs(z) = R$, then $abs(z - a) >= R - abs(a)$ and $abs(z - b) >= R - abs(b)$. Hence
  $
    abs(integral.cont_(partial D(0, R)) f(z) / ((z - a)(z - b)) dz)
    <= M integral.cont_(partial D(0, R)) abs(dz) / (abs(z - a) abs(z - b))
    <= (2 uppi M R) / ((R - abs(a))(R - abs(b))).
  $

  As $R -> infinity$, the right-hand side tends to $0$. Therefore,
  $ taui (f(a) - f(b)) / (a - b) = 0. $

  Since $a$ and $b$ were arbitrary and distinct, $f(a) = f(b)$ for all $a, b in CC$, so $f$ is constant.
]

#theorem("Morera")[
  Let $U subset.eq CC$ and let $f:U -> CC$ be continuous. If for every oriented closed triangular contour $gamma subset U$,
  $ integral.cont_gamma f(zeta) dzeta = 0, $
  then $f$ is holomorphic on $U$.
] <thm:morera>

#proof[
  Fix $z_0 in U$. Since $U$ is open, there exists $r > 0$ such that $overline(D(z_0, r)) subset U$. Define
  $ F(z) = integral_(z_0)^z f(zeta) dzeta, $
  where the path is the straight line segment from $z_0$ to $z$. This is well-defined for $z in D(z_0, r)$ because the disk is convex.

  If $z, z + Delta z in D(z_0, r)$, then the triangle with vertices $z_0$, $z$, and $z + Delta z$ lies inside $D(z_0, r)$. By the hypothesis on triangular contours,
  $ F(z + Delta z) - F(z) = integral_z^(z + Delta z) f(zeta) dzeta. $

  Hence
  $
    (F(z + Delta z) - F(z)) / (Delta z) - f(z)
    = (1) / (Delta z) integral_z^(z + Delta z) (f(zeta) - f(z)) dzeta.
  $

  By continuity of $f$ at $z$, for every $epsilon > 0$ there exists $delta > 0$ such that
  $ abs(zeta - z) < delta => abs(f(zeta) - f(z)) < epsilon. $

  Therefore, whenever $abs(Delta z) < delta$,
  $
    abs((1) / (Delta z) integral_z^(z + Delta z) (f(zeta) - f(z)) dzeta)
    <= (1) / (abs(Delta z)) integral_z^(z + Delta z) epsilon abs(dzeta)
    = epsilon.
  $

  Thus $F'(z) = f(z)$ on $D(z_0, r)$. In particular, $f$ is holomorphic on $D(z_0, r)$. Since $z_0$ was arbitrary, $f$ is holomorphic on $U$.
]

#theorem[
  Let $U subset.eq CC$ be open, let $K subset U$ be compact, and let $K subset V subset.eq CC$ with $V$ open and $overline(V) subset U$. Let $f$ be holomorphic on $U$. Then there exists a sequence ${c_n} subset RR$ depending only on $K$ and $V$ such that for every $n in NN$,
  $ sup_(z in K) abs(f^(n)(z)) <= c_n norm(f)_(L^1(V)), $ <eq:nthderivativeboundedl1norm_statement>
  where
  $ norm(f)_(L^p(V)) = (integral_V abs(f(z))^p dx and dy)^((1)/(p)). $
] <thm:nthderivativeboundedl1norm>

#proof[
  Let $phi in C^infinity(CC)$ satisfy $supp(phi) subset V$ and suppose that $phi equiv 1$ on an open neighborhood $W$ of $K$ with $overline(W) subset V$. Since $f in C^infinity(U)$, apply the Cauchy--Pompeiu Theorem (@thm:pompeiu) to $f(z) phi(z)$:
  $
    f(z) phi(z)
    = (1) / (taui) (integral.cont_(partial U) (f(zeta) phi(zeta)) / (zeta - z) dzeta - integral_U pdv(f(zeta) phi(zeta), overline(zeta)) dot (dif overline(zeta) and dzeta) / (zeta - z)).
  $

  Since $supp(phi) subset V subset U$, the boundary term vanishes. Because $f$ is holomorphic,
  $ pdv(f(zeta) phi(zeta), overline(zeta)) = pdv(phi(zeta), overline(zeta)) f(zeta). $

  Therefore,
  $
    f(z) phi(z) = -(1) / (taui) integral_U pdv(phi(zeta), overline(zeta)) f(zeta) dot (dif overline(zeta) and dzeta) / (zeta - z).
  $

  Let $K_1 = supp(pdv(phi, overline(z)))$. For $z in K$, we have $phi(z) = 1$, so
  $
    f(z) = (1) / (taui) integral_(K_1) f(zeta) pdv(phi(zeta), overline(zeta)) (dzeta and dif overline(zeta)) / (zeta - z).
  $

  Since $K subset W$ and $K_1 inter W = emptyset$, the distance between $K$ and $K_1$ is positive. Hence there exists a constant $M > 0$ such that
  $ (1) / (abs(zeta - z)) <= M, quad forall z in K, zeta in K_1. $

  Differentiating under the integral sign is therefore justified, and for every $n in NN$,
  $
    f^(n)(z) = (n!) / (taui) integral_(K_1) f(zeta) pdv(phi(zeta), overline(zeta)) (dzeta and dif overline(zeta)) / ((zeta - z)^(n + 1)).
  $

  Taking absolute values gives
  $
    abs(f^(n)(z))
    <= (n!) / (2 uppi) integral_(K_1) abs(f(zeta)) abs(pdv(phi(zeta), overline(zeta))) abs((dzeta and dif overline(zeta)) / ((zeta - z)^(n + 1))).
  $

  The factor
  $ abs(pdv(phi(zeta), overline(zeta))) / (abs(zeta - z)^(n + 1)) $
  is bounded for all $z in K$ and $zeta in K_1$ by some constant $c'_n$ depending only on $K$, $V$, and $n$. Also,
  $ abs(dzeta and dif overline(zeta)) = 2 abs(dx and dy). $

  Thus
  $
    abs(f^(n)(z)) <= (n! c'_n) / uppi integral_(K_1) abs(f(zeta)) abs(dx and dy) <= (n! c'_n) / uppi integral_V abs(f(zeta)) abs(dx and dy).
  $

  Defining $c_n = n! c'_n / uppi$ proves @eq:nthderivativeboundedl1norm_statement.

  The remaining issue is the existence of such a cutoff function $phi$, which will be supplied later by @thm:bumpfunctionexistence.
]

#corollary[
  Let $U subset.eq CC$ be open, let $K subset U$ be compact, and let $K subset V subset.eq CC$ with $V$ open and $overline(V) subset U$. Then for every holomorphic function $f$ on $U$, there exist constants ${c_n}$ independent of $f$ and $z$ such that
  $ sup_(z in K) abs(f^(n)(z)) <= c_n sup_(z in V) abs(f(z)). $
] <cor:nthderivativeboundedsupremum>

#proof[
  By @eq:nthderivativeboundedl1norm_statement,
  $ sup_(z in K) abs(f^(n)(z)) <= c_n norm(f)_(L^1(V)). $

  Since
  $
    norm(f)_(L^1(V)) <= integral_V sup_(z in V) abs(f(z)) abs(dx and dy) = (integral_V abs(dx and dy)) sup_(z in V) abs(f(z)),
  $
  the result follows after absorbing $integral_V abs(dx and dy)$ into the constant.
]

For the next theorem we briefly introduce the notion of _analytic continuation_.

#definition("Analytic Continuation")[
  Let $U subset.eq CC$ be open, and let $f:U -> CC$ be holomorphic. Let $V subset.eq CC$ be open with $U subset.eq V$. A function $F:V -> CC$ is an _analytic continuation_ of $f$ to $V$ if:

  1. $F$ is holomorphic on $V$.
  2. $F equiv f$ on $U$.
] <def:analyticcontinuation>

The concept of analytic continuation and its consequences will be studied in more detail later. For now, we prove a classical removable singularity theorem that follows from the analyticity of holomorphic functions.

#theorem("Riemann")[
  Let $D^*(z_0, r) = D(z_0, r) without {z_0}$ be a punctured disk, and let $f:D^*(z_0, r) -> CC$ be holomorphic and bounded. Then $f$ admits an analytic continuation to $D(z_0, r)$.
] <thm:riemannremovablesingularities>

#proof[
  Since $f$ is bounded on $D^*(z_0, r)$, there exists $M > 0$ such that $abs(f(z)) <= M$ there. Define
  $ g(z) = cases((z - z_0)^2 f(z) & "if" z in D^*(z_0, r), 0 & "if" z = z_0.) $

  Then $g$ is holomorphic on $D^*(z_0, r)$, and
  $ abs(g(z)) <= M abs(z - z_0)^2 $
  shows that $g(z) -> 0$ as $z -> z_0$. Moreover,
  $ abs(g(z) / (z - z_0)) <= M abs(z - z_0) -> 0, $
  so $g'(z_0) = 0$.

  Define $g(z_0) = 0$. Then $g$ is holomorphic on all of $D(z_0, r)$. By @thm:cauchydifferentiationformula, $g$ has a Taylor expansion at $z_0$,
  $ g(z) = sum_(j = 2)^infinity a_j (z - z_0)^j. $

  Hence
  $ sum_(j = 0)^infinity a_(j + 2) (z - z_0)^j $
  defines a holomorphic function on $D(z_0, r)$. On the punctured disk this series equals
  $ g(z) / ((z - z_0)^2) = f(z). $

  Therefore $f$ extends holomorphically to $D(z_0, r)$.
]

#include "partitions_of_unity/index.typ"
