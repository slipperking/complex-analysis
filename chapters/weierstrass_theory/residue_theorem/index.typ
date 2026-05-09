#import "/lib.typ": *
== The Residue Theorem <sec:cauchyresiduetheorem>

After Riemann and Weierstrass refined the understanding of analytic functions and the formal characterization of Jordan curves, the Cauchy Residue Theorem was consequently formalized. Cauchy had the informal notion of a residue, which we will now formally introduce.

#definition("Residue")[
  For some $r in RR_(>0)$, $a in U$, suppose $f : D^*(a, r) -> CC$ is holomorphic. Then the _residue_ of $f$ at $a$, denoted by $Res_(z=a) f(z)$ or $Res(f, a)$, is equal to
  $
    Res_(z=a) f(z) = 1 / (2 uppi ii) oint_(partial D(a, rho)) f(z) dz,
  $<eq:residue>
  where $0 < rho < r$ is arbitrary. Since $f$ has a Laurent expansion at $a$, being
  $
    sum_(n=-infinity)^infinity c_n (z - a)^n, quad c_n = 1 / (2 uppi ii) oint_(partial D(a, rho)) (f(z) dz) / (z - a)^(n+1),
  $
  we get that the residue of $f$ at $a$ is equal to the first term $c_(-1)$ of the principal part of its Laurent expansion.
]<def:residue>

It then follows that the residue at a removable singularity is 0. As a direct consequence of @eq:residue, we can derive explicit formulas for the calculation of residues at poles. If $U subset.eq CC$ is open, $a in U$ is an isolated singularity (a pole of order $m != infinity$) of $f : U without {a} -> CC$ that is holomorphic, then locally:
$ f(z) = c_(-m) (z-a)^(-m) + c_(1-m) (z-a)^(1-m) + dots + c_(-1) (z-a)^(-1) + dots. $
Multiplying by $(z-a)^m$, we obtain that
$ (z-a)^m f(z) = c_(-m) + c_(1-m) (z-a) + dots + c_(-1) (z-a)^(m-1) + dots. $
By the definition of a Taylor series, we find that
$
  c_(-1) = Res_(z=a) f(z) = 1 / ((m-1)!) lim_(z -> a) dif^(m-1) / (dif z^(m-1)) [(z-a)^m f(z)].
$<eq:residueatpole>
Let $z = infinity$ be an isolated singularity of $f(z)$, which is holomorphic in $CC without overline(D(0, R))$, for sufficiently large finite $R$. Then for finite $rho > R$, the residue at $z = infinity$ is _defined_ as (notice the orientation)
$ Res_(z=infinity) f(z) = 1 / (2 uppi ii) integral.cont.cw_(partial D(0, rho)) f(z) dz. $
Let $zeta = 1 / z$. Then we get that
$
  Res_(z=infinity) f(z)
  &= -1 / (2 uppi ii) integral.cont.ccw_(partial D(0, rho)) f(1 / zeta) dif(1 / zeta) \
  &= 1 / (2 uppi ii) integral.cont.ccw_(partial D(0, 1\/rho)) (f(1 \/ zeta)) / zeta^2 dzeta = -Res_(zeta=0) (f(1 \/ zeta)) / zeta^2.
$
In this definition, if
$ f(z) = sum_(n=-infinity)^infinity c_n z^n <==> (f(1 \/ zeta)) / zeta^2 = sum_(n=-infinity)^infinity c_n zeta^(-n-2), $
the residue at $z = infinity$ is equal to $-c_(-1)$. We will later explain the reasoning behind this definition.

#theorem("Residue Theorem")[
  Let $U subset CC$ be an open set with a simple closed boundary curve $partial U$. Suppose ${z_n} subset U$ is a finite set and $f(z)$ is holomorphic on $U without {z_n}$ and continuous on $overline(U) without {z_n}$. Then,
  $ oint_(partial U) f(z) dz = 2 uppi ii sum_(k=1)^n Res_(z=z_k) f(z) $
]<thm:residuethm>

#proof[
  Since $U$ is open, there exists a small disk centered at each isolated singularity $z_k$ of radii $delta_k$. By the Cauchy--Goursat Theorem (@thm:cauchygoursattheorem), we get that
  $ integral_(union.big_(k=1)^n D(z_k, delta_k)^- union partial U^+) f(z) dz = 0. $
  From rearrangement, $oint_(partial U) f(z) dz = sum_(k=1)^n oint_(partial D(z_k, delta_k)) f(z) dz$, and the conclusion follows.
]

This result itself is fairly trivial. Now we will explain the significance of the residue at infinity.

#theorem("Global Residue Theorem")[
  If ${z_1, dots z_n, infinity}$ is discrete and finite, and $f : extcomplex without {z_1, dots z_n, infinity} -> CC$ is holomorphic, and these points are the isolated singularities of $f$, then the sum of the residues at each of these isolated singularities is zero, or
  $ sum_(k=1)^n Res_(z=z_k) f(z) + Res_(z=infinity) f(z) = 0. $
]<thm:globalresiduethm>

#proof[
  Let $R > max_(j in NN_(lt.eq n)) abs(z_n)$ be arbitrary. By the Residue Theorem (@thm:residuethm),
  $ -Res_(z=infinity) f(z) = 1 / (2 uppi ii) oint_(partial D(0,R)) f(z) dz = sum_(k=1)^n Res_(z=z_k) f(z) $
  as desired. This is merely a restatement of @thm:residuethm.
]

There is not a directly trivial reason for the definition of the residue at $infinity$, except for the fact that it seemingly "unifies" the Riemann sphere.

