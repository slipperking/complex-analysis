#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [The Reflection Principle],
  route: "schwarz-reflection-principle",
)
We have previously considered analytic continuations over two regions with an intersection. Under certain conditions, analytic continuations can be derived across a curve, given by the following theorem.

#lbl(
  theorem[Painlevé][
    Let $U_1$ and $U_2$ be two disjoint simply connected open regions in $CC$ such that $partial U_1 inter partial U_2$ is a simple curve $gamma$ without its endpoints. Let $f_1:U_1 -> CC$ and $f_2:U_2 -> CC$ be two holomorphic functions that are continuous on $U_1 union gamma$ and $U_2 union gamma$, respectively, such that $f_1 equiv f_2$ on $gamma$. Then there exists a unique holomorphic function
    $
      f = cases(
        f_1 & "on" U_1,
        f_2 & "on" U_2,
        f_1 equiv f_2 & "on" gamma
      ).
    $
    on $U_1 union U_2 union gamma$.
  ],
  <thm:painleve>,
)

#figure-wrapper([
  #lbl(
    figure(
      {
        canvas({
          import cetz.draw: *
          import cetz.decorations: brace

          let var-R = 2.6

          catmull(
            (-4, -0.5),
            (-3, -3),
            (-1, -3),
            (0.6, -4),
            (1.9, -4),
            (3, -2),
            (4.3, 2),
            (-1.5, 4),
            close: true,
            stroke: 0.7pt,
            name: "union",
          )

          hide(line((-2, -4), (4, 8), name: "testline"))
          intersections("gamma-boundaries", "testline", "union")
          for-each-anchor("gamma-boundaries", name => {
            circle((), radius: 1.5pt, fill: black)
          })

          catmull("gamma-boundaries.0", (0.1, -0.6), (0.2, 0.8), "gamma-boundaries.1", name: "gamma")

          get-ctx(ctx => {
            anchor("z", (name: "gamma", anchor: 45%))
            circle("z", radius: 1.5pt, fill: black)
            circle("z", radius: var-R, stroke: (dash: "dashed"))

            let points = (
              (-0.6, -0.2),
              (-0.7, -0.4),
              (-0.4, -0.7),
              (0.1, -0.8),
              (0.1, -0.5),
              (-0.4, -0.2),
              (0.7, -0.2),
              (0.5, 0.6),
              (-0.3, 0.8),
              (0.3, 0.3),
              (-0.4, 0.3),
            ).map(point => (rel: cvector.scale(point, var-R), to: "z"))
            catmull(..points, close: true, stroke: 0.5pt, name: "Gamma", mark: (
              end: arrow-populate(16),
            ))

            intersections("Gamma-ints", "Gamma", "gamma", sort: (ctx, pts) => pts.sorted(key: p => p.at(1)))

            for-each-anchor("Gamma-ints", name => {
              circle((), radius: 1.5pt, fill: black)
            })

            let radius-indicator-loc = (
              rel: "z",
              to: cmatrix.mul4x4-vec3(cmatrix.transform-rotate-z(-30deg), (
                var-R,
                0,
              )),
            )

            brace(
              ("z", 2%, radius-indicator-loc),
              ("z", 98%, radius-indicator-loc),
              name: "var-R-brace",
              amplitude: 7pt,
              stroke: (thickness: 1pt),
              flip: true,
            )

            get-ctx(ctx => {
              let var-gamma-int-points = ctx
                .nodes
                .at("Gamma-ints")
                .at("anchors")(())
                .map(
                  anchor => cetz.coordinate.resolve-anchor(ctx, none, "Gamma-ints." + anchor),
                )

              for k in range(0, var-gamma-int-points.len()) {
                if (k + 1 < var-gamma-int-points.len()) {
                  for points in (
                    (var-gamma-int-points.at(k), var-gamma-int-points.at(k + 1)),
                    (
                      var-gamma-int-points.at(k + 1),
                      var-gamma-int-points.at(k),
                    ),
                  ) {
                    halflength-arrow(
                      ..points,
                      scalar: 0.3,
                      stroke: if calc.rem(k, 2) == 0 { (:) } else { (dash: ("dot", "dot"), thickness: 0.6pt) },
                      mark: if calc.rem(k, 2) == 0 { (end: ">>", fill: black) } else { (end: ">>", scale: 0.5) },
                    )
                  }
                }
              }
            })

            hide(line((rel: "z", to: (100, -20)), (rel: "z", to: (-100, 20)), name: "label-testline"))

            intersections("U-label-ints", "label-testline", "union")

            content("U-label-ints.0", $U_2$, anchor: "west", padding: 3pt)
            content("U-label-ints.1", $U_1$, anchor: "west", padding: 3pt)

            intersections("Gamma-label-ints", "label-testline", "Gamma")
            content("Gamma-label-ints.0", $Gamma$, anchor: "west", padding: 2pt)

            content("var-R-brace.content", $R_z$)
            content((name: "gamma", anchor: 88%), $gamma$, anchor: "south-east", padding: 2pt)
            content("z", $z$, anchor: "east", padding: 4pt)
          })
        })
      },
      caption: [The two regions $U_1$ and $U_2$ sharing a boundary curve $gamma$, the disk $D(z,R_z)$ for $z in gamma$, and the curve#footnote[Although more accurately, they are restricted to triangular paths. Our purpose here is to show that they intersect multiple times, the validity of the treatment remains the same.] $Gamma$. Solid large arrows and arrowheads denote orientation of the $tilde(Gamma)_1$ and $tilde(Gamma)_2$ regions.],
    ),
    <fig:painleve-theorem>,
  )
])

