#import "/lib.typ": *

== Laurent Series

The Laurent series generalizes the Taylor series to holomorphic functions with isolated singularities. While Taylor series are valid within a disk centered at a point of holomorphy, Laurent series apply to annular regions surrounding a singularity, making them essential for studying functions near non-removable singularities (refer to @thm:riemannremovablesingularities).

We now introduce a fundamental result in complex analysis due to Weierstrass, which formalizes the conditions under which the limit of a sequence of holomorphic functions is itself holomorphic. This theorem not only guarantees the holomorphy of the limit function but also the uniform convergence of its derivatives (its statement was used in the proof of @thm:hurwitzsimplecase).

#theorem("Weierstrass")[
  Let ${f_n (z)}_(n in NN)$ be a sequence of holomorphic functions on an open region $U subset.eq CC$ that converges uniformly to $f(z)$ on every compact subset of $U$. Then $f(z)$ is holomorphic on $U$, and $forall k in NN$, the sequence ${f_n^(k) (z)}_(n in NN)$ uniformly converges to $f^((k)) (z)$ on all compact subsets of $U$.
] <thm:weierstrassconvergence>

#proof[
  By Morera's Theorem (@thm:morera) and the uniform convergence of ${f_n (z)}$, the holomorphy of $f(z)$ follows (refer to @eq:hurwitzsimplecase_integrallimitswitchforholomorphy and preceding explanations).

  Following the same logic, by @cor:nthderivativeboundedsupremum, $forall k in NN$ and for all compact $K subset U$ and open $V supset K$ relatively compact in $U$ there exists a finite constant $c_k > 0$ such that
  $
    lim_(n -> oo) sup_(z in K) abs(f_n^((k)) (z) - f^((k)) (z)) <= c_k lim_(n -> oo) sup_(z in V) abs(f_n (z) - f(z)).
  $
  Since ${f_n (z)}$ is uniformly convergent, the limit on the right-hand side vanishes. Then,
  $
    lim_(n -> oo) sup_(z in K) abs(f_n^((k)) (z) - f^((k)) (z)) = 0,
  $
  and therefore ${f_n^((k)) (z)}_(n in NN)$ uniformly converges on all compact subsets of $U$.
]

The condition of uniform convergence on every compact subset can also be significantly loosened, by the fact demonstrated below:

#proposition[
  Let $U subset.eq CC$ be an open bounded region, and let ${f_n (z)}$ be holomorphic on $U$. Let $K subset U$ be compact. If $f_n (z) arrows.rr f(z)$ on $partial K$, then $f_n (z) arrows.rr f(z)$ on $K$.
]

#proof[
  By the converse statement of the Cauchy Criterion (@thm:cauchycriterionuniformconvergence), $forall epsilon > 0$, $exists N in NN$ such that $forall n, m > N$,
  $
    sup_(z in partial K) abs(f_n (z) - f_m (z)) < epsilon.
  $

  By the Maximum Modulus Principle (@thm:maximummodulus) on $f_n - f_m$,
  $
    sup_(z in partial K) abs(f_n (z) - f_m (z)) = sup_(z in K) abs(f_n (z) - f_m (z)) < epsilon.
  $

  It follows that $f_n (z) arrows.rr f(z)$ on $K$ by @thm:cauchycriterionuniformconvergence.
]

#remark[
  From the above result, the uniform convergence on every compact subset in @thm:weierstrassconvergence can therefore be loosened to the uniform convergence on every simple closed curve.
]

We will now study Laurent series. Let $a in CC$ and ${c_n}_(n in ZZ) subset CC$ be constants. A series in the form of
$
  f(z) = sum_(n = -oo)^oo c_n (z - a)^n
$ <eq:laurentseries>
is a Laurent series at the point $a$. The series can be separated into a power series with non-negative exponents,
$
  phi(z) = sum_(n = 0)^oo c_n (z - a)^n,
$ <eq:laurentseriesnonnegativeexponents>
and a power series with negative exponents,
$
  psi(z) = sum_(n = 1)^oo c_(-n) (z - a)^(-n).
$ <eq:laurentseriesnegativeexponents>
@eq:laurentseries is said to be convergent at $z = z_0$ if the two power series are both convergent. Let the convergence radius of @eq:laurentseriesnonnegativeexponents be
$
  R = 1 / limsup_(n -> oo) root(n, abs(c_n))
$
by the Cauchy--Hadamard Theorem (@thm:cauchyhadamard). It follows that $phi$ is holomorphic on $D(a, R)$. Let $zeta = (z - a)^(-1)$. Then @eq:laurentseriesnegativeexponents becomes
$
  sum_(n = 1)^oo c_(-n) zeta^n.