#figure-wrapper([
  #figure(
    {
      cetz.canvas({
        import plot: *
        import cetz.draw: *

        ortho(x: 35deg, y: 35deg, cull-face: none, {
          circle((0, 1, 0), radius: 1.2pt, fill: black, stroke: none)
          circle((0, -1, 0), radius: 1.2pt, fill: black, stroke: none)
          let theta-steps = 60
          let phi-steps = 30
          let n-shading-levels = 6

          for i in range(theta-steps) {
            for j in range(phi-steps) {
              let theta1 = i / theta-steps * 2 * calc.pi
              let theta2 = (i + 1) / theta-steps * 2 * calc.pi
              let phi1 = j / phi-steps * calc.pi
              let phi2 = (j + 1) / phi-steps * calc.pi

              let p1 = (calc.sin(phi1) * calc.cos(theta1), calc.cos(phi1), calc.sin(phi1) * calc.sin(theta1))
              let p2 = (calc.sin(phi1) * calc.cos(theta2), calc.cos(phi1), calc.sin(phi1) * calc.sin(theta2))
              let p3 = (calc.sin(phi2) * calc.cos(theta2), calc.cos(phi2), calc.sin(phi2) * calc.sin(theta2))
              let p4 = (calc.sin(phi2) * calc.cos(theta1), calc.cos(phi2), calc.sin(phi2) * calc.sin(theta1))

              let normal = (
                calc.sin((phi1 + phi2) / 2) * calc.cos((theta1 + theta2) / 2),
                calc.cos((phi1 + phi2) / 2),
                calc.sin((phi1 + phi2) / 2) * calc.sin((theta1 + theta2) / 2),
              )

              let light-intensity = calc.max(
                0.7,
                calc.ceil((1 + normal.at(1)) * n-shading-levels / 2) * 0.3 / n-shading-levels + 0.7,
              )

              let translucent-fill = color.transparentize(color.black, 100% * light-intensity)

              line(p1, p2, p3, p4, close: true, fill: translucent-fill, stroke: none)
            }
          }

          for i in range(6) {
            let theta = i / 6 * 2 * calc.pi
            let pts = range(61).map(j => {
              let phi = j / 60 * calc.pi
              (calc.sin(phi) * calc.cos(theta), calc.cos(phi), calc.sin(phi) * calc.sin(theta))
            })
            line(..pts, stroke: (paint: black, thickness: 0.3pt, dash: ("dot", .5pt)))
          }

          let eq-pts = range(101).map(i => {
            let t = i / 100 * 2 * calc.pi
            (calc.cos(t), 0, calc.sin(t))
          })
          line(..eq-pts, stroke: (paint: black, thickness: 0.8pt, dash: ("dot", 1pt)))

          let pr = 3
          for i in range(-2 * pr, 2 * pr + 1) {
            let index = i / 2
            line((index, 0, -pr), (index, 0, pr), stroke: (paint: black, thickness: 0.2pt))
            line((-pr, 0, index), (pr, 0, index), stroke: (paint: black, thickness: 0.2pt))
          }

          let phi-c = calc.pi / 3
          let theta-c = calc.pi / 3
          let r-nb = 0.3
          let nbhd-pts = range(61).map(i => {
            let t = i / 60 * 2 * calc.pi
            let phi = phi-c + r-nb * calc.cos(t)
            let theta = theta-c + r-nb * calc.sin(t)
            (calc.sin(phi) * calc.cos(theta), calc.cos(phi), calc.sin(phi) * calc.sin(theta))
          })
          line(..nbhd-pts, stroke: (paint: black, thickness: 0.5pt, dash: ("dot", "dot")))

          let proj-pts = nbhd-pts.map(p => {
            let (xc, yc, zc) = p
            let d = 1 - yc
            (xc / d, 0, zc / d)
          })
          line(..proj-pts, stroke: (paint: black, thickness: 0.6pt, dash: ("dot", "dot")))

          let n-arrows = 6
          for k in range(n-arrows) {
            let i = int(k / n-arrows * 60)
            mark(nbhd-pts.at(i + 1), nbhd-pts.at(i), ">>", fill: black, stroke: none, scale: 0.4)
            mark(proj-pts.at(i + 1), proj-pts.at(i), ">>", fill: black, stroke: none, scale: 0.7)
          }

          let ax = 3.0
          let ax-s = (paint: black, thickness: 0.6pt)

          line((0, 0, 0), (ax, 0, 0), stroke: ax-s, mark: (end: ">>", fill: black))
          line((0, 0, 0), (-ax, 0, 0), stroke: ax-s, mark: (end: ">>", fill: black))
          content((ax + 0.2, 0, 0), [$x_2$])

          line((0, 0, 0), (0, 0, ax), stroke: ax-s, mark: (end: ">>", fill: black))
          line((0, 0, 0), (0, 0, -ax), stroke: ax-s, mark: (end: ">>", fill: black))
          content((0, 0, ax + 0.2), [$x_1$])

          line((0, 0, 0), (0, ax, 0), stroke: ax-s, mark: (end: ">>", fill: black))
          line((0, 0, 0), (0, -ax, 0), stroke: ax-s, mark: (end: ">>", fill: black))
          content((0, ax + 0.2, 0), [$x_3$])
        })
      })
    },
    caption: [The orientation of a neighborhood that does not enclose $infinity$ after projection.],
  ) <fig:stereographicprojectionofneighborhood>
])

However, if we take a neighborhood of an arbitrary point in $CC$ on the Riemann sphere and traverse its boundary clockwise (from the perspective of outside the sphere), its projection onto $CC$ will be counterclockwise (@fig:stereographicprojectionofneighborhood). However, the boundary of a neighborhood of $infinity$ in $S^2$ will have a clockwise projection (hence the difference in orientation). We define its equality with the residue of $-(f(1\/zeta)) / zeta^2$ at $zeta = 0$, rather than $f(1\/zeta)$, because we compose the differential form $f(z) dz$ with the inversion, as opposed to $f(z)$.

For any closed rectifiable curve $gamma subset U$ (here we are not bound under the assumption of simpleness), the Residue Theorem can be generalized into:
$ oint_gamma f(z) dz = 2 uppi ii sum_k Ind_gamma (z_k) Res_(z=z_k) f(z) $
where $z_k$ are the singularities of $f$ in $U$ and $Ind_gamma$ is the winding index.

