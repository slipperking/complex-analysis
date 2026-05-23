#import "/lib.typ": *

== Boundary Continuity of Biholomorphisms

Suppose $Omega_1$ and $Omega_2$ are two regions in the complex plane such that there is a biholomorphism $phi$ from $Omega_1$ to $Omega_2$. Naturally, we are concerned about the existence of a continuous extension of $phi$ to $overline(Omega_1)$.

In fact, it is almost always true that such an extension exists. We will give three examples of this phenomenon, each with increasing regularity assumptions on the boundaries $partial Omega_1$ and $partial Omega_2$:

1. If $partial Omega_1$ and $partial Omega_2$ are two Jordan curves, then $phi$ (whose existence is given by the Riemann Mapping Theorem or @thm:riemann_mapping) extends homeomorphically to $partial Omega_1$ (@thm:osgood_taylor_caratheodory).
2. If $partial Omega_1$ and $Omega_2$ are $C^oo$, then $phi$ extends continuously and injectively to $partial Omega_1$ and is $C^oo$ on $overline(Omega_1)$.
3. If $partial Omega_1$ and $partial Omega_2$ are real-analytic (the boundary is parameterizable by functions such that at every point, there is a power series expansion that converge to the function on a neighborhood), then $phi$ extends analytically past $partial Omega_1$ (@thm:osgood_taylor_caratheodoryrealanalyticboundaries).

#example[
  The biholomorphism $phi : DD -> DD inter HH^+$ defined by
  $
    phi : z |-> (1 + ii sqrt((ii (1 - z)) / (1 + z))) / (1 - ii sqrt((ii (1 - z)) / (1 + z)))
  $
  extends continuously but not differentiably to $plus.minus 1$. The boundary of $DD inter HH^+$ is piecewise $C^oo$.
]

#theorem("Osgood--Taylor--Carathéodory")[
  Suppose that $Omega_1$ and $Omega_2$ are two bounded regions in $CC$ such that $partial Omega_1$ and $partial Omega_2$ each comprises a single Jordan curve. If $phi : Omega_1 -> Omega_2$ is a biholomorphism (provided by the Riemann Mapping Theorem in @thm:riemann_mapping), then $exists tilde(phi) : overline(Omega_1) -> overline(Omega_2)$ homeomorphic such that $tilde(phi)|_(Omega_1) equiv phi$ (the restriction of $tilde(phi)$ to $Omega_1$ agrees with $phi$).
] <thm:osgood_taylor_caratheodory>

