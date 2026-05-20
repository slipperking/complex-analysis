#import "/lib.typ": *

== Gaussian Curvature of a Surface <sec:gaussiancurvatureofsurface>
#let II-matrix = $vb(I #h(-0.15em) I)$
#let II-form = $upright(I #h(-0.15em) I)$

We will give a brief introduction to the curvature of a surface for heuristic intuition.

Suppose $U subset.eq RR^2$ is a region, and let $(u, v) in U$. Consider a surface parameterized via

$
  va(r)(u, v)=(x(u, v), y(u, v), z(u, v)) in RR^3,
$

where $x, y, z in C^2 (U)$. If $va(r)'_u times va(r)'_v$ never vanishes for $(u, v) in U$, then $va(r)(U)$ defines a smooth surface $Sigma$. For a fixed $(u, v) in U$, the vectors $va(r)'_u$ and $va(r)'_v$ form the basis of the tangent space (a plane) of $Sigma$ at $P=va(r)(u, v)$, denoted by $T_P Sigma=op("span")(va(r)'_u (P), va(r)'_v (P))$.

The square of the length of the vector infinitesimal $dif va(r)=va(r)'_u dif u + va(r)'_v dif v$, or

$
  upright(I)=dif s^2=E dif u^2 + 2 F dif u dif v + G dif v^2,
$ <eq:firstfundamentalform>

is known as the _first fundamental form_ of $Sigma$, where $E=va(r)'_u dot va(r)'_u$, $F=va(r)'_u dot va(r)'_v$, and $G=va(r)'_v dot va(r)'_v$.

Let $Q=va(r)(u + Delta u, v + Delta v)$ be near $P$. It follows that $arrow(P Q)=va(r)(u + Delta u, v + Delta v) - va(r)(u, v)$. The distance between $Q$ and $T_P Sigma$ is $arrow(P Q) dot vu(n)$, where $vu(n)=(va(r)'_u times va(r)'_v) / norm(va(r)'_u times va(r)'_v)$. By application of the multivariate Taylor's Theorem, we have

$
  arrow(P Q) & = va(r)'_u Delta u + va(r)'_v Delta v + 1 / 2 (va(r)''_(u u) Delta u^2 + 2 va(r)''_(u v) Delta u Delta v + va(r)''_(v v) Delta v^2) + Order(Delta u^3 + Delta v^3),
$

and therefore,

$
  arrow(P Q) dot vu(n)=1 / 2 (va(r)''_(u u) dot vu(n) Delta u^2 + 2 va(r)''_(u v) dot vu(n) Delta u Delta v + va(r)''_(v v) dot vu(n) Delta v^2) + Order(3) dot vu(n).
$

The first two linear terms vanish by properties of the triple scalar product. The _second fundamental form_ of $Sigma$ is defined as

$
  #II-form=L dif u^2 + 2 M dif u dif v + N dif v^2,
$ <eq:second_fundamental_form>

where $L=va(r)''_(u u) dot vu(n)$, $M=va(r)''_(u v) dot vu(n)$, and $N=va(r)''_(v v) dot vu(n)$. Since $va(r)'_u dot vu(n)=0$ and $va(r)'_v dot vu(n)=0$, by differentiation, we have

$
  va(r)''_(u u) dot vu(n) + va(r)'_u dot vu(n)'_u & = 0, & va(r)''_(u v) dot vu(n) + va(r)'_u dot vu(n)'_v & = 0, \
  va(r)''_(u v) dot vu(n) + va(r)'_v dot vu(n)'_u & = 0, & va(r)''_(v v) dot vu(n) + va(r)'_v dot vu(n)'_v & = 0.
$

It follows that $L=-va(r)'_u dot vu(n)'_u$, $M=-va(r)'_u dot vu(n)'_v=-va(r)'_v dot vu(n)'_u$, and $N=-va(r)'_v dot vu(n)'_v$. Because $dif vu(n)=vu(n)'_u dif u + vu(n)'_v dif v$,

$
  #II-form=-dif va(r) dot dif vu(n).
$

