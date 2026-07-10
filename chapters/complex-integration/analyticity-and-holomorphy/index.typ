#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Analyticity and Holomorphy],
  route: "analyticity-and-holomorphy",
  children: [
    #include "partitions-of-unity/index.typ"
  ],
  label: <sec:analyticity-and-holomorphy>,
)

The Cauchy--Goursat Formula (@thm:cauchy-goursat-formula) can also be generalized into a result that equates complex integration and differentiation:

#lbl(
  theorem[Cauchy--Goursat][
    Let $U subset CC$ be an open region bounded by a simple closed boundary $partial U$, and let $f:U -> CC$ be holomorphic and continuous over $overline(U)$. Then $forall z in U$, $forall n in NN$, $f^((n)) (z)$ exists, and

    #lbl(
      $
        f^((n)) (z)= (n!) / taui integral.cont_(partial U) (f(zeta)) / ((zeta-z)^(n+1)) dzeta.
      $,
      <eq:cauchy-differentiation-formula-statement>,
    )

    Additionally, since $U$ is open, $forall a in U$, $forall r > 0$ such that the closed disk $overline(D(a, r)) subset U$, $f$ has the uniformly and absolutely convergent Taylor expansion

    #lbl(
      $
        f(zeta)=sum_(j = 0)^oo a_j (z-a)^j,
      $,
      <eq:cauchy-differentiation-formula-taylor-series>,
    )

    where

    #lbl(
      $
        a_j = 1 / taui integral.cont_(partial U) (f(zeta)) / ((zeta-z)^(j+1)) dzeta
      $,
      <eq:cauchy-differentiation-formula-taylor-series-coefficients>,
    )

    for $z in overline(D(a, r))$.
  ],
  <thm:cauchy-differentiation-formula>,
)