Residues are extremely important as they allow for simple evaluation of definite (most commonly improper) real-valued integrals. This is because oftentimes, residues at poles are generally easy to calculate and have an integral representation. We can integrate over a contour (a smooth closed curve) that contains the important part of the real interval. Oftentimes this is the most non-trivial step.

#example[
  Evaluate the improper integral $I = integral_(-infinity)^infinity 1 / (x^2+1)^(n+1) dx$, where $n in NN$.
]

#figure-wrapper([
  #figure(
    {
      let radius = 3
      let max = radius + 0.5
      quick-plot(scale: 1, x-min: -max, x-max: max, y-max: max, canvas: {
        import cetz.draw: *
        let mark = (end: (symbol: ">>", fill: black, pos: 30%, shorten-to: none))

        arc-through(
          (0deg, 3),
          (30deg, 3),
          (60deg, 3),
          stroke: (thickness: 1.5pt),
          mark: mark,
        )

        arc-through(
          (60deg, 3),
          (90deg, 3),
          (120deg, 3),
          stroke: (thickness: 1.5pt),
          mark: mark,
        )

        arc-through(
          (120deg, 3),
          (150deg, 3),
          (180deg, 3),
          stroke: (thickness: 1.5pt),
          mark: mark,
        )

        line((-radius, 0), (radius, 0), mark: mark, stroke: 1.5pt)

        content((radius, 0), anchor: "north", $R$, padding: 2pt)
        content((-radius, 0), anchor: "north", $-R$, padding: 2pt)
        content((0, radius), anchor: "south-east", $R$, padding: 2pt)
      })
    },
    caption: [A semicircular contour with orientation marked.],
  ) <fig:semicircularcontour>
])

#proof[
  Consider $gamma$ to be a closed semicircle with radius $R gt.eq 2$ as in @fig:semicircularcontour. Notice that the function $z |-> 1 / (z^2+1)^(n+1)$ has singularities at only $z = ii$ and $z = -ii$, both of which are poles of order $n+1$. By @eq:residueatpole, the residue at $z = ii$ is
  $
    Res_(z=ii) 1 / (z^2+1)^(n+1)
    &= lr(1 / (n!) dif^n / (dif z^n) ((z + ii)^(-n-1)) |)_(z=ii) = 1 / (n!) ((-1)^n product_(k=1)^n (n+k)) / (2 ii)^(2n+1) \
    &= ((-1)^n (2n)!) / ((n!)^2 (2 ii)^(2n+1)) = ((2n)!) / (2^(2n+1) ii (n!)^2).
  $
  The singularity at $z = -ii$ is not relevant, as it is not enclosed by the contour. By the Residue Theorem (@thm:residuethm), we have
  $
    oint_gamma 1 / (z^2+1)^(n+1) dz
    &= integral_(-R)^R 1 / (x^2+1)^(n+1) dx + integral_0^uppi (R ii) / (R^2 ee^(2 ii theta) + 1)^(n+1) ee^(ii theta) dif theta \
    &= 2 uppi ii Res_(z=ii) 1 / (z^2+1)^(n+1) = ((2n)! uppi) / (2^(2n) (n!)^2).
  $
  We will now show that the integral over the semicircle vanishes as $R -> infinity$. Under the assumption that $R gt.eq 2$, since
  $
    abs((R ii ee^(ii theta)) / (R^2 ee^(2 ii theta) + 1)^(n+1)) = R / abs(R^2 ee^(2 ii theta) + 1)^(n+1) lt.eq R / abs(R^2 - 1) lt.eq 2/3,
  $
  which is integrable over $[0, uppi]$, and we can commute the limit with the integral. Therefore, we have
  $
    integral_(-infinity)^infinity 1 / (x^2+1)^(n+1) dx
    &= lim_(R -> infinity) oint_gamma 1 / (z^2+1)^(n+1) dz \
    &quad - integral_0^uppi lim_(R -> infinity) (R ii) / (R^2 ee^(2 ii theta) + 1)^(n+1) ee^(ii theta) dif theta = ((2n)! uppi) / (2^(2n) (n!)^2). #qedhere
  $
]

#example("Dirichlet Integral")[
  Evaluate the integral $integral_0^infinity (sin x) / x dx$.
]

