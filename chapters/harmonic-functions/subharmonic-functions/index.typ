#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Subharmonic Functions],
  route: "subharmonic-functions",
)
Our goal of introducing subharmonic functions is principally to solve the Dirichlet Problem. In a previous section, it was demonstrated that a solution exists for all disks (@eq:poisson-integral-formula-2). Subsequently, one can deduce that a solution in a general domain, if one exists, is unique by the Maximum Principle (@thm:maximum-principle-for-real-harmonic-functions): if two solutions $u,v$ exist, $u-v$ vanishes on the boundary and thus vanishes everywhere.

Historically, the problem itself was heavily motivated by physics. Consider a thin simply connected heat-conducting two-dimensional plate with a smooth boundary that is in thermal equilibrium; as time passes, the temperature remains constant at each point. Consider $u(x,y,t)$ to be the temperature at each point $z = x + ii y$ of the plate at time $t$. The heat equation states that
$ pdv(u, t) equiv k laplacian_(x y) u. $
If the plate is in thermal equilibrium, we have $pdv(u, t) equiv laplacian u equiv 0$, or that its temperature is modeled by a harmonic function. Now artificially fix temperatures at each point along its boundary. Eventually, as time passes, the points within the material will reach thermal equilibrium, and at the same time, there is a harmonic temperature function solving the Dirichlet problem. Therefore, physically, it is very plausible for the solution to exist (and therefore also be unique from the Maximum Principle). However, the situation is considerably more complicated from a rigorous mathematical standpoint.

In fact, the solution will not always exist.
#lbl(
  example[
    Let $U = DD^* = DD without {0}$,
    $ f(z) = cases(1& quad "if" abs(z) = 1, 0& quad "if" z = 0). $
    Then there exists no harmonic function in $DD^*$ with a continuous extension to $f$.
  ],
  <ex:dirichlet-problem-solution-dne-on-punctured-disk>,
)
#proof[
  For the sake of contradiction, assume the existence of a solution $u$.

  If we arbitrarily choose $z_1, z_2 in partial DD$, then $v = u compose (z mapsto z z_1 / z_2)$ is also a solution to the particular problem. We already know solutions are unique from the Maximum Principle, thus $u(z_2) = v(z_2) = u(z_1)$. Therefore the unique solution $u$ is radial ($pdv(u, theta) equiv 0$). Then applying (@eq:laplacian-polar-form),
  $ pdv(u, r, 2) + 1/r pdv(u, r) + 1/r^2 pdv(u, theta, 2) equiv 1/r (r pdv(u, r, 2) + pdv(u, r)) equiv 0, $
  which implies $ pdv(, r) (r pdv(u, r)) equiv 0 ==> r pdv(u, r) equiv c ==> integral dif u equiv integral c / r dr, $
  where $c in RR$ is a constant. Then there exists some second constant $c' in RR$ such that $u(r ee^(ii theta)) = c log r + c'$. Setting $r = 0$ shows that no choice of $c,c'$ allows an extension to $f$.
]
So clearly, there are necessary conditions on $f$ and/or the domain $U$ for a solution to exist. Physically, forcibly fixing the temperature of a single isolated point carries too little weight to influence the nearby points. Furthermore, we found that the radial solution would attain an infinity at the $0$ point (or otherwise constancy), similar to how point masses have infinite density (colloquially modeled by the Dirac delta function).

The following section proves solvability when $partial U$ consists of sufficiently smooth curves (consisting of points which will be deemed to be "regular"). In fact, this hypothesis is much stronger than necessary: for planar domains, the Dirichlet problem is solvable for every continuous boundary function whenever every connected component of $partial U$ contains at least two points. The punctured disk from the previous example fails this condition, since the isolated point 0 forms a singleton boundary component.

The remainder of this section will be dedicated to introducing the concepts and characterizations that are precursory to the proof.
#lbl(
  definition[Subharmonicity][
    Let $U subset.eq CC$ be an open region and let $f:U -> RR$ be continuous.

    We say that $f$ is _subharmonic_ if, whenever $overline(D(p, r)) subset.double U$ and $u : overline(D(p, r)) -> RR$ is harmonic (on a neighborhood) with
    $ f<= u quad "on" quad partial D(p,r), $
    it follows that
    $ f<= u quad "throughout" quad D(p,r). $
  ],
  <def:subharmonicity>,
)
At first glance, the definition may seem a little bloated. However, we aim to provide sufficient intuition. Firstly, the one-dimensional analog of a harmonic function $u$ is one satisfying $dv(u, x, 2) equiv 0 ==> dv(u, x) equiv a ==> u(x) = a x + b$. Consider an arbitrary continuous function $f: I -> RR$, where $I subset.eq RR$ is an open connected set. Then the analogous scenario is: $f$ is subharmonic iff: for any $a, b in I$ and any harmonic (linear) function such that $f(a) <= u(a)$ and $f(b) <= u(b)$, it follows that $f(x) <= u(x)$ for all $x in (a,b)$. This is the criteria for convexity. Therefore, subharmonicity is a higher-dimension generalization of convexity.