#proof[
  $forall a in U$, $forall z in D(a, r) subset U$, by @thm:cauchy-goursat-formula,

  $
    f(z)-f(a) & = 1 / taui integral.cont_(partial U) ((f(zeta)) / (zeta-z) - (f(zeta)) / (zeta-a)) dzeta \
              & = (z-a) / taui integral.cont_(partial U) (f(zeta) dzeta) / ((zeta-z)(zeta-a)),
  $

  and dividing by $z-a$, the above is equal to

  $
    (f(z)-f(a)) / (z-a) = 1 / taui integral.cont_(partial U) (f(zeta) dzeta) / ((zeta-z)(zeta-a)).
  $

  Since

  #lbl(
    $
      (f(z)-f(a)) / (z-a) - 1 / taui integral.cont_(partial U) (f(zeta) dzeta) / ((zeta-a)^2) & = 1 / taui integral.cont_(partial U) (f(zeta)) / (zeta-a) (1 / (zeta-z) - 1 / (zeta-a)) dzeta \
      & = (z-a) / (2 uppi ii) integral.cont_(partial U) (f(zeta)) / ((zeta-z)(zeta-a)^2) dzeta,
    $,
    <eq:cauchy-differentiation-formula-difference-of-first-order-differences>,
  )

  Let $d$ be the distance from $a$ to $partial U$; then $0 < r < d$. Then since $abs(z-a) < r$ and $abs(zeta-a) >= d$, $abs(zeta-z) >= d-r$. Then the absolute value of the integrand of @eq:cauchy-differentiation-formula-difference-of-first-order-differences is bounded above by $M / (d^2(d-r))$, where $M$ is the maximum of $abs(f(zeta))$, which exists by @thm:continuous-function-bounded-on-compact. Then,

  $
    abs((z-a) / (2 uppi ii) integral.cont_(partial U) (f(zeta)) / ((zeta-z)(zeta-a)^2) dzeta) <= abs(z-a) / (2 uppi) (M) / (d^2(d-r)) integral.cont_(partial U) abs(dzeta).
  $

  As $z -> a$, the difference vanishes, and therefore,

  $
    f'(z_0)=1/taui integral.cont_(partial U) (f(zeta)) / ((zeta-a)^2) dzeta.
  $

  Now inductively assume that @eq:cauchy-differentiation-formula-statement is true for a given $n=k in NN$, or

  $
    f^((k)) (z)= (k!) / (2 uppi ii) integral.cont_(partial U) (f(zeta)) / ((zeta-z)^(k+1)) dzeta.
  $

  Notice the expansion of the kernel, convergent since $abs(z-z_0) < abs(zeta-a)$:

  #lbl(
    $
      1 / (zeta-z) & =1 / (zeta-a) dot (zeta-a) / (zeta-a+a-z)=1 / (zeta-a) dot 1 / (1 - (z-a) / (zeta-a)) \
                   & =1 / (zeta-a) sum_(j = 0)^oo ((z-a) / (zeta-a))^j.
    $,
    <eq:cauchy-differentiation-formula-kernel-expansion>,
  )

  Then,

  $
    f^((k)) (z) & = (k!) / (2 uppi ii) integral.cont_(partial U) (f(zeta)) / ((zeta-z)^(k+1)) dzeta \
    & = (k!) / (2 uppi ii) integral.cont_(partial U) (f(zeta)) / ((zeta-a)^(k+1)) (sum_(j = 0)^oo ((z-a) / (zeta - a))^j)^(k+1) dzeta \
    & = f^((k)) (z_0) + (k!(k+1) (z-a)) / (2 uppi ii) integral.cont_(partial U) (f(zeta)) / ((zeta - a)^(k+2)) dzeta \
    & quad ""+ Order(abs(z-a)^2),
  $

  where the remainder terms $Order(abs(z-a)^2)$ resemble

  $
    (z - a)^2 (k!) / (2 uppi ii) [(k+1)+binom(k+1, 2)] integral.cont_(partial U) (f(zeta)) / ((zeta - a)^(k+3)) dzeta + Order(abs(z - a)^3).
  $

  The difference quotient is equal to

  $
    (f^((k)) (z) - f^((k)) (a)) / (z - a)=((k+1)!) / (2 uppi ii) integral.cont_(partial U) (f(zeta)) / ((zeta - a)^(k+2)) dzeta + Order(abs(z - a)).
  $

  As $z -> a$, the remainder terms vanish, and

  $
    f^((k+1)) (a)=((k+1)!) / (2 uppi ii) integral.cont_(partial U) (f(zeta)) / ((zeta - a)^(k+2)) dzeta.
  $

  By induction, @eq:cauchy-differentiation-formula-statement is valid. By substituting @eq:cauchy-differentiation-formula-kernel-expansion into @thm:cauchy-goursat-formula, we obtain

  $
    f(z) & =1 / taui integral.cont_(partial U) (f(zeta)) / (zeta - a) sum_(j = 0)^oo ((z - a) / (zeta - a))^j dzeta \
         & = 1 / taui integral.cont_(partial U) sum_(j = 0)^oo (z - a)^j (f(zeta) dzeta) / ((zeta - a)^(j+1)).
  $

  Because $f(zeta)$ is continuous over $partial U$, it is bounded by a constant $M$. Additionally, since $abs(z - a) < r < abs(zeta - a)$ and consequently $c=abs((z-a)/(zeta-a))<1$, the sum is termwise uniformly bounded by the convergent series

  $
    sum_(j = 0)^oo M c^j / r.
  $

  By the Weierstrass $M$--Test (@thm:weierstrass-m-test), the integrand uniformly converges, and we can justify

  $
    1 / taui integral.cont_(partial U) sum_(j = 0)^oo (z-z_0)^j (f(zeta)) / ((zeta-z_0)^(j+1)) dzeta &= 1 / taui sum_(j = 0)^oo integral.cont_(partial U) (z-z_0)^j (f(zeta)) / ((zeta-z_0)^(j+1)) dzeta \
    &= sum_(j = 0)^oo a_j (z-z_0)^j,
  $

  which verifies @eq:cauchy-differentiation-formula-taylor-series and @eq:cauchy-differentiation-formula-taylor-series-coefficients.
]

#remark[
  By induction, we have shown that assuming the existence of the first order derivative of a holomorphic function $f$, the $n$-th order derivative of $f$ exists $forall n in NN$ and is holomorphic over the same region as $f^((n-1))$. Furthermore, if $f$ is holomorphic, then $forall z in U$, there exists an open disk enclosing $z$ such that $f$ has a convergent Taylor series expansion. This property is known as _analyticity_, and @thm:cauchy-differentiation-formula tells us that all holomorphic functions are analytic. Analytic functions can be expanded into power series, which are termwise differentiable, and therefore complex differentiable. Thus, analyticity and holomorphy are logically equivalent, which is a fundamental difference between real and complex functions.
]

