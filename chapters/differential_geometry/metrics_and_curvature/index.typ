#import "/lib.typ": *

== Conformal Metrics and Curvature

Let $Omega subset.eq CC$ be a region and let $rho in C^0 (Omega)$ be a positive function. The _conformal metric_ (in the following chapters when we refer to _metric_ we mean conformal) induced by $rho$ is given by

$
  dif s = rho(z) abs(dz) quad "or" quad dif s^2 = rho(z)^2 abs(dz)^2.
$

The term "conformality" is explained in the previous section (note that this specific usage has little to do with holomorphy). The distance between two points $z_1,z_2 in Omega$ is defined as

$
  d (z_1, z_2) = inf_(gamma subset Omega) integral_gamma rho(z) abs(dz),
$

where the infimum is taken over all piecewise smooth curves $gamma$ in $Omega$ joining $z_1$ and $z_2$.

A $C^2$ metric is said to be _regular_. The (Gaussian) _curvature_ of the regular metric $rho$ at $z in Omega$ is defined as

$
  K_rho (z) = -(laplacian(log rho(z)))/(rho(z)^2),
$ <eq:curvatureofmetric>

where $laplacian = pdv(, x, 2, style: "horizontal") + pdv(, y, 2, style: "horizontal") = 4 pdv(, overline(z), z, style: "horizontal")$ is the Laplacian operator. This is the same definition as the Gaussian curvature in @eq:gaussiancurvatureofsurface_gaussiancurvatureconformalmetricformula.

The three following metrics are of particular interest in complex differential geometry:

+ Perhaps the most trivial metric is the _Euclidean metric_ (also known as the _parabolic metric_) on $CC$, and is given by

  $
    rho = 1, quad dif s^2 = abs(dz)^2.
  $

  The _Euclidean distance_ between two points $z_1,z_2 in CC$ is

  $
    inf_gamma integral_gamma abs(dz) = abs(z_2 - z_1)
  $

  is the length of the straight line segment connecting $z_1$ and $z_2$. The group formed by all transformations in the form of $z |-> ee^(ii theta) z + a$ (where $a in CC$ and $theta in RR$) is known as _the group of rigid motions_, or more abstractly, the _special Euclidean group_ of order $2$, denoted by $op("SE")(2) < Aut(CC)$, intuitively consists of all rotations and translations and their compositions, while the _Euclidean_ group $op("E")(2) > op("SE")(2)$ consists of reflections in the form of $z |-> ee^(ii theta) overline(z) + a$. Obviously, the Euclidean metric is invariant under both groups.

  From @eq:curvatureofmetric, we find that Euclidean metric has curvature $K = 0$.