#figure-wrapper([
  #figure(
    {
      let var-R = 3
      let var-epsilon = 0.8
      let max = var-R + 0.5
      quick-plot(scale: 1, x-min: -max, x-max: max, y-max: max, canvas: {
        import cetz.draw: *
        let mark = (end: (pos: 50%, symbol: ">>", fill: black, shorten-to: none))

        arc-through(
          (180deg, var-epsilon),
          (90deg, var-epsilon),
          (0deg, var-epsilon),
          stroke: (thickness: 1pt),
          mark: mark,
        )

        line((-var-R, 0), (-var-epsilon, 0), stroke: (thickness: 1pt), mark: mark)
        line((var-epsilon, 0), (var-R, 0), stroke: (thickness: 1pt), mark: mark)

        arc-through(
          (0deg, var-R),
          (30deg, var-R),
          (60deg, var-R),
          stroke: (thickness: 1.5pt),
          mark: mark,
        )

        arc-through(
          (60deg, var-R),
          (90deg, var-R),
          (121deg, var-R),
          stroke: (thickness: 1.5pt),
          mark: mark,
        )

        arc-through(
          (120deg, var-R),
          (150deg, var-R),
          (180deg, var-R),
          stroke: (thickness: 1.5pt),
          mark: mark,
        )

        content((var-R, 0), anchor: "north", $R$, padding: 2pt)
        content((var-epsilon, 0), anchor: "north", $epsilon$, padding: 2pt)
        content((-var-R, 0), anchor: "north", $-R$, padding: 2pt)
        content((-var-epsilon, 0), anchor: "north", $-epsilon$, padding: 2pt)
        content((0, var-R), anchor: "south-east", $R$, padding: 2pt)
      })
    },
    caption: [An indented semicircular contour with orientation marked.],
  ) <fig:indentedsemicircularcontour>
])
#proof[
  It is common to use integration with parameters to approach this integral. However, we will now provide a solution via contour integration.

  Let $f(z) = ee^(ii z) / z$. Consider a closed contour $gamma$ in the form of @fig:indentedsemicircularcontour, consisting of a semicircle of radius $R$ in $overline(HH^+)$ ($C_R$), a line segment from $-R$ to $-epsilon$, a smaller semicircle of radius $epsilon$ in the upper half-plane ($C_epsilon$), and a line segment from $epsilon$ to $R$.

  By the Cauchy--Goursat Theorem (@thm:cauchygoursattheorem), we have that
  $
    oint_gamma f(z) dz = integral_(C_R) f(z) dz + integral_(-R)^(-epsilon) f(z) dz + integral_(C_epsilon) f(z) dz + integral_epsilon^R f(z) dz = 0.
  $
  We will now analyze each integral. The first integral is
  $
    integral_(C_R) f(z) dz = integral_0^uppi (exp(ii R ee^(ii theta))) / (R ee^(ii theta)) R ii ee^(ii theta) dif theta = ii integral_0^uppi ee^(ii R cos theta) ee^(-R sin theta) dif theta.
  $
  Notice that $2/uppi theta lt.eq sin(theta) lt.eq theta$ over the integration range. We want to observe the behavior as $R -> infinity$:
  $
    abs(ii integral_0^uppi ee^(ii R cos theta) ee^(-R sin theta) dif theta)
    &lt.eq integral_0^uppi ee^(-R sin theta) dif theta = 2 integral_0^(uppi\/2) ee^(-R sin theta) dif theta \
    &< 2 integral_0^(uppi\/2) ee^(-R 2/uppi theta) dif theta = lr(-uppi/R ee^(-R 2/uppi theta) |)_0^(uppi\/2) \
    &= uppi/R (1 - ee^(-R)) -> 0.
  $
  Let us evaluate the integral on $gamma_epsilon$ as $epsilon -> 0$:
  $
    integral_(C_epsilon) f(z) dz = ii integral_uppi^0 exp(epsilon (ii cos theta - sin theta)) dif theta = ii integral_uppi^0 ee^(-epsilon sin theta) ee^(ii epsilon cos theta) dif theta.
  $
  Obviously,
  $ abs(ee^(-epsilon sin theta) ee^(ii epsilon cos theta)) lt.eq 1, $
  and therefore, the integral and the limit may commute:
  $
    lim_(epsilon -> 0) integral_(C_epsilon) f(z) dz = ii integral_uppi^0 lim_(epsilon -> 0^+) ee^(-epsilon sin theta) ee^(ii epsilon cos theta) dif theta = ii integral_uppi^0 dif theta = -ii uppi.
  $
  Evaluating the integral over the line segments, we have
  $
    integral_(-R)^(-epsilon) f(z) dz + integral_epsilon^R f(z) dz
    &= integral_(-R)^(-epsilon) ee^(ii z) / z dz + integral_epsilon^R ee^(ii z) / z dz \
    &= integral_(-R)^(-epsilon) ee^(ii z) / z dz - integral_(-R)^(-epsilon) ee^(-ii z) / z dz \
    &-> 2 ii integral_(-infinity)^0 (sin z) / z dz = 2 ii integral_0^infinity (sin z) / z dz.
  $
  Hence,
  $
    -ii uppi + 2 ii integral_0^infinity (sin(z)) / z dz = 0 <==> integral_0^infinity (sin z) / z dz = uppi / 2. #qedhere
  $
]

#example("Fresnel Integral")[
  Evaluate the improper integrals
  $ I_1 = integral_0^infinity cos(x^2) dx, quad I_2 = integral_0^infinity sin(x^2) dx. $
]

