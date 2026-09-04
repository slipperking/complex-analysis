#import "/lib.typ": *
#show: docs-subsubchapter.with(
  title: [Weierstrass Elliptic Functions],
  route: "weierstrass-elliptic-functions",
)
Since any (non-constant) elliptic function has order greater than one, it is natural to next consider elliptic functions of order two.

Within a fundamental parallelogram, by @thm:elliptic_function-number-of-zeros-and-poles, such a function either has two simple poles or a single double pole. This distinction is the key difference between the Weierstrass theory of elliptic functions (the former case) and the Jacobi theory (the latter case).

In practice, elliptic functions derived from the Jacobi formulation often have more practical use cases, whereas the Weierstrass theory tends to be more convenient in theoretical analysis.

#lbl(
  proposition[
    Let $omega_1$, $omega_2$ be a fundamental pair of periods generating the lattice $Lambda$. Then the series
    #lbl(
      $
        sum_(omega in Lambda without {0}) 1 / abs(omega)^alpha
      $,
      <eq:weierstrass-p-function-intermediate-series-convergence-statement>,
    )
    is (absolutely) convergent for $alpha > 2$.
  ],
  <prop:weierstrass-p-function-intermediate-series-convergence>,
)
#figure-wrapper(
  lbl(
    figure(
      {
        canvas({
          import cetz.draw: *

          let n = 4
          let ax = 1.5
          let ay = 0.3
          let bx = 0.5
          let by = 1.0
          let ov = 0.3

          let lp = (i, j) => (i * ax + j * bx, i * ay + j * by)

          for j in range(0, n + 1) {
            line(
              (-ov * ax + j * bx, -ov * ay + j * by),
              ((n + ov) * ax + j * bx, (n + ov) * ay + j * by),
              stroke: 0.4pt,
            )
          }
          for i in range(0, n + 1) {
            line(
              (i * ax - ov * bx, i * ay - ov * by),
              (i * ax + (n + ov) * bx, i * ay + (n + ov) * by),
              stroke: 0.4pt,
            )
          }

          let h = n / 2
          for i in (-1, 1) {
            line(lp(h + i, h - 1), lp(h + i, h + 1), stroke: 1.5pt)
            line(lp(h - 1, h + i), lp(h + 1, h + i), stroke: 1.5pt)
          }

          content(lp(h, h), math-rect($0$), anchor: "south-east", padding: 2pt)
          content(lp(h + 1, h), math-rect($omega_1$), anchor: "north-west")
          content(lp(h - 1, h), math-rect($-omega_1$), anchor: "south-east")
          content(lp(h, h + 1), math-rect($omega_2$), anchor: "north-west")
          content(lp(h, h - 1), math-rect($-omega_2$), anchor: "north", padding: 2pt)
          content(lp(h + 1, h + 1), math-rect($omega_1 + omega_2$), anchor: "south-west")
          content(lp(h - 1, h - 1), math-rect($-omega_1 - omega_2$), anchor: "north-east", padding: 2pt)
          content(lp(h - 1, h + 1), math-rect($omega_2 - omega_1$), anchor: "east", padding: 2pt)
          content(lp(h + 1, h - 1), math-rect($omega_1 - omega_2$), anchor: "north-west", padding: 2pt)

          anchor("O", lp(h, h))
          anchor("O-b", lp(h, h - 1))
          anchor("O-b+a", lp(h + 1, h - 1))

          line(
            "O",
            ("O", "_|_", "O-b", "O-b+a"),
            name: "dl",
            stroke: (paint: black, dash: "dotted", thickness: 1.5pt),
          )

          content("dl.mid", math-rect($delta$), anchor: "east", padding: 2pt)
        })
      },
      caption: [The parallelogram $P_1$ with 8 periods on its boundary with lattice $Lambda$.],
    ),
    <fig:weierstrass-p-function-intermediate-series-convergence-parallelogram>,
  ),
)
#proof[
  Let $P_n$ be a parallelogram whose center is $0$ and has $n(omega_1 + omega_2)$ as a vertex (the specific case of $n = 1$ is illustrated in @fig:weierstrass-p-function-intermediate-series-convergence-parallelogram). For each $n in NN$, there exist $8 n$ periods (points in $Lambda$) on $partial P_n$.

  Let $delta$ be the distance from $0$ to $partial P_1$. Hence, the distance from $0$ to $partial P_n$ is $n delta$. Since each $omega in Lambda^* = Lambda without {0}$ lies in a unique $partial P_n$, it follows that $abs(omega)^alpha >= n^alpha delta^alpha$ for all $alpha > 0$. Hence,
  $
    sum_(omega in Lambda^*) 1 / abs(omega)^alpha <= sum_(n=1)^oo (8 n) / (n^alpha delta^alpha) = 8 / delta^alpha sum_(n=1)^oo 1 / n^(alpha - 1),
  $
  which is a $p$-series that converges for $alpha > 2$.
]