The differentiation formula above can be thought of as a generalization of @thm:cauchy-goursat-formula, and provides similar utility in the evaluation of integrals:

#lbl(
  example[
    A _Legendre polynomial_ is a polynomial whose explicit equation is given by

    #lbl(
      $
        P_n (z)=1 / (2^n n!) dv((z^2-1)^n, z, n, style: "large").
      $,
      <eq:legendre-polynomial-integral-formula-rodrigues-formula>,
    )

    Prove the integral form

    $
      P_n (z)=1 / taui integral.cont_gamma ((zeta^2-1)^n) / (2^n (zeta-z)^(n+1)) dzeta,
    $

    where $gamma$ is a simple closed curve enclosing $z$.
  ],
  <ex:legendre-polynomial-integral-formula>,
)

#solution[to @ex:legendre-polynomial-integral-formula][
  By applying Cauchy--Goursat (@thm:cauchy-differentiation-formula) on @eq:legendre-polynomial-integral-formula-rodrigues-formula, we get that

  $
    P_n (z)=1 / (2^(n+1) uppi ii) integral.cont_gamma ((zeta^2-1)^n) / ((zeta-z)^(n+1)) dzeta,
  $

  as desired.
]

#lbl(
  theorem[Cauchy's Estimate][
    For a function $f:U -> CC$ holomorphic over $U subset.eq CC$ and $forall z_0 in U$ and $forall R > 0$ such that $overline(D(z_0, R)) subset.eq U$, $forall n in NN$,

    $
      abs(f^((n)) (z_0)) <= (n! M) / (R^n),
    $

    where

    $
      M=max_(z in overline(D(z_0, R))) abs(f(z)).
    $
  ],
  <thm:cauchys-estimate>,
)

#proof[
  By the Differentiation Formula (@thm:cauchy-differentiation-formula), $forall n in NN$,

  $
    f^((n)) (z_0)= (n!) / (2 uppi ii) integral.cont_(partial D(z_0, R)) (f(zeta)) / ((zeta-z_0)^(n+1)) dzeta.
  $

  Because $f(z)$ is continuous over the boundary $partial D(z_0, R)$, it is bounded by $M$. Thus,

  $
    abs(f^((n)) (z_0)) <= (n!) / (2 uppi) integral_0^(2 uppi) M / ((ee^(ii theta) R)^(n+1)) ee^(ii theta) R dif theta = (n! M) / (R^n),
  $

  as desired.
]

@thm:nth-derivative-bounded-L1-norm will profoundly generalize this statement significantly. The relationship between the derivatives of a holomorphic function and the function itself is an important property of holomorphic functions.

#lbl(
  example[
    Let $f$ be entire such that $forall z in CC$, $abs(f(z)) <= M ee^(abs(z))$. Prove that $forall n in NN$, $abs(f(0)) <= M$ and

    $
      abs(f^((n)) (0)) <= M n! (ee / n)^n.
    $
  ],
  <ex:entire-function-exponential-bounded-derivative-bound>,
)

#solution[to @ex:entire-function-exponential-bounded-derivative-bound][
  $abs(f(0)) <= M$ is obviously true by letting $z=0$. Then $forall R > 0$, by Cauchy's Estimate (@thm:cauchys-estimate),

  $
    abs(f^((n)) (0)) <= M n! (ee^R) / (R^n).
  $

  By letting $R=n$, the conclusion follows. In fact, this is the tightest possible inequality. Consider $phi(R)=M n! (ee^R) / (R^n)$ to be a function of $R$. It attains its minimum as its derivative vanishes:

  $
    phi'(R)=M n! (ee^R R^n - n ee^R R^(n-1)) / (R^(2n)) = 0 <==> R^n = n R^(n-1) <==> R=n.
  $

  To confirm it as a minimum, we calculate the second order derivative:

  $
    phi''(R)=M n! ee^R (1 / (R^n) - (2n) / (R^(n+1)) + (n(n+1)) / (R^(n+2))) ==> phi''(n)=M (n-1)! (ee^n) / (n^n),
  $

  which is positive and convex.
]

