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
#example[
  Let $U = DD^* = DD without {0}$,
  $ f(z) = cases(1& quad "if" abs(z) = 1, 0& quad "if" z = 0). $
  Then there exists no harmonic function in $DD^*$ with a continuous extension to $f$.
]
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
    Let $U subset.eq CC$ be an open region and let $f:U -> RR$ be continuous. Then $f$ is _subharmonic_ iff: whenever $overline(D(p, r)) subset.double U$ and $u in C^0 (overline(D(p, r)))$ is real-harmonic in $D(p, r)$ with
    $ f<= u quad "on" quad partial D(p,r), $
    it follows that
    $ f<= u quad "throughout" quad D(p,r). $
  ],
  <prop:subharmonicity-weakened-to-continuity-on-boundary-harmonicity-in-interior>,
)
#proof[
  The reverse implication (stated condition implies @def:subharmonicity) is immediate: if the stated condition holds for $f$ and $u$ is harmonic on a neighborhood of $overline(D(p,r))$, then $u$ is also continuous on $overline(D(p,r))$ and harmonic in $D(p,r)$ and therefore the stated inequality can be obtained. Thus the stated condition implies the definition of subharmonicity.

  Conversely, suppose that $f$ is subharmonic in the sense of @def:subharmonicity. Let $overline(D(p,r)) subset.double U$, and let $u in C^0(overline(D(p,r)))$ be real-harmonic in $D(p,r)$ such that $f <= u$ on $partial D(p,r)$. We must show that the stated condition holds, or that $f <= u$ throughout $D(p,r)$.

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
    A continuous function $f:U -> RR$ (where $U subset.eq CC$ is an open region) is subharmonic iff for each $overline(D(p, r)) subset.double U$,
    #lbl(
      $ f(p) <= 1 / (2 uppi) integral_0^(2 uppi) f(p + r ee^(ii theta)) dtheta. $,
      <eq:subharmonic-function-sub-mean-value-property>,
    )
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
        // circle("end1", radius: 2pt, fill: black)
        // circle("end2", radius: 2pt, fill: black)

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
// #todo[Finish drawing figure components.]
#proof[
  + We first prove the forward direction (subharmonic #sym.arrow.double.long sub-mean-value property).

    For each $overline(D(p, r)) subset.double U$, by the Poisson Integral Formula, $exists! u in C^0(overline(D(p, r))) -> RR$ harmonic in $D(p, r)$ such that $lr(u|)_(partial D(p, r)) equiv lr(f|)_(partial D(p, r))$. By @prop:subharmonicity-weakened-to-continuity-on-boundary-harmonicity-in-interior, $f <= u$ in $D(p, r)$. Therefore, $ f(p) <= u(p) = 1 / (2 uppi) integral_0^(2 uppi) f(p + r ee^(ii theta)) dtheta. $
  + Conversely (sub-mean-value property #sym.arrow.double.long subharmonic), first assume @eq:subharmonic-function-sub-mean-value-property holds at all points and all valid radii such that $f$ is not subharmonic.

    Then there exists a disk $overline(D(p, r)) subset.double U$ and a harmonic function $u: overline(D(p, r)) -> RR$ such that $u >= f$ on $partial D(p, r)$ but $u(z_0) < f(z_0)$ for some $z_0 in D(p, r)$. Now let $g equiv f - u$.

    Observe that $lr(g|)_(partial D(p, r)) <= 0$ whilst $g(z_0) > 0$. Let $M = max_(z in overline(D(p, r))) g(z)$ (and by assumption $M >= g(z_0) > 0$), which exists by @thm:continuous-function-bounded-on-compact and the Extreme Value Theorem (@thm:extreme-value). Moreover, $K = {z in overline(D(p,r)) : g(z) = M}$ is not all of $D(p,r)$, because importantly, by continuity, there exists some $delta$ such that for any $z in D(p, r) without overline(D(p, r - delta))$, $g(z) <= M / 2$ (since $g$ is non-positive on the boundary).

    Notice that $K$ is compact; for any sequence ${z_n}_n$ in $K$ that converges in $overline(D(p,r))$, since $g(z_n) = M$ for each $n$, by continuity, $g(z_oo) = M$ as well where $z_oo$ is the accumulation point. Then $D(p,r) without K$ is open and non-empty. Fix $z_K in partial K$. Then notice that $z_K$ is an accumulation point of $D(p,r) without K$, otherwise $K$ would contain a disk centered at $z_K$ and $z_K$ then wouldn't be a boundary point.

    Let $eta' = op("dist") (z_K, partial D(p,r))$. Then $exists a in D(z_k, eta') inter (D(p,r) without K)$. Then letting $eta = abs(a - z_K)$, $overline(D(z_K, eta))$ lies within $D(p, r)$ since $eta < eta'$, and $partial D(z_K, eta) inter (D(p,r) without K)$ consists of a connected open arc $C$ containing $a$ subtending an angle $theta.alt$, on which $g(z) < M$ (as described by @fig:subharmonic-function-sub-mean-value-property-arc-construction). Then by the sub-mean-value property assumption,
    $
      M &= f(z_K) - u(z_K) <= 1 / (2 uppi) integral_0^(2 uppi) f(z_K + eta ee^(ii theta)) dtheta - u(z_K) \
      &= 1 / (2 uppi) integral_0^(2 uppi) [f(z_K + eta ee^(ii theta)) - u(z_K + eta ee^(ii theta))] dtheta #tag[(by the harmonicity of $u$)]\
      &= 1 / (2 uppi) integral_0^(2 uppi) g(z_K + eta ee^(ii theta))\
      &= 1 / (2 uppi) [integral_([0, 2 uppi] without C) g(z_K + eta ee^(ii theta)) dtheta + integral_C g(z_K + eta ee^(ii theta)) dtheta] \
      & < 1 / (2 uppi) [(2 uppi - theta.alt) M + theta.alt M] = M,
    $
    which is an impossibility (the purpose of extracting a Jordan arc was to ensure a strict inequality). Therefore, $f$ must be subharmonic. #qedhere
]
#corollary[
  Let $U subset.eq CC$ be an open region and let $f:U -> RR$ be holomorphic. Then $abs(f)$ is subharmonic.
]
#proof[
  Since $f$ satisfies the mean-value property on any disk $overline(D(z, epsilon))$ by @lem:holomorphic-mean-value-property, it follows that
  $
    abs(f(z)) = abs(1 / (2 uppi) integral_0^(2 uppi) f(z + epsilon ee^(ii theta)) dtheta) <= 1 / (2 uppi) integral_0^(2 uppi) abs(f(z + epsilon ee^(ii theta))) dtheta.
  $
  Therefore, $abs(f)$ satisfies the sub-mean-value property and is subharmonic by @thm:subharmonic-function-sub-mean-value-property.
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
    Define the right-hand side to be a function of $epsilon$, namely $M(epsilon)$; and let $M(0) = lim_(epsilon -> 0^+) M(epsilon) = u(z_0)$. Then
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