#figure-wrapper([
  #figure(
    {
      cetz.canvas(length: 3cm, {
        import cetz.draw: *
        let para(u, v) = (u, u * u + v * v, v)

        ortho(x: 25deg, y: -25deg, {
          let n = 10
          let s = 20

          for i in range(0, n + 1) {
            let v = -1 + 2 * i / n
            line(
              ..(range(0, s + 1).map(j => para(-1 + 2 * j / s, v))),
              stroke: (paint: black.transparentize(60%), thickness: 0.3pt),
            )
          }
          for i in range(0, n + 1) {
            let u = -1 + 2 * i / n
            line(
              ..(range(0, s + 1).map(j => para(u, -1 + 2 * j / s))),
              stroke: (paint: black.transparentize(60%), thickness: 0.3pt),
            )
          }

          let tp = 5
          for i in range(0, tp + 1) {
            let t = -1.1 + 2.2 * i / tp
            line((t, 0, -1.1), (t, 0, 1.1), stroke: (paint: black.transparentize(50%), thickness: 0.5pt))
            line((-1.1, 0, t), (1.1, 0, t), stroke: (paint: black.transparentize(50%), thickness: 0.5pt))
          }

          let P = (0.0, 0.00, 0.0)
          let Q = (0.5, 0.34, 0.3)
          let Qp = (0.5, 0.00, 0.3)
          anchor("P", P)
          anchor("Q", Q)
          anchor("Qp", Qp)
          line(
            ..(range(0, 51).map(i => para(0.5 * i / 50, 0.3 * i / 50))),
            stroke: (paint: black, thickness: 0.5pt),
          )

          line(Q, Qp, stroke: (paint: black, thickness: 0.5pt, dash: "dotted"))
          line(P, Qp, stroke: (paint: black, thickness: 0.5pt, dash: "dotted"))
        })
        circle("P", radius: 0.022, fill: black)
        circle("Q", radius: 0.022, fill: black)
        content("P", $P = va(r)(u, v)$, anchor: "east", padding: 3pt)
        content("Q", $Q = va(r)(u + Delta u, v + Delta v)$, anchor: "west", padding: 3pt)
        content((-0.9, 0.1, -0.9), $T_P Sigma$)
      })
    },
    caption: [$Q$ has a greater heuristic distance to $T_P Sigma$ for a more curved surface.],
  ) <fig:second_fundamental_form>
])

The second fundamental form, in a rough sense, measures the curvature of the surface $Sigma$ at $P$ (refer to @fig:second_fundamental_form). Both the first and second fundamental forms are geometric invariants; they are independent of the parameterization $va(r)$ of $Sigma$. The first fundamental form is also referred to as the _intrinsic metric_ (we will not delve into the metric tensor here) of $Sigma$, and the second fundamental form is an _extrinsic_ property of $Sigma$ as it is invariant up to the orientation of the surface (consequent direction of the normal vector).

Let $gamma subset Sigma$ be a curve parameterized by arc length, $va(r)(s)=va(r)(u(s), v(s))$. Then the unit tangent vector at $P=va(r)(s)$ is

$
  va(T)(s)=dv(va(r), s)=va(r)'_u dv(u, s) + va(r)'_v dv(v, s).
$

Consequently,

$
  va(T)'(s)=va(r)''_(u u) (dv(u, s))^2 + 2 va(r)''_(u v) (dv(u, s)) (dv(v, s)) + va(r)''_(v v) (dv(v, s))^2 + va(r)'_u dv(u, s, 2) + va(r)'_v dv(v, s, 2),
$

where the last two terms are in $T_P Sigma$. Because $norm(va(T)(s))=1$ for all $s$ by the arc-length parameterization, we have

$
  0=dv(norm(va(T)(s))^2, s)=dv(va(T)(s) dot va(T)(s), s)=2 va(T)(s) dot va(T)'(s).
$

Hence, $va(T)(s)$ and $va(T)'(s)$ are orthogonal and $va(T)'(s)$ is a normal to the curve $gamma$. Let $vu(n)=(va(r)'_u times va(r)'_v) / norm(va(r)'_u times va(r)'_v)$ be the unit normal to $Sigma$ at $P$. The _normal curvature_ of $gamma$ at $P$ in $Sigma$ is defined as

$
  kappa_n=va(T)'(s) dot vu(n)=[va(r)''_(u u) (dv(u, s))^2 + 2 va(r)''_(u v) (dv(u, s)) (dv(v, s)) + va(r)''_(v v) (dv(v, s))^2] dot vu(n).
$

The quotient