Additionally, we note that the harmonicity of $u : overline(D(p, r)) -> RR$ can be weakened to simply $D(p,r)$ with continuity up to $partial D(p,r)$:
#lbl(
  proposition[
    Let $U subset.eq CC$ be an open region and let $f:U -> RR$ be continuous. Then $f$ is _subharmonic_ iff: whenever $overline(D(p, r)) subset.double U$ and $u in C(overline(D(p, r)))$ is real-harmonic in $D(p, r)$ with
    $ f<= u quad "on" quad partial D(p,r), $
    it follows that
    $ f<= u quad "throughout" quad D(p,r). $
  ],
  <prop:subharmonicity-weakened-to-continuity-on-boundary-harmonicity-in-interior>,
)
#proof[
  The reverse implication (stated condition implies @def:subharmonicity) is immediate: if the stated condition holds for $f$ and $u$ is harmonic on a neighborhood of $overline(D(p,r))$, then $u$ is also continuous on $overline(D(p,r))$ and harmonic in $D(p,r)$ and therefore the stated inequality can be obtained. Thus the stated condition implies the definition of subharmonicity.

  Conversely, suppose that $f$ is subharmonic in the sense of @def:subharmonicity. Let $overline(D(p,r)) subset.double U$, and let $u in C(overline(D(p,r)))$ be real-harmonic in $D(p,r)$ such that $f <= u$ on $partial D(p,r)$. We must show that the stated condition holds, or that $f <= u$ throughout $D(p,r)$.

  Fix $epsilon > 0$. Since $f-u$ is uniformly continuous on $overline(D(p,r))$ and satisfies $f-u <= 0$ on $partial D(p,r)$, there exists $rho in (0,r)$, sufficiently close to $r$, such that $f-u <= epsilon$ on $partial D(p,rho)$. Equivalently, $f <= u + epsilon$ on $partial D(p,rho)$.

  Since $u$ is harmonic in $D(p,r)$, the function $u+epsilon$ is harmonic on a neighborhood of $overline(D(p,rho))$. By the subharmonicity of $f$, $f <= u + epsilon$ throughout $D(p,rho)$.

  Now let $z in D(p,r)$ be arbitrary. Choosing $rho$ above so that $abs(z-p) < rho < r$, we obtain $f(z) <= u(z) + epsilon$. As this holds for every $epsilon>0$, it follows that $f(z) <= u(z)$. Since $z$ was arbitrary, $f <= u$ throughout $D(p,r)$.
]
By the Maximum Principle, we have the following characterization:
#proposition[
  A harmonic function $f: U -> RR$ (where $U subset.eq CC$ is an open region) is subharmonic.
]
#proof[
  For any $overline(D(p, r)) subset.double U$ and $u : overline(D(p, r)) -> RR$ harmonic such that $f <= u$ on $partial D(p,r)$, $f - u$ is harmonic on $overline(D(p,r))$ and non-positive on the boundary circle. By the Maximum Principle, for any $z in D(p,r)$,
  $ (f - u)(z) <= sup_(zeta in partial D(p,r)) (f-u)(zeta) <= 0 ==> f(z) <= u(z). $
  Then $f$ is subharmonic.
]
#lbl(
  theorem[
    Let $f:U -> RR$ be continuous, where $U subset.eq CC$ is an open region. The following are equivalent:
    + $f$ is subharmonic on $U$.
    + $f$ satisfies the _global sub-mean-value property_: for each $overline(D(p, r)) subset.double U$,
      #lbl(
        $ f(p) <= 1 / (2 uppi) integral_0^(2 uppi) f(p + r ee^(ii theta)) dtheta. $,
        <eq:subharmonic-function-sub-mean-value-property>,
      )
    + $f$ satisfies the _local sub-mean-value property_: for each $p in U$, there exists $r_p > 0$ such that $overline(D(p,r_p)) subset.double U$ and, for every $0 < r < r_p$,
      $ f(p) <= 1 / (2 uppi) integral_0^(2 uppi) f(p + r ee^(ii theta)) dtheta. $
  ],
  <thm:subharmonic-function-sub-mean-value-property>,
)
#figure-wrapper([
  #lbl(
    figure(
      canvas({
        import cetz.draw: *
        circle((0, 0), radius: 5, name: "D(p,r)")
        let hatch = diagonal-stripes(
          background-color: black.transparentize(100%),
          size: 3pt,
          angle: 45deg,
          thickness: 0.2pt,
        )
        let blob(center, base-r: 0.6, wobble: 0.42, n: 14, seed: 0) = {
          let p0r = base-r * (1 + wobble * calc.sin(seed * 91deg))
          let p0 = (center.at(0) + p0r * calc.cos(0deg), center.at(1) + p0r * calc.sin(0deg))
          let angle-enforcer = directional-points(offset: p0, angle: 90deg, length: 1e-6, n: 4)
          let raw = range(1, n).map(i => {
            let ang = 360deg * i / n + 26deg * calc.sin(seed * 113deg + i * 67.3deg)
            let r = base-r * (1 + wobble * calc.sin(seed * 97deg + i * 137.5deg + i * 13.7deg))
            let pt = (center.at(0) + r * calc.cos(ang), center.at(1) + r * calc.sin(ang))
            (ang: ang, pt: pt)
          })
          let sorted = raw.sorted(key: v => v.ang)
          let body = sorted.map(v => v.pt)
          hobby(..angle-enforcer, ..body, ..angle-enforcer, closed: true)
        }
        compound-path(
          {
            blob((-1.7, 0.8), base-r: 2, seed: 56431)
            blob((2.6, -0.5), base-r: 1.3, seed: 32423)
          },
          name: "partial-K",
          fill: hatch,
        )
        anchor("z_K", "partial-K.27%")
        circle("z_K", radius: 2pt, fill: black)
        circle((0, 0), radius: 2pt, fill: black)
        hide(line((0, 0), ((0, 0), 100, "z_K"), name: "z_K-radius-test-line"))
        intersections("D(p,r)-boundary-point-intersections", "z_K-radius-test-line", "D(p,r)")
        circle("z_K", "D(p,r)-boundary-point-intersections.0", stroke: (dash: "dotted"))
        line(
          "D(p,r)-boundary-point-intersections.0",
          "z_K",
          mark: (
            end: (pos: 3pt, symbol: "|", inset: 0%),
            start: (pos: 3pt, symbol: "|", inset: 0%),
          ),
          name: "eta-prime-label",
        )
        content(("eta-prime-label.50%", 7pt, 90deg, "z_K"), math-rect($eta'$))
        content("z_K", anchor: "north", math-rect($z_K$), padding: 3pt)
        anchor("a", ("z_K", 60%, -50deg, "D(p,r)-boundary-point-intersections.0"))
        hide(circle("z_K", "a", name: "arc-circle"))
        intersections("arc-endpoints-test", "arc-circle", "partial-K")
        anchor("end1", "arc-endpoints-test.0")
        anchor("end2", "arc-endpoints-test.1")
        arc-through("end1", "a", "end2", stroke: 2pt, name: "arc", mark: (
          end: (pos: 2%, symbol: "o", inset: 0%),
          start: (pos: 2%, symbol: "o", inset: 0%),
        ))
        anchor("true-end-1", "arc.0%")
        anchor("true-end-2", "arc.100%")
        line(
          "a",
          "z_K",
          mark: (
            end: (pos: 3pt, symbol: "|", inset: 0%),
            start: (pos: 3pt, symbol: "|", inset: 0%),
          ),
          name: "eta-label-line",
        )
        line((1, 1.5), "arc.40%", mark: (end: ">>", fill: black))
        content((1, 1.5), math-rect($C$), anchor: "west", padding: 3pt)
        content(("eta-label-line.50%", 7pt, 90deg, "z_K"), math-rect($eta$))
        circle("a", radius: 2pt, fill: black)
        content("a", math-rect($a$), anchor: "south", padding: 3pt)
        content((0, 0), math-rect($p$), anchor: "east", padding: 3pt)
      }),
      caption: [The construction of the arc subtending a positive angle on which $g(z) < M$. The striped region is $K$.],
    ),
    <fig:subharmonic-function-sub-mean-value-property-arc-construction>,
  )
])
#proof[
  + Assume first that $f$ is subharmonic. Let $overline(D(p,r)) subset.double U$ be arbitrary. By the Poisson Integral Formula, there exists a function $h in C(overline(D(p,r)))$ harmonic on $D(p,r)$ with $h equiv f$ on $partial D(p,r)$. By @prop:subharmonicity-weakened-to-continuity-on-boundary-harmonicity-in-interior, $f <= h$ on $D(p,r)$. Therefore,
    $
      f(p) <= h(p) = 1 / (2 uppi) integral_0^(2 uppi) f(p + r ee^(ii theta)) dtheta.
    $
    Since the disk was arbitrary, the second condition holds for every valid radius, not merely for sufficiently small radii.

  + The global sub-mean-value property trivially implies the local sub-mean-value property: for each $p in U$, choose any $r_p > 0$ such that $overline(D(p,r_p)) subset.double U$.

  + Conversely, assume the local sub-mean-value property holds and that $f$ is not subharmonic. Then there exists a disk $overline(D(p,r)) subset.double U$ and a harmonic function $u: overline(D(p,r)) -> RR$ such that $u >= f$ on $partial D(p,r)$ but $u(z_0) < f(z_0)$ for some $z_0 in D(p,r)$. Let $g equiv f - u$.

    Observe that $lr(g|)_(partial D(p,r)) <= 0$ whilst $g(z_0) > 0$. Let $M = max_(z in overline(D(p,r))) g(z)$, which exists by @thm:continuous-function-bounded-on-compact and the Extreme Value Theorem (@thm:extreme-value). Moreover, $K = {z in overline(D(p,r)) : g(z) = M}$ is not all of $D(p,r)$, because by continuity there exists some $delta$ such that for any $z in D(p,r) without overline(D(p,r-delta))$, $g(z) <= M/2$, since $g$ is non-positive on the boundary.

    Notice that $K$ is compact; hence $D(p,r) without K$ is open and non-empty. Fix $z_K in partial K$. Then $z_K$ is an accumulation point of $D(p,r) without K$, otherwise $K$ would contain a disk centered at $z_K$ and $z_K$ would not be a boundary point. Let $eta' = op("dist")(z_K, partial D(p,r))$. By the local sub-mean-value property at $z_K$, choose $r_(z_K)>0$ such that the sub-mean inequality holds at $z_K$ for every radius less than $r_(z_K)$. Choose
    $
      a in D(z_K, min{eta', r_(z_K)}) inter (D(p,r) without K).
    $
    Letting $eta = abs(a-z_K)$, $overline(D(z_K,eta))$ lies within $D(p,r)$, $eta < r_(z_K)$, and $partial D(z_K,eta) inter (D(p,r) without K)$ contains a connected open arc $C$ containing $a$ subtending an angle $theta.alt$, on which $g(z)<M$ (as described by @fig:subharmonic-function-sub-mean-value-property-arc-construction). Then by the local sub-mean-value property,
    $
      M &= f(z_K)-u(z_K) <= 1/(2 uppi) integral_0^(2 uppi) f(z_K+eta ee^(ii theta)) dtheta-u(z_K) \
      &= 1/(2 uppi) integral_0^(2 uppi) [f(z_K+eta ee^(ii theta))-u(z_K+eta ee^(ii theta))] dtheta #tag[(by the harmonicity of $u$)] \
      &= 1/(2 uppi) integral_0^(2 uppi) g(z_K+eta ee^(ii theta)) dtheta \
      &= 1/(2 uppi) [integral_([0,2 uppi] without C) g(z_K+eta ee^(ii theta)) dtheta + integral_C g(z_K+eta ee^(ii theta)) dtheta] \
      &< 1/(2 uppi) [(2 uppi-theta.alt)M+theta.alt M] = M,
    $
    which is impossible (the purpose of extracting a Jordan arc was to ensure a strict inequality). Therefore, $f$ is subharmonic. #qedhere
]
#corollary[
  Let $U subset.eq CC$ be an open region and let $f:U -> RR$ be holomorphic. Then $abs(f)$ is subharmonic.
]
#proof[
  Since $f$ satisfies the global mean-value property on any disk $overline(D(z, epsilon))$ by @lem:holomorphic-mean-value-property, it follows that
  $
    abs(f(z)) = abs(1 / (2 uppi) integral_0^(2 uppi) f(z + epsilon ee^(ii theta)) dtheta) <= 1 / (2 uppi) integral_0^(2 uppi) abs(f(z + epsilon ee^(ii theta))) dtheta.
  $
  Therefore, $abs(f)$ satisfies the global sub-mean-value property and is subharmonic by @thm:subharmonic-function-sub-mean-value-property.
]
#remark[
  This in no way implies $abs(f)$ is harmonic, clearly $f(z) = z$, $abs(f(z)) = abs(z)$ attains an average value on the boundary of any disk centered at $0$ that is strictly greater than its value at the center. (This applies to a wide variety of holomorphic functions.)
]
#lbl(
  theorem[
    A real-valued function $f in C^2 (U)$ (where $U subset.eq CC$ is an open region) is subharmonic iff $laplacian f >= 0$ in $U$.
  ],
  <thm:subharmonic-twice-continuously-differentiable-subharmonic-nonnegative-laplacian-equivalence>,
)
#proof[
  + Assume $f$ is subharmonic, we first show the nonnegativity of its Laplacian.

    For the sake of contradiction, assume $exists z_0 in U$ such that $laplacian f (z_0) < 0$; then $exists epsilon' > 0$ such that $overline(D(z_0, epsilon')) subset.double U$ and $laplacian f < 0$ on $overline(D(z_0, epsilon'))$ (by continuity). By @thm:subharmonic-function-sub-mean-value-property, for each $0<epsilon< epsilon'$, $ f(z_0) <= 1 / (2 uppi) integral_0^(2 uppi) f(z_0 + epsilon ee^(ii theta)) dtheta. $
    Define the right-hand side to be a function of $epsilon$, namely $M(epsilon)$; and let $M(0) = lim_(epsilon -> 0^+) M(epsilon) = f(z_0)$. Then
    #lbl(
      $ f(z_0) <= M(epsilon) $,
      <eq:subharmonic-twice-continuously-differentiable-subharmonic-laplacian-forward-implication-contradicted-expression>,
    )
    for any $epsilon in (0,epsilon')$. Then
    $
      M'(epsilon) & = pdv(, epsilon) 1 / (2 uppi) integral_0^(2 uppi) f(z_0 + epsilon ee^(ii theta)) dtheta \
      & = 1 / (2 uppi) integral.cont.ccw_(partial D(z_0, epsilon)) nabla_(vu(n)) f(zeta) dzeta / (ii (zeta - z_0)),
    $
    where $nabla_(vu(n))$ is the normal derivative, or the directional derivative along the exterior-pointing normal vector. Since $dzeta$ is tangent to the circle and points $uppi/2$ counter-clockwise of the radial vector $zeta - z_0$, $dzeta = abs(dzeta) exp[ii arg (zeta - z_0)] ii$, implying that $abs(zeta - z_0) dzeta = (zeta - z_0) ii abs(dzeta)$. Hence,
    $
      M'(epsilon) & = 1 / (2 uppi epsilon) integral.cont.ccw_(partial D(z_0, epsilon)) nabla_(vu(n)) f(zeta) abs(dzeta)
    $
    Then letting $zeta = xi + ii eta$, using $ nabla_(vu(n)) f(zeta) abs(dzeta) = grad f(zeta) dot vu(n) abs(dzeta) = grad f(zeta) dot vec(dd(eta), -dd(xi)) $
    (since $vu(n) abs(dzeta)$ points in the direction $uppi/2$ clockwise of $dzeta$), we obtain
    $
      2 uppi epsilon M'(epsilon) & = integral.cont.ccw_(partial D(z_0, epsilon)) f'_xi (zeta) dd(eta) - f'_eta (zeta) dd(xi) \
      & = integral_(D(z_0, epsilon)) dd((f'_xi (zeta) dd(eta) - f'_eta (zeta) dd(xi))) \
      & = integral_(D(z_0, epsilon)) f''_(xi xi) (zeta) dd(xi, eta, prod: and) - f''_(eta eta) (zeta) dd(eta, xi, prod: and) #tag[(by @thm:complex-green)] \
      & = integral.double_(D(z_0, epsilon)) laplacian_zeta f(zeta) dd(A_zeta).
    $
    Since $laplacian f < 0$ on $overline(D(z_0, epsilon'))$, we obtain that for each $epsilon in (0, epsilon')$, $M'(epsilon) < 0$, meaning that $M$ is a strictly decreasing function of $epsilon$. Therefore, for any such $epsilon$,
    $ f(z_0) = M(0) > M(epsilon), $ which is impossible since we previously have asserted that $f(z_0) <= M(epsilon)$ in @eq:subharmonic-twice-continuously-differentiable-subharmonic-laplacian-forward-implication-contradicted-expression. Thus, there exists no point $z_0 in U$ at which the Laplacian of $f$ is negative.
  + Now assume $laplacian f >= 0$ everywhere. We aim to show subharmonicity.

    Let $overline(D(z_0, r)) subset.double U$ be arbitrary, and let $u:overline(D(z_0, r)) -> RR$ be harmonic such that $u >= f$ on $partial D(z_0, r)$. Then letting $v = f - u$, it follows that $laplacian v equiv laplacian f >= 0$ everywhere, while $v <= 0$ everywhere on $partial D(z_0, r)$.

    For each $epsilon > 0$, let $v_epsilon (z) = v(z) + epsilon(abs(z - z_0)^2 - r^2)$. Then it follows that for $z in partial D(z_0, r)$, $v_epsilon (z) = v(z) <= 0,$
    while $forall z in D(z_0, r)$,
    $
      laplacian v_epsilon = laplacian v + 4 epsilon pdv(, z, overline(z))[(z-z_0)(overline(z)-overline(z_0))]= laplacian v + 4 epsilon > 0 quad "(strictly)",
    $
    which means that $v_epsilon$ cannot attain a local maximum within $D(z_0, r)$ (as one would require $laplacian v_epsilon <= 0$). Therefore, we have $v_epsilon (z) <= 0$ for all $z in overline(D(z_0, r))$, and letting $epsilon -> 0^+$ gives $v <= 0 => f <= u$ thereon as well. #qedhere
    #remark[
      The purpose here of defining $v_epsilon$ as opposed to directly using $v$ is that without adding a small subharmonic (convex) paraboloid to $v$, $laplacian v$ could still vanish at some point in the interior (in which case we cannot directly determine that it is not a maximum).
    ]
]
(Notice that convexity in the one-dimensional case for $C^2$ functions is equivalent to the condition that $f'' >= 0$ everywhere.)

Here, we must alert the reader to an important difference between harmonic and subharmonic functions. The local mean-value property implies harmonicity and therefore smoothness. The local sub-mean-value property likewise implies subharmonicity by @thm:subharmonic-function-sub-mean-value-property, and consequently the global sub-mean inequality, but it does not imply that the function is $C^2$. Thus the statement and application in @thm:subharmonic-twice-continuously-differentiable-subharmonic-nonnegative-laplacian-equivalence do not hold, and there is no analogous elliptic regularity for general subharmonic functions.
#lbl(
  theorem[Jensen's inequality][
    Let $[a,b] subset.eq RR$ be an interval. If $phi.alt: RR -> RR$ is convex and $f: [a,b] -> RR$ is continuous,
    then
    $ phi.alt(1/(b-a) integral_a^b f(t) dt) <= 1/(b-a) integral_a^b phi.alt compose f(t) dt. $
    In other words, $ phi.alt([#[average of $f$ on $[a,b]$]]) <= [#[average of $phi.alt compose f$ on $[a,b]$]]. $
  ],
  <thm:jensens-inequality-convexity>,
)
#proof[
  Let the two points $alpha, beta in RR$ be arbitrary.

  First assume that $phi.alt(x) = alpha x + beta$ is linear, then
  $
    phi.alt(1/(b - a) integral_a^b f(t) dt) & = alpha / (b-a) integral_a^b f(t) dt + beta \
                                            & = 1 / (b-a) integral_a^b alpha f(t) dt + beta (integral_a^b dt) / (b - a) \
                                            & = 1/ (b-a) integral_a^b (alpha f(t) + beta) dt \
                                            & =1/(b-a) integral_a^b phi.alt compose f(t) dt.
  $
  Now assume the general case for $phi.alt$.

  For any $x' in RR$, there exists a linear function $phi.alt_(x')$ such that $phi.alt_(x') (x) <= phi.alt(x)$ on $RR$ and $phi.alt_(x') (x') = phi.alt(x')$. Then for simplicity define
  $ f_"avg" = 1/(b - a) integral_a^b f(t) dt. $
  Then letting $x' = f_"avg"$,
  $
    phi.alt(1/(b - a) integral_a^b f(t) dt) = phi.alt(f_"avg") &= phi.alt_(f_"avg") (f_"avg") = 1/(b-a) integral_a^b phi.alt_(f_"avg") compose f(t) dt \
    &<= 1/(b-a) integral_a^b phi.alt compose f(t) dt. qedhere
  $
]
#theorem[
  Let $U subset.eq CC$ be a region. If $phi.alt: RR -> RR$ is convex and non-decreasing and $f: U -> RR$ is subharmonic, then $phi.alt compose f$ is subharmonic.
]
#proof[
  Let $overline(D(p, r)) subset.double U$ be arbitrary. It suffices from @thm:subharmonic-function-sub-mean-value-property to show that the global sub-mean-value property is satisfied thereon. Observe that
  $
    f(p) <= 1 / (2 uppi) integral_0^(2 uppi) f(p + r ee^(ii theta)) dtheta.
  $
  Then, since $phi.alt$ is non-decreasing,
  $
    phi.alt compose f(p) & <= phi.alt(1 / (2 uppi) integral_0^(2 uppi) f(p + r ee^(ii theta)) dtheta) \
    & <= 1 / (2 uppi) integral_0^(2 uppi) phi.alt compose f(p + r ee^(ii theta)) dtheta. #tag[(by @thm:jensens-inequality-convexity)]
  $
  Then the global sub-mean-value property holds on an arbitrary disk and hence $phi.alt compose f$ is subharmonic.
]
#lbl(
  theorem[Maximum Principle for Subharmonic Functions][
    Let $U subset.eq CC$ be an open region and let $f in C(U, RR)$ be subharmonic. Then if $exists z_0 in U$ such that for all $z in U$, $ f(z_0) >= f(z) $
    holds, then $f$ is the constant function on $U$.
  ],
  <thm:maximum-principle-for-subharmonic-functions>,
)
Our proof will remain the same as @thm:maximum-modulus, aside from the sole difference that the local sub-mean-value property will be used in place of the local mean-value property.
#proof[
  Assume that $z_0$ exists. We aim to show that the set
  $ S = {z : f(z) = f(z_0) and z in U} $
  is all of $U$. This is equivalent to proving that $S$ is nonempty, open, and relatively closed in $U$ by the connectivity argument.

  Nonemptiness follows directly from $z_0 in S$.

  For any sequence ${z_n} in S$ converging to some $z_infinity in U$, by the continuity of $f$,
  $ lim_(n -> oo) f(z_n) = f(lim_(n -> oo) z_n) = f(z_infinity) = f(z_0), $
  and $z_infinity in S$. Thus, $S$ contains all of its accumulation points in $U$ and is closed therein.

  Since $U$ is open, $forall z in S$, $exists lambda > 0$ such that $D(z, lambda) subset.eq U$. By the local sub-mean-value property, $forall 0 < epsilon < lambda$,
  $
    f(z) <= 1 / (2 uppi) integral_0^(2 uppi) f(z + epsilon ee^(ii theta)) dtheta <= 1 / (2 uppi) integral_0^(2 uppi) f(z) dt = f(z),
  $
  forcing all inequalities to become inequalities:
  $
    f(z) = 1 / (2 uppi) integral_0^(2 uppi) f(z + epsilon ee^(ii theta)) dtheta = 1 / (2 uppi) integral_0^(2 uppi) f(z) dt = f(z)
  $
  From the equality of the last two integrals,
  $ integral_0^(2 uppi) [f(z) - f(z + epsilon ee^(ii t))] dt = 0. $
  Since this integrand is strictly non-negative and continuous, we have equality everywhere. Indeed, if not, there exists a $t_0$ at which the integrand is positive. Then the integrand is bounded below by a positive constant on a neighborhood of $t_0$ by continuity, giving a positive integral: a contradiction. Thus for any $t$, $f(z) = f(z + epsilon ee^(ii t))$.

  Thus, $forall z in S$, $exists lambda > 0$ such that $D(z, lambda) subset.eq S$. In other words, every $z in S$ has an open neighborhood that also lies in $S$, giving the openness of $S$ in $U$. Therefore, $S = U$ by the connectivity argument (@thm:connected-topological-space-clopen-sets).
]
#remark[
  Note that there is no corresponding "minimum" principle as with harmonic functions: subharmonicity is sufficiently restrictive in a "one-sided" way. If one were to instead define a "superharmonic function," there would not be a maximum principle but instead a sole minimum principle. Although this is a widely recognized definition, it is somewhat unnecessary for our purposes as any superharmonic function could be trivially made into a subharmonic function by negation (from $f$ to $z |-> -f(z)$).
]
The utility of using subharmonic functions, as opposed to harmonic or holomorphic functions is due to its flexibility as we now show:
#lbl(
  proposition[
    Suppose $U subset.eq CC$ is an open region and let $f, g: U -> RR$ be two subharmonic functions. Then the function $phi$ defined by
    $ phi(z) = max{f(z), g(z)} quad forall z in U $
    is subharmonic on $U$ as well.
  ],
  <prop:subharmonic-pointwise-maximum-is-subharmonic>,
)
#proof[
  #todo[Show continuity.]
  By a simple application of the global sub-mean-value property on any disk $overline(D(z, r)) subset.double U$:
  $
    phi(z) &<= max{1 / (2 uppi) integral_0^(2 uppi) f(z + r ee^(ii theta)) dtheta, 1 / (2 uppi) integral_0^(2 uppi) g(z + r ee^(ii theta)) dtheta} \
    &<= 1 / (2 uppi) integral_0^(2 uppi) max{f(z + r ee^(ii theta)) dtheta}, g(z + r ee^(ii theta)) dtheta}} dtheta \
    &= 1 / (2 uppi) integral_0^(2 uppi) phi(z + r ee^(ii theta)) dtheta.
  $
  Applying @thm:subharmonic-function-sub-mean-value-property gives the subharmonicity of $phi$.
]
Before venturing into the the proof-specific definitions of the Perron Method, we remark that subharmonicity is also preserved under addition and scaling by a positive constant.