$
This series converges when
$
  abs(zeta) < 1 / limsup_(n -> oo) root(n, abs(c_(-n))) = lambda.
$
Let $r = 1 / lambda$. Then $psi(z)$ converges when
$
  abs(z - a) > limsup_(n -> oo) root(n, abs(c_(-n))),
$
or when $z in CC without overline(D(a, r))$.

If $R > r$, then $f$ is convergent on the annulus $D(a, R) without overline(D(a, r))$ and divergent on $(CC without overline(D(a, R))) union D(a, r)$. If $r = R$, the series diverges possibly everywhere but on $partial D(a, r)$. Similar to power series with positive exponents, the convergence on the boundary varies. For example,
$
  sum_(n = -oo \ n != 0)^oo z^n / n^2,
$
where $R = r = 1$, converges (absolutely) on $partial DD$, whereas
$
  sum_(n = -oo)^oo z^n
$
diverges on all of $partial DD$, while
$
  sum_(n = -oo \ n != 0)^oo z^n / n
$
converges (conditionally) on all of $partial DD without {1}$ and diverges at $z = 1$. If $r > R$, then the series is divergent on all of $CC$. The region $D(a, R) without overline(D(a, r))$ is known as the _annulus of convergence_. $f(z)$ in @eq:laurentseries is holomorphic over this annulus. The series $phi(z)$ is known as the _holomorphic part_ of $f(z)$, and $psi(z)$ is known as the _principal part_ of the Laurent series. The properties of the convergence disk in Abel's Theorem (@thm:abelradius) can be generalized to Laurent series. In other words, $f$ is absolutely convergent on the annulus and is uniformly convergent on every compact subset of it.

#theorem[
  Let $V = {z in CC : r < abs(z - a) < R}$ for some $0 <= r < R <= oo$. Let $f$ be holomorphic on $V$. Then $f$ has the unique _Laurent expansion_
  $
    f(z) = sum_(n = -oo)^oo c_n (z - a)^n, quad c_n = 1 / (2 uppi ii) integral.cont_gamma (f(zeta) dzeta) / ((zeta - a)^(n + 1)), quad z in V,
  $ <eq:laurentexpansionofholomorphicfunction_statement>
  for any simple closed curve $gamma subset V$ enclosing $a$. Moreover, the series converges absolutely on $V$ and uniformly on all compact subsets of $V$.
] <thm:laurentexpansionofholomorphicfunction>