#lbl(
  proposition[
    Let $omega_1$, $omega_2$ be a fundamental pair of periods generating the lattice $Lambda$. Then the series
    #lbl(
      $
        sum_(omega in Lambda without {0}) [1 / (z - omega)^2 - 1 / omega^2]
      $,
      <eq:weierstrass-p-function-convergence-statement>,
    )
    locally uniformly converges on $CC without Lambda$.
  ],
  <prop:weierstrass-p-function-convergence>,
)

#proof[
  Let $R > 0$ be arbitrary. Then $forall z in D(0, R)$, and for $abs(omega) > 2 R$, we have
  $
    abs(z) / abs(omega) < 1 / 2, quad abs(2 - z / omega) <= 2 + abs(z) / abs(omega) < 5 / 2, quad abs(1 - z / omega)^2 >= (1 - abs(z / omega))^2 > 1 / 4.
  $
  It follows that
  $
    abs(1 / (z - omega)^2 - 1 / omega^2) = abs((2 omega z - z^2) / (omega^2 (z - omega)^2)) = abs((z (2 - z / omega)) / (omega^3 (z / omega - 1)^2)) < abs((5 / 2 z) / (1 / 4 omega^3)) <= (10 R) / abs(omega)^3.
  $
  Hence, by @prop:weierstrass-p-function-intermediate-series-convergence,
  #lbl(
    $
      sum_(omega in Lambda \ omega in.not overline(D(0, 2 R))) [1 / (z - omega)^2 - 1 / omega^2]
    $,
    <eq:weierstrass-p-function-convergence-intermediate-series>,
  )
  is termwise bounded by a series $sum_(omega in Lambda, omega in.not overline(D(0, 2 R))) (10 R) / omega^3$, which is convergent by @prop:weierstrass-p-function-intermediate-series-convergence. Weierstrass $M$--Test (@thm:weierstrass-m-test) gives the uniform convergence of @eq:weierstrass-p-function-convergence-intermediate-series on $D(0, R)$. Since we have omitted only finitely many terms, @eq:weierstrass-p-function-intermediate-series-convergence-statement converges uniformly on $D(0, R) without Lambda$.

  Let $K subset CC without Lambda$ be compact and arbitrary. By boundedness, $exists R > 0$ such that $K subset D(0, R) without Lambda$, on which it uniformly converges.
]

#lbl(
  definition[Weierstrass $wp$-Function][
    Let $omega_1$, $omega_2$ be a fundamental pair of periods generating the lattice $Lambda$. The Weierstrass $wp$-function with period lattice $Lambda$ is defined by
    #lbl(
      $
        wp(z) = 1 / z^2 + sum_(omega in Lambda without {0}) [1 / (z - omega)^2 - 1 / omega^2], quad z in CC without Lambda.
      $,
      <eq:weierstrass-p-function>,
    )
  ],
  <def:weierstrass-p-function>,
)
Note that it is not immediately apparent that $wp$ is periodic. If we add some $omega in Lambda$ to $z$, we do indeed see a summation in which each individual term does reoccur. Although without absolute convergence of the summation in which $1 / (z - omega)^2$ and $1 / omega^2$ are considered as separate terms, such a conclusion cannot be made. Instead, we proceed with differentiation.

By @prop:weierstrass-p-function-convergence, @thm:weierstrass-convergence, $wp$ is well-defined and meromorphic on $CC$. By @thm:weierstrass-convergence, we can use termwise differentiation to get
$
  wp'(z) = -2 / z^3 - sum_(omega in Lambda without {0}) 2 / (z - omega)^3 = -2 sum_(omega in Lambda) 1 / (z - omega)^3,
$
which is absolutely convergent for $z in.not Lambda$. It follows that $wp'$ is also meromorphic on $CC$. Hence, the series expression for $wp'(z)$ may be rearranged to $wp'(z + omega_1)$, and hence,
$
  wp'(z) = wp'(z + omega_1) = wp'(z + omega_2).
$
Hence, $wp'$ is also an elliptic function with period lattice $Lambda$. Hence, we must have
$
  wp(z) + c_1 = wp(z + omega_1), quad wp(z) + c_2 = wp(z + omega_2).