#figure-wrapper(
  [
    #figure(
      {
        let outer-rad = 3.5

        quick-plot(x-max: 4, y-max: 3, canvas: {
          import cetz.draw: *
          let mark = (end: (pos: 50%, symbol: ">>", fill: black, shorten-to: none))

          arc(
            (outer-rad, 0),
            start: 0deg,
            stop: 45deg,
            radius: outer-rad,
            mark: mark,
            stroke: 1.5pt,
            name: "C-R",
          )

          line((0, 0), (outer-rad, 0), mark: mark, stroke: (thickness: 1.5pt), name: "Gamma-1")

          line(
            cvector.scale((outer-rad, outer-rad), calc.sqrt(2) / 2),
            (0, 0),
            mark: mark,
            stroke: 1.5pt,
            name: "Gamma-2",
          )

          content("Gamma-1.mid", $Gamma_1$, anchor: "north", padding: 1pt)
          content("Gamma-2.mid", $Gamma_2$, anchor: "south-east", padding: 1pt)
          content("C-R.arc-center", $C_R$, anchor: "south-west", padding: 1pt)
          content("Gamma-1.end", $R$, anchor: "north", padding: 1pt)
          content("Gamma-2.start", $R$, anchor: "south", padding: 1pt)
        })
      },
      caption: [A wedge contour with orientation marked.],
    ) <fig:wedgecontour>],
)
#proof[
  Let $f(z) = ee^(ii z^2)$. Choose the wedge contour composed of
  $
    Gamma_1 = {x in RR : 0 lt.eq x lt.eq R}, quad Gamma_2 = {r ee^(ii uppi\/4) : 0 lt.eq r lt.eq R}, \
    C_R = {R ee^(ii theta) : 0 lt.eq theta lt.eq uppi/4}
  $
  as in @fig:wedgecontour. By the Cauchy--Goursat Theorem (@thm:cauchygoursattheorem), we have that
  $
    integral_(Gamma_1) f(z) dz + integral_(Gamma_2) f(z) dz + integral_(C_R) f(z) dz = 0.
  $<eq:fresnelwedgecontourintegral>
  The third integral can be written as
  $ integral_(C_R) f(z) dz = R ii integral_0^(uppi\/4) exp[ii (R ee^(ii theta))^2] ee^(ii theta) dif theta. $
  Using the fact that $4/uppi theta < sin(2 theta)$ on the integration range, it can be bounded as
  $
    abs(integral_(C_R) f(z) dz)
    &lt.eq R integral_0^(uppi\/4) ee^(-R^2 sin(2 theta)) dif theta < R integral_0^(uppi\/4) ee^(-4/uppi R^2 theta) dif theta \
    &= -uppi/(4R) lr(ee^(-4/uppi R^2 theta) |)_0^(uppi\/4) = uppi/(4R) (1 - ee^(-R^2)).
  $
  As $R -> infinity$, this integral tends to 0. Let $z = r ee^(ii uppi\/4)$ on $Gamma_2$. Then, we have
  $
    lim_(R -> infinity) integral_(Gamma_2) f(z) dz = integral_infinity^0 exp[ii (r ee^(ii uppi\/4))^2] ee^(ii uppi\/4) dr = ee^(ii uppi\/4) integral_infinity^0 exp(-r^2) dr.
  $
  From @eq:fresnelwedgecontourintegral, we have that
  $ integral_0^infinity ee^(ii r^2) dr = ee^(ii uppi\/4) integral_0^infinity ee^(-r^2) dr. $
  Since $integral_0^infinity ee^(-r^2) dr = sqrt(uppi)/2$, we have
  $ integral_0^infinity ee^(ii r^2) dr = (sqrt(2)/2 + ii sqrt(2)/2) sqrt(uppi)/2. $
  Since $ee^(ii r^2) = cos(r^2) + ii sin(r^2)$, we have
  $
    integral_0^infinity cos(r^2) dr = Re [integral_0^infinity ee^(ii r^2) dr] = sqrt(2 uppi) / 4, \
    integral_0^infinity sin(r^2) dr = Im [integral_0^infinity ee^(ii r^2) dr] = sqrt(2 uppi) / 4,
  $
  as desired.
]

#example[
  Evaluate the integrals $integral_0^(2 uppi) Phi(cos theta, sin theta) dif theta$, where $Phi(xi, eta)$ is a rational function of $xi$ and $eta$ that is continuous on $theta in [0, 2 uppi]$.
]

#proof[
  Let $z = ee^(ii theta)$. Consequently, we have $cos theta = (z + z^(-1)) / 2$, $sin theta = (z - z^(-1)) / (2 ii)$, and $dz = ii ee^(ii theta) dif theta$, implying that $dif theta = dz / (ii z)$. Therefore, by the Residue Theorem (@thm:residuethm), letting $f(z) = 1 / (ii z) Phi((z + z^(-1)) / 2, (z - z^(-1)) / (2 ii))$, we have
  $
    integral_0^(2 uppi) Phi(cos theta, sin theta) dif theta = oint_(partial DD) f(z) dz = 2 uppi ii sum_(k=1)^n Res_(z=z_k) f(z),
  $
  where $z_k$ where $k = 1, dots, n$ are the isolated singularities of $f$ in $DD$.
]

#example[
  Evaluate $I = integral_0^infinity x^alpha / (1 + x^beta) dx$, where $0 < alpha + 1 < beta$.
]

