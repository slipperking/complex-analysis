#import "/lib.typ": *

=== Solution to the Dirichlet Problem on a Disk

A fundamental problem in the theory of partial differential equations is to find a function $u$ that is continuous on the closed disk $overline(D(0, R))$, harmonic on the open disk $D(0, R)$, and identically equal to a given boundary function on $partial D(0, R)$. This is known as the _Dirichlet problem_ (for Laplace's equation) on a disk.

#theorem[
  For a continuous function $phi in C^0 (partial D(0, R))$, the unique real-valued solution $u in C^0 (overline(D(0, R)))$ that solves
  $
    laplacian u(z) = 0 quad forall z in D(0, R), \
    u(z) = phi(z) quad forall z in partial D(0, R)
  $
  is given by the Poisson integral formula:
  $ u(z) = integral_0^(2 uppi) phi(zeta) P(zeta, z) dif tau, $ <eq:dirichlet_problem_with_laplace_equation_solution>
  where $zeta = R ee^(ii tau)$.
] <thm:dirichlet_problem_with_laplace_equation_solution>
#figure-wrapper([
  #figure(
    {
      let radius = 5
      quick-plot(x-max: radius + .5, y-max: radius + .5, canvas: {
        import cetz.draw: *

        let zeta-angle = 10deg
        let xi-angle = 80deg
        let z-angle = 60deg
        let z-radius = 4.75
        let var-zeta = ((0, 0), 100%, zeta-angle, (radius, 0))

        let var-xi = ((0, 0), 100%, xi-angle, (radius, 0))
        let var-z = ((0, 0), 100%, z-angle, (z-radius, 0))
        let auxiliary1 = ((0, 0), 100%, zeta-angle, (z-radius, 0))

        arc-center((0, 0), start: 0deg, stop: 90deg, radius: 5, stroke: .7pt)

        line((0, 0), var-zeta)
        line((0, 0), var-xi)
        line((0, 0), var-z)
        line(var-z, var-xi)
        line(var-z, auxiliary1)
        line(var-z, var-zeta, stroke: (thickness: .7pt, dash: "dotted"))

        arc-center(
          (0, 0),
          start: zeta-angle,
          stop: z-angle,
          radius: 0.4,
          stroke: (thickness: .7pt, dash: "dotted"),
          name: "arc-greater-than-delta/2",
        )
        arc-center(
          (0, 0),
          start: zeta-angle,
          stop: xi-angle,
          radius: 1.5,
          stroke: (thickness: .7pt, dash: "dotted"),
          name: "arc-greater-than-delta",
        )
        arc-center(
          (0, 0),
          start: 0deg,
          stop: zeta-angle,
          radius: 2,
          stroke: (thickness: .7pt, dash: "dotted"),
          name: "arc-tau",
        )
        arc-center(
          (0, 0),
          start: 0deg,
          stop: xi-angle,
          radius: 1,
          stroke: (thickness: .7pt, dash: "dotted"),
          name: "arc-theta-alt",
        )

        let var-diff = sub-vectors(var-z, var-xi)
        get-ctx(ctx => {
          let (_, var-z, var-xi, var-diff) = cetz.coordinate.resolve(ctx, var-z, var-xi, var-diff)
          arc(
            var-z,
            start: cvector.angle2((0, 0, 0), var-diff),
            stop: xi-angle - 180deg,
            radius: cvector.len(var-diff),
            stroke: (
              dash: "dotted",
              thickness: .7pt,
            ),
          )
          arc(
            var-z,
            start: z-angle,
            stop: xi-angle,
            radius: cvector.len(var-z),
            stroke: (
              dash: "dotted",
              thickness: .7pt,
            ),
            name: "z-radius-arc",
          )

          content(var-zeta, anchor: "west", [$zeta$], padding: .1cm)
          content(var-z, anchor: "east", [$z$], padding: .1cm)
          content(var-xi, anchor: "south", [$xi$], padding: .1cm)

          content((auxiliary1, 50%, (0, 0)), anchor: "south", [$rho$])
          content((var-z, 50%, var-xi), anchor: "south", [
            #text(10pt, box(
              outset: 1pt,
              fill: luma(100%, 80%),
              math.equation(numbering: none, block: true, $ inline(eta^-) $),
            ))
          ])
          content((var-xi, 50%, (0, 0)), anchor: "west", [$R$])
          content((var-z, 50%, (0, 0)), anchor: "west", [$rho>R/2$])

          content("arc-greater-than-delta/2.arc-center", anchor: "south-west", [#text(10pt, $frac(delta, 2)^+$)])
          content("arc-theta-alt.arc-center", anchor: "south-west", [#text(10pt, $theta.alt$)])
          content("arc-greater-than-delta.arc-center", anchor: "south-west", [#text(10pt, $delta^+$)])
          content("arc-tau.arc-center", anchor: "west", [$tau$])

          content((var-z, 50%, var-zeta), anchor: "east", [
            #text(10pt, box(
              outset: 1pt,
              fill: luma(100%, 80%),
              math.equation(numbering: none, block: true, $ inline(abs(zeta - z)^-) $),
            ))
          ])
        })
      })
    },
    caption: [$zeta$, $xi$, and $z$ when $abs(theta.alt - tau) > delta$, with distances marked. The use of $+$ and $-$ denote a value more or less (respectively) than the preceding value.],
  ) <fig:dirichlet_problem_with_laplace_equation_solution_secondintegral>
])
#proof[
  Since
  $
    P(zeta, z) = 1 / (4 uppi) ((zeta + z) / (zeta - z) + (overline(zeta) + overline(z)) / (overline(zeta) - overline(z))),
  $
  from @eq:laplaciancomplexform, we have that $laplacian_z P(zeta, z) = 4 pdv(P(zeta, z), z, overline(z)) = 0$ (since each term is independent of either $z$ or $overline(z)$). Moreover, by @thm:leibnizintegralrule, @eq:dirichlet_problem_with_laplace_equation_solution gives that
  $
    laplacian u(z)
    = laplacian integral_0^(2 uppi) phi(zeta) P(zeta, z) dif tau
    = integral_0^(2 uppi) laplacian [phi(zeta) P(zeta, z)] dif tau
    = 0.
  $

  Our goal is to show that for fixed $xi = R ee^(ii theta.alt) in partial D(0, R)$,
  $ lim_(z -> xi \ z in D(0, R)) u(z) = phi(xi). $ <eq:dirichlet_problem_with_laplace_equation_solution_limittoboundary>

  Let $R/2 < rho < R$ and $z = rho ee^(ii theta)$. Then with $zeta = R ee^(ii tau)$,
  $
    abs(phi(xi) - u(z))
    = abs(phi(R ee^(ii theta.alt)) - u(rho ee^(ii theta)))
    = abs(phi(R ee^(ii theta.alt)) - integral_0^(2 uppi) P(zeta, z) phi(zeta) dif tau).
  $

  For a constant harmonic function identically equal to $1$, we get $integral_0^(2 uppi) P(zeta, z) dif tau = 1$ from @eq:poissonintegralformula2. Hence,
  $
    abs(phi(xi) - u(z))
    = abs(integral_0^(2 uppi) P(zeta, z) (phi(R ee^(ii theta.alt)) - phi(zeta)) dif tau).
  $

  By the continuity of $phi$, $forall epsilon > 0$, $exists delta > 0$ such that $forall abs(theta.alt - tau) < delta < uppi / 2$, we have that $abs(phi(R ee^(ii theta.alt)) - phi(zeta)) < epsilon$. Therefore,
  $
    abs(phi(xi) - u(z))
    &= abs((integral_(abs(theta.alt - tau) < delta) + integral_(abs(theta.alt - tau) > delta)) P(zeta, z) (phi(R ee^(ii theta.alt)) - phi(zeta)) dif tau) \
    &= abs(I_1 + I_2) <= abs(I_1) + abs(I_2).
  $

  Since the Poisson kernel is non-negative,
  $
    abs(I_1) < integral_(abs(theta.alt - tau) < delta) epsilon P(zeta, z) dif tau < epsilon integral_0^(2 uppi) P(zeta,z) dif tau = epsilon.
  $

  By continuity of $phi$ on the compact set $partial D(0, R)$, by @thm:heinecantor, it is bounded and $M = sup_(abs(zeta) = R) abs(phi(zeta))$ is finite. The Poisson kernel can be rewritten as
  $ P(zeta, z) = (R^2 - rho^2) / (2 uppi abs(zeta - z)^2), $
  where $zeta = R ee^(ii tau)$ and $z = rho ee^(ii theta)$, with $abs(theta.alt - tau) > delta$. Then $exists eta > 0$ such that $forall z$ with $abs(xi - z) < eta$ (small enough so that $abs(theta.alt - theta)< delta/2$),
  $ abs(theta - tau) > delta / 2 $ <eq:dirichlet_problem_with_laplace_equation_solution_constraint1>
  and
  $ (rho > R / 2) quad "and" quad eta <= R / 2 $ <eq:dirichlet_problem_with_laplace_equation_solution_constraint2>
  as in @fig:dirichlet_problem_with_laplace_equation_solution_secondintegral. Then,
  $
    abs(zeta - z)^2 > 4 rho^2 sin(delta / 4)^2 > 1 / 2 R^2 (1 - cos(delta / 2)).
  $

  We aim to prove that $abs(I_2) < epsilon$. Since $abs(phi(R ee^(ii theta.alt)) - phi(zeta)) < 2 M$, the condition is satisfied if
  $
    integral_(abs(theta.alt - tau) > delta) (R^2 - rho^2) / (uppi R^2 (1 - cos(delta / 2))) dif tau
    < 2 (R^2 - rho^2) / (R^2 (1 - cos(delta / 2)))
    < epsilon / (2 M),
  $
  and from rearrangement, we can tighten the constraint with:
  $
    R^2 - rho^2 < epsilon / (4 M) R^2 (1 - cos(delta / 2)),
  $
  which follows in particular from
  $
    R - rho < epsilon / (8 M) R (1 - cos(delta / 2)).
  $ <eq:dirichlet_problem_with_laplace_equation_solution_constraint3>

  From @fig:dirichlet_problem_with_laplace_equation_solution_secondintegral, it is evident that $R - rho < abs(xi - z) < eta$. For @eq:dirichlet_problem_with_laplace_equation_solution_constraint1 to be true, we previously had that $abs(theta.alt - theta) < delta / 2$. In other words
  $ abs(xi - z)^2 < R^2 + rho^2 - 2 R rho cos(delta / 2). $

  Obviously, this is satisfied if $abs(xi - z)^2 < R^2 / 2 (1 - cos(delta / 2)) < 2 rho^2 (1 - cos(delta / 2))$. This can be rearranged into
  $ abs(xi - z) < R sqrt((1 - cos(delta / 2))/2) = R sin(delta / 4). $
  Therefore, we can choose
  $
    eta = min(
      epsilon / (8 M) R (1 - cos(delta / 2)),
      R sin(delta / 4),
      R / 2,
    ) > 0,
  $
  under which @eq:dirichlet_problem_with_laplace_equation_solution_constraint1, @eq:dirichlet_problem_with_laplace_equation_solution_constraint2, and @eq:dirichlet_problem_with_laplace_equation_solution_constraint3 are satisfied.

  Hence, $forall epsilon > 0$, $exists eta > 0$ such that $forall z$ with $0 < abs(xi - z) < eta$, we have $abs(phi(xi) - u(z)) < 2 epsilon$. Then @eq:dirichlet_problem_with_laplace_equation_solution_limittoboundary follows.

  We will now show that $u(z)$ is unique. Assume that $v != u$ on $overline(D(0, R))$ also solves the problem. Then $u - v$ is harmonic and vanishes on $partial D(0, R)$. By the Poisson Integral Formula (@eq:poissonintegralformula2),
  $
    u(z) - v(z)
    = integral_0^(2 uppi) P(zeta, z) (u(zeta) - v(zeta)) dif tau
    = 0
  $
  for all $z in D(0, R)$. Hence $u equiv v$, a contradiction.
]