$
  kappa_n=(#II-form)/(upright(I))=(L dif u^2 + 2 M dif u dif v + N dif v^2)/(E dif u^2 + 2 F dif u dif v + G dif v^2),
$

varies depending on the curve traversing $Sigma$ (and ultimately, depending on the direction induced by $dif u$ and $dif v$). On $gamma$, the two representations are equivalent since $upright(I)=dif s^2$. The maximum and minimum values of $kappa_n$ are known as the _principal curvatures_ $kappa_1$ and $kappa_2$ of $Sigma$ at $P$, achieved along the _principal directions_ of the (unit) tangent vectors at $P$.

The _mean curvature_ of $Sigma$ at $P$ is defined to be $H=(kappa_1 + kappa_2) / 2$. Let $r_1, r_2$ be the radii of curvature corresponding to $kappa_1$ and $kappa_2$. The product of the two principal curvatures is known as the _Gaussian curvature_ of $Sigma$ at $P$, denoted by $K=kappa_1 kappa_2$. We will now heuristically derive the explicit formulas for $H$ and $K$ in terms of $E, F, G, L, M, N$.

Suppose $p in Sigma$. Adopt the matrix notation of $vb(I)$, $#II-matrix$ as in

$
  vb(I)=mat(E, F; F, G), quad #II-matrix=mat(L, M; M, N),
$

to reduce to the optimization problem of

$
  kappa_n=(va(v)^top #II-matrix va(v))/(va(v)^top vb(I) va(v)), quad va(v) in T_p Sigma.
$

We may restrict $va(v)=(v_1, v_2)$ so that the denominator is always $1$, aiming to optimize the numerator. By the method of Lagrange multipliers, we write

$
  cal(L)(va(v), lambda)=va(v)^top #II-matrix va(v)-lambda (va(v)^top vb(I) va(v)-1).
$

The equation $grad cal(L)=vb(0)$ for $grad=(pdv(, v_1), pdv(, v_2), pdv(, lambda))$ can then be decomposed into (where $va(v)=(v_1, v_2)$):

$
  2 L v_1 + 2 M v_2 - lambda (2 E v_1 + 2 F v_2)=0, \
  2 M v_1 + 2 N v_2 - lambda (2 F v_1 + 2 G v_2)=0, \
  (va(v)^top vb(I) va(v)=1).
$

The first two equations can be written as

$
  mat(L - lambda E, M - lambda F; M - lambda F, N - lambda G) va(v)=vb(0).
$ <eq:gaussiancurvaturelambdarootsmatrixvectorvanish>

Let the matrix on the left be denoted by $vb(M)$. In order for non-trivial $(vb(v) eq.not vb(0))$ to exist, we must have $det vb(M)=0$. That is,

$
  & (L - lambda E)(N - lambda G) - (M - lambda F)^2 \
  & wide""=lambda^2 (E G - F^2) + lambda (2 M F - E N - G L) + L N - M^2=0.
$

This is a quadratic giving two solutions for $lambda$. From

$
  grad(va(v)^top #II-matrix va(v))=lambda grad(va(v)^top vb(I) va(v))
$

it is apparent that the roots $lambda_1, lambda_2 in RR$. Moreover, from @eq:gaussiancurvaturelambdarootsmatrixvectorvanish we have

$
  #II-matrix va(v)=lambda vb(I) va(v) ==> lambda=(va(v)^top #II-matrix va(v))/(va(v)^top vb(I) va(v)).
$

Hence, the two roots $lambda_1, lambda_2$ are precisely the principal curvatures. Vieta's formulas give that

$
  K=lambda_1 lambda_2=(L N - M^2)/(E G - F^2), quad H=(E N + G L - 2 M F)/(2 E G - 2 F^2).
$

Now, assume a parameterization of $Sigma$ by $va(r)(u, v)$ (thrice continuously differentiable) such that

$
  upright(I)(u, v)=rho^2 dif u^2 + rho^2 dif v^2=rho^2 (dif u^2 + dif v^2)
$

(which we will later formalize as a _conformal metric_). Then there is an alternate representation of the Gaussian curvature in terms of $rho$.

By definition, $E equiv G equiv rho^2$ while $F equiv 0$. Moreover,

$
  L N & =(va(r)''_(u u) dot (va(r)'_u times va(r)'_v) / norm(va(r)'_u times va(r)'_v))(va(r)''_(v v) dot (va(r)'_u times va(r)'_v) / norm(va(r)'_u times va(r)'_v)) \
  & = (det mat(va(r)''_(u u), va(r)'_u, va(r)'_v) det mat(va(r)''_(v v), va(r)'_u, va(r)'_v)) / (norm(va(r)'_u)^2 norm(va(r)'_v)^2 - (va(r)'_u dot va(r)'_v)^2) \
  & = (det mat(va(r)''_(u u), va(r)'_u, va(r)'_v) det mat(va(r)''_(v v), va(r)'_u, va(r)'_v)) / (E G - F^2) \
  & = 1 / rho^4 det mat(va(r)''_(v v) dot va(r)''_(u u), va(r)''_(v v) dot va(r)'_u, va(r)''_(v v) dot va(r)'_v; va(r)'_u dot va(r)''_(u u), va(r)'_u dot va(r)'_u, va(r)'_u dot va(r)'_v; va(r)'_v dot va(r)''_(u u), va(r)'_v dot va(r)'_u, va(r)'_v dot va(r)'_v).
$

Similarly,

$
  M^2 & = 1 / rho^4 det mat(va(r)''_(u v) dot va(r)''_(u v), rho rho'_v, rho rho'_u; rho rho'_v, rho^2, 0; rho rho'_u, 0, rho^2) \
  & = 1 / rho^4 [va(r)''_(u v) dot va(r)''_(u v) rho^4 - rho^4 (rho'_v)^2 - rho^4 (rho'_u)^2] \
  & = va(r)''_(u v) dot va(r)''_(u v) - (rho'_v)^2 - (rho'_u)^2.
$

By differentiation of the equations

$
  va(r)'_u dot va(r)'_v equiv F equiv 0, quad va(r)'_u dot va(r)'_u equiv E equiv G equiv va(r)'_v dot va(r)'_v equiv rho^2,
$

we have

$
  va(r)''_(u u) dot va(r)'_v + va(r)'_u dot va(r)''_(u v) equiv 0, quad va(r)''_(u v) dot va(r)'_v + va(r)'_u dot va(r)''_(v v) equiv 0,
$ <eq:gaussian_curvature_of_surface_conformal_zero_differentiation>

and

$
  2 va(r)''_(u u) dot va(r)'_u equiv 2 rho rho'_u equiv 2 va(r)''_(u v) dot va(r)'_v, quad 2 va(r)''_(u v) dot va(r)'_u equiv 2 rho rho'_v equiv 2 va(r)''_(v v) dot va(r)'_v.
$ <eq:gaussian_curvature_of_surface_conformal_nonzero_differentiation>

Substituting @eq:gaussian_curvature_of_surface_conformal_nonzero_differentiation into @eq:gaussian_curvature_of_surface_conformal_zero_differentiation then gives

$
  va(r)''_(u u) dot va(r)'_v=-rho rho'_v, quad (va(r)''_(v v) dot va(r)'_u=-rho rho'_u).
$

Differentiating these give

$
  va(r)'''_(u u v) dot va(r)'_v + va(r)''_(u u) dot va(r)_(v v)=- (rho'_v)^2 - rho rho''_(v v), \ (va(r)'''_(v v u) dot va(r)'_u + va(r)''_(v v) dot va(r)_(u u)=- (rho'_u)^2 - rho rho''_(u u)).
$

Differentiating the inner two expressions of @eq:gaussian_curvature_of_surface_conformal_nonzero_differentiation, we have

$
  va(r)'''_(u u v) dot va(r)'_v + va(r)''_(u v) dot va(r)_(u v)=(rho'_u)^2 + rho rho''_(u u), \ (va(r)'''_(v v u) dot va(r)'_u + va(r)''_(u v) dot va(r)_(u v)=(rho'_v)^2 + rho rho''_(v v)).
