#import "/lib.typ": *

== Complex Differentiation

For $U subset.eq CC$ and a complex function $f: U -> CC$, $f(z)$ is _complex differentiable_ at $z in U$ if the following limit exists, regardless of the direction $Delta z$ approaches $0$ from:
$ lim_(Delta z -> 0) (f(z + Delta z) - f(z)) / (Delta z). $

We can consider $f(z)$ to be a bivariate function $f(x, y)$ for $z = x + ii y$. Two main cases we are concerned with are when $Delta z$ approaches $0$ from the real and imaginary axes:
$
  lim_(Delta z -> 0\ Delta z in RR) (f(z + Delta z) - f(z)) / (Delta z)
  =
  lim_(Delta z -> 0\ Delta z in RR) (f(z + ii Delta z) - f(z)) / (ii Delta z).
$
Expressing $f(z)$ as $f(x, y) = u(x, y) + ii v(x, y)$,
$
  lim_(Delta z -> 0\ Delta z in RR) (f(z + Delta z) - f(z)) / (Delta z)
  = lim_(Delta z -> 0\ Delta z in RR) (f(x + Delta z, y) - f(x, y)) / (Delta z)
  = pdv(u, x) + ii pdv(v, x),
$
and
$
  lim_(Delta z -> 0\ Delta z in RR) (f(z + ii Delta z) - f(z)) / (ii Delta z)
  = -ii lim_(Delta z -> 0\ Delta z in RR) (f(x, y + Delta z) - f(x, y)) / (Delta z)
  = pdv(v, y) - ii pdv(u, y).
$
By comparing the real and imaginary parts, we obtain necessary conditions for complex differentiability:
$ pdv(u, x) = pdv(v, y) quad "and" quad pdv(v, x) = -pdv(u, y) $ <eq:cauchy_riemann_eqs_1>
By multiplying the second equation by $ii$ and adding it to the first, we obtain the equivalent form
$ pdv(f, x) = -ii pdv(f, y). $ <eq:cauchy_riemann_eqs_2>
The identities @eq:cauchy_riemann_eqs_1 and @eq:cauchy_riemann_eqs_2 are known as the _Cauchy--Riemann equations_.

Although this condition is necessary, it is not sufficient. Consider the function
$ f(z) = sqrt(abs(Re(z) Im(z))). $
Let $z = x + ii y$, $x = alpha t$, and $y = beta t$. Then
$
  lim_(z -> 0) (f(z) - f(0)) / (z - 0)
  = lim_(z -> 0) f(z) / z
  = lim_(t -> 0) sqrt(abs(alpha beta t^2)) / (alpha t + ii beta t)
  = sqrt(abs(alpha beta)) / (alpha + ii beta).
$
The derivative along $alpha = 1$, $beta = 0$, or the real axis, vanishes. Along $alpha = 0$, $beta = 1$, or the imaginary axis, it also vanishes. However, the limit is different for any other pair of $alpha$ and $beta$, and hence for other directions of approach.

#definition("Holomorphy")[
  A function $f: U -> CC$ is said to be _holomorphic_ at $z_0 in U$ if it is complex differentiable on a neighborhood of $z_0$. If $f(z)$ is holomorphic for every point in an open connected set $U$, then it is said to be holomorphic over $U$. A function is holomorphic over a compact set $K$ if it is holomorphic on a neighborhood of $K$.
] <def:holomorphy>

Weierstrass provided the following classification:

#definition[
  A function is _entire_ if it is holomorphic over $CC$.
]

For the purpose of the following contents, a _region_ or _domain_ will denote a nonempty, open, connected subset of the complex plane.

#theorem[
  Let $U subset.eq CC$ be open, and let $f: U -> CC$ be a function. Then $f$ is holomorphic on $U$ iff $f in C^1 (U)$ and satisfies the Cauchy--Riemann equations.
] <thm:holomorphy_condition>

#proof[
  The first part is to prove that any holomorphic function on $U$ has continuous first-order partial derivatives in $U$. This requires an argument that will be covered later, specifically in @sec:analyticity_and_holomorphy, which states that the complex derivative of any holomorphic function is also holomorphic over the region.

  For the second part, let $f(z) = f(x, y) = u(x, y) + ii v(x, y)$. Assume that $u, v in C^1 (brace.l z_0 brace.r)$ and satisfy the Cauchy--Riemann equations at $z_0 = x_0 + ii y_0$. Let
  $
    alpha = pdv(u, x)(x_0, y_0) = pdv(v, y)(x_0, y_0), quad beta = pdv(v, x)(x_0, y_0) = -pdv(u, y)(x_0, y_0).
  $
  Then because $u, v in C^1 (U)$ have continuous partial derivatives, $forall x + ii y in U$:
  $
    u(x, y) - u(x_0, y_0) = alpha (x - x_0) - beta (y - y_0) + order(abs(Delta z)),
  $
  $
    v(x, y) - v(x_0, y_0) = beta (x - x_0) + alpha (y - y_0) + order(abs(Delta z)),
  $
  where $abs(Delta z) = sqrt(Delta x^2 + Delta y^2)$ and $order(abs(Delta z))$ denotes a value with higher infinitesimal order to $abs(Delta z)$, or that $lim_(Delta z -> 0) (order(abs(Delta z))) / abs(Delta z) = 0$. Then letting $Delta z = x - x_0 + ii (y - y_0)$,
  $
    f(z) - f(z_0) = alpha Delta z + ii beta Delta z + order(abs(Delta z)) + order(abs(Delta z)),
  $
  $
    (f(z) - f(z_0)) / (z - z_0) = alpha + ii beta + (order(abs(Delta z))) / abs(Delta z) dot abs(Delta z) / (Delta z).
  $
  Taking the limit as $Delta z -> 0$, the high order infinitesimals on the right-hand side vanish, and
  $ lim_(Delta z -> 0) (f(z) - f(z_0)) / (z - z_0) = alpha + ii beta. #qedhere $
]

