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

  If we arbitrarily choose $z_1, z_2 in partial DD$, then $v = u compose (z mapsto z * z_1 / z_2)$ is also a solution to the particular problem. We already know solutions are unique from the Maximum Principle, thus $u(z_2) = v(z_2) = u(z_1)$. Therefore the unique solution $u$ is radial ($pdv(u, theta) equiv 0$). Then applying (@eq:laplacian-polar-form),
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

    We say that f is subharmonic if, whenever $overline(D(p, r)) subset.double U$ and $u : overline(D(p, r)) --> RR$ is harmonic (on a neighborhood) with
    $ f<= u quad "on" quad partial D(p,r), $
    it follows that
    $ f<= u quad "throughout" quad D(p,r). $
  ],
  <def:subharmonicity>,
)
At first glance, the definition may seem a little bloated. However, we aim to provide sufficient intuition. Firstly, the one-dimensional analog of a harmonic function $u$ is one satisfying $dv(u, x, 2) equiv 0 ==> dv(u, x) equiv a ==> u(x) = a x + b$. Consider an arbitrary continuous function $f: I -> RR$, where $I subset.eq RR$ is an open connected set. Then the analogous scenario is: $f$ is subharmonic iff: for any $a, b in I$ and any harmonic (linear) function such that $f(a) <= u(a)$ and $f(b) <= u(b)$, it follows that $f(x) <= u(x)$ for all $x in (a,b)$. This is the criteria for convexity. Therefore, subharmonicity is a higher-dimension generalization of convexity.
#proposition[
  A harmonic function $f: U -> RR$ (where $U subset.eq CC$ is an open region) is subharmonic.
]
#proof[
  For any $overline(D(p, r)) subset.double U$ and $u : overline(D(p, r)) --> RR$ harmonic such that $f <= u$ on $partial D(p,r)$, $f - u$ is harmonic on $overline(D(p,r))$ and non-positive on the boundary circle. By the Maximum Principle, for any $z in D(p,r)$,
  $ (f - u)(z) <= sup_(zeta in partial D(p,r)) (f-u)(zeta) <= 0 ==> f(z) <= u(z). $
  Then $f$ is subharmonic.
]