+ The _Poincaré metric_ (also referred to as the _hyperbolic metric_) on $DD$ is given by

  $
    lambda(z) = 2 / (1 - abs(z)^2), quad dif s_lambda^2 = (4 abs(dz)^2)/((1 - abs(z)^2)^2).
  $ <eq:poincaremetricdefinition>

  In @lem:schwarzpick, it was shown that the metric is invariant under $Aut(DD)$.

  We will now calculate the Poincaré distance between two points $z_1,z_2 in CC$. First assume the case where $z_1 = 0$ and $z_2 = R in (0, 1)$. Consider a piecewise smooth curve $gamma subset DD$ parameterized by $z(t)$ connecting $z_1$ and $z_2$; or in other words

  $
    z(t) = x(t) + ii y(t), quad z(0) = z_1 = 0, quad z(1) = z_2 = R,
  $

  where $x in C^1([0, 1])$ and $y in C^1([0, 1])$ are real-valued functions. Then

  $
    integral_gamma dif s & = integral_0^1 (2 sqrt(x'(t)^2 + y'(t)^2))/(1 - x(t)^2 - y(t)^2) dt \
                         & >= integral_0^1 (2 abs(x'(t)))/(1 - x(t)^2) dt >= abs(integral_0^1 (2 x'(t))/(1 - x(t)^2) dt) \
                         & = abs(integral_0^R (2 dx) / (1 - x^2)) = log((1 + R)/(1 - R)).
  $

  Assuming that $gamma$ is in the form of $z(t) = R t, z'(t) = R$ where $t in [0, 1]$, we have

  $
    integral_gamma dif s = integral_0^1 (2 R dt)/(1 - R^2 t^2) = log((1 + R)/(1 - R)).
  $

  Hence, the Poincaré distance between $0$ and $R$ is given by

  $
    d (0, R) = log((1 + R)/(1 - R))
  $

  and the straight line segment connecting the two points is a _geodesic_ (path of least length under a metric or other criteria). For fixed $theta in RR$ since $z |-> z ee^(ii theta) in Aut(DD)$, by the Schwarz--Pick Lemma (@lem:schwarzpick), we have

  $
    d (0, R) = d (0, R ee^(ii theta)) = log((1 + R)/(1 - R))
  $

  by the invariance under $Aut(DD)$. Now let $z_1$ and $z_2$ be arbitrary points in $DD$. The Möbius transformation

  $
    phi_(z_1) (z) = (z - z_1)/(1 - overline(z_1) z)
  $

  maps $z_1$ to $0$ and maps $z_2$ to $(z_2 - z_1)/(1 - overline(z_1) z_2)$. Hence, we have

  $
    d (z_1, z_2) = d (0, (z_2 - z_1)/(1 - overline(z_1) z_2)) = log[(1 + abs((z_2 - z_1)/(1 - overline(z_1) z_2)))/(1 - abs((z_2 - z_1)/(1 - overline(z_1) z_2)))] = inf_gamma integral_gamma dif s,
  $

  which is the Poincaré distance (or _hyperbolic distance_) between $z_1$ and $z_2$. The infimum is attained along the geodesic curve $gamma$ parameterized by

  $
    z(t) = (phi_(z_1))^(-1) ((z_2 - z_1)/(1 - overline(z_1) z_2) t)
  $

  for $t in [0, 1]$. By @thm:linearfractionaltransformationmapscirclestocircles, the geodesic is either an arc or a straight line segment passing through $z_1$ and $z_2$. Since $partial DD$ is orthogonal to the straight line passing through $0$ and $(z_2 - z_1)/(1 - overline(z_1) z_2)$, by the conformality of $phi_(z_1)^(-1)$, $phi_(z_1)^(-1)(partial DD) = partial DD$ is orthogonal to the circular (or straight line) extension of the geodesic curve.

  As a consequence of the Schwarz--Pick Lemma (@lem:schwarzpick), for any $f:DD -> DD$ is holomorphic, we have

  $
    d (f (z_1), f (z_2)) <= d (z_1, z_2),
  $

  where equality is attained iff $f in Aut(DD)$. The Poincaré metric has constant negative curvature $-1$ since

  $
    K_lambda & = -(4)/(lambda^2) pdv(log compose lambda, overline(z), z) = -(4)/(lambda^2) pdv(((lambda'_z)/(lambda)), overline(z), style: "large") = -2/(lambda^2) pdv(((2 overline(z))/(1 - abs(z)^2)), overline(z), style: "large") \
    & = -(2)/(lambda^2) (lambda + overline(z) lambda'_(overline(z))) = -((1 - abs(z)^2)^2)/(2) (lambda + overline(z) (2 z)/((1 - abs(z)^2)^2)) \
    & = -(1 - abs(z)^2) - abs(z)^2 = -1,
  $

  where $lambda'_z = pdv(lambda, z, style: "horizontal")$ and $lambda'_(overline(z)) = pdv(lambda, overline(z), style: "horizontal")$.

+ The _spherical metric_ (also referred to as the _elliptic metric_) on $extcomplex$ is given by

  $
    sigma(z) = 2 / (1 + abs(z)^2), quad dif s_sigma^2 = (4 abs(dz)^2)/((1 + abs(z)^2)^2).
  $ <eq:sphericalmetricdefinition>

  Under the inverse stereographic projection of $S^2 -> extcomplex$, for a given $z in extcomplex$, the corresponding point in $S^2$ is

  $
    (x_1, x_2, x_3) = ((z + overline(z))/(abs(z)^2 + 1), (z - overline(z))/(ii abs(z)^2 + ii), (abs(z)^2 - 1)/(abs(z)^2 + 1)).
  $

  If we let $P = (x_1, x_2, x_3)$ and $Q = (tilde(x_1), tilde(x_2), tilde(x_3))$ be two points in $S^2$, the distance between the two points is the length of the shortest arc $widearc(P Q)$ (a subset of great circle passing the two points). By considering $P$ and $Q$ as vectors from $(0, 0, 0)$, this distance is equal to

  $
    & display(arccos(P dot Q) = 2 arctan sqrt((1 - x_1 tilde(x_1) - x_2 tilde(x_2) - x_3 tilde(x_3))/(1 + x_1 tilde(x_1) + x_2 tilde(x_2) + x_3 tilde(x_3))))\
    & quad""= 2 arctan sqrt((1 - ((z + overline(z))(tilde(z) + overline(tilde(z))))/((abs(z)^2 + 1)(abs(tilde(z))^2 + 1)) + ((z - overline(z))(tilde(z) - overline(tilde(z))))/((abs(z)^2 + 1)(abs(tilde(z))^2 + 1)) - ((abs(z)^2 - 1)(abs(tilde(z))^2 - 1))/((abs(z)^2 + 1)(abs(tilde(z))^2 + 1)))/(1 + ((z + overline(z))(tilde(z) + overline(tilde(z))))/((abs(z)^2 + 1)(abs(tilde(z))^2 + 1)) - ((z - overline(z))(tilde(z) - overline(tilde(z))))/((abs(z)^2 + 1)(abs(tilde(z))^2 + 1)) + ((abs(z)^2 - 1)(abs(tilde(z))^2 - 1))/((abs(z)^2 + 1)(abs(tilde(z))^2 + 1)))) \
    & quad""= 2 arctan sqrt((-z overline(tilde(z)) - overline(z) tilde(z) + abs(z)^2 + abs(tilde(z))^2)/(z overline(tilde(z)) + overline(z) tilde(z) + abs(z)^2 abs(tilde(z))^2 + 1)) = 2 arctan sqrt(((z - tilde(z))(overline(z) - overline(tilde(z))))/((z overline(tilde(z)) + 1)(overline(z) tilde(z) + 1))).
  $

  Notice that the fraction within the square root is a product between a complex number and its conjugate. Thus, this distance is equal to

  $
    d (z, tilde(z)) = 2 arctan abs((z - tilde(z))/(z overline(tilde(z)) + 1))
  $

  in the extended complex plane. Let $tilde(z) = z + Delta z$. It follows that

  $
    & d (z, z + Delta z) = 2 arctan abs((Delta z)/(abs(z)^2 + z overline(Delta z) + 1)) \
    & wide = 2 arctan abs((Delta z)/(abs(z)^2 + 1) 1/(1 + (z overline(Delta z))/(abs(z)^2 + 1))) \
    & wide = 2 arctan abs((Delta z)/(abs(z)^2 + 1) (1 + Order(Delta z))) = 2 arctan abs((Delta z)/(abs(z)^2 + 1) + Order(Delta z^2)) \
    & wide = 2 [abs((Delta z)/(abs(z)^2 + 1) + Order(Delta z^2)) + Order(Delta z^3 [1/(abs(z)^2 + 1) + Order(Delta z)]^3)] \
    & wide = 2 [abs((Delta z)/(abs(z)^2 + 1) + order(Delta z^2))],
  $

  where we have taken the liberty to coalesce orders for simplification. Since

  $
    lim_(Delta z -> 0) abs((d (z, z + Delta z))/(Delta z)) = 2 / (abs(z)^2 + 1),
  $

  the metric as defined in @eq:sphericalmetricdefinition has a clear geometric meaning: the distance between two points $z$ and $tilde(z)$ under the metric in @eq:sphericalmetricdefinition is the shortest distance between the corresponding points in $S^2$, or their spherical distance.

  Thus, if curve $gamma$ joins $z$ and $tilde(z)$, we have

  $
    d (z, tilde(z)) = inf_gamma integral_gamma sigma(z) abs(dz),
  $

  which attains its infimum when the inverse stereographic projection of $gamma$ is a great circle of $S^2$. Thus, $sigma$ is known as the spherical metric.

  The corresponding curvature is given by

  $
    K_sigma & = -4/(sigma^2) pdv(, overline(z), z)(log sigma(z)) = -(4)/(sigma^2) pdv(((sigma'_z)/(sigma)), overline(z), style: "large") = 2/(sigma^2) pdv(((2 overline(z))/(1 + abs(z)^2)), overline(z), style: "large") \
    & = (2)/(sigma^2) (sigma + overline(z) sigma'_(overline(z))) = ((1 + abs(z)^2)^2)/(2) (2/(1 + abs(z)^2) - (2 abs(z)^2)/((1 + abs(z)^2)^2)) \
    & = (1 + abs(z)^2) - abs(z)^2 = 1,
  $

  where $sigma'_z = pdv(sigma, z, style: "horizontal")$ and $sigma'_(overline(z)) = pdv(sigma, overline(z), style: "horizontal")$. This can also be verified by computing the principal curvatures of the unit sphere, which are both one.

The importance of the selected regions lies in the uniformization to be mentioned in @ sec:riemannsurfaces.

Let $Omega_1$ and $Omega_2$ be two open regions in $CC$ such that $f:Omega_1 -> Omega_2$ is univalent (implying that $f' != 0$ by @lem:univalentnonvanishingderivative). If $rho$ is a metric on $Omega_2$, then

$
  f^*rho = (rho compose f) abs(f')
$ <eq:pullbackmetric>

defines a metric on $Omega_1$, referred to as the _metric pullback of_ $rho$ _by_ $f$.

Curvature as defined in @eq:curvatureofmetric is invariant under pullbacks of conformal mappings, or in the case above, we now aim to show that (under assumptions of regularity)

$
  K_rho (f(z)) = K_(f^*rho) (z).
$ <eq:curvatureinvarianceunderholomorphicpullback>

By explicit definition,

$
  K_(f^*rho) (z) = -(laplacian(log compose f^*rho(z)))/((f^*rho)(z)^2) = -(laplacian(log compose rho compose f)(z) + laplacian(log abs(f'(z))))/((f^*rho)(z)^2).
$

Since $f'(z) != 0$, $log compose abs(f') = Re log(f')$ is harmonic on $Omega_1$ with a vanishing Laplacian. Hence,

$
  K_(f^*rho) (z) & = -(laplacian(log compose rho compose f(z)))/((rho compose f)^2 abs(f')^2) = -4/((rho compose f)^2 abs(f')^2) pdv((pdv(, z,)(log compose rho compose f(z))), overline(z), style: "large") \
  & = -4/((rho compose f)^2 abs(f')^2) pdv((pdv(, f)(log compose rho compose f)pdv(f, z) + pdv(, overline(f))(log compose rho compose f) pdv(overline(f), z) ), overline(z), style: "large") \
  & = -4/((rho compose f)^2 abs(f')^2) pdv((pdv(log compose rho compose f, f)pdv(f, z) + pdv(log compose rho compose f, overline(f)) overline((pdv(f, overline(z))))), overline(z), style: "large") \
  & = -4/((rho compose f)^2 abs(f')^2) pdv(f, z) pdv((pdv(log compose rho compose f, f)), overline(z), style: "large") \
  & = -4/((rho compose f)^2 abs(f')^2) pdv(f, z) (pdv(log compose rho compose f, f, [2]) pdv(f, overline(z)) + pdv(log compose rho compose f, overline(f), f) overline((pdv(f, z)))) \
  & = -4/((rho compose f)^2) pdv(log compose rho compose f, overline(f), f) = -(laplacian_f (log compose rho compose f))/((rho compose f)^2) = K_rho (f(z)).
$

For a given metric $dif s = lambda(z) abs(dz)$, if there is some other parameterization such that $dif s = lambda'(z') abs(dz')$, $z' = f(z)$ is conformal, then the relation is given by $lambda = f^*lambda'$. Under differing parameterizations of a metric $dif s$, we once again have the invariance of curvature.