The following theorem, albeit originally proven by Cauchy in 1844, shows a fundamental difference between holomorphic functions on proper subsets of $CC$ and entire functions.

#lbl(
  theorem[Liouville][
    Any bounded entire function is constant.
  ],
  <thm:liouville>,
)

#proof[
  Let $f:CC -> CC$ be entire. Then, $forall z_0 in CC$, $forall R > 0$, $f$ is holomorphic over $overline(D(z_0, R))$. By @thm:cauchys-estimate,

  $
    abs(f'(z_0)) <= M / R,
  $

  where $M=sup_(z in CC) abs(f(z))$. By letting $R -> oo$, $f'(z_0)$ where $z_0$ is any arbitrary value in $CC$. Therefore, $f(z)$ is constant.
]

#proof[(Alternative)][
  Let $a, b in CC$ be distinct and arbitrarily chosen. Let $f:CC -> CC$ be entire and bounded such that $abs(f) <= M$ for some $M > 0$. Let $R > abs(a), abs(b)$. Since $a != b$, $exists epsilon > 0$ such that $overline(D(a, epsilon)) union overline(D(b, epsilon)) = emptyset$. By the Cauchy--Goursat Theorem (@thm:cauchy-goursat-theorem), we have

  $
    integral.cont_(partial D(0, R)) (f(z)) / ((z-a)(z-b)) dz = (integral.cont_(partial D(a, epsilon)) + integral.cont_(partial D(b, epsilon))) (f(z)) / ((z-a)(z-b)) dz.
  $

  Since $z |-> (f(z)) / (z-a)$ is holomorphic on the disk centered at $b$ and $z |-> (f(z)) / (z-b)$ is holomorphic on the disk centered at $a$, by the Cauchy--Goursat Formula (@thm:cauchy-goursat-formula), we have

  $
    integral.cont_(partial D(0, R)) (f(z)) / ((z-a)(z-b)) dz = 2 uppi ii (f(b) / (b-a) + f(a) / (a-b)).
  $

  On the contrary, we also have

  $
    abs((integral.cont_(partial D(a, epsilon)) + integral.cont_(partial D(b, epsilon))) (f(z)) / ((z-a)(z-b)) dz) & <= M integral.cont_(partial D(0, R)) abs(dz) / (abs(z-a) abs(z-b)) \
    & = (2 uppi M R) / ((R-a)(R-b)) \
    & -> 0 quad "as" quad R -> oo.
  $

  We conclude that

  $
    (2 uppi ii) / (b-a) (f(b)-f(a))=0
  $

  for all distinct complex $a$ and $b$. Hence, $f$ is a constant function.
]

#lbl(
  theorem[Morera][
    Let $U subset.eq CC$ be a region and $f:U -> CC$ be continuous over $U$. If for any closed triangular contour $gamma subset U$,

    $
      integral.cont_gamma f(zeta) dzeta = 0,
    $

    then $f$ is holomorphic over $U$.
  ],
  <thm:morera>,
)

#proof[
  Let $a in U$ be arbitrary. Since $U$ is open, $exists r > 0$ such that $overline(D)=overline(D(a, r)) subset U$. Define

  $
    F(z)=integral_a^z f(zeta) dzeta,
  $

  where the path is a straight line segment, and $F$ is well-defined for $z in D$. Now

  $
    F'(z)&=lim_(Delta z -> 0) (F(z + Delta z)-F(z)) / (Delta z)\ &=lim_(Delta z -> 0) ([integral_a^(z + Delta z) + integral_z^a + (integral_(z + Delta z)^z + integral_z^(z + Delta z))] f(zeta) dzeta) / (Delta z).
  $

  Note that the first three integrals sum to form a closed triangular curve and hence vanish by assumption. Therefore,

  $
    F'(z)=lim_(Delta z -> 0) 1 / (Delta z) integral_z^(z + Delta z) f(zeta) dzeta.
  $

  By the continuity of $f$ at $z$, for any $epsilon > 0$, $exists delta > 0$ such that $abs(zeta-z) < delta ==> abs(f(zeta)-f(z)) < epsilon$. Then, for $abs(Delta z) < delta$,

  $
    abs(1 / (Delta z) integral_z^(z + Delta z) f(zeta) dzeta - f(z)) = abs(1 / (Delta z) integral_z^(z + Delta z) (f(zeta)-f(z)) dzeta) <= epsilon.
  $

  Thus, $F'(z)=f(z)$ for all $z in D$. Since $a$ was arbitrary, $f$ is holomorphic over $U$.
]