#figure-wrapper(
  [
    #figure(
      {
        let inner-rad = 1
        let outer-rad = 3.5

        quick-plot(x-max: 4, y-max: 3, canvas: {
          import cetz.draw: *
          let mark = (end: (pos: 40%, symbol: ">>", fill: black, shorten-to: none))

          line((0, 0), (inner-rad, inner-rad), stroke: (dash: "dashed", thickness: 0.5pt), name: "wedge-dash")
          arc(
            (outer-rad, 0),
            start: 0deg,
            stop: 45deg,
            radius: outer-rad,
            mark: mark,
            stroke: 1.5pt,
            name: "C-R",
          )

          arc(
            cvector.scale((inner-rad, inner-rad), calc.sqrt(2) / 2),
            start: 45deg,
            stop: 0deg,
            radius: inner-rad,
            mark: mark,
            stroke: 1.5pt,
            name: "C-epsilon",
          )

          line((inner-rad, 0), (outer-rad, 0), mark: mark, stroke: (thickness: 1.5pt), name: "Gamma-1")

          line(
            cvector.scale((outer-rad, outer-rad), calc.sqrt(2) / 2),
            cvector.scale((inner-rad, inner-rad), calc.sqrt(2) / 2),
            mark: mark,
            stroke: 1.5pt,
            name: "Gamma-2",
          )

          content("Gamma-1.mid", $Gamma_1$, anchor: "north", padding: 1pt)
          content("Gamma-2.mid", $Gamma_2$, anchor: "south-east", padding: 1pt)
          content("C-R.arc-center", $C_R$, anchor: "south-west", padding: 1pt)
          content("C-epsilon.arc-center", $C_epsilon$, anchor: "south-west", padding: 1pt)
          content("Gamma-1.end", $R$, anchor: "north", padding: 1pt)
          content("Gamma-1.start", $epsilon$, anchor: "north", padding: 1pt)
          content("Gamma-2.start", $R$, anchor: "south", padding: 1pt)
          content("Gamma-2.end", $epsilon$, anchor: "south-east", padding: 1pt)
        })
      },
      caption: [An indented wedge contour with orientation marked.],
    )
    <fig:indentedwedgecontour>
  ],
)
#proof[
  Let $f(z) = z^alpha / (1 + z^beta)$ and let $-uppi < Arg(z) lt.eq uppi$ in the principal branches of $z^alpha = ee^(alpha Log(z))$ and $z^beta = ee^(beta Log(z))$. Then except for at the zeros of $1 + z^beta$, $f$ is holomorphic.

  The solutions to $z^beta = -1$ are $z = exp(ii uppi/beta + 2 ii k uppi/beta)$. Choose an indented wedge contour (as there is a logarithmic branch point singularity at the origin) with an angle of $2 uppi / beta$ (as in @fig:wedgecontour). The only singularity it encloses is $exp(ii uppi/beta)$. Since it is a simple zero of $1/f$, this singularity is a simple pole.

  The contour is the union of the following curves:
  $
    Gamma_1 = {x in RR : epsilon lt.eq x lt.eq R}, quad Gamma_2 = {r exp(ii 2 uppi\/beta) : epsilon lt.eq r lt.eq R}, \
    C_R = {R ee^(ii theta) : 0 lt.eq theta lt.eq 2 uppi\/beta}, quad C_epsilon = {epsilon ee^(ii theta) : 0 lt.eq theta lt.eq 2 uppi\/beta}
  $
  where $R > 1$ and $0 < epsilon < 1$. By the Residue Theorem (@thm:residuethm), we get that
  $
    lim_(epsilon -> 0) lim_(R -> infinity) (integral_(Gamma_1) + integral_(Gamma_2) + integral_(C_R) + integral_(C_epsilon)) f(z) dz = 2 uppi ii Res[f, exp(ii uppi/beta)].
  $
  By @eq:residueatpole, it follows that
  $
    Res [f, exp(ii uppi\/beta)] & = lim_(z -> exp(ii uppi\/beta)) (z - exp(ii uppi\/beta)) / ((1 + z^beta) \/ z^alpha) \
                                & = lim_(z -> exp(ii uppi\/beta)) (dif / (dif z) (z^(-alpha) + z^(beta - alpha)))^(-1) \
                                & = lim_(z -> exp(ii uppi\/beta)) z^(alpha+1) / ((beta - alpha) z^beta - alpha) \
                                & = -1/beta exp(ii uppi/beta (alpha + 1)).
  $
  We can write the integral on $Gamma_2$ in terms of $I$:
  $
    lim_(R -> infinity \ epsilon -> 0) integral_(Gamma_2) f(z) dz
    &= lim_(R -> infinity \ epsilon -> 0) integral_R^0 f[r exp(ii 2 uppi\/beta)] exp(ii 2 uppi\/beta) dr \
    &= -exp[ii 2 uppi/beta (1 + alpha)] integral_0^infinity r^alpha / (1 + r^beta) dr.
  $
  We also have
  $
    integral_(C_R) f(z) dz = R ii integral_0^(2 uppi\/beta) f(R ee^(ii theta)) ee^(ii theta) dif theta = ii integral_0^(2 uppi\/beta) (R^(alpha+1)) / (1 + R^beta ee^(ii beta theta)) exp[ii theta (1 + alpha)] dif theta.
  $
  It can also be shown that the integral is bounded by a vanishing function as $R -> infinity$:
  $
    abs(integral_0^(2 uppi\/beta) (R^(alpha+1)) / (1 + R^beta ee^(ii beta theta)) exp[ii theta (1+alpha)] dif theta) lt.eq integral_0^(2 uppi\/beta) (R^(alpha+1)) / (R^beta - 1) dif theta = 2 uppi/beta (R^(alpha+1)) / (R^beta - 1) -> 0.
  $
  Similarly, as $epsilon -> 0$,
  $
    abs(integral_(C_epsilon) f(z) dz) lt.eq epsilon integral_0^(2 uppi\/beta) abs(f(epsilon ee^(ii theta))) dif theta = integral_0^(2 uppi\/beta) (epsilon^(alpha+1)) / (1 - epsilon^beta) dif theta = 2 uppi/beta (epsilon^(alpha+1)) / (1 - epsilon^beta) -> 0.
  $
  By letting $R -> infinity$ and $epsilon -> 0$, we have
  $ [1 - exp(ii 2 uppi/beta (1 + alpha))] I = -(2 uppi ii)/beta exp(ii uppi/beta (alpha+1)). $
  It follows that
  $
    I = (2 uppi ii)/beta [exp(ii uppi/beta (alpha+1)) - exp(-ii uppi/beta (alpha+1))]^(-1) = uppi/beta csc(uppi/beta (alpha+1)). #qedhere
  $
]

#example[
  Prove that the Fourier transform of $sech(uppi x)$ is itself, or that
  $ I(xi) = integral_(-infinity)^infinity exp(-2 uppi ii x xi) sech(uppi x) dx = sech(uppi xi). $
]

