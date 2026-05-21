#import "/lib.typ": *

=== Weierstrass Elliptic Functions

Since any (non-constant) elliptic function has order greater than one, it is natural to next consider elliptic functions of order two.

Within a fundamental parallelogram, by @thm:ellipticfunctionnumberofzerosandpoles, such a function either has two simple poles or a single double pole. This distinction is the key difference between the Weierstrass theory of elliptic functions (the former case) and the Jacobi theory (the latter case).

In practice, elliptic functions derived from the Jacobi formulation often have more practical use cases, whereas the Weierstrass theory tends to be more convenient in theoretical analysis.

#proposition[
  Let $omega_1$, $omega_2$ be a fundamental pair of periods generating the lattice $Lambda$. Then the series
  $
    sum_(omega in Lambda without {0}) 1 / abs(omega)^alpha
  $ <eq:weierstrasspfunctionintermediateseriesconvergence_statement>
  is (absolutely) convergent for $alpha > 2$.
] <prop:weierstrasspfunctionintermediateseriesconvergence>

#proof[
  #figure(
    box(
      inset: 1em,
      stroke: 0.6pt,
      radius: 4pt,
      width: 100%,
      [Illustration placeholder for the parallelogram $P_1$ with 8 periods on its boundary with lattice $Lambda$. Raw TikZ source is preserved below for manual conversion.],
    ),
    caption: [The parallelogram $P_1$ with 8 periods on its boundary with lattice $Lambda$.],
  ) <fig:weierstrasspfunctionintermediateseriesconvergence_parallelogram>

  /*
  \begin{figure}
      \centering
      \begin{tikzpicture}
          \pgfmathsetmacro{\n}{4}
          \pgfmathsetmacro{\ax}{1.5}
          \pgfmathsetmacro{\ay}{0.3}
          \pgfmathsetmacro{\bx}{0.5}
          \pgfmathsetmacro{\by}{1.0}
          \pgfmathsetmacro{\over}{0.3}
          \foreach \j in {0,...,\n} {
                  \draw[thin]
                  ({-\over*\ax+\j*\bx},{-\over*\ay+\j*\by})
                  -- ({(\n+\over)*\ax+\j*\bx},{(\n+\over)*\ay+\j*\by});
              }
          \foreach \i in {0,...,\n} {
                  \draw[thin]
                  ({-\over*\bx+\i*\ax},{-\over*\by+\i*\ay}) -- ({\i*\ax+(\n+\over)*\bx},{\i*\ay+(\n+\over)*\by});
              }
          \foreach \i in {-1,1} {
                  \draw[thick] ({\ax*(\n/2+\i)+\bx*(\n/2-1)},{\ay*(\n/2+\i)+\by*(\n/2-1)}) -- ({\ax*(\n/2+\i)+\bx*(\n/2+1)},{\ay*(\n/2+\i)+\by*(\n/2+1)});
                  \draw[thick] ({\ax*(\n/2-1)+\bx*(\n/2+\i)},{\ay*(\n/2-1)+\by*(\n/2+\i)}) -- ({\ax*(\n/2+1)+\bx*(\n/2+\i)},{\ay*(\n/2+1)+\by*(\n/2+\i)});
              }
          \node[shift={(5pt,-5pt)}] at ({\ax*(\n/2)+\bx*(\n/2)},{\ay*(\n/2)+\by*(\n/2)}) {\(0\)};
          \node[shift={(5pt,-5pt)}] at ({\ax*(\n/2+1)+\bx*(\n/2)},{\ay*(\n/2+1)+\by*(\n/2)}) {\(\omega_1\)};
          \node[shift={(9pt,-5pt)}] at ({\ax*(\n/2-1)+\bx*(\n/2)},{\ay*(\n/2-1)+\by*(\n/2)}) {\(-\omega_1\)};
          \node[shift={(5pt,-5pt)}] at ({\ax*(\n/2)+\bx*(\n/2+1)},{\ay*(\n/2)+\by*(\n/2+1)}) {\(\omega_2\)};
          \node[shift={(9pt,-5pt)}] at ({\ax*(\n/2)+\bx*(\n/2-1)},{\ay*(\n/2)+\by*(\n/2-1)}) {\(-\omega_2\)};
          \node[shift={(16pt,-5pt)}] at ({\ax*(\n/2+1)+\bx*(\n/2+1)},{\ay*(\n/2+1)+\by*(\n/2+1)}) {\(\omega_1+\omega_2\)};
          \node[shift={(16pt,-5pt)}] at ({\ax*(\n/2-1)+\bx*(\n/2-1)},{\ay*(\n/2-1)+\by*(\n/2-1)}) {\(-\omega_1-\omega_2\)};
          \node[shift={(16pt,-5pt)}] at ({\ax*(\n/2-1)+\bx*(\n/2+1)},{\ay*(\n/2-1)+\by*(\n/2+1)}) {\(\omega_2-\omega_1\)};
          \node[shift={(16pt,-5pt)}] at ({\ax*(\n/2+1)+\bx*(\n/2-1)},{\ay*(\n/2+1)+\by*(\n/2-1)}) {\(\omega_1-\omega_2\)};
          \coordinate (O) at ({\ax*(\n/2)+\bx*(\n/2)},{\ay*(\n/2)+\by*(\n/2)});

          \pgfmathsetmacro{\lengtha}{sqrt(\ax*\ax+\ay*\ay)}
          \pgfmathsetmacro{\lengthb}{sqrt(\bx*\bx+\by*\by)}
          \pgfmathsetmacro{\sineanglebetween}{sqrt(1-((\ax*\bx+\ay*\by)/(\lengtha*\lengthb))^2)}
          \coordinate (H) at ([shift={(\ay*\lengthb*\sineanglebetween/\lengtha,-\ax*\lengthb*\sineanglebetween/\lengtha)}] O);
          \draw[dotted, thick] (O) -- (H);
          \node[xshift=-4, yshift=-2] at ($(O)!0.5!(H)$) {\(\delta\)};
      \end{tikzpicture}
      \caption{The parallelogram \(P_1\) with 8 periods on its boundary with lattice \(\Lambda\).}\label{fig:weierstrasspfunctionintermediateseriesconvergence_parallelogram}
  \end{figure}
  */

  Let $P_n$ be a parallelogram whose center is $0$ and has $n(omega_1 + omega_2)$ as a vertex (the specific case of $n = 1$ is illustrated in @fig:weierstrasspfunctionintermediateseriesconvergence_parallelogram). For each $n in NN$, there exist $8 n$ periods (points in $Lambda$) on $partial P_n$.

  Let $delta$ be the distance from $0$ to $partial P_1$. Hence, the distance from $0$ to $partial P_n$ is $n delta$. Since each $omega in Lambda^* = Lambda without {0}$ lies in a unique $partial P_n$, it follows that $abs(omega)^alpha gt.eq n^alpha delta^alpha$ for all $alpha > 0$. Hence,
  $
    sum_(omega in Lambda^*) 1 / abs(omega)^alpha <= sum_(n=1)^oo (8 n) / (n^alpha delta^alpha) = 8 / delta^alpha sum_(n=1)^oo 1 / n^(alpha - 1),
  $
  which is a $p$-series that converges for $alpha > 2$.
]