$
At $z = -(omega_1) / 2, -(omega_2) / 2$, we have
$
  wp(-(omega_1) / 2) + c_1 = wp(omega_1 / 2), quad wp(-(omega_2) / 2) + c_2 = wp(omega_2 / 2)
$
By evenness of $wp$, we must have $c_1 = c_2 = 0$. Therefore, $wp$ is also an elliptic function with period lattice $Lambda$. Moreover, each isolated singularity $omega in Lambda$ is a pole of order two with residue $0$ (by @prop:elliptic-function-residue-sum). The quotient group $CC \/ Lambda$, may be represented by a fundamental parallelogram $P$ of $Lambda$ with vertices at $0$, $omega_1$, $omega_2$, and $omega_1 + omega_2$, which by identification, are homeomorphic to a single point on the torus.

#proposition[
  At $z = 0$, $wp$ has a double pole with Laurent expansion
  $
    1 / z^2 + sum_(n=1)^oo c_(2 n) z^(2 n), quad c_(2 n) = sum_(omega in Lambda^*) (2 n + 1) / omega^(2 n + 2)
  $
  whose convergence annulus centered at $0$ has an outer radius equal to the distance from $0$ to the nearest period in $Lambda^*$.
]

#proof[
  Observe that for $abs(z) < R = min_(omega in Lambda^*) abs(omega)$, $omega in Lambda^*$,
  $
    1 / (omega - z) = ((1) / omega) / (1 - z / omega) = 1 / omega sum_(n=0)^oo (z / omega)^n ==> 1 / (z - omega)^2 = 1 / omega^2 [sum_(n=0)^oo (z / omega)^n]^2.
  $
  Therefore,
  $
    wp(z) & = 1 / z^2 + sum_(omega in Lambda^*) [1 / (z - omega)^2 - 1 / omega^2] = 1 / z^2 + sum_(omega in Lambda^*) [1 / omega^2 (sum_(m=0)^oo (z / omega)^m)^2 - 1 / omega^2] \
    & = 1 / z^2 + sum_(omega in Lambda^*) 1 / omega^2 [sum_(m=0)^oo (m + 1) (z / omega)^m - 1] = 1 / z^2 + sum_(omega in Lambda^*) sum_(m=1)^oo (m + 1) / omega^(m + 2) z^m \
    & = 1 / z^2 + sum_(m=1)^oo (sum_(omega in Lambda^*) (m + 1) / omega^(m + 2)) z^m = 1 / z^2 + sum_(m=1)^oo c_m z^m,
  $
  where $c_m = sum_(omega in Lambda^*) (m + 1) / omega^(m + 2)$. Indeed, since
  $
    abs(sum_(omega in Lambda^*) sum_(m=1)^oo (m + 1) / omega^(m + 2) z^m) <= sum_(omega in Lambda^*) (2 abs(z omega) - abs(z)^2) / ((abs(omega) - abs(z))^2 abs(omega)^2) = sum_(omega in Lambda^*) (abs(z) (2 - abs(z / omega))) / (abs(omega)^3 (abs(z / omega) - 1)^2),
  $
  which for $abs(omega) > 2 R$ (which comprises all $omega$ except for finitely many) is bounded by $sum_(omega in Lambda, abs(omega) > 2 R) (10 R) / abs(omega)^3$ (estimates derived in the proof of @prop:weierstrass-p-function-convergence), which is convergent by @prop:weierstrass-p-function-intermediate-series-convergence. Hence, the series converges absolutely for $abs(z) < R$ and the summation exchange (and the Cauchy product) is valid. By the symmetry of the period lattice, it is trivial that $c_(2 m + 1) = 0$ for all $m in NN$. Hence, the assertion follows.
]

Termwise differentiation (provided by @thm:weierstrass-convergence) now gives
$
  wp'(z) = -2 / z^3 + sum_(n=1)^oo 2 n c_(2 n) z^(2 n - 1).
$
Letting
$
  b_m = sum_(omega in Lambda^*) 1 / omega^m,
$
we have
$
  wp(z) = 1 / z^2 + 3 b_4 z^2 + 5 b_6 z^4 + 7 b_8 z^6 + dots, \ wp'(z) = -2 / z^3 + 6 b_4 z + 20 b_6 z^3 + 42 b_8 z^5 + dots.
$

#definition[Weierstrass $zeta$-Function][

]

#definition[Weierstrass $sigma$-Function][

]