#figure-wrapper([
  #figure(
    {
      let var-h-max = 2.5
      let var-v-max = 2
      quick-plot(
        x-min: -var-h-max,
        x-max: var-h-max,
        y-min: -1,
        y-max: var-v-max,
        canvas: {
          import cetz.draw: *

          let R = 2
          let h = 1.5

          let A = (-R, 0)
          let C = (R, 0)
          let D = (R, h)
          let F = (-R, h)

          let thick = (thickness: 1.5pt)
          let mark = (end: (symbol: ">>", pos: 30%, fill: black, shorten-to: none))

          line(A, C, mark: mark, stroke: thick)
          line(C, D, mark: mark, stroke: thick)
          line(D, F, mark: mark, stroke: thick)
          line(F, A, mark: mark, stroke: thick)

          content(C, $R$, anchor: "north", padding: 2pt)
          content(A, $-R$, anchor: "north", padding: 2pt)
          content((0, h), $i$, anchor: "north-east", padding: 2pt)
        },
      )
    },
    caption: [A rectangular contour with orientation marked.],
  ) <fig:rectangularcontour>
])
#proof[
  Fix $xi in RR$ and let $f(z) = exp(-2 uppi ii z xi) / cosh(uppi z)$. Its poles in $CC$ occur when $ee^(uppi z) + ee^(-uppi z) = 0$, or equivalently, when $z = ii (n + 1/2)$, where $n in ZZ$.

  Since
  $ cosh(uppi (z + ii)) = -cosh(uppi z), quad exp(-2 uppi ii (z + ii) xi) = exp(2 uppi xi) exp(-2 uppi ii z xi), $
  we have that $f(z)$ is a constant multiple of $f(z + ii)$. In particular, $f(z + ii) = -exp(2 uppi xi) f(z)$. Therefore, we can use a rectangular contour as shown in @fig:rectangularcontour. Let the sides be denoted by
  $
    attach(Gamma, t: arrow.l) = {x + ii : -R lt.eq x lt.eq R, x in RR}, quad attach(Gamma, t: arrow.r) = {x in RR : -R lt.eq x lt.eq R} \
    attach(Gamma, t: arrow.b) = {-R + ii y : y in [0,1]}, quad attach(Gamma, t: arrow.t) = {R + ii y : y in [0,1]}.
  $
  The only enclosed singularity is a simple pole at $z = ii/2$ (simple by evaluation of the Taylor expansion of the denominator). By the Residue Theorem (@thm:residuethm), we get that
  $
    (integral_(attach(Gamma, t: arrow.r)) + integral_(attach(Gamma, t: arrow.t)) + integral_(attach(Gamma, t: arrow.l)) + integral_(attach(Gamma, t: arrow.b))) f(z) dz = 2 uppi ii Res(f, ii/2).
  $<eq:fouriertransformofsechpix_rectangularcontourintegral>
  By @eq:residueatpole, we have
  $
    Res(f, ii/2) & = lim_(z -> ii\/2) (z - ii/2) exp(-2 uppi ii z xi) / cosh(uppi z) \
                 & = lim_(z -> ii\/2) dif / (dif z) (cosh(uppi z) / exp(-2 uppi ii z xi))^(-1) \
                 & = lim_(z -> ii\/2) exp(-2 uppi ii z xi) / (uppi sinh(uppi z) + 2 uppi ii xi cosh(uppi z)) \
                 & = exp(uppi xi) / (uppi ii).
  $
  The sum of the horizontal line integrals is equal to
  $
    integral_(-R)^R f(z) dz + integral_R^(-R) f(z + ii) dz
    &= integral_(-R)^R f(z) dz - integral_R^(-R) ee^(2 uppi xi) f(z) dz \
    &= (1 + ee^(2 uppi xi)) integral_(-R)^R f(z) dz.
  $
  As $R -> infinity$, we have $integral_(attach(Gamma, t: arrow.r)) f(z) dz + integral_(attach(Gamma, t: arrow.l)) f(z) dz -> (1 + ee^(2 uppi xi)) I(xi)$.
  The remaining two integrals can be written as
  $
    integral_(attach(Gamma, t: arrow.t)) f(z) dz = integral_0^1 exp(-2 uppi ii (R + ii z) xi) / cosh(uppi (R + ii z)) dz \
    integral_(attach(Gamma, t: arrow.b)) f(z) dz = integral_1^0 exp(2 uppi ii (R - ii z) xi) / cosh(uppi (-R + ii z)) dz.
  $
  They can be bounded with
  $
    abs(integral_0^1 exp(-2 uppi ii (R + ii z) xi) / cosh(uppi (R + ii z)) dz)
    &lt.eq 2 integral_0^1 (exp(2 uppi z xi)) / abs(ee^(uppi R) ee^(uppi ii z) + ee^(-uppi R) ee^(-uppi ii z)) dz \
    &lt.eq 2 integral_0^1 (exp(2 uppi z xi)) / abs(ee^(uppi R) - ee^(-uppi R)) dz
  $
  and
  $
    abs(integral_1^0 exp(2 uppi ii (R - ii z) xi) / cosh(uppi (-R + ii z)) dz)
    &lt.eq 2 integral_0^1 (exp(2 uppi z xi)) / abs(ee^(-uppi R) ee^(uppi ii z) + ee^(uppi R) ee^(-uppi ii z)) dz \
    &lt.eq 2 integral_0^1 (exp(2 uppi z xi)) / abs(ee^(uppi R) - ee^(-uppi R)) dz.
  $
  Since the integrands are continuous and uniformly convergent to $0$ with respect to $z$, we have
  $ integral_(attach(Gamma, t: arrow.t)) f(z) dz + integral_(attach(Gamma, t: arrow.b)) f(z) dz -> 0 $
  as $R -> infinity$. By rearrangement of @eq:fouriertransformofsechpix_rectangularcontourintegral,
  $ I(xi) (1 + ee^(2 uppi xi)) = 2 exp(uppi xi), $
  or that
  $ I(xi) = 2 / (ee^(-uppi xi) + ee^(uppi xi)) = sech(uppi xi), $
  which proves the result.
]

Contour integration provides a powerful method for evaluating real improper integrals by leveraging the Residue Theorem (@thm:residuethm). The primary challenge often lies in constructing a suitable contour in the complex plane that encloses the relevant singularities of the integrand $f$ while ensuring that the contribution from the contributions from the remaining segments of the contour either vanishes or can be calculated with ease.

If the function $f$ is even and integrated on a domain such as $RR_(gt.eq 0)$, then the integral can be extended to the entire real axis. If $f$ decays sufficiently rapidly in the upper half plane $HH^+$, a semicircular contour is generally preferable, as illustrated in @fig:semicircularcontour. In the presence of singularities on the contour itself, we can insert arc indentations around them, as shown in @fig:indentedsemicircularcontour.

If $f(z)$ is a constant multiple of $f(z + ii y)$ (a type of quasiperiodicity) for some $y in RR$, it is a strong indication to use a rectangular contour. If $f(z)$ is a constant multiple of $f(z ee^(ii tau))$ for some $tau in RR$, a wedge-shaped contour is an appropriate choice.