#proof[
  We aim to prove that the constructed function $f$ is holomorphic on $U_1 union U_2 union gamma$. In particular, we only need to prove that $f$ is holomorphic on (a neighborhood of) $gamma$, after which the Identity Theorem (@thm:identity) applies.

  Let $z in gamma$ be fixed, and choose $R = R_z > 0$ such that $D(z, R) subset.eq U_1 union U_2 union gamma$. Let $Gamma$ be any simple closed curve in $D(z, R)$. If $Gamma$ is fully contained in $U_1 union gamma (inter D(z, R))$, then by Cauchy--Goursat (@thm:cauchy-goursat-theorem),
  $
    integral.cont_(Gamma) f(z) dz = integral.cont_(Gamma) f_1 (z) dz = 0.
  $
  Similarly, if $Gamma$ is fully contained in $U_2 union gamma$, then
  $
    integral.cont_(Gamma) f(z) dz = integral.cont_(Gamma) f_2 (z) dz = 0.
  $
  If $Gamma$ intersects $gamma$, then we can decompose $Gamma = Gamma_1 union Gamma_2$, where $Gamma_1$ is the part of $Gamma$ that lies in $U_1 union gamma$ and $Gamma_2$ is the part of $Gamma$ that lies in $U_2 union gamma$. The set $tilde(Gamma) = gamma inter jinterior(Gamma)$ closes $Gamma_1$ and $Gamma_2$ in the sense that $tilde(Gamma)_1 = Gamma_1 union tilde(Gamma)$ and $tilde(Gamma)_2 = Gamma_2 union tilde(Gamma)$ are both simple closed curves, or unions of simple closed curves (where $tilde(Gamma)$ in each of the two curves have opposite orientations, see @fig:painleve-theorem). By Cauchy--Goursat (@thm:cauchy-goursat-theorem), we have
  $
    integral.cont.ccw_(Gamma) f(z) dz = (integral_(Gamma_1) + integral_(Gamma_2) + integral_(tilde(Gamma)) - integral_(tilde(Gamma))) f(z) dz = (integral.cont.ccw_(tilde(Gamma)_1) + integral.cont.ccw_(tilde(Gamma)_2)) f(z) dz = 0.
  $
  Hence, by Morera's Theorem (@thm:morera), $f$ is holomorphic on $union.big_(z in gamma) D(z, R_z)$, and the assertion follows.
]

A consequent result was discovered by Schwarz, known as the _reflection principle_, is a unique result derived from the above theorem for when the shared boundary curve lies in the real axis under certain conditions.

