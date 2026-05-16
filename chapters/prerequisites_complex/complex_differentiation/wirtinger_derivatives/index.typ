#import "/lib.typ": *

=== Wirtinger Derivatives

We have previously introduced the concept of expressing a complex function as a function of $x$ and $y$. It can also be expressed in terms of $z$ and $overline(z)$, where $z = x + ii y$ and $overline(z) = x - ii y$. Then $abs(z)^2 = z overline(z)$, $x = (z + overline(z)) / 2$, and $y = (z - overline(z)) / (2 ii)$. By the rules of the derivative, it is only natural that we define
$ pdv(, z) = pdv(, x) pdv(x, z) + pdv(, y) pdv(y, z) = 1/2 (pdv(, x) - ii pdv(, y)) $ <eq:wirtingerderivative1>
and
$
  pdv(, overline(z)) = pdv(, x) pdv(x, overline(z)) + pdv(, y) pdv(y, overline(z)) = 1/2 (pdv(, x) + ii pdv(, y)).
$ <eq:wirtingerderivative2>
If @eq:wirtingerderivative1 is set equal to 0, then it is the equivalent form of the homogeneous Cauchy--Riemann Equations. Then for a holomorphic function $f(z)$, the Wirtinger derivative $pdv(f, z) = dv(f, z)$.

In terms of $u$ and $v$, the two derivatives of a function $f(z)$ are equal to:
$ pdv(f, z) = 1/2 (pdv(u, x) + ii pdv(v, x) - ii pdv(u, y) + pdv(v, y)), $
and
$ pdv(f, overline(z)) = 1/2 (pdv(u, x) + ii pdv(v, x) + ii pdv(u, y) - pdv(v, y)). $
If $f$ is holomorphic,
$
  dv(f, z) = pdv(u, x) + ii pdv(v, x) = pdv(v, y) + ii pdv(v, x) = pdv(u, x) - ii pdv(u, y) = pdv(v, y) - ii pdv(u, y).
$ <eq:holomorphic_derivative_decomposition>
On the contrary, by the rules of the derivative,
$ pdv(, x) = pdv(, z) pdv(z, x) + pdv(, overline(z)) pdv(overline(z), x) = pdv(, z) + pdv(, overline(z)) $
and
$ pdv(, y) = pdv(, z) pdv(z, y) + pdv(, overline(z)) pdv(overline(z), y) = ii pdv(, z) - ii pdv(, overline(z)). $
The Laplacian is equal to
$
  Delta = pdv(, x, 2) + pdv(, y, 2) & = (pdv(, z) + pdv(, overline(z)))^2 + (ii pdv(, z) - ii pdv(, overline(z)))^2 \
                                    & = pdv(, z, 2) + pdv(, overline(z), 2) + 2 pdv(, z, overline(z)) \
                                    & quad""- pdv(, z, 2) - pdv(, overline(z), 2) + 2 pdv(, z, overline(z)) \
                                    & = 4 pdv(, z, overline(z)).
$<eq:laplaciancomplexform>
Under this definition, we can derive the chain rule:

#theorem("Chain Rule")[
  Let $Omega subset.eq CC$ be a region such that $g in C^1(Omega)$ and $f in C^1(g(Omega))$. Writing $w = g(z)$, it follows that
  $
    pdv(, z)(f compose g) &= (pdv(f, w) compose g) pdv(g, z) + (pdv(f, overline(w)) compose g) pdv(overline(g), z) \
    pdv(, overline(z))(f compose g) &= (pdv(f, w) compose g) pdv(g, overline(z)) + (pdv(f, overline(w)) compose g) pdv(overline(g), overline(z)).
  $
] <thm:wirtingerchainrule>