#proposition[
  Let $omega_1$, $omega_2$ be a fundamental pair of periods generating the lattice $Lambda$. Then the series
  $
    sum_(omega in Lambda without {0}) [1 / (z - omega)^2 - 1 / omega^2]
  $ <eq:weierstrasspfunctionconvergence_statement>
  locally uniformly converges on $CC without Lambda$.
] <prop:weierstrasspfunctionconvergence>

#proof[
  Let $R > 0$ be arbitrary. Then $forall z in D(0, R)$, and for $abs(omega) > 2 R$, we have
  $
    abs(z) / abs(omega) < 1 / 2, quad abs(2 - z / omega) <= 2 + abs(z) / abs(omega) < 5 / 2, quad abs(1 - z / omega)^2 gt.eq (1 - abs(z / omega))^2 > 1 / 4.
  $
  It follows that
  $
    abs(1 / (z - omega)^2 - 1 / omega^2) = abs((2 omega z - z^2) / (omega^2 (z - omega)^2)) = abs((z (2 - z / omega)) / (omega^3 (z / omega - 1)^2)) < abs((5 / 2 z) / (1 / 4 omega^3)) <= (10 R) / abs(omega)^3.
  $
  Hence, by @prop:weierstrasspfunctionintermediateseriesconvergence,
  $
    sum_(omega in Lambda \ omega in.not overline(D(0, 2 R))) [1 / (z - omega)^2 - 1 / omega^2]
  $ <eq:weierstrasspfunctionconvergence_intermediateseries>
  is termwise bounded by a series $sum_(omega in Lambda, omega in.not overline(D(0, 2 R))) 10 R / omega^3$, which is convergent by @prop:weierstrasspfunctionintermediateseriesconvergence. Weierstrass $M$--Test (@thm:weierstrassmtest) gives the uniform convergence of @eq:weierstrasspfunctionconvergence_intermediateseries on $D(0, R)$. Since we have omitted only finitely many terms, @eq:weierstrasspfunctionintermediateseriesconvergence_statement converges uniformly on $D(0, R) without Lambda$.

  Let $K subset CC without Lambda$ be compact and arbitrary. By boundedness, $exists R > 0$ such that $K subset D(0, R) without Lambda$, on which it uniformly converges.
]

#definition[Weierstrass $wp$-Function][
  Let $omega_1$, $omega_2$ be a fundamental pair of periods generating the lattice $Lambda$. The Weierstrass $wp$-function with period lattice $Lambda$ is defined by
  $
    wp(z) = 1 / z^2 + sum_(omega in Lambda without {0}) [1 / (z - omega)^2 - 1 / omega^2], quad z in CC without Lambda.
  $ <eq:weierstrasspfunction>
] <def:weierstrasspfunction>

By @prop:weierstrasspfunctionconvergence, @ thm:weierstrassconvergence, $wp$ is well-defined and meromorphic on $CC$. By @ thm:weierstrassconvergence, we can use termwise differentiation to get
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
By evenness of $wp$, we must have $c_1 = c_2 = 0$. Therefore, $wp$ is also an elliptic function with period lattice $Lambda$. Moreover, each isolated singularity $omega in Lambda$ is a pole of order two with residue $0$ (by @prop:ellipticfunctionresiduesum). The quotient group $CC \/ Lambda$, may be represented by a fundamental parallelogram $P$ of $Lambda$ with vertices at $0$, $omega_1$, $omega_2$, and $omega_1 + omega_2$, which by identification, are homeomorphic to a single point on the torus.

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
  which for $abs(omega) > 2 R$ (which comprises all $omega$ except for finitely many) is bounded by $sum_(omega in Lambda, abs(omega) > 2 R) 10 R / abs(omega)^3$ (estimates derived in the proof of @prop:weierstrasspfunctionconvergence), which is convergent by @prop:weierstrasspfunctionintermediateseriesconvergence. Hence, the series converges absolutely for $abs(z) < R$ and the summation exchange is valid. By the symmetry of the period lattice, it is trivial that $c_(2 m + 1) = 0$ for all $m in NN$. Hence, the assertion follows.
]

Termwise differentiation (provided by @ thm:weierstrassconvergence) now gives
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