We next introduce the concept of a _barrier_ in the establishing of a condition on the boundary of a domain which will help us avoid the situation previously described in @ex:dirichlet-problem-solution-dne-on-punctured-disk (a situation leading to the insolvability of the Dirichlet problem).
#lbl(
  definition[Barrier][
    Let $U subset.double CC$ be an open region and let $p in partial U$ be arbitrary. Then a function $b:overline(U) -> RR$ is said to be a _barrier_ iff the following conditions are satisfied:
    + $b in C(overline(U))$. #enum-lbl(<itm:barrier-continuity>)
    + $b$ is subharmonic in $U$. #enum-lbl(<itm:barrier-subharmonicity>)
    + $b(p) = 0$ and $forall z in partial U without {p}$, $b(z) != 0$. #enum-lbl(<itm:barrier-exclusive-vanishing>)
    + $b$ is non-positive in $overline(U)$.#enum-lbl(<itm:barrier-non-positivity>)
  ],
  <def:barrier>,
)
Although the definition of a barrier here is somewhat technical, it is the precise definition that will later allow for the construction of a solution to the Dirichlet problem.

The way in which this helps rule out the case of @ex:dirichlet-problem-solution-dne-on-punctured-disk is by analyzing the existence of these barriers.

We provide several important examples of barriers:
#lbl(
  theorem[
    A barrier exists at every point $p in partial DD$ on $DD$ by $ b:z mapsto Re (z / p) - 1. $
  ],
  <thm:barrier-existence-for-unit-disk>,
)
#proof[
  Obviously @itm:barrier-continuity, @itm:barrier-exclusive-vanishing, and @itm:barrier-non-positivity are true. Moreover, $b$ is harmonic (real part of a holomorphic function) and thus subharmonic (proving @itm:barrier-subharmonicity).
]
#lbl(
  theorem[
    Let $U subset CC$ be a bounded region and let $p in partial U$ be a point with greatest modulus. Then $overline(U) subset.eq overline(D(0,abs(p)))$. Let $theta.alt = Arg p$, where $Arg$ is the principal branch (restricted to $[0, 2 uppi)$). Then we have that
    $ f:z |-> Re(ee^(-ii theta.alt) z) - abs(p) $
    serves as a barrier for $U$ at $p$.
  ],
  <thm:barrier-existence-for-bounded-region-at-point-of-furthest-modulus>,
)
#proof[
  By the condition on $p$, $abs(ee^(-ii theta.alt) z) <= abs(p)$ must hold for all $z in overline(U)$, which implies @itm:barrier-non-positivity. For $f$ to vanish at $z$, we must have
  $
    Re(ee^(-ii theta.alt) z) = abs(p).
  $
  Therefore, $Im(ee^(-ii theta.alt) z) = 0$, which implies that $z = p$. Thus @itm:barrier-exclusive-vanishing is satisfied. Moreover, @itm:barrier-continuity trivially holds and @itm:barrier-subharmonicity holds by harmonicity (real part of a holomorphic function).
]
#lbl(
  theorem[
    Let $U subset.eq CC$ be open and let $p in partial U$. Assume there exists $q in CC without U$ and a closed line segment $L$ of positive length joining $p$ and $q$ such that $ L inter overline(U) = {p}. $
    Then there exists a barrier for $U$ at $p$, given by
    $ b:z |-> Re[-phi compose (ii psi(z))] - 1, $
    where $ phi(z) = (z - ii) / (z + ii) $ is the Cayley transform and $ psi(z) = sqrt((z - p) / (z - q)) $ utilizes the principal branch square root.
  ],
  <thm:barrier-exterior-segment>,
)
#proof[
  Let $phi.alt : z mapsto (z - p) / (z - q)$ be a Möbius transformation mapping $p$ to $0$ and $q$ to $oo$. Note that by the theorem hypotheses, $q in.not overline(U)$. Each $z in L$ can be written as $z = p(1 - t) + q t$. Then for $z in L$, $phi.alt(z) = (t(q - p)) / ((1 - t)(p - q)) = t / (t - 1) <= 0$. Therefore, $phi.alt$ maps $L$ to $RR_(<= 0) union {oo}$ and maps $CC without L$ to $CC without (RR_(<= 0) union {1})$. The the branch cut of the square root coincides to the subtracted ray, then $ii psi$ biholomorphically maps $CC without L$ to
  $
    ii sqrt(CC without (RR_(<= 0) union {1})) = ii ({z in CC : Re z > 0} without {1}) = HH^+ without {ii}.
  $
  Then $phi$ maps this region to $DD^* = DD without {0}$. It follows that
  $ -phi compose (ii psi(overline(U) without {p})) subset.eq DD^* $ and extends to $p$ continuously by $ -phi compose (ii psi(p)) = -phi(0) = 1. $
  Then by @thm:barrier-existence-for-bounded-region-at-point-of-furthest-modulus, we find that $b_DD(w) = Re w - 1$ is a barrier on $DD$, thus set $b:z |-> b_DD compose (-phi compose (ii psi(z)))$. By injectivity, we have @itm:barrier-exclusive-vanishing; @itm:barrier-continuity and @itm:barrier-non-positivity hold trivially. Lastly, subharmonicity (@itm:barrier-subharmonicity) is satisfied as $b$ is the real part of some holomorphic function.
]
The exterior segment condition in @thm:barrier-exterior-segment yields barriers for a broad class of domains. In particular, any domain bounded by a finite disjoint union of regular $C^1$ Jordan curves admits a barrier at every point of its boundary (see below), though this regularity is sufficient but far from necessary. Elementary examples with corners, such as squares and rectangles, likewise admit a barrier at every boundary point, as they too satisfy the exterior segment condition.
#lbl(
  theorem[
    Let $U subset CC$ be a bounded region such that $partial U$ is a finite disjoint union of $C^1$ Jordan (simple, closed) curves. Then $U$ satisfies the exterior segment condition at every point of $partial U$. Consequently, $U$ admits a barrier at every point of its boundary.
  ],
  <thm:barrier-c1-boundary-exterior-segment>,
)
#proof[
  Fix $p in partial U$, and let $gamma$ be a $C^1$ parameterization of the boundary component containing $p$ (with a nowhere-vanishing derivative), with $gamma(0) = p$. Define the transformation
  $
    phi.alt(w) = overline(gamma'(0)) / abs(gamma'(0)) (w - p).
  $
  Choose $phi$ to be either $phi.alt$ or $w mapsto overline(phi.alt(w))$, so that $phi(U)$ lies locally above its boundary curve at $0$. Set $tilde(U) = phi(U)$ and $tilde(gamma) = phi compose gamma$. Then $tilde(gamma)(0) = 0$ and $tilde(gamma)'(0) = abs(gamma'(0)) in RR_(> 0)$. Write $tilde(gamma)(t) = u(t) + ii v(t)$. Thus $u'(0) > 0$ and $v'(0) = 0$.

  By the inverse function theorem applied to $u$, there exists an open interval $(-delta, delta)$ centered at $0$ and an open interval $I$ such that $u: (-delta, delta) -> I$ is a $C^1$ bijection with a $C^1$ inverse $u^(-1): I -> (-delta, delta)$. Choose $a > 0$ such that $(-a, a) subset I$, and define
  $
    h(x) = v(u^(-1) (x)) quad (x in (-a, a)).
  $
  Then
  $
    tilde(gamma)(u^(-1) (x)) = x + ii h(x),
  $
  while $h(0) = 0$ and $h'(0) = (v'(0)) / (u'(0)) = 0$. Let
  $
    K = partial tilde(U) without tilde(gamma)((-delta, delta)).
  $
  Hence $K$ is a closed subset of the compact set $partial tilde(U)$, and is therefore compact. Since $0 in.not K$, the continuous function $z mapsto abs(z)$ attains a strictly positive minimum on $K$:
  $
    d = min_(z in K) abs(z) > 0.
  $
  Set $epsilon = 1 / 2 min{a, d}$. Then $D(0, epsilon)$ cannot meet $K$, and every point of this disk has real part in $(-a, a)$. Consequently,
  $
    partial tilde(U) inter D(0, epsilon) = {x + ii h(x) : x in (-a, a)} inter D(0, epsilon).
  $
  Thus
  $
    overline(tilde(U)) inter D(0, epsilon) subset.eq {x + ii y : y >= h(x)}.
  $
  Choose $0 < s < epsilon$. Since $h(0) = 0$, the line segment
  $
    L = {-ii t : 0 <= t <= s}
  $
  satisfies
  $
    L inter overline(tilde(U)) = {0}.
  $
  Applying $phi^(-1)$ to $L$ yields a closed line segment of positive length through $p$ whose remaining points lie in $CC without overline(U)$. Hence the exterior segment condition holds at $p$. Since $p$ was arbitrary, @thm:barrier-exterior-segment yields a barrier at every point of $partial U$.
]
Conversely, it is immediate that @thm:barrier-exterior-segment does not apply to $DD^*$: at the origin there is no segment emanating from $0$ that remains disjoint from $DD^*$. We now provide a proof that there is no barrier for $DD^*$ at the origin.
#proposition[
  There exists no real-valued function $b in C(overline(DD))$ that serves as a barrier on $DD^* = DD without {0}$ at the origin.
]
#proof[
  For contradiction, assume that such a barrier $b in C(overline(DD))$ exists. Let
  $
    hat(b)(z) = 1 / (2 uppi) integral_0^(2 uppi) b(z ee^(ii theta)) dtheta,
  $
  which is a radial function as
  $
    hat(b)(z ee^(ii theta.alt)) = 1 / (2 uppi) integral_0^(2 uppi) b(z ee^(ii theta + theta.alt)) dtheta = 1 / (2 uppi) integral_theta.alt^(2 uppi + theta.alt) b(z ee^(ii theta)) dtheta = hat(b)(z).
  $
  Moreover, $hat(b)(0) = b(0) = 0$ and nowhere else does $hat(b)$ vanish as $b < 0$ on each circle (proving @itm:barrier-exclusive-vanishing of @def:barrier). Continuity (@itm:barrier-continuity) and non-positivity (@itm:barrier-non-positivity) are trivial. Lastly, to demonstrate the subharmonicity of $hat(b)$, consider an arbitrary point $z_0 in DD^*$. Then $exists r > 0$ such that $overline(D(z_0, r)) subset.double DD^*$ (and therefore for any $theta$, $overline(D(z_0 ee^(ii theta), r)) subset.double DD^*$),
  $
    hat(b)(z_0) & = 1 / (2 uppi) integral_0^(2 uppi) b(z_0 ee^(ii theta)) dtheta \
    & <= 1 / (2 uppi) integral_0^(2 uppi) 1 / (2 uppi) integral_0^(2 uppi) b(z_0 ee^(ii theta) + r ee^(ii theta.alt)) dd(theta.alt) dtheta.
  $
  Let $tau = theta.alt - theta$, $dd(theta.alt) = dd(tau)$. Then
  $
    hat(b)(z_0) & <= 1 / (2 uppi) integral_0^(2 uppi) 1 / (2 uppi) integral_(-theta)^(2 uppi - theta) b((z_0 + r ee^(ii tau))ee^(ii theta)) dd(tau) dtheta \
    &=1 / (2 uppi) integral_0^(2 uppi) [1 / (2 uppi) integral_0^(2 uppi) b((z_0 + r ee^(ii tau))ee^(ii theta)) dtheta] dd(tau) #tag[(by Fubini's Theorem)] \
    &=1 / (2 uppi) integral_0^(2 uppi) hat(b)(z_0 + r ee^(ii tau)) dd(tau). #tag[(by definition of $hat(b)$)]
  $
  This shows that $hat(b)$ satisfies the global sub-mean-value property @thm:subharmonic-function-sub-mean-value-property and is subharmonic. Therefore it is a barrier at the origin for $DD^*$.

  Without loss of generality, assume $hat(b) equiv -1$ on $partial DD$ (this can easily be achieved by scaling). We now show that such a rotationally-invariant barrier $hat(b)$ cannot exist.

  For all $r in (0,1)$ consider the functions on $DD^*$ in the form of
  $
    phi_r (z) = (hat(b)(r) + 1) / (log r) log abs(z) - 1.
  $
  Moreover, since $log abs(z)$ is harmonic, it follows that $phi_r$ is harmonic. Therefore, let $psi equiv hat(b) - phi_r$, which is subharmonic. For $abs(z) = r$,
  $ phi_r (z) = (hat(b)(r) + 1) - 1 = hat(b)(r) = hat(b)(z) ==> psi(partial D(0, r)) = {0} $
  by rotational invariance. For $abs(z) = 1$,
  $ phi_r (z) = (-1 + 1) / (log r) dot 0 - 1 = -1 = hat(b)(z) ==> psi(partial DD) = {0}. $
  By the Maximum Principle (@thm:maximum-principle-for-subharmonic-functions), $ max_(abs(z) in (r,1)) psi_r (z) = max_(abs(z) in {r, 1}) psi_r (z) = 0. $
  Therefore, for any $z in overline(DD) without D(0,r)$, $psi(z) <= 0$, meaning that $hat(b)(z) <= phi_r (z)$.

  Let $r -> 0^+$. Then for any $z in overline(DD)^*$, $ hat(b)(z) <= lim_(r -> 0^+) phi_r (z) = -1. $
  Now let $z -> 0$, which gives that $ hat(b)(0) <= -1 $ by continuity, which contradicts $hat(b)$ being a barrier (which would otherwise require $hat(b)(0) = 0$).
]