#proof[
  The theorem will be first proven in the case that $Omega_1$ is the unit disk $DD$. The general case will then be reduced to this special case.

  Let $mu_1, mu_2 : [0, 1] -> overline(DD)$ be two curves such that $mu_1([0, 1)), mu_2([0, 1)) subset DD$ and $mu_1(1) = 1$, $mu_2(1) = 1$ (as in @fig:osgood_taylor_caratheodory_unitdiskandVandmu). We now aim to show that $lim_(t -> 1^-) phi(mu_1(t)) = lim_(t -> 1^-) phi(mu_2(t))$ (existence and equality).

  Let $V = DD inter D(1, 1 / 2)$, which has a finite area. Since $phi$ is a biholomorphism, $phi(V) subset Omega_2$ also has a finite area (call this $M$) and is simply connected since its complement in $Omega_2$, $phi(DD without V)$, is connected.

  #let hatch = diagonal-stripes(
    size: 3pt,
    angle: 45deg,
    thickness: 0.2pt,
  )

  #figure-wrapper(
    [
      #figure(
        cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let var-D-rad = 1.875
          set-style(
            mark: (fill: black),
          )

          circle((0, 0), radius: var-D-rad, name: "D")
          circle((var-D-rad, 0), radius: var-D-rad / 2, name: "small-circle")

          boolean("D", "small-circle", op: "intersection", fill: hatch, name: "V")

          catmull(
            (-0.5, 1.2),
            (-0.2, 0.8),
            (0.3, 1),
            (0.6, 0.9),
            (0.8, 0.6),
            (0.9, 0.4),
            (1.3, 0.45),
            (1.875, 0),
            tension: 0.5,
            mark: (end: ">>"),
            name: "mu_1",
          )

          catmull(
            (-0.5, -0.9),
            (-0.9, -0.8),
            (-0.3, 0.1),
            (0.1, -0.5),
            (0.4, -0.8),
            (0.8, -0.4),
            (1.0, -0.5),
            (1.3, -0.6),
            (1.875, 0),
            tension: 0.5,
            mark: (end: ">>"),
            name: "mu_2",
          )

          content((1.3, 0.2), math-rect($V$), anchor: "north")
          content("mu_2.0", math-rect($mu_2$), anchor: "north", padding: 4pt)
          content("mu_1.0", math-rect($mu_1$), anchor: "east", padding: 2pt)
          content((name: "D", anchor: 40%), math-rect($partial DD$), anchor: "north-east")
        }),
        caption: [Configuration of $V$, and possible $mu_1, mu_2$.],
      ) <fig:osgood_taylor_caratheodory_unitdiskandVandmu>
    ],
    [
      #figure(
        cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let lendpoint = (-1.5, -0.75)
          let rendpoint = (1.65, -1.35)
          let lendpoint-ext-ang = -150deg
          let rendpoint-ext-ang = -30deg
          let lendpoint-ext = (lendpoint, 6, lendpoint-ext-ang, (rel: lendpoint, to: (1, 0)))
          let rendpoint-ext = (rendpoint, 6, rendpoint-ext-ang, (rel: rendpoint, to: (1, 0)))

          catmull(
            (3.6, 0.9),
            (2.1, 2.55),
            (-1.2, 0.75),
            lendpoint,
            (-1.1, -1.3),
            (-0.75, -1.5),
            (0.5, -1.4),
            rendpoint,
            tension: 0.5,
            close: true,
            name: "Omega_2",
          )


          floating(merge-path(
            {
              catmull(
                lendpoint,
                (-1.1, -0.4),
                (-0.6, -0.5),
                (-0.1, 0.2),
                (0.4, 0.5),
                (0.9, 0.1),
                (1.2, -0.2),
                rendpoint,
                tension: 0.5,
              )
              line(rendpoint, rendpoint-ext)
              line(rendpoint-ext, lendpoint-ext)
            },
            name: "phi(V)-ext-testline",
            close: true,
            stroke: none,
          ))

          boolean(
            "Omega_2",
            "phi(V)-ext-testline",
            op: "intersection",
            fill: hatch,
            name: "phi(V)",
          )

          content((0.2, -0.5), math-rect($phi(V)$), anchor: "north")
          content((name: "Omega_2", anchor: 90%), math-rect($partial Omega_2$), anchor: "north-west")
        }),
        caption: [Possible positioning of $phi(V)$ relative to $Omega_2$.],
      ) <fig:osgood_taylor_caratheodory_phi_of_V>
    ],
  )

  Let $K subset Omega_2$ be compact. Since $phi^(-1)$ is continuous, it maps $K$ to a compact set $phi^(-1)(K)$ (a function providing the compactness of the pre-image of every compact set is more generally known as _proper_). This implies that for any sequence ${z_j}_(j in NN) subset DD$ with accumulation points only in $partial DD$, ${phi(z_j)}_(j in NN)$ will have its accumulation points in $partial Omega_2$ (because otherwise, there would be a corresponding subsequence of ${z_j}_(j in NN)$ that converges to a point in $DD$). Therefore, $phi(V)$ does not have relatively compact closure in $Omega_2$ (a representation of a possible configuration in @fig:osgood_taylor_caratheodory_phi_of_V).

  #figure-wrapper(
    [
      #figure(
        cetz.canvas(length: 1cm, {
          import cetz.draw: *
          set-style(
            mark: (fill: black),
          )

          let var-D-rad = 1.875
          circle((0, 0), radius: var-D-rad, name: "D")
          boolean(
            circle((0, 0), radius: var-D-rad, name: "D"),
            circle((var-D-rad, 0), radius: var-D-rad * 0.32, name: "gamma_r-test", stroke: none),
            op: "intersection",
          )

          circle((var-D-rad, 0), radius: var-D-rad / 2, name: "small-circle")

          circle((var-D-rad, 0), radius: 1.5pt, fill: black, stroke: none)

          line((2.1, -1.5), (1.8, -0.65), mark: (end: "stealth"), name: "theta_0(r)-arrow")
          line((2.1, 1.5), (1.8, 0.65), mark: (end: "stealth"), name: "-theta_0(r)-arrow")
          line((0, 0.75), (1.22, 0.1), mark: (end: "stealth"), name: "inequality-arrow")
          content(
            (var-D-rad, 0),
            text(size: 9pt)[$1$],
            anchor: "west",
            padding: 3pt,
          )

          content((0.7, 0.2), text(size: 9pt)[$V$], anchor: "north")

          content(
            "inequality-arrow.0",
            text(size: 8pt)[#math-rect($-theta_0(r) < theta < theta_0(r)$)],
            anchor: "south",
            padding: 2pt,
          )

          content(
            "-theta_0(r)-arrow.0",
            text(size: 9pt)[$-theta_0(r)$],
            anchor: "south",
            padding: 3pt,
          )
          content(
            "theta_0(r)-arrow.0",
            text(size: 9pt)[$theta_0(r)$],
            anchor: "north",
            padding: 3pt,
          )

          content(
            (1.5, 0.3),
            text(size: 9pt)[$gamma_r$],
            anchor: "north",
          )

          content((name: "D", anchor: 40%), math-rect($partial DD$), anchor: "north-east")
        }),
        caption: [Possible configuration of $gamma_r$.],
      ) <fig:osgood_taylor_caratheodory_gamma_r_configuration>
    ],
    [
      #figure(
        cetz.canvas(length: 1cm, {
          import cetz.draw: *

          let lendpoint = (-1.5, -0.75)
          let rendpoint = (1.65, -1.35)

          catmull(
            (3.6, 0.9),
            (2.1, 2.55),
            (-1.2, 0.75),
            lendpoint,
            (-1.1, -1.3),
            (-0.75, -1.5),
            (0.5, -1.4),
            rendpoint,
            tension: 0.5,
            close: true,
            name: "Omega_2",
          )
          catmull(
            lendpoint,
            (-1.1, -0.4),
            (-0.6, -0.5),
            (-0.1, 0.2),
            (0.4, 0.5),
            (0.9, 0.1),
            (1.2, -0.2),
            rendpoint,
            tension: 0.5,
          )

          catmull(
            (-1.11, -1.31),
            (-1, -0.8),
            (-0.5, -0.9),
            (-0.2, -0.5),
            (0.2, -0.7),
            (0.7, -1.1),
            (0.5, -1.41),
            tension: 0.5,
          )

          content((0.3, -0), math-rect($phi(V)$), anchor: "north")
          content((name: "Omega_2", anchor: 90%), math-rect($partial Omega_2$), anchor: "north-west")
          content(
            (0, -0.9),
            text(size: 10pt)[#math-rect($phi(gamma_r)$)],
            anchor: "north",
          )
        }),
        caption: [Concept configuration of $phi(gamma_r)$],
      ) <fig:osgood_taylor_caratheodory_subwedgeimage>
    ],
  )

  For $0 < r < 1 / 2$, we now introduce polar coordinates $(r, theta)$ centered at $1$ with angles offset by $uppi$. Let $theta_0(r)$ be the supremum of $theta$ for fixed $r$ such that $1 - r ee^(ii theta) in V$. Define $gamma_r : (-theta_0(r), theta_0(r)) -> V$ to be the curve with $theta |-> 1 - r ee^(ii theta)$ (as in @fig:osgood_taylor_caratheodory_gamma_r_configuration).

  #lemma[
    Let $l_r$ be the length of $phi compose gamma_r$. Then
    $
      integral_0^(1 / 2) l_r^2 / (uppi r) dr
    $
    is finite.
  ] <lem:osgood_taylor_caratheodory_length_integral_finiteness>

  #proof[
    Notice that
    $
      l_r &= integral_(phi compose gamma_r ([-theta_0(r), theta_0(r)])) abs(dz) = integral_(-theta_0(r))^(theta_0(r)) abs(dv(phi(1 - r ee^(ii theta)), theta)) dtheta \ &= integral_(-theta_0(r))^(theta_0(r)) r abs(phi'(1 - r ee^(ii theta))) dtheta.
    $
    Hence,
    $
      integral_0^(1 / 2) l_r^2 / (uppi r) dr &= integral_0^(1 / 2) 1 / (uppi r) [integral_(-theta_0(r))^(theta_0(r)) abs(phi'(1 - r ee^(ii theta))) r dtheta]^2 dr \
      &= integral_0^(1 / 2) 1 / (uppi r) [integral_(-theta_0(r))^(theta_0(r)) abs(phi'(1 - r ee^(ii theta))) sqrt(r) sqrt(r) dtheta]^2 dr \
      & <= integral_0^(1 / 2) 1 / (uppi r) [integral_(-theta_0(r))^(theta_0(r)) abs(phi'(1 - r ee^(ii theta)))^2 r dtheta] [integral_(-theta_0(r))^(theta_0(r)) r dtheta] dr \
      & <= integral_0^(1 / 2) integral_(-theta_0(r))^(theta_0(r)) abs(phi'(1 - r ee^(ii theta)))^2 r dtheta dr \
      &= integral.double_V abs(phi'(z))^2 dx dy = M,
    $
    where the last step uses the Jacobian matrix (see @thm:lusinarea).
  ]

  Assume that $exists c > 0, epsilon > 0$ such that $l_r >= c$ for all $0 < r < epsilon$. Then, this implies that
  $
    integral_0^(1 / 2) l_r^2 / (uppi r) dr >= integral_0^epsilon l_r^2 / (uppi r) dr >= integral_0^epsilon c^2 / (uppi r) dr = c^2 / uppi integral_0^epsilon dr / r,
  $
  which is a divergent integral. This contradicts @lem:osgood_taylor_caratheodory_length_integral_finiteness. Therefore, we must have $liminf_(r -> 0^+) l_r = 0$. Thus, there exists a sequence ${r_j}_(j in NN) subset (0, 1 / 2)$ such that $r_j -> 0$ and $l_(r_j) -> 0$ as $j -> oo$.

  #proposition[
    For each such $r_j$ as above, the limits
    $
      lim_(theta -> theta_0(r_j)^-) phi(1 - r_j ee^(ii theta)) quad "and" quad lim_(theta -> -theta_0(r_j)^+) phi(1 - r_j ee^(ii theta))
    $
    exist.
  ] <prop:osgood_taylor_caratheodory_limits_existence>

  #proof[
    Since $l_(r_j)$ is finite, $forall epsilon > 0$, $exists delta > 0$ such that for $theta > theta_0(r_j) - delta$,
    $
      integral_theta^(theta_0(r_j)) r abs(phi'(1 - r ee^(ii theta.alt))) dif theta.alt < epsilon.
    $
    Then for any $theta', theta'' in (theta_0(r) - delta, theta_0(r))$,
    $
      abs(phi(1 - r ee^(ii theta')) - phi(1 - r ee^(ii theta''))) <= length(phi(gamma_r([theta', theta'']))) \
      = integral_(theta')^(theta'') r abs(phi'(1 - r ee^(ii theta.alt))) dif theta.alt < epsilon,
    $
    implying that ${phi(1 - r ee^(ii theta))}_(theta -> theta_0(r_j)^-)$ is Cauchy and hence convergent. The proof for the other limit follows symmetrically.
  ]

  #lemma[
    Let $tau = partial Omega_2$. Then there is a function $eta(delta)$ defined for sufficiently small $delta$, such that $eta(delta) -> 0$ as $delta -> 0^+$, such that for all $a, b in tau$ satisfying $abs(a - b) <= delta$, then there is exactly one curve in $tau$ with endpoints $a$ and $b$ with diameter $<= eta(delta)$.
  ] <lem:osgood_taylor_caratheodory_jordan_curve_arc_diameter>

  #proof[
    Since $tau$ is a Jordan curve, it admits a homeomorphic parametrization $psi : S^1 -> tau$, and $psi$ is a bicontinuous bijection (onto its image) between compact Hausdorff spaces, so $psi^(-1)$ is continuous.

    Since $psi^(-1)$ is uniformly continuous on the compact set $tau$, for every $epsilon > 0$ there exists $delta' > 0$ such that if $abs(p - q) < delta'$ with $p, q in tau$, then $abs(psi^(-1)(p) - psi^(-1)(q)) < epsilon$.

    In particular, choose $delta_0 > 0$ small enough so that whenever $abs(psi(zeta) - psi(zeta')) <= delta_0$, then $abs(zeta - zeta') < 2$.

    Now define
    $
      eta(delta) = sup{diam rho : abs(psi(zeta) - psi(zeta')) <= delta}
    $
    for $0 < delta <= delta_0$, where $rho = psi(sigma)$ and $sigma subset.eq S^1$ is the shorter arc connecting $zeta, zeta' in S^1$.

    First, $eta(delta) -> 0$ as $delta -> 0^+$; if not, there exists $epsilon > 0$ and a sequence $delta_n -> 0^+$ with $eta(delta_n) >= epsilon$. Then for each $n in NN$, there are $zeta_n, zeta'_n in S^1$ with $abs(psi(zeta_n) - psi(zeta'_n)) <= delta_n$ such that the shorter arc on $S^1$ between $zeta_n$ and $zeta'_n$ has image $rho_n$ with $diam rho_n >= epsilon$. By compactness of $S^1$, we may assume (by passing to a subsequence if necessary) that $zeta_n -> zeta$ and $zeta'_n -> zeta'$. Then $psi(zeta) = lim_(n -> oo) psi(zeta_n) = lim_(n -> oo) psi(zeta'_n) = psi(zeta')$, so $zeta = zeta'$. But then the images of the shorter arcs between each $zeta_n$ and $zeta'_n$ must have diameters tending to zero (by continuity of $psi$), contradicting that $diam rho_n >= epsilon$ for each $n$.

    To finish, choose $0 < delta_1 < delta_0$ small enough that $eta(delta_1) < 1 / 2 diam tau$ (possible since $eta(delta) -> 0$ as $delta -> 0$ and $diam tau > 0$).

    Then the assertion holds for all $delta <= delta_1$ with this $eta$: for $a, b in tau$ with $abs(a - b) <= delta <= delta_1$, let $zeta, zeta' in S^1$ with $psi(zeta) = a$, $psi(zeta') = b$. The shorter arc on $S^1$ between $zeta, zeta'$ has image $rho$ with $diam rho <= eta(delta)$. The image of the other arc on $tau$ between $a, b$, $tilde(rho)$, satisfies
    $
      diam tilde(rho) + diam rho >= diam tau,
    $
    which is sufficient to imply that
    $
      diam tilde(rho) >= diam tau - diam rho > diam tau - 1 / 2 diam tau = 1 / 2 diam tau > eta(delta).
    $
    Thus, exactly one arc's image (specifically, the image of the shorter arc on $S^1$) has diameter $<= eta(delta)$.
  ]

  By the uniqueness as described by @lem:osgood_taylor_caratheodory_jordan_curve_arc_diameter, for any two points $a, b$ sufficiently close together, we now identify the unique curve in $tau$ (joining $a$ and $b$) with diameter less than $eta(abs(a - b))$ as the _smaller arc_ of $tau$ joining $a$ and $b$, denoted by $tau_(a, b)$.
  #figure-wrapper([
    #figure(
      grid(
        columns: 2,
        gutter: 1em,
        cetz.canvas(length: 1cm, {
          import cetz.draw: *

          let lendpoint = (-1.5, -0.75)
          let rendpoint = (1.65, -1.35)

          catmull(
            (3.6, 0.9),
            (2.1, 2.55),
            (-1.2, 0.75),
            lendpoint,
            (-1.1, -1.3),
            (-0.75, -1.5),
            (0.5, -1.4),
            rendpoint,
            tension: 0.5,
            close: true,
            stroke: 1.5pt,
          )

          catmull(
            (-1.5, -0.75),
            (-1.1, -0.4),
            (-0.6, -0.5),
            (-0.1, 0.2),
            (0.4, 0.5),
            (0.9, 0.1),
            (1.2, -0.2),
            (1.65, -1.35),
            tension: 0.5,
            stroke: 0.5pt,
          )

          catmull(
            (-1.1, -1.3),
            (-1, -0.8),
            (-0.5, -0.9),
            (-0.2, -0.5),
            (0.2, -0.7),
            (0.7, -1.1),
            (0.5, -1.4),
            tension: 0.5,
            stroke: 1.5pt,
            name: "phi_gamma_r_j",
          )

          content((name: "phi_gamma_r_j", anchor: 60%), text(size: 9pt)[$phi(gamma_r_j)$], anchor: "south-west")
          content("phi_gamma_r_j.0", math-rect($a_j$), anchor: "north-east", padding: 2pt)
          content("phi_gamma_r_j.100%", math-rect($b_j$), anchor: "north", padding: 2pt)
        }),

        cetz.canvas(length: 1cm, {
          import cetz.draw: *

          let lendpoint = (-1.5, -0.75)
          let rendpoint = (1.65, -1.35)

          catmull(
            (3.6, 0.9),
            (2.1, 2.55),
            (-1.2, 0.75),
            lendpoint,
            (-1.1, -1.3),
            (-0.75, -1.5),
            (0.5, -1.4),
            rendpoint,
            tension: 0.5,
            close: true,
            stroke: 1.5pt,
          )
          catmull(
            (-1.51, -0.751),
            (-1.1, -0.4),
            (-0.6, -0.5),
            (-0.1, 0.2),
            (0.4, 0.5),
            (0.9, 0.1),
            (1.2, -0.2),
            (1.6499, -1.3501),
            tension: 0.5,
            stroke: 0.5pt,
          )
          catmull(
            (-0.75, -1.5),
            (-0.8, -1.1),
            (-0.5, -0.9),
            (-0.2, -0.5),
            (0.2, -0.7),
            (0.6, -0.9),
            (0.4, -1.0),
            (0.4, -1.2),
            tension: 0.5,
            close: true,
            stroke: 1.5pt,
            name: "phi_gamma_r_j",
          )

          content("phi_gamma_r_j.45%", text(size: 9pt)[$phi(gamma_(r_j))$], anchor: "south-west")
          content("phi_gamma_r_j.0", $p_j$, anchor: "north")
        }),
      ),
      caption: [Two possibilities for the endpoints of $phi(gamma_(r_j))$],
    ) <fig:osgood_taylor_caratheodory_curveimagetwocases>
  ])

  #lemma[
    Let ${r_j}_(j in NN)$ be the sequence such that $l_(r_j) -> 0$ as $j -> oo$ (in the discussion preceding @prop:osgood_taylor_caratheodory_limits_existence). Then, for each $j in NN$, either
    $
      Omega_2 in.rev a_j & = lim_(theta -> theta_0(r_j)^-) phi(1 - r_j ee^(ii theta)) \
                         & != lim_(theta -> -theta_0(r_j)^+) phi(1 - r_j ee^(ii theta)) = b_j in partial Omega_2
    $ <eq:osgood_taylor_caratheodory_twoalternatives_differentpoints>
    or
    $
      lim_(theta -> theta_0(r_j)^-) phi(1 - r_j ee^(ii theta)) = lim_(theta -> -theta_0(r_j)^+) phi(1 - r_j ee^(ii theta)) = p_j in partial Omega_2
    $ <eq:osgood_taylor_caratheodory_twoalternatives_samepoint>
    is satisfied. The two situations are represented in @fig:osgood_taylor_caratheodory_curveimagetwocases.
  ] <lem:osgood_taylor_caratheodory_twoalternatives>

  #proof[
    By virtue of @prop:osgood_taylor_caratheodory_limits_existence, both described limits exist. Similarly, since any sequences ${1 - r_j ee^(ii theta)}_(theta -> theta_0(r_j)^-)$ and ${1 - r_j ee^(ii theta)}_(theta -> -theta_0(r_j)^+)$ approach $partial DD$, their images under $phi$ approach $partial Omega_2$ by properness (refer to the discussions preceding @lem:osgood_taylor_caratheodory_length_integral_finiteness). Therefore, both limits must lie in $partial Omega_2$, and the conclusion follows.
  ]

  For fixed $r_j$, in the case of @eq:osgood_taylor_caratheodory_twoalternatives_differentpoints, let $phi(gamma_(r_j))$ be the described curve joining $a_j$ and $b_j$ (where $gamma_(r_j)$ is represented by the arc as labeled in @fig:osgood_taylor_caratheodory_subwedgeimage). Except for the two boundary points, the curve $phi(gamma_(r_j))$ lies entirely in $Omega_2$ since $gamma_(r_j) subset V subset DD$. Let the _shorter_ arc on $Omega_2$ joining the two points $a_j$ and $b_j$ be denoted by $tau_j$. Therefore, the curve $phi(gamma_(r_j)) union tau_j$ forms a Jordan curve (simplicity by injectivity).

  In the event that @eq:osgood_taylor_caratheodory_twoalternatives_samepoint is assumed, let $tau_j = {p_j}$, and $phi(gamma_(r_j))(union tau_j)$ forms a Jordan curve. By the Jordan Curve Theorem (@thm:jordancurve), the selected curve bounds a region, which we will denote by $W_j subset.eq Omega_2$.

  For each $j$, let $V_j = {1 - r ee^(ii theta) : 0 < r < r_j, -theta_0(r) < theta < theta_0(r)}$. Since $phi(gamma_(r_j))$ is a curve with endpoints $a_j$ and $b_j$ (or $p_j$) and lies in $Omega_2$ except for its endpoints, it splits $Omega_2$ into two disconnected regions, $W_j$ or $Omega_2 without overline(W_j)$. Since $gamma_(r_j)$ splits $DD$ into two regions, one of which being $V_j$, the image $phi(V_j)$ is either $W_j$ or $Omega_2 without overline(W_j)$.

  #proposition[
    As $j -> oo$,
    $
      diam W_j -> 0 quad "and" quad op("area")(W_j) -> 0.
    $
  ] <prop:osgood_taylor_caratheodory_vanishing_areas_and_diameters>

  #proof[
    @lem:osgood_taylor_caratheodory_jordan_curve_arc_diameter provides the existence of $eta$ such that $diam tau_j <= eta(l_(r_j))$ for sufficiently large $j$ (since $abs(a_j - b_j) <= l_(r_j)$ or $0$ for the $p_j$ case) such that $eta(l_(r_j)) -> 0$ as $j -> oo$.

    Let $D_j = D(a_j, l_(r_j) + eta(l_(r_j)))$ (or $D_j = D(p_j, l_(r_j) + eta(l_(r_j)))$ in the case of the same point) for each $j$. By the previous diameter estimate, the entire Jordan curve $phi(gamma_(r_j)) union tau_j$ lies in $D_j$, and hence $W_j subset D_j$. This implies that
    $
      op("area")(W_j) <= op("area")(D_j) = uppi (l_(r_j) + eta(l_(r_j)))^2 -> 0 quad "as" quad j -> oo.
    $ <eq:osgood_taylor_caratheodory_vanishing_areas_and_diameters_areaestimation2>
    qedhere
  ]

  #lemma[
    For sufficiently large $j in NN$, $phi(V_j) = W_j$.
  ] <lem:osgood_taylor_caratheodory_matching_areas>

  #proof[
    For fixed $j$, let $T_j$ be the complementary region of $V_j$ in $DD$ (as $DD without overline(V_j)$). Then for an arbitrary $w_0 in W_j$, there exists a point $z_0 in DD$ (specifically, either in $T_j$ or $V_j$) such that $phi(z_0) = w_0$.

    1. If $z_0 in V_j$, then $phi(z_0) in W_j$ and connectivity suffices to ensure that $phi(V_j) = W_j$.
    2. If $z_0 in T_j$, then from $phi(z_0) in W_j$, connectivity implies that $phi(T_j) subset.eq W_j$. Now by the Lusin Area Theorem (@thm:lusinarea),
      $
        op("area")(phi(T_j)) = op("area")(Omega_2) - op("area")(phi(V_j)) = op("area")(Omega_2) - integral.double_(V_j) abs(phi'(z)) dx dy.
      $
      Since $V_j$ shrinks to the empty set, $integral.double_(V_j) abs(phi'(z)) dx dy -> 0$ as $j -> oo$, and hence
      $
        op("area")(phi(T_j)) -> op("area")(Omega_2).
      $ <eq:osgood_taylor_caratheodory_matching_areas_areaestimation>
      @prop:osgood_taylor_caratheodory_vanishing_areas_and_diameters implies that
      $
        op("area")(W_j) -> 0
      $
      as $j -> oo$. Hence, for sufficiently large $j$, we cannot have $phi(T_j) subset.eq W_j$ (by the induced contradiction with @eq:osgood_taylor_caratheodory_matching_areas_areaestimation). Therefore, $phi(T_j) = Omega_2 without overline(W_j)$ and $phi(V_j) = W_j$. qedhere
  ]

  #lemma[
    If the two complex curves $mu_1, mu_2 : [0, 1] -> overline(DD)$ map $1$ to $1$ such that $mu_1([0, 1)), mu_2([0, 1)) subset DD$, then
    $
      lim_(t -> 1^-) phi(mu_1(t)) = lim_(t -> 1^-) phi(mu_2(t))
    $
    exist and are equal.
  ] <lem:osgood_taylor_caratheodory_limits_existence_and_equality>

  #proof[
    By @lem:osgood_taylor_caratheodory_matching_areas and @prop:osgood_taylor_caratheodory_vanishing_areas_and_diameters, $exists j in NN$ such that $diam W_j < epsilon$ and $phi(V_j) = W_j$. Since $mu_1(t), mu_2(t) -> 1$ as $t -> 1^-$, $exists S in (0, 1)$ such that $forall t : S < t < 1$, $abs(mu_1(t) - 1) < r_j$ and $abs(mu_2(t) - 1) < r_j$. Recall the definition of $V_j$ as the set of points ${1 - r ee^(ii theta) : 0 < r < r_j, -theta_0(r) < theta < theta_0(r)}$; then $mu_1(t), mu_2(t) in V_j$ for all $S < t < 1$. Therefore,
    $
      phi(mu_1(t)), phi(mu_2(t)) in W_j
    $
    for all $S < t < 1$. Then
    $
      abs(phi(mu_1(t)) - phi(mu_2(t))) <= diam W_j < epsilon
    $
    for all $S < t < 1$, thus equality is derived. Moreover, $inter.big_j overline(W_j)$ (shrinks to) is a single point, which is precisely the prescribed limit.
  ]

  #corollary[
    There is a continuous extension of $phi$ to $partial DD$.
  ] <cor:osgood_taylor_caratheodory_continuous_extension>

  #proof[
    Let $zeta in partial DD$. Let $gamma : [0, 1] -> overline(DD)$ satisfy $phi([0, 1)) subset.eq DD$ and $gamma(1) = 1$. Suppose $phi_zeta : z |-> phi compose (z zeta)$. Then by @lem:osgood_taylor_caratheodory_limits_existence_and_equality, $lim_(t -> 1^-) phi_zeta (gamma(t))$ exists and is independent of the choice of $gamma$. Now define $tilde(phi)(zeta)$ to be the _unique_ value of this limit and let $tilde(phi)|_(DD) = phi$. // show this extension is cont.

    Fix $epsilon > 0$ and suppose ${z_n}_(n in NN) subset overline(DD)$ be a sequence such that $z_n -> 1$ as $n -> oo$. By @lem:osgood_taylor_caratheodory_matching_areas and @prop:osgood_taylor_caratheodory_vanishing_areas_and_diameters, $exists j in NN$ such that $diam W_j < epsilon$ and $phi(V_j) = W_j$. By the geometry of $V_j$, $exists N in NN$ such that $forall n > N$, there exists some $0 < t_0 = t_0(n) < 1$ such that the line segment $(t_0 z_n, z_n)$ lies in $V_j$. By the previous result, we have
    $
      phi(t z_n) in W_j ==> tilde(phi)(z_n) = lim_(t -> 1^-) phi(t z_n) in overline(W_j).
    $
    Hence, any two $z_n, z_m$ for $n, m > N$ satisfy $abs(tilde(phi)(z_n) - tilde(phi)(z_m)) <= diam W_j < epsilon$. Hence, ${tilde(phi)(z_n)}_(n in NN)$ is Cauchy and hence convergent to $tilde(phi)(1)$.

    This is sufficient to show that $tilde(phi)$ is continuous at $1$. Indeed, assuming otherwise implies $exists epsilon > 0$ such that $forall delta > 0$, $exists z_delta in overline(DD)$ within $delta$ apart from $1$ such that $abs(tilde(phi)(z_delta) - tilde(phi)(1)) >= epsilon$. Let $delta_n = 1 / n$, and hence $delta_n -> 0$ with the sequence ${z_(delta_n)}_(n in NN)$ converging to $1$. By the previous result, $tilde(phi)(z_(delta_n)) -> tilde(phi)(1)$, which contradicts $abs(tilde(phi)(z_(delta_n)) - tilde(phi)(1)) >= epsilon$ for all $n in NN$. The same argument can be repeated to show that $tilde(phi)$ is continuous at every point of $partial DD$.
  ]

  #proposition[
    Let $f in C^0(overline(DD))$ such that $f$ is holomorphic on $DD$. If there exists an open arc $gamma subset.eq partial DD$ such that $f equiv c$ on $gamma$ ($c$ is some complex constant), then $f$ is constant on $DD$.
  ] <prop:holomorphicondiskcontinuousonclosureconstantonarcconstancy>

  #proof[
    Without loss of generality, assume $c = 0$. If $gamma = partial DD$, then by the continuity of $abs(f)$, it attains its maximum somewhere in $overline(DD)$ (by the Extreme Value Theorem in @thm:extremevalue). If $abs(f)$ attains its maximum at some $z_0 in DD$, it must be an isolated extrema (otherwise the Identity Theorem implies constancy on all of $DD$), and thus the Maximum Modulus Principle (@thm:maximum_modulus) implies that $f$ is constant and subsequently identically zero. If $abs(f)$ attains its maximum on $partial DD$, the conclusion follows trivially.

    Hence we may assume that $exists z in partial DD$ such that $f(z) != 0$. Without loss of generality, we assume $z = -1$ (generality by applying a rotation). Then the Möbius transform $phi.alt : z |-> ii (1 - z) / (1 + z)$ (in the inverse form of @ex:biholomorphismsupperhalfplanetounitdisk) maps $gamma$ bijectively to a connected segment $Gamma subset RR$. Then the function $f compose phi.alt^(-1)$ maps $Gamma = phi.alt(gamma)$ to ${0}$ and is continuous on $HH^+ union RR$ and holomorphic on $HH^+$. Let $U$ define the upper half-disk with diameter $Gamma$. By the Schwarz Reflection Principle (@thm:riemannschwarzreflection), $f compose phi.alt^(-1)$ may be analytically continued to a function $tilde(g)$ on $U union Gamma union {overline(z) : z in U}$. Since the zero set $Gamma$ has an accumulation point in $U union Gamma union {overline(z) : z in U}$, the Identity Theorem (@thm:identity) implies that $g$ vanishes on all of $U union Gamma union {overline(z) : z in U} -> U -> HH^+$, or equivalently, that $f$ vanishes on $DD$.
  ]

  #lemma[
    The extension $tilde(phi)$ of the biholomorphism $phi$ to $overline(DD)$ is injective.
  ]

  #proof[
    #figure-wrapper([
      #figure(
        rect(
          width: 100%,
          height: 5cm,
          stroke: gray + 0.8pt,
          inset: 10pt,
        )[
          #align(center + horizon)[Figure placeholder. Raw TikZ preserved below.]
        ],
        caption: [Two line segments $alpha$ and $beta$ mapping to a Jordan curve bounding $W$],
      ) <fig:osgood_taylor_caratheodory_injectivityofextension>
    ])

    /*
    \begin{figure}
        \centering
        \vspace{0pt}
        \begin{tikzpicture}
            \draw[thick] (-1.875, 0) arc (180:-180:1.875);
            \draw[thick] ({1.875*cos(20)}, {1.875*sin(20)}) -- (0,0);
            \draw[thick] ({1.875*sqrt(3)/2}, {-1.875/2}) -- (0,0);

            \node[anchor=west] at ({1.875*cos(20)}, {1.875*sin(20)}) {\footnotesize\(\zeta\)};
            \node[anchor=west] at ({1.875*cos(30)}, {1.875*sin(-30)}) {\footnotesize\(\zeta'\)};
            \node[anchor=east] at (0,0) {0};
            \node[anchor=north] at (-1.7, -1.2) {\footnotesize\(\partial\mathbb{D}\)};
            \node[anchor=north] at (0.9, 0.7) {\footnotesize\(\alpha\)};
            \node[anchor=north] at (0.8, -0.53) {\footnotesize\(\beta\)};
            \node[anchor=north] at (1.2, 0.2) {\(U_1\)};
            \node[anchor=center] at (-1, 0) {\(U_2\)};
        \end{tikzpicture}\hfill
        \begin{tikzpicture}
            \draw[thick] plot[smooth cycle] coordinates {
                (3.6,0.9) (2.1,2.55) (-1.2,0.75) (-1.5,-0.75) (-1.1,-1.3) (-0.75,-1.5) (0.5,-1.4) (1.65,-1.35)
            };
            \draw[thick] plot[smooth] coordinates {
                (-0.75,-1.5) (-0.8,-0.7)
                (-0.4,-0.5) (-0.1,0.2) (0.4,0.5)
                (0.7,0.8) (1.1,1.2)
            };
            \draw[thick] plot[smooth] coordinates {
                (-0.75,-1.5) (-0.6,-1.1)(-0.2,-0.9)
                (0.8,-0.7) (1.4,0.1) (1.8,0.5) (1.2,0.9) (1.1,1.2)
            };
            \node[anchor=south] at (1.1,1.17) {\footnotesize\(\widetilde{\varphi}(0)\)};
            \node[anchor=north] at (-0.75,-1.51) {\footnotesize\(\widetilde{\varphi}(\zeta)=\widetilde{\varphi}\qty(\zeta')\)};
            \node[anchor=north] at (0.4,0) {\(W\)};
            \node[anchor=center] at (2.75,-0.75) {\footnotesize\(\partial\Omega_2\)};
        \end{tikzpicture}
        \caption{Two line segments \(\alpha\) and \(\beta\) mapping to a Jordan curve bounding \(W\)}\label{fig:osgood_taylor_caratheodory_injectivityofextension}
    \end{figure}
    */

    Notice that $tilde(phi)(DD) = Omega_2$, and from the earlier discussion regarding properness, $tilde(phi)(S^1) subset.eq partial Omega_2$. By the biholomorphy on $DD$, it thus suffices to show that $tilde(phi)|_(partial DD)$ is one-to-one, or that for any two points $zeta, zeta' in partial DD$ such that $tilde(phi)(zeta) = tilde(phi)(zeta')$, $zeta = zeta'$. Assume, for the sake of contradiction, that $zeta != zeta'$. The straight line segment connecting $0$ to $zeta$ (denoted $alpha$), and the straight line segment joining $0$ and $zeta'$ (denoted $beta$) then split $DD$ into two domains $U_1$ and $U_2$, and $tilde(phi)(alpha) union tilde(phi)(beta)$ forms a Jordan curve enclosing some region $W$. See @fig:osgood_taylor_caratheodory_injectivityofextension. By connectivity, either $U_1$ or $U_2$ maps to $W$. Without loss of generality, assume $tilde(phi)(U_1) = W$. Then it follows that
    $
      partial DD inter partial U_1 subset.eq partial Omega_2 inter partial W = {tilde(phi)(zeta)} = {tilde(phi)(zeta')}.
    $
    Then the arc of $partial DD$ in $partial U_1$ maps to a constant, which by @prop:holomorphicondiskcontinuousonclosureconstantonarcconstancy, implies that $tilde(phi)$ is constant, which is an impossibility. (The same argument is used for $U_2$)

    Therefore, by the induced contradiction, we must have $zeta = zeta'$, which implies the injectivity of $tilde(phi)$.
  ]

  Thus, the preceding results gives the construction of an injective, continuous extension of $phi$ to $overline(DD)$. Moreover, the extension is onto since a continuous function maps compact sets to compact sets.

  Now consider the general case for arbitrary $Omega_1$ as in the theorem statement.

  By the preceding results, there exist biholomorphisms $phi_1 : DD -> Omega_1$ and $phi_2 : DD -> Omega_2$, and the Riemann Mapping Theorem (@thm:riemann_mapping) implies the existence of a biholomorphism $phi : Omega_1 -> Omega_2$. Moreover, $phi_1$ and $phi_2$ extend continuously to $tilde(phi)_1$ and $tilde(phi)_2$, respectively.

  The restriction $tilde(phi)_1|_(partial DD)$ forms a continuous bijection to $partial Omega_1$. We now aim to show that $(tilde(phi)_1|_(partial DD))^(-1)$ is continuous. This is in fact a specific case of a famous topological argument that we will avoid. By the final argument of the proof of @cor:osgood_taylor_caratheodory_continuous_extension, it suffices to show that any sequence ${z_n}_(n in NN) subset partial Omega_2$ that converges to a point $z in partial Omega_2$ has a corresponding sequence ${w_n}_(n in NN) = {(tilde(phi)_1|_(partial DD))^(-1)(z_n)}_(n in NN)$ in $partial DD$ which converges to $w = (tilde(phi)_1|_(partial DD))^(-1)(z)$. Assume, for contradiction, that some sequence as labeled above does not converge to $w$. By the Bolzano--Weierstrass Theorem (@thm:bolzanoweierstrass), some subsequence of ${w_n}_(n in NN)$, denoted by ${w_(n_k)}_(k in NN)$, converges to $w_oo in partial DD$ (which is not equal to $w$). Then $tilde(phi)_1(w_(n_k)) -> tilde(phi)_1(w_oo)$ as $k -> oo$ by the continuity of $(tilde(phi)_1)$. However, each $tilde(phi)_1(w_(n_k)) = z_(n_k) -> z = tilde(phi)_1(w)$. Hence, $tilde(phi)_1(w) = tilde(phi)_1(w_oo)$ which by injectivity, implies $w = w_oo$, which is a contradiction. Thus $tilde(phi)_1$ establishes a homeomorphism between $overline(DD)$ and $overline(Omega_1)$. A similar deduction gives the same result for $tilde(phi)_2$.

  Thus, $psi = phi_2^(-1) compose phi compose phi_1 in Aut(DD)$, which by @thm:holomorphicautomorphismgrouponunitdisk, is the composition of a Möbius transformation and a rotation, which extends injectively and continuously to some function $tilde(psi)$ on $overline(DD)$. Thus, we define $tilde(phi) = tilde(phi)_2 compose tilde(psi) compose tilde(phi)_1^(-1)$ to be the composition of three continuous functions, defining a continuous extension of $phi$, completing the proof.
]