#lbl(
  theorem[Schwarz Reflection Principle][
    Let $U subset.eq CC$ be a connected region on one side of the real axis such that there exists a non-degenerate curve $gamma subset.eq partial U$ such that $gamma subset.eq RR$. Let $f:U -> CC$ be holomorphic with continuity up to $U union gamma$ such that $f$ is real-valued on $gamma$, and let $tilde(U) = { overline(z) : z in U }$ be the reflection of $U$ across the real axis. Then there exists a unique holomorphic function
    $
      tilde(f)(z) = cases(
        f(z) quad & "if" z in U,
        overline(f(overline(z))) quad & "if" z in tilde(U),
        f(z) equiv overline(f(overline(z))) quad & "if" z in gamma
      ).
    $
    on $U union tilde(U) union gamma$.
  ],
  <thm:riemann-schwarz-reflection>,
)

#proof[
  If $z in RR$, then $overline(z) = z$, and since $f$ is real on $gamma$, it follows that $f(z) = overline(f(overline(z)))$ for $z in gamma$. Thus, we are left to prove that $z |-> overline(f(overline(z)))$ is holomorphic on $tilde(U)$. Let $z_0 in tilde(U)$. It follows that
  $
    lim_(z -> z_0 \ z in tilde(U)) (overline(f(overline(z))) - overline(f(overline(z_0)))) / (z - z_0) = lim_(z -> z_0 \ z in tilde(U)) overline(((f(overline(z)) - f(overline(z_0))) / (overline(z) - overline(z_0)))) = overline(f'(overline(z_0))).
  $
  Since this limit exists, it follows that $overline(f(overline(z)))$ is holomorphic on $tilde(U)$. Assume that $z_0 in gamma$. Since
  $
    lim_(z -> z_0) overline(f(overline(z))) = overline(f(lim_(z -> z_0) overline(z))) = overline(f(z_0)) = f(z_0),
  $
  it follows that $overline(f(overline(z)))$ is continuous on $tilde(U) union gamma$. Therefore, by the Painlevé Theorem, $tilde(f)$ is holomorphic on $U union tilde(U) union gamma$.
]

This conjugate-symmetry can be generalized by transforming $gamma$:

#theorem[Symmetry Principle][
  Let $L subset CC$ be an (infinite) straight line, and let $U subset CC$ be an open region lying entirely on one side of $L$. Suppose $gamma subset.eq L$ is a non-degenerate open curve contained in $partial U$. If $f$ is holomorphic on $U$, continuous on $U union gamma$, and satisfies $f(gamma) subset.eq Gamma$, where $Gamma subset CC$ is a straight line, then there exists a unique holomorphic function $tilde(f):U union tilde(U) union gamma -> CC$ such that $tilde(f) equiv f$ on $U$, where $tilde(U)$ is the reflection of $U$ across $L$. Moreover, for any pair $z_1, z_2 in U union tilde(U) union gamma$ symmetric with respect to $L$, the values $tilde(f)(z_1)$ and $tilde(f)(z_2)$ are symmetric with respect to $Gamma$.
]

#proof[
  There exist $a, c in CC^*$ and $b, d in CC$ such that $phi.alt(z) = a z + b$ maps $L$ to $RR$ and $psi(z) = c z + d$ maps $Gamma$ to $RR$. Let $U' = phi.alt(U)$, which lies entirely on one side of the real axis, and let $gamma' = phi.alt(gamma)$, a curve on the real axis. The function $phi = psi compose f compose phi.alt^(-1)$ is holomorphic on $U'$ and continuous on $U' union gamma'$. By the Schwarz Reflection Principle (@thm:riemann-schwarz-reflection), there exists a unique holomorphic function $tilde(phi):U' union tilde(U') union gamma' -> CC$ such that $tilde(phi) equiv phi$ on $U'$, where $tilde(U')$ is the reflection of $U'$ across the real axis. Then $tilde(f) = psi^(-1) compose tilde(phi) compose phi.alt$ is a holomorphic function on $U union tilde(U) union gamma$ such that $tilde(f) equiv f$ on $U$. Since linear transformations preserves symmetry, for any pair $z_1, z_2 in U union tilde(U) union gamma$ symmetric with respect to $L$, we have $phi.alt(z_1) = overline(phi.alt(z_2))$, and thus $tilde(phi) compose phi.alt(z_1)$ and $tilde(phi) compose phi.alt(z_2)$ are symmetric with respect to $RR$. Hence, $tilde(f)(z_1)$ and $tilde(f)(z_2)$ are symmetric with respect to $psi^(-1)(RR) = Gamma$.
]