In the case that there are indentations along the contour, we have

#theorem[
  Let $lambda > 0$ and let $a in CC$. Suppose $f(z)$ is a holomorphic function on $D^*(a, lambda)$ with a simple pole at $z = a in U$. Let $0 < epsilon < lambda$ and define $gamma_epsilon subset.eq partial D(a, epsilon)$ be a counterclockwise-oriented, connected arc subtending an angle $theta.alt$. Then,
  $ lim_(epsilon -> 0) integral_(gamma_epsilon) f(z) dz = ii theta.alt dot Res_(z=a) f(z). $
]<thm:residueoverarc>

#proof[
  Parameterize $gamma_epsilon$ with $z = a + epsilon ee^(ii theta)$, where $theta in [alpha, beta]$ and $beta - alpha = theta.alt$. Then,
  $
    integral_(gamma_epsilon) f(z) dz = integral_alpha^beta f(a + epsilon ee^(ii theta)) (dif z) / (dif theta) dif theta = epsilon ii integral_alpha^beta f(a + epsilon ee^(ii theta)) ee^(ii theta) dif theta.
  $
  Since $f$ has a simple pole at $z = a$, we can write a Laurent expansion around $a$ as
  $ f(z) = c_(-1) / (z - a) + phi(z), $
  where $phi(z)$ is holomorphic in a neighborhood of $a$ and $c_(-1) = Res_(z=a) f(z)$.

  Then for $z = a + epsilon ee^(ii theta)$,
  $ f(a + epsilon ee^(ii theta)) = c_(-1) / (epsilon ee^(ii theta)) + phi(a + epsilon ee^(ii theta)). $
  So,
  $
    integral_(gamma_epsilon) f(z) dz
    &= epsilon ii integral_alpha^beta (c_(-1) / (epsilon ee^(ii theta)) + phi(a + epsilon ee^(ii theta))) ee^(ii theta) dif theta \
    &= ii c_(-1) integral_alpha^beta dif theta + epsilon ii integral_alpha^beta phi(a + epsilon ee^(ii theta)) ee^(ii theta) dif theta \
    &= ii c_(-1) theta.alt + epsilon ii integral_alpha^beta phi(a + epsilon ee^(ii theta)) ee^(ii theta) dif theta.
  $
  Let $epsilon < lambda/2$. Since $phi$ is continuous on the disk $overline(D(a, lambda/2))$, it is bounded. Therefore, letting $epsilon -> 0$, we have
  $
    lim_(epsilon -> 0) epsilon ii integral_alpha^beta phi(a + epsilon ee^(ii theta)) ee^(ii theta) dif theta = lim_(epsilon -> 0) epsilon ii integral_alpha^beta phi(a) ee^(ii theta) dif theta = 0.
  $
  Therefore,
  $ lim_(epsilon -> 0) integral_(gamma_epsilon) f(z) dz = ii theta.alt Res_(z=a) f(z). #qedhere $
]

In the case that a branch point singularity is present on the contour, we may attempt to rewrite the function in a way such that the branch point is irrelevant. Otherwise, there are two types of "keyhole contours" that can be used to avoid the branch cut.

#example[
  Evaluate $I = integral_0^infinity (log(x^2+1)) / (x^2+1) dx$.
]<ex:branchpointpoleconcurrenceintegral>

#proof[
  Notice that the integrand itself has branch points at $z = plus.minus ii$ coinciding with the poles from the denominator. We can rewrite the integral as
  $
    I
    &= 1/2 integral_(-infinity)^infinity (log(x^2+1)) / (x^2+1) = integral_(-infinity)^infinity (log sqrt((x+i)(x-i))) / (x^2+1) \
    &= integral_(-infinity)^infinity (log abs(x plus.minus i)) / (x^2+1) = Re integral_(-infinity)^infinity (log(x+i)) / (x^2+1).
  $<eq:branchpointpoleconcurrenceintegral_rewrite>
  Let $gamma = Gamma union C_R$, where concretely,
  $ Gamma = {x in RR : -R lt.eq x lt.eq R}, quad C_R = {R ee^(ii theta) : 0 lt.eq theta lt.eq uppi} $
  and $R > 2$, and let $f(z) = Log(z + ii) / (z^2+1)$, where the branch for $Log$ is chosen to satisfy $[0, uppi] subset Im log(CC^*)$, such as the principal branch. The only singularity of $f$ in the upper half plane is a simple pole at $z = ii$. By the Residue Theorem (@thm:residuethm), we have
  $
    lim_(R -> infinity) oint_gamma f(z) dz = lim_(R -> infinity) (integral_Gamma + integral_(C_R)) f(z) dz = 2 uppi ii Res_(z=ii) f(z).
  $
  By @eq:residueatpole, we have
  $
    Res_(z=ii) f(z) = lim_(z -> ii) (z - ii) (log(z+ii)) / (z^2+1) = lim_(z -> ii) (log(z+ii)) / (z+ii) = (log(2 ii)) / (2 ii) = uppi/4 - ii (log(2)) / 2.
  $
  Additionally, for $z in C_R$, since as $R -> infinity$, $abs(f(z)) = abs(Log(z+i) / (z^2+1)) lt.eq (abs(log abs(z+i)) + uppi) / (R^2-1) lt.eq (log abs(R+1) + uppi) / (R^2-1) < (R+1+uppi) / (R^2-1) -> 0$ by virtue of $R > 2$, it follows that $integral_(C_R) f(z) dz -> 0$.

  Since $lim_(R -> infinity) integral_Gamma f(z) dz = integral_(-infinity)^infinity f(z) dz$ and
  $ integral_(-infinity)^infinity f(z) dz = (uppi^2 ii) / 2 + uppi log(2), $
  by @eq:branchpointpoleconcurrenceintegral_rewrite, we have $I = Re integral_(-infinity)^infinity f(z) dz = uppi log(2)$.
]