#lbl(
  theorem[
    Let $U subset.eq CC$ be open, let $K subset U$ be compact and $V supset K$ be open such that $overline(V) subset U$ is compact ($V supset.eq K$ is relatively compact in $U$). Let $f(z)$ be holomorphic in $U$. Then there exists a sequence ${c_n} subset RR$ dependent only on $K$ and $V$ (independent of $f$ and $z$) such that $forall n in NN$,

    #lbl(
      $
        sup_(z in K) abs(f^((n)) (z)) <= c_n norm(f)_(L^1(V)),
      $,
      <eq:nth-derivative-bounded-L1-norm-statement>,
    )

    where $norm(f)_(L^p(V))$ denotes

    $
      (integral_V abs(f(z))^p dx and dy)^(1 / p).
    $
  ],
  <thm:nth-derivative-bounded-L1-norm>,
)

#proof[
  Let $phi in C^oo (CC)$ satisfy $supp(phi) subset V$ and be identically equal to $1$ over some open neighborhood $W$ of $K$ relatively compact in $V$. Since $f in C^oo (U)$, by the Cauchy--Pompeiu Theorem (@thm:pompeiu) on $f(z) phi(z) in C^oo (overline(U))$,

  $
    f(z) phi(z)=1 / taui (integral.cont_(partial U) (f(zeta) phi(zeta)) / (zeta-z) dzeta - integral_U pdv(f(zeta) phi(zeta), overline(zeta)) dot (dif overline(zeta) and dzeta) / (zeta-z)).
  $

  By the product rule,

  $
    pdv(f(zeta) phi(zeta), overline(zeta))=pdv(phi(zeta), overline(zeta)) f(zeta),
  $

  and since $partial U subset CC without supp(phi)$, the first term vanishes, resulting in

  $
    f(z) phi(z) = -1 / taui integral_U pdv(phi(zeta), overline(zeta)) f(zeta) dot (dif overline(zeta) and dzeta) / (zeta-z).
  $

  Let $K_1$ denote $supp(pdv(phi(zeta), overline(zeta)))$, and $forall z in K$, $phi(z)=1$. Therefore,

  $
    f(z)=1 / taui integral_(K_1) f(zeta) dot pdv(phi(zeta), overline(zeta)) dot (dzeta and dif overline(zeta)) / (zeta-z).
  $

  We can differentiate within the integral as $f(zeta) dot pdv(phi(zeta), overline(zeta))$ is $C^oo$ and bounded over $K_1$, and thus the integrand is uniformly bounded by an integrable function independent of $zeta$:

  $
    f^((n)) (z)= (n!) / (2 uppi ii) integral_(K_1) f(zeta) dot pdv(phi(zeta), overline(zeta)) dot (dzeta and dif overline(zeta)) / ((zeta-z)^(n+1)),
  $

  and by the triangle inequality,

  $
    abs(f^((n)) (z)) <= (n!) / (2 uppi) integral_(K_1) abs(f(zeta)) abs(pdv(phi(zeta), overline(zeta))) abs(dzeta and dif overline(zeta)) / (abs(zeta-z)^(n+1)).
  $

  Notice that over $W$, $phi=1$, $phi'=0$, and is disjoint from $K_1$ (or that $W inter K_1 = emptyset$). Then, the distance between $W$ and $K$ is positive and the two are disjoint. Therefore, $exists M > 0$ such that

  $
    1 / (abs(zeta-z)) <= M,
  $

  and thus,

  $
    abs(pdv(phi(zeta), overline(zeta))) 1 / (abs(zeta-z)^(n+1))
  $

  can be bounded by a sequence ${c'_n}$, independent of $f$ and dependent only on $n$ and the sets $K$ and $V$. Then,

  $
    abs(f^((n)) (z)) <= (n!) / (2 uppi) integral_(K_1) c'_n abs(f(zeta)) abs(dzeta and dif overline(zeta)) = (n!) / uppi integral_(K_1) c'_n abs(f(zeta)) abs(dx and dy).
  $

  Because $K_1$ is compact, it has a finite area $op("area")(K_1)$, and we can define a new sequence $c_n=frac(n! c'_n op("area")(K_1), uppi, style: "horizontal")$ to find that

  $
    abs(f^((n)) (z)) <= c_n integral_(K_1) abs(f(zeta)) abs(dx and dy) <= c_n integral_V abs(f(zeta)) abs(dx and dy).
  $

  The problem now stands to prove that $phi(z)$ exists in the first place, which requires a topological argument to be later discussed in @thm:bump-function-existence.
]

#lbl(
  corollary[
    Let $U subset.eq CC$ be open, let $K subset U$ be compact and $V supset K$ be open such that $overline(V) subset U$. For any holomorphic function $f(z)$ in $U$, there exist constants (independent of $z$ and $f$) ${c_n}$ such that

    $
      sup_(z in K) abs(f^((n)) (z)) <= c_n sup_(z in V) abs(f(z)).
    $
  ],
  <cor:n-th-derivative-bounded-supremum>,
)

