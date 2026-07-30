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