Here, we must alert the reader to an important difference between the properties of harmonic functions and subharmonic functions. In the former case, if we have a function $f$ which is continuous on $U$ and satisfies the mean-value property on every small disk therein, then $f$ is harmonic (and $C^oo$). This was proved in @thm:continuous-mean-value-property-solutions-are-harmonic. However, in the case of subharmonic functions, we have a continuous function $f$ which satisfies the sub-mean-value property on every small disk therein, but $f$ is not necessarily $C^2$ and the statement and application in @thm:subharmonic-twice-continuously-differentiable-subharmonic-nonnegative-laplacian-equivalence do not hold. There is also no "elliptic regularity" that holds for the general case of subharmonicity.
#lbl(
  theorem[Jensen's inequality][
    Let $[a,b] subset.eq RR$ be an interval. If $phi.alt: RR -> RR$ is convex and $f: [a,b] -> RR$ is continuous,
    then
    $ phi.alt(1/(b-a) integral_a^b f(t) dt) <= 1/(b-a) integral_a^b phi.alt compose f(t) dt. $
    In other words, $phi.alt([#[average of $f$ on $[a,b]$]]) <= [#[average of $phi.alt compose f$ on $[a,b]$]]$.
  ],
  <thm:jensens-inequality-convexity>,
)
#proof[
  // For any two points $alpha, beta in RR$, let $psi : RR -> RR$ be a linear function satisfying $phi.alt(alpha) = psi(alpha)$ and $phi.alt(beta) = psi(beta)$. Concretely, we have $psi(t) = phi.alt(alpha) (t-beta) / (alpha-beta) + phi.alt(b) (t - alpha) / (beta - alpha)$.

  // By the definition of convexity, we have for any $t in [alpha, beta])$,
  // $ psi(t) >= phi.alt(t). $
  Let the two points $alpha, beta in RR$ be arbitrary.

  First assume that $phi.alt(x) = alpha x + beta$ is linear, then
  $
    phi.alt(1/(b - a) integral_a^b f(t) dt) & = alpha / (b-a) integral_a^b f(t) dt + beta \
                                            & = 1 / (b-a) integral_a^b alpha f(t) dt + beta (integral_a^b dt) / (b - a) \
                                            & = 1/ (b-a) integral_a^b (alpha f(t) + beta) dt \
                                            & =1/(b-a) integral_a^b phi.alt compose f(t) dt.
  $
  Now assume the general case for $phi.alt$.

  For any $x' in RR$, there exists a linear function $phi.alt_(x')$ such that $phi.alt_(x') (x) <= phi.alt(x)$ on $RR$ and $phi.alt(x') (x') = phi.alt(x')$. Then for simplicity define
  $ f_"avg" = 1/(b - a) integral_a^b f(t) dt. $
  Then letting $x' = f_"avg"$,
  $
    phi.alt(1/(b - a) integral_a^b f(t) dt) = phi.alt(f_"avg") &= phi.alt_(f_"avg") (f_"avg") = 1/(b-a) integral_a^b phi.alt_(f_"avg") compose f(t) dt \
    &<= 1/(b-a) integral_a^b phi.alt compose f(t) dt. qedhere
  $
  // <= str
]
#theorem[
  Let $U subset.eq CC$ be a region. If $phi.alt: RR -> RR$ is convex and non-decreasing and $f: U -> RR$ is subharmonic, then $phi.alt compose f$ is subharmonic.
]
#proof[
  Let $overline(D(p, r)) subset.double U$ be arbitrary. It suffices from @thm:subharmonic-function-sub-mean-value-property to show that the mean-value property is satisfied thereon. Observe that
  $
    f(p) <= 1 / (2 uppi) integral_0^(2 uppi) f(p + r ee^(ii theta)) dtheta.
  $
  Then, since $phi.alt$ is non-decreasing,
  $
    phi.alt compose f(p) & <= phi.alt(1 / (2 uppi) integral_0^(2 uppi) f(p + r ee^(ii theta)) dtheta) \
    & <= 1 / (2 uppi) integral_0^(2 uppi) phi.alt compose f(p + r ee^(ii theta)) dtheta. #tag[(by @thm:jensens-inequality-convexity)]
  $
  Then the sub-mean-value property holds on an arbitrary disk and hence $phi.alt compose f$ is subharmonic.
]
#lbl(
  theorem[Maximum Principle for Subharmonic Functions][
    Let $U subset.eq CC$ be an open region and let $f in C^0 (U, RR)$ be subharmonic. Then if $exists z_0 in U$ such that for all $z in U$, $ f(z_0) >= f(z) $
    holds, then $f$ is the constant function on $U$.
  ],
  <thm:maximum-principle-for-subharmonic-functions>,
)
Our proof will remain the same as @thm:maximum-modulus, aside from the sole difference that the sub-mean-value property will be used (in contrast to the mean-value property), which will not change the proof by any significant amount.
#proof[
  Assume that $z_0$ exists. We aim to show that the set
  $ S = {z : f(z) = f(z_0), z in U} $
  is all of $U$. This is equivalent to proving that $S$ is nonempty, open, and relatively closed in $U$ by the connectivity argument.

  Nonemptiness follows directly from $z_0 in S$.

  For any sequence ${z_n} in S$ converging to some $z_infinity in U$, by the continuity of $f$,
  $ lim_(n -> oo) f(z_n) = f(lim_(n -> oo) z_n) = f(z_infinity) = f(z_0), $
  and $z_infinity in S$. Thus, $S$ contains all of its accumulation points in $U$ and is closed.

  Since $U$ is open, $forall z in S$, $exists lambda > 0$ such that $D(z, lambda) subset.eq V$. By the sub-mean-value property, $forall 0 < epsilon < lambda$,
  $
    f(z) <= 1 / (2 uppi) integral_0^(2 uppi) f(z + epsilon ee^(ii theta)) dtheta <= 1 / (2 uppi) integral_0^(2 uppi) f(z) dt = f(z),
  $
  forcing all inequalities to become inequalities:
  $
    f(z) = 1 / (2 uppi) integral_0^(2 uppi) f(z + epsilon ee^(ii theta)) dtheta = 1 / (2 uppi) integral_0^(2 uppi) f(z) dt = f(z)
  $
  From the equality of the last two integrals,
  $ integral_0^(2 uppi) [f(z) - f(z + epsilon ee^(ii t))] dt = 0. $
  Since this integrand is strictly non-negative, it must vanish everywhere. Thus, $forall z in S$, $exists lambda > 0$ such that $D(z, lambda) subset.eq S$. In other words, every $z in S$ has an open neighborhood that also lies in $S$, giving the openness of $S$ in $U$. Therefore, $S = U$ by the connectivity argument (@thm:connected-topological-space-clopen-sets).
]
#remark[
  Note that there is no corresponding "minimum" principle as with harmonic functions: subharmonicity is sufficiently restrictive in a "one-sided" way. If one were to instead define a "superharmonic function," there would not be a maximum principle but instead, only a minimum principle. Although this is a widely recognized definition, it is somewhat unnecessary for our purposes as any superharmonic function could be trivially made into a subharmonic function by negation (from $f$ to $z |-> -f(z)$).
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
  By a simple application of the sub-mean-value-property on any disk $overline(D(z, r)) subset.double U$:
  $
    phi(z) &<= max{1 / (2 uppi) integral_0^(2 uppi) f(z + r ee^(ii theta)) dtheta, 1 / (2 uppi) integral_0^(2 uppi) g(z + r ee^(ii theta)) dtheta} \
    &<= 1 / (2 uppi) integral_0^(2 uppi) max{f(z + r ee^(ii theta)) dtheta}, g(z + r ee^(ii theta)) dtheta}} dtheta \
    &= 1 / (2 uppi) integral_0^(2 uppi) phi(z + r ee^(ii theta)) dtheta.
  $
  Applying @thm:subharmonic-function-sub-mean-value-property gives the subharmonicity of $phi$.
]