#figure-wrapper([
  #figure(
    [
      #cetz.canvas({
        import cetz.draw: *
        import cetz.decorations: brace

        let center = (0, 0)
        let var-R = 2.8
        let var-Rp = 2.64
        let var-r = 1.6
        let var-rp = 1.76

        let label_angle_R = 30deg
        let label_angle_Rp = -30deg
        let label_angle_r = 90deg
        let label_angle_rp = -135deg

        circle(center, radius: var-R, stroke: 1pt)
        circle(center, radius: var-Rp, stroke: (dash: "dashed"))
        circle(center, radius: var-r, stroke: 1pt)
        circle(center, radius: var-rp, stroke: (dash: "dashed"))

        catmull(
          (-2.4, -0.24),
          (-1.84, -1.68),
          (-0.96, -1.68),
          (0.16, -1.92),
          (0.96, -2.0),
          (1.84, -1.2),
          (1.92, 0.96),
          (-0.56, 2.16),
          close: true,
          stroke: 0.7pt,
        )

        brace(center, (var-R * calc.cos(label_angle_R), var-R * calc.sin(label_angle_R)), name: "label_R")
        brace(center, (var-Rp * calc.cos(label_angle_Rp), var-Rp * calc.sin(label_angle_Rp)), name: "label_Rp")
        brace(center, (var-r * calc.cos(label_angle_r), var-r * calc.sin(label_angle_r)), name: "label_r")
        brace(center, (var-rp * calc.cos(label_angle_rp), var-rp * calc.sin(label_angle_rp)), name: "label_rp")

        content("label_R.content", [#math-rect($R$)], anchor: "center")
        content("label_r.content", [#math-rect($r$)], anchor: "center")
        content("label_rp.content", [#math-rect($r'$)], anchor: "center")
        content("label_Rp.content", [#math-rect($R'$)], anchor: "center")
        content(center, math-rect($a$), anchor: "center")
        content((-0.8, -1.76), [$gamma$], anchor: "north")
      })
    ],
    caption: [The annulus $V$, with $gamma_1$, $gamma_2$, and $gamma$.],
  ) <fig:laurentexpansionofholomorphicfunction>
])

#proof[
  By the openness of $V$, there exist two circles $gamma_1 subset V$ with radius $r'$ and $gamma_2 subset V$ with radius $R'$ centered at $a$ such that $gamma$ encloses $gamma_1$ and $gamma_2$ encloses $gamma$ both without intersection. Let $W = {z in V : r' < abs(z - a) < R'}$ and let $z in W$ be arbitrary. By the Cauchy--Goursat Formula (@thm:cauchygoursatformula),
  $
    f(z) = 1 / (taui) (integral.cont_(gamma_2) (f(zeta)) / (zeta - z) dzeta - integral.cont_(gamma_1) (f(zeta)) / (zeta - z) dzeta).
  $

  For all $zeta in gamma_1$ (or $abs(zeta - a) = r'$), $abs(zeta - a) < abs(z - a)$ and therefore, $(abs(zeta - a)) / (abs(z - a)) < 1$. It follows that
  $
    1 / (zeta - z) = -1 / ((z - a) (1 - (zeta - a) / (z - a))) = -sum_(n = 0)^oo (zeta - a)^n / (z - a)^(n + 1)
  $ <eq:laurentexpansionofholomorphicfunction_kernelexpansioninside>
  is uniformly convergent with respect to $zeta$. Similarly, for all $zeta in gamma_2$,
  $ abs(zeta - a) > abs(z - a) <==> (abs(z - a)) / (abs(zeta - a)) < 1, $
  and it follows that
  $
    1 / (zeta - z) = 1 / ((zeta - a) (1 - (z - a) / (zeta - a))) = sum_(n = 0)^oo (z - a)^n / (zeta - a)^(n + 1)
  $ <eq:laurentexpansionofholomorphicfunction_kernelexpansionoutside>
  is uniformly convergent with respect to $zeta$. By the boundedness of $f$ on $gamma_1$ and $gamma_2$ from holomorphy on a compact set, the uniform convergence from the Weierstrass $M$-Test (@thm:weierstrassmtest), gives that
  $
    f(z) = 1 / (taui) (sum_(n = 0)^oo integral.cont_(gamma_2) ((z - a)^n) / ((zeta - a)^(n + 1)) f(zeta) dzeta + sum_(n = 1)^oo integral.cont_(gamma_1) ((zeta - a)^(n - 1)) / ((z - a)^n) f(zeta) dzeta).
  $ <eq:laurentexpansionofholomorphicfunction_finalstep>

  By the Cauchy--Goursat Theorem (@thm:cauchygoursattheorem), for a given $n$,
  $
    integral_(gamma_2^+ union gamma^-) (f(zeta) dzeta) / ((zeta - a)^n) = 0 quad "and" quad integral_(gamma^+ union gamma_1^-) f(zeta) (zeta - a)^n dzeta = 0.
  $
  In other words, the integrals in @eq:laurentexpansionofholomorphicfunction_finalstep are the same as on $gamma$. Hence, we obtain the absolutely convergent expansion
  $
    f(z) = sum_(n = 0)^oo c_n (z - a)^n + sum_(n = 1)^oo c_(-n) (z - a)^(-n) = sum_(n = -oo)^oo c_n (z - a)^n
  $
  which converges uniformly on compact sets of $V$. The constants ${c_n}_(n in ZZ)$ are also unique in the expansion. For the sake of contradiction, assume there exists another set of constants ${c'_n}_(n in ZZ)$ such that
  $
    f(z) = sum_(n = -oo)^oo c'_n (z - a)^n,
  $ <eq:laurentexpansionofholomorphicfunction_uniquenessstatement>
  where $z in V$ and the series is uniformly convergent on $gamma$. Let $m in ZZ$ be arbitrary. By Cauchy--Goursat (@thm:cauchydifferentiationformula),
  $
    integral.cont_gamma (z - a)^k dz =
    cases(
      0 & "if" k >= 0,
      taui dv(1, z, -k - 1) & "if" k <= -1,
    )
    =
    cases(
      0 & "if" k != -1,
      taui & "if" k = -1.
    )
  $
  Multiplying @eq:laurentexpansionofholomorphicfunction_uniquenessstatement by $(z - a)^(-m - 1)$ and from integrating over $gamma$, we get that
  $
    integral.cont_gamma (f(z) dz) / ((z - a)^(m + 1)) = integral.cont_gamma sum_(n = -oo)^oo c'_n (z - a)^(n - m - 1) dz,
  $
  implying that
  $
    taui c_m = sum_(n = -oo)^oo c'_n integral.cont_gamma (z - a)^(n - m - 1) dz = taui c'_m,
  $
  which is a contradiction, implying uniqueness.
]

#remark[
  Unlike Taylor series, Laurent series are not necessarily unique up to the point of expansion. Depending on the chosen annulus, the expansion may differ.
]