#proof[
  Starting from @eq:nth-derivative-bounded-L1-norm-statement, observe that

  $
    c_n norm(f)_(L^1(V)) <= c_n op("area")(V) sup_(z in V) abs(f(z)),
  $

  and we can define a new set of constants equal to $c_n op("area")(V)$, which are still independent of $z$.
]

For the next theorem we will briefly introduce the concept of _analytic continuation_.

#lbl(
  definition[Analytic Continuation][
    Let $U subset.eq CC$ be open, and let $f:U -> CC$ be holomorphic. Let $V subset.eq CC$ be open with $U subset.eq V$. A function
    $ F : V -> CC $
    is an _analytic continuation_ of $f$ to $V$ if:

    + $F$ is holomorphic on $V$, and
    + $F equiv f$ on $U$.
  ],
  <def:analytic-continuation>,
)

The concept of analytic continuation and its consequent problems and properties will be discussed in detail in a later chapter. For now, we will prove a theorem that is a direct consequence of the Cauchy--Goursat Differentiation Formula (@thm:cauchy-differentiation-formula) and the existence of holomorphic functions with removable singularities.

#lbl(
  theorem[Riemann][
    Let $D^*(z_0, r)=D(z_0, r) without {z_0}$ (known as a punctured disk), and $f:D^*(z_0, r) -> CC$ be holomorphic and bounded. Then $f$ can be analytically continued to $D(z_0, r)$.
  ],
  <thm:riemann-removable-singularities>,
)

#proof[
  Define the auxiliary function

  $
    phi(z) = cases(
      (z-z_0)^2 f(z) & quad "if" z in D^*(z_0, r)\,,
      0 & quad "if" z = z_0.
    )
  $

  $phi(z)$ is bounded and continuously differentiable on $D(z_0, r)$ and satisfies the Cauchy--Riemann Equations since

  $
    lim_(z -> z_0) (phi(z)-phi(z_0)) / (z-z_0) = ((z-z_0)^2 f(z)) / (z-z_0) = lim_(z -> z_0) (z-z_0) f(z)=0,
  $

  meaning that $dv(phi, z) (z_0)=0$. For $z in D^*(z_0, r)$,

  $
    phi'(z)=2 (z-z_0) f(z) + (z-z_0)^2 f'(z).
  $

  As $z -> z_0$, $phi(z) -> 0$, meaning that $phi$ is holomorphic over $D(z_0, r)$. By @thm:cauchy-differentiation-formula,

  $
    phi(z)=sum_(j = 2)^oo a_j (z-z_0)^j,
  $

  which is convergent over $D(z_0, r)$. Then we can define

  $
    tilde(f)(z)=phi(z) / ((z-z_0)^2)=sum_(j = 0)^oo a_(j+2) (z-z_0)^j
  $

  over the same disk of convergence. Over the punctured disk, $tilde(f)(z)=f(z)$, and therefore $tilde(f)$ is an analytic continuation of $f$.
]
