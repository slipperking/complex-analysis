#import "/lib.typ": *

=== Solution to the Dirichlet Problem on a Disk

A fundamental problem in the theory of partial differential equations is to find a function $u$ that is continuous on the closed disk $overline(D(0, R))$, harmonic on the open disk $D(0, R)$, and identically equal to a given boundary function on $partial D(0, R)$. This is known as the _Dirichlet problem_ (for Laplace's equation) on a disk.

#theorem[
  For a continuous function $phi in C^0(partial D(0, R))$, the unique real-valued solution $u in C^0(overline(D(0, R)))$ that solves
  $
    Delta u(z) = 0 quad forall z in D(0, R), \
    u(z) = phi(z) quad forall z in partial D(0, R)
  $
  is given by the Poisson integral formula:
  $ u(z) = integral_0^(2 uppi) phi(zeta) P(zeta, z) dif tau, $ <eq:dirichletproblemwithlaplaceequationsolution>
  where $zeta = R ee^(ii tau)$.
] <thm:dirichletproblemwithlaplaceequationsolution>

#proof[
  Since
  $
    P(zeta, z) = 1 / (4 uppi) ((zeta + z) / (zeta - z) + (overline(zeta) + overline(z)) / (overline(zeta) - overline(z))),
  $
  from @eq:laplaciancomplexform, we have that $Delta_z P(zeta, z) = 4 pdv(P(zeta, z), z, overline(z)) = 0$ (since each term is independent of either $z$ or $overline(z)$). Then by @thm:leibnizintegralrule, @eq:dirichletproblemwithlaplaceequationsolution becomes
  $
    Delta u(z)
    = Delta integral_0^(2 uppi) phi(zeta) P(zeta, z) dif tau
    = integral_0^(2 uppi) Delta [phi(zeta) P(zeta, z)] dif tau
    = 0.
  $

  Our goal is to show that for fixed $xi = R ee^(ii theta.alt) in partial D(0, R)$,
  $ lim_(z -> xi, z in D(0, R)) u(z) = phi(xi). $ <eq:dirichletproblemwithlaplaceequationsolution_limittoboundary>

  Let $0 < rho < R$ and $z = rho ee^(ii theta)$. Then,
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
  $ abs(I_1) < epsilon integral_(abs(theta.alt - tau) < delta) P(zeta, z) dif tau < epsilon. $

  #figure(
    cetz.canvas({
      import cetz.draw: *

      let var-zeta = (4.924, 0.868)
      let var-z = (2.2, 4.2)
      let var-xi = (0.868, 4.924)
      let auxiliary1 = (4.667952, 0.822864)

      line((-0.5, 0), (5.5, 0), mark: (end: "stealth"), stroke: .8pt)
      line((0, -0.5), (0, 5.5), mark: (end: "stealth"), stroke: .8pt)

      arc-center((0, 0), start: 0deg, stop: 90deg, radius: 5, stroke: .5pt)

      line((0, 0), var-zeta, stroke: .5pt)
      line((0, 0), var-xi, stroke: .5pt)
      line((0, 0), var-z, stroke: .5pt)
      line(var-z, var-xi, stroke: .5pt)
      line(var-z, auxiliary1, stroke: .5pt)
      line(var-z, var-zeta, stroke: (paint: black, thickness: .5pt, dash: "dashed"))

      arc-center((0, 0), start: 10deg, stop: 62.35deg, radius: 0.4, stroke: .5pt)
      arc-center((0, 0), start: 10deg, stop: 80deg, radius: 1.5, stroke: .5pt)
      arc-center((0, 0), start: 0deg, stop: 10deg, radius: 2, stroke: .5pt)
      arc-center((0, 0), start: 0deg, stop: 80deg, radius: 1, stroke: .5pt)

      arc(var-z, start: -27.65deg, stop: -100deg, radius: 1.516, stroke: (paint: black, thickness: .5pt, dash: "dashed"))
      arc(var-z, start: 62.35deg, stop: 80deg, radius: 4.741, stroke: (paint: black, thickness: .5pt, dash: "dotted"))

      content((5.03, 0.87), anchor: "west", [$zeta$])
      content((2.2, 4.08), anchor: "north", [$z$])
      content((0.87, 5.02), anchor: "south", [$xi$])

      content((2.462, 0.434), anchor: "south", [$rho$])
      content((1.534, 4.562), anchor: "north", [#text(8pt, $eta^-$)])
      content((0.434, 2.462), anchor: "west", [$R$])
      content((1.1, 2.1), anchor: "west", [$rho$])

      content((0.57, 0.75), anchor: "north", [#text(8pt, $frac(delta, 2)^+$)])
      content((0.95, 0.95), anchor: "north", [#text(8pt, $theta.alt$)])
      content((1.25, 1.55), anchor: "north", [#text(8pt, $delta^+$)])
      content((2.2, 0.4), anchor: "north", [$tau$])

      content((3.35, 2.48), anchor: "east", [#text(8pt, $|zeta - z|^-$)])
    }),
    caption: [$zeta$, $xi$, and $z$ when $abs(theta.alt - tau) > delta$, with distances marked. The use of $+$ and $-$ denote a value more or less (respectively) than the preceding value.],
  ) <fig:dirichletproblemwithlaplaceequationsolution_secondintegral>


  By continuity of $phi$ on the compact set $partial D(0, R)$, by @thm:heinecantor, it is bounded and $M = sup_(abs(zeta) = R) abs(phi(zeta))$ is finite. The Poisson kernel can be rewritten as
  $ P(zeta, z) = (R^2 - rho^2) / (2 uppi abs(zeta - z)^2), $
  where $zeta = R ee^(ii tau)$ and $z = rho ee^(ii theta)$, with $abs(theta.alt - tau) > delta$. Then $exists eta > 0$ such that $forall z$ with $abs(xi - z) < eta$,
  $ abs(theta - tau) > delta / 2 $ <eq:dirichletproblemwithlaplaceequationsolution_constraint1>
  and
  $ rho > R / 2 quad "and" quad eta <= R / 2 $ <eq:dirichletproblemwithlaplaceequationsolution_constraint2>
  (these can be arbitrarily chosen for different resulting bounds) as in @fig:dirichletproblemwithlaplaceequationsolution_secondintegral. Then,
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
  $ <eq:dirichletproblemwithlaplaceequationsolution_constraint3>

  From @fig:dirichletproblemwithlaplaceequationsolution_secondintegral, it is evident that $R - rho < abs(xi - z) < eta$. In order for @eq:dirichletproblemwithlaplaceequationsolution_constraint1 to be true, we can enforce that $abs(theta.alt - theta) < delta / 2$. In other words
  $ abs(xi - z)^2 < R^2 + rho^2 - 2 R rho cos(delta / 2). $

  Obviously, this is satisfied if $abs(xi - z)^2 < R^2 / 2 (1 - cos(delta / 2)) < 2 rho^2 (1 - cos(delta / 2))$. This can be rearranged into
  $ abs(xi - z) < R sqrt(2) / 2 sqrt(1 - cos(delta / 2)) = R sin(delta / 4). $
  Therefore, we can choose
  $
    eta = min(
      epsilon / (8 M) R (1 - cos(delta / 2)),
      R sin(delta / 4),
      R / 2,
    ) > 0,
  $
  under which @eq:dirichletproblemwithlaplaceequationsolution_constraint1, @eq:dirichletproblemwithlaplaceequationsolution_constraint2, and @eq:dirichletproblemwithlaplaceequationsolution_constraint3 are satisfied.

  Hence, $forall epsilon > 0$, $exists eta > 0$ such that $forall z$ with $0 < abs(xi - z) < eta$, we have $abs(phi(xi) - u(z)) < 2 epsilon$. Then @eq:dirichletproblemwithlaplaceequationsolution_limittoboundary follows.

  We will now show that $u(z)$ is unique. Assume that $v != u$ on $overline(D(0, R))$ also solves the problem. Then $u - v$ is harmonic and vanishes on $partial D(0, R)$. By the Poisson Integral Formula (@eq:poissonintegralformula2),
  $
    u(z) - v(z)
    = integral_0^(2 uppi) P(zeta, z) (u(zeta) - v(zeta)) dif tau
    = 0
  $
  for all $z in D(0, R)$. Hence $u equiv v$, a contradiction.
]