$

It follows that

$
  va(r)''_(u v) dot va(r)_(u v) - va(r)''_(u u) dot va(r)''_(v v)=(rho'_u)^2 + (rho'_v)^2 + rho laplacian rho,
$

where $laplacian$ here is $pdv(, u, 2, style: "horizontal") + pdv(, v, 2, style: "horizontal")$. Then

$
  L N & = 1 / rho^4 det mat(va(r)''_(v v) dot va(r)''_(u u), -rho rho'_u, rho rho'_v; rho rho'_u, rho^2, 0; -rho rho'_v, 0, rho^2) \
  & = 1 / rho^4 [va(r)''_(v v) dot va(r)''_(u u) rho^4 + rho^4 (rho'_u)^2 + rho^4 (rho'_v)^2] \
  & = va(r)''_(v v) dot va(r)''_(u u) + (rho'_u)^2 + (rho'_v)^2,
$

and

$
  M^2 & = 1 / rho^4 det mat(va(r)''_(u v) dot va(r)''_(u v), rho rho'_v, rho rho'_u; rho rho'_v, rho^2, 0; rho rho'_u, 0, rho^2) \
  & = 1 / rho^4 [va(r)''_(u v) dot va(r)''_(u v) rho^4 - rho^4 (rho'_v)^2 - rho^4 (rho'_u)^2] \
  & = va(r)''_(u v) dot va(r)''_(u v) - (rho'_v)^2 - (rho'_u)^2.