We will prove later in @sec:analyticity_and_holomorphy that the complex derivative of a holomorphic function $f(z) = u(z) + ii v(z)$ is holomorphic. Under this assumption, $f(z)$ has continuous second-order partial derivatives, and therefore,
$ pdv(u, x, y) = pdv(u, y, x), quad pdv(v, x, y) = pdv(v, y, x), $
and by the Cauchy--Riemann equations,
$ pdv(u, x, 2) = pdv(v, x, y), quad pdv(u, y, 2) = -pdv(v, y, x), $
and
$ pdv(v, x, 2) = -pdv(u, x, y), quad pdv(v, y, 2) = pdv(u, y, x). $
Adding the equations,
$ pdv(u, x, 2) + pdv(u, y, 2) = 0, quad pdv(v, x, 2) + pdv(v, y, 2) = 0. $
This general type of equation is known as _Laplace's equation_, which is a basic example of an elliptic partial differential equation. Define the operator (the _Laplacian_)
$ laplacian = div grad = pdv(, x, 2) + pdv(, y, 2). $
#definition[Harmonicity][
  For a given region $U subset.eq CC$, a real-valued function $u in C^2 (U)$ satisfying Laplace's equation $laplacian u = 0$ is a _harmonic function_.
]
Thus, the real and complex parts of a holomorphic function are harmonic functions.

Letting $x = r cos theta$, $y = r sin theta$, the Laplacian is equal to:
$
  laplacian & = pdv(, x, 2) + pdv(, y, 2)
  = pdv(, x)(pdv(r, x) pdv(, r) + pdv(theta, x) pdv(, theta))
  + pdv(, y)(pdv(r, y) pdv(, r) + pdv(theta, y) pdv(, theta)) \
  & = pdv(, x)(x/r pdv(, r) - y/r^2 pdv(, theta))
  + pdv(, y)(y/r pdv(, r) + x/r^2 pdv(, theta)) \
  & = (x/r pdv(, r) - y/r^2 pdv(, theta))(x/r pdv(, r) - y/r^2 pdv(, theta)) + (y/r pdv(, r) + x/r^2 pdv(, theta))(y/r pdv(, r) + x/r^2 pdv(, theta)) \
  & = (cos theta pdv(, r) - (sin theta)/r pdv(, theta))(cos theta pdv(, r) - (sin theta)/r pdv(, theta)) \
  & quad"" + (sin theta pdv(, r) + (cos theta)/r pdv(, theta))(sin theta pdv(, r) + (cos theta)/r pdv(, theta)) \
  & = cos^2 theta pdv(, r, 2)
  - cos theta sin theta (-1/r^2 pdv(, theta) + 1/r pdv(, theta, r)) \
  & quad"" - (sin theta)/r (-sin theta pdv(, r) + cos theta pdv(, theta, r))
  + (sin theta)/r^2 (cos theta pdv(, theta) + sin theta pdv(, theta, 2)) \
  & wide"" + sin^2 theta pdv(, r, 2)
  + sin theta cos theta (-1/r^2 pdv(, theta) + 1/r pdv(, theta, r)) \
  & quad wide"" + (cos theta)/r (cos theta pdv(, r) + sin theta pdv(, theta, r)) + (cos theta)/r^2 (-sin theta pdv(, theta) + cos theta pdv(, theta, 2)) \
  & = pdv(, r, 2) + 1/r^2 pdv(, theta, 2) + 1/r pdv(, r).
$ <eq:laplacianpolarform>

#proposition[
  Let $U subset.eq CC$ be open and connected and let $f: U -> RR$ be holomorphic. It follows that $f$ is constant over $U$.
] <prop:realvaluedholomorphicfunctionconstant>

#proof[
  Since $f(x, y) = u(x, y) + ii v(x, y)$ is real-valued, $v(x, y) equiv 0$ on $U$. Then by the Cauchy--Riemann equations on $U$, $pdv(u, x) = pdv(v, y) = 0$. Similarly, $pdv(u, y) = -pdv(v, x) = 0.$ Therefore, $f(z) = u(z)$ is constant.
]
#chapter-section("wirtinger_derivatives")[
  #include "wirtinger_derivatives/index.typ"
]