#proof[
  Write $z = x + ii y$. Let
  $ g(z) = xi(x, y) + ii eta(x, y), quad w = xi + ii eta $
  so that $w = g(z)$ with $xi = xi(x, y), eta = eta(x, y)$. Let $f$ be regarded as a $C^1$ function of the real variables $xi, eta$; equivalently we may view $f$ as $f(w, overline(w))$ where $overline(w) = xi - ii eta$. The composition is $h(z) = f compose g(z) = f(xi(x, y), eta(x, y))$.

  Using the real chain rule (provided by the continuous differentiability), we have
  $
    pdv(h, x) = pdv(f, xi) pdv(xi, x) + pdv(f, eta) pdv(eta, x), quad pdv(h, y) = pdv(f, xi) pdv(xi, y) + pdv(f, eta) pdv(eta, y).
  $
  Hence,
  $ pdv(h, z) = 1/2 [pdv(f, xi) (pdv(xi, x) - ii pdv(xi, y)) + pdv(f, eta) (pdv(eta, x) - ii pdv(eta, y))]. $

  Now recall
  $ pdv(f, w) = 1/2 (pdv(f, xi) - ii pdv(f, eta)), quad pdv(f, overline(w)) = 1/2 (pdv(f, xi) + ii pdv(f, eta)). $
  Thus,
  $ pdv(f, xi) = pdv(f, w) + pdv(f, overline(w)), quad pdv(f, eta) = ii (pdv(f, w) - pdv(f, overline(w))). $

  Then by substitution,
  $
    pdv(h, z) & = 1/2 [(pdv(f, w) + pdv(f, overline(w)))(pdv(xi, x) - ii pdv(xi, y)) \
              & quad ""+ ii (pdv(f, w) - pdv(f, overline(w)))(pdv(eta, x) - ii pdv(eta, y))] \
              & = pdv(f, w) 1/2 [(pdv(xi, x) - ii pdv(xi, y)) + ii (pdv(eta, x) - ii pdv(eta, y))] \
              & quad ""+ pdv(f, overline(w)) 1/2 [(pdv(xi, x) - ii pdv(xi, y)) - ii (pdv(eta, x) - ii pdv(eta, y))].
  $

  The terms in brackets equal $pdv(g, z)$ and $pdv(overline(g), z)$. Thus,
  $ pdv(h, z) = (pdv(f, w) compose g) pdv(g, z) + (pdv(f, overline(w)) compose g) pdv(overline(g), z). $

  A similar calculation using @eq:wirtingerderivative2 gives
  $
    pdv(, overline(z))(f compose g) = (pdv(f, w) compose g) pdv(g, overline(z)) + (pdv(f, overline(w)) compose g) pdv(overline(g), overline(z)).
  $
  These are exactly the proclaimed identities.
]

Last we have taking derivatives of conjugates:

#theorem[
  Let $f in C^1(Omega)$ where $Omega subset.eq CC$ is a region. Then
  $ pdv(overline(f), z) = overline(pdv(f, overline(z))), quad pdv(overline(f), overline(z)) = overline(pdv(f, z)). $
]

#proof[
  Write $z = x + ii y$ and $f(z) = u(x, y) + ii v(x, y)$ with $u, v in C^1(Omega)$. Then $overline(f(z)) = u(x, y) - ii v(x, y)$. We compute
  $ pdv(overline(f), z) = 1/2 (pdv(, x) - ii pdv(, y))(u - ii v) = 1/2 (u'_x - v'_y - ii (v'_x + u'_y)). $
  On the other hand,
  $ pdv(f, overline(z)) = 1/2 (pdv(, x) + ii pdv(, y))(u + ii v) = 1/2 (u'_x - v'_y + ii (v'_x + u'_y)). $
  Taking complex conjugates yields
  $ overline(pdv(f, overline(z))) = 1/2 (u'_x - v'_y - ii (v'_x + u'_y)) = pdv(overline(f), z). $
  Similarly,
  $ pdv(overline(f), overline(z)) = 1/2 (pdv(, x) + ii pdv(, y))(u - ii v) = 1/2 (u'_x + v'_y + ii (u'_y - v'_x)), $
  while
  $ pdv(f, z) = 1/2 (pdv(, x) - ii pdv(, y))(u + ii v) = 1/2 (u'_x + v'_y + ii (v'_x - u'_y)). $
  Taking complex conjugates gives
  $ overline(pdv(f, z)) = 1/2 (u'_x + v'_y + ii (u'_y - v'_x)) = pdv(overline(f), overline(z)). #h(1fr) #qedhere $
]
