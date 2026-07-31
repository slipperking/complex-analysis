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
    A subharmonic function $f:U -> RR$ (where $U subset.eq CC$ is an open region) is subharmonic iff for each $overline(D(p, r)) subset.double U$,
    #lbl(
      $ f(p) <= 1 / (2 uppi) integral_0^(2 uppi) f(p + r ee^(ii theta)) dtheta. $,
      <eq:subharmonic-function-sub-mean-value-property>,
    )
  ],
  <thm:subharmonic-function-sub-mean-value-property>,
)
#proof[
  + We first prove the forward direction (subharmonic ==> sub-mean-value property).

    For each $overline(D(p, r)) subset.double U$, by the Poisson Integral Formula, $exists! u in C^0(overline(D(p, r))) -> RR$ harmonic in $D(p, r)$ such that $lr(u|)_(partial D(p, r)) equiv lr(f|)_(partial D(p, r))$. By @prop:subharmonicity-weakened-to-continuity-on-boundary-harmonicity-in-interior, $f <= u$ in $D(p, r)$. Therefore, $ f(p) <= u(p) = 1 / (2 uppi) integral_0^(2 uppi) f(p + r ee^(ii theta)) dtheta. $
  + Conversely (sub-mean-value property ==> subharmonic), first assume @eq:subharmonic-function-sub-mean-value-property holds at all points and all valid radii such that $f$ is not subharmonic.

    Then there exists a disk $overline(D(p, r)) subset.double U$ and a harmonic function $u: overline(D(p, r)) -> RR$ such that $u >= f$ on $partial D(p, r)$ but $u(z_0) < f(z_0)$ for some $z_0 in D(p, r)$. Now let $g equiv f - u$.

    Observe that $lr(g|)_(partial D(p, r)) <= 0$ whilst $g(z_0) > 0$. Let $M = max_(z in overline(D(p, r))) g(z)$ (and by assumption $M >= g(z_0) > 0$). Moreover, $K = {z in overline(D(p,r)) : g(z) = M}$ is not all of $D(p,r)$, because importantly, by continuity, there exists some $delta$ such that for any $z in D(p, r) without overline(D(p, r- delta))$, $g(z) <= M / 2$ (since $g$ is non-positive on the boundary). // TO BE CONTINUED
]
#theorem[
  A function real-valued function $f in C^2 (U)$ (where $U subset.eq CC$ is an open region) is subharmonic iff $laplacian f >= 0$ in $U$.
]
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
      laplacian v_epsilon = laplacian v + 4 epsilon pdv(, z, overline(z))[(z-z_0)overline((z-z_0))]= laplacian v + 4 epsilon > 0 quad "strictly",
    $
    which means that $v_epsilon$ cannot attain a local maximum within $D(z_0, r)$ (as one would require $laplacian v_epsilon <= 0$). Therefore, we have $v_epsilon (z) <= 0$ for all $z in overline(D(z_0, r))$, and letting $epsilon -> 0^+$ gives $v <= 0 => f <= u$ thereon as well. #qedhere
    #remark[
      The purpose here of defining $v_epsilon$ as opposed to directly using $v$ is that without adding a small subharmonic (convex) paraboloid to $v$, $laplacian v$ could still vanish at some point in the interior (in which case we cannot directly determine that it is not a maximum).
    ]
]
(Notice that convexity in the one-dimensional case for $C^2$ functions is equivalent to the condition that $f'' >= 0$ everywhere.)