The second case pertaining to $C^oo$ boundaries will be proved later. We now entertain the third.

#theorem[
  Let $Omega_1$ and $Omega_2$ be two regions in $CC$ each bounded by a single real-analytic Jordan curve. Then a biholomorphism $phi : Omega_1 -> Omega_2$ can be analytically continued to a neighborhood of $overline(Omega_1)$.
] <thm:osgood_taylor_caratheodoryrealanalyticboundaries>

#proof[
  The Osgood--Taylor--Carathéodory Theorem (@thm:osgood_taylor_caratheodory) suffices to extend $phi$ to $overline(Omega_1)$ continuously (continue to denote the extension with $phi$) such that $phi(partial Omega_1) = partial Omega_2$.

  Fix $p in partial Omega_1$ and let $q = phi(p) in partial Omega_2$. Because $partial Omega_1$ is real-analytic, there exists some open interval $I$ and a real-analytic function $eta_1 : I -> partial Omega_1$ such that $eta_1(0) = p$ and $eta_1'(t) != 0$ for $t in I$. By the analytic continuation via power series, $eta_1$ can be analytically continued to a region $N_1 supset.eq I$ on which $eta_1'$ does not vanish and $eta_1$ is univalent (by @thm:nonvanishingderivativeunivalentonneighborhood) and conformally maps to a neighborhood $V_p in.rev p$. Then $phi.alt = eta_1^(-1) : V_p -> N_1$ maps $V_p inter partial Omega_1$ to $N_1 inter RR$ and $p$ to $0$.

  Similarly, $V_q subset CC$ there exists a neighborhood $V_q in.rev q$ and a corresponding complex neighborhood $N_2 in.rev 0$ such that $eta_2 : N_2 -> V_q$ is a biholomorphism with $eta_2(0) = q$. Define $psi = eta_2^(-1) : V_q -> N_2$ which maps $V_q inter partial Omega_2$ to $N_2 inter RR$.

  For $psi compose phi compose phi.alt^(-1)$ to be defined on some set $U$, we must have $phi compose phi.alt^(-1)(U) subset.eq V_q$, which is satisfied when $U subset.eq phi.alt compose phi^(-1)(V_q inter overline(Omega_2))$. The image $phi.alt compose phi^(-1)(V_q inter partial Omega_2)$ then is an open interval $I' subset RR$ containing $0$. Since $phi.alt compose phi^(-1)(V_q inter Omega_2)$ either lies entirely above ($HH^+$) or below ($HH^-$) $RR$, without loss of generality we assume it lies entirely in $HH^+$. Let $I'' = (N_1 inter RR) inter I'$ and define $N_1' subset.eq phi.alt compose phi^(-1)(V_q inter Omega_2) inter N_1 subset HH^+$ to be a new region on which $eta_1$ is analytic.

  Then
  $
    psi compose phi compose phi.alt^(-1)(I'') subset.eq psi(V_q inter partial Omega_2) = N_2 inter RR,
  $
  and the composition is of three univalent functions for $z in N_1'$ whose ultimate codomain lies either entirely in $HH^+$ or $HH^-$ (without loss of generality, we assume $HH^+$), and said composition is continuous up to $I''$.

  By the Schwarz Reflection Principle (@thm:riemannschwarzreflection), $psi compose phi compose phi.alt^(-1)$ may be analytically continued from $N_1' -> HH^+$ to a symmetric domain in $N_1$,
  $
    U' = N_1 inter (N_1' union I'' union {overline(z) : z in N_1'}) -> W subset CC
  $
  biholomorphically (where $W$ is a neighborhood of $0$). Since $U'$ is a neighborhood of $0$, the set defined by
  $
    psi compose phi compose phi.alt^(-1)(U') = W ==> phi(V) = psi^(-1)(W),
  $
  where $V = phi.alt^(-1)(U')$ is a neighborhood of $p$ and $psi^(-1)(W)$ is a neighborhood of $q$. Let $V'_p subset.eq V$ be an open disk centered at $p$ and denote the continuation by $phi_p$.

  For every $z in partial Omega_1$, we may construct a neighborhood $V'_z$ and a continuation $phi_z$ of $phi$ on $V'_z$. Now let $z_1, z_2 in partial Omega_1$ be two distinct points such that $V_(z_1) inter V_(z_2) != emptyset$. Obviously, $phi_(z_1) equiv phi_(z_2)$ on $V_(z_1) inter V_(z_2) inter overline(Omega_1) != emptyset$. Hence the Identity Theorem (@thm:identity) implies that $phi_(z_1) equiv phi_(z_2)$ on all of $V_(z_1) inter V_(z_2)$.

  Therefore, the local continuations ${phi_z}_(z in partial Omega_1)$ agree on overlaps and concatenate together to define a single-valued holomorphic extension of $phi$ to a neighborhood of $overline(Omega_1)$.
]