$

Combining the two expressions, we have

$
  K & =(L N - M^2)/(E G - F^2)=(va(r)''_(v v) dot va(r)''_(u u) + 2 (rho'_u)^2 + 2 (rho'_v)^2 - va(r)''_(u v) dot va(r)''_(u v)) / rho^4 \
  & = ((rho'_u)^2 + (rho'_v)^2 - rho laplacian rho) / rho^4 = -(1)/(rho^2) laplacian(log rho).
$ <eq:gaussiancurvatureofsurface_gaussiancurvatureconformalmetricformula>

To understand the motivation for which $dif s^2$ is said to be conformal, consider two curves in the $u-v$ plane, parameterized by $bold(gamma)_1 (t)=(u_1 (t), v_1 (t))$ and $bold(gamma)_2 (t)=(u_2 (t), v_2 (t))$ such that $bold(gamma)_1 (0)=bold(gamma)_2 (0)=vb(w)_0=(u_0, v_0)$. Their images via $vb(r)$ are $vb(alpha)_1 (t)=vb(r) compose bold(gamma)_1 (t)$ and $vb(alpha)_2 (t)=vb(r) compose bold(gamma)_2 (t)$ so that they intersect at some point $P in Sigma$. Let $bold(gamma)'_1 (0)=vb(v)_1=a vb(e)_u + b vb(e)_v$ and $bold(gamma)'_2 (0)=vb(v)_2=c vb(e)_u + d vb(e)_v$ be two tangent vectors. Then the corresponding vectors in $T_P Sigma$ are

$ dif vb(r)_(vb(w)_0) (vb(v)_1)=a dif vb(r)_(vb(w)_0) (vb(e)_u) + b dif vb(r)_(vb(w)_0) (vb(e)_v) $ and $ dif vb(r)_(vb(w)_0) (vb(v)_2)=c dif vb(r)_(vb(w)_0) (vb(e)_u) + d dif vb(r)_(vb(w)_0) (vb(e)_v). $

Since#footnote[In more modern formulations of differential geometry, differentials (known as pushforwards) are functions mapping tangent vectors to tangent vectors. The notion came from the realization that "changes" of functions are best described in terms of a direction of change. Then basis vectors themselves became partial derivative operators two give the second set of equalities, which is a consequence of the more abstract notion of ``duality.'' For the remaining sections, this structural viewpoint is not considered.] $vb(e)_u=pdv(, u)$, $vb(e)_v=pdv(, v)$ and $dif vb(r)_(vb(w)_0) (pdv(, u))=evaluated(pdv(vb(r), u))_(vb(w)_0)$, $dif vb(r)_(vb(w)_0) (pdv(, v))=evaluated(pdv(vb(r), v))_(vb(w)_0)$. Then

$
  dif vb(r)_(vb(w)_0) (vb(v)_1)=a vb(r)'_u (vb(w)_0) + b vb(r)'_v (vb(w)_0), quad dif vb(r)_(vb(w)_0) (vb(v)_2)=c vb(r)'_u (vb(w)_0) + d vb(r)'_v (vb(w)_0).
$

The angle $theta_(u v)$ between $vb(v)_1$ and $vb(v)_2$ on the $u-v$ plane satisfies

$
  cos theta_(u v)=(vb(v)_1 dot vb(v)_2)/(norm(vb(v)_1) norm(vb(v)_2))=(a c + b d)/(sqrt(a^2 + b^2) sqrt(c^2 + d^2)),
$

while the angle $theta_Sigma$ between the two tangent vectors in $T_P Sigma$ satisfies

$
  cos theta_Sigma&=evaluated(((a vb(r)'_u + b vb(r)'_v) dot (c vb(r)'_u + d vb(r)'_v)) / (norm(a vb(r)'_u + b vb(r)'_v) norm(c vb(r)'_u + d vb(r)'_v)))_(vb(w)_0)\ &=evaluated((rho^2 (a c + b d)) / (sqrt(a^2 rho^2 + b^2 rho^2) sqrt(c^2 rho^2 + d^2 rho^2)))_(vb(w)_0)=cos theta_(u v).
$
