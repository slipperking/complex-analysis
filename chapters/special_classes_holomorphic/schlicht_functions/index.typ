#import "/lib.typ": *

== Schlicht Functions

#definition[
  A holomorphic function $f : DD -> CC$ is called _schlicht_ iff it is univalent and satisfies $f(0) = 0$ and $f'(0) = 1$.
]

The power series expansion of schlicht $f$ around $0$ is of the form
$
  f(z) = sum_(n=0)^oo (f^((n)) (0)) / (n !) z^n, quad z in DD,
$
which by assumption, simplifies to
$
  f(z) = z + sum_(n=2)^oo a_n z^n, quad z in DD,
$
where $a_n = (f^((n)) (0)) / (n !)$ for $n gt.eq 2$. Two historic results regarding schlicht functions state that

+ The only schlicht functions satisfying $exists n in NN$ with $abs(a_n) = n$ are the Koebe functions in the form of
  $
    z |-> z / (1 - ee^(ii theta) z)^2.
  $
  The Koebe functions are more extremal in that it satisfies the conclusion $abs(a_n) = n$ for all $n in NN$; its power series is given by
  $
    z |-> sum_(n=1)^oo n ee^(ii theta (n - 1)) z^n.
  $
+ For any schlicht $f$ and $forall n in NN$, it holds that $abs(a_n) <= n$.

Both were solved in the 20th century by Louis de Branges in the affirmative. The second statement is known as the _Bieberbach Conjecture_ as it was originally hypothesized by Ludwig Bieberbach.

We will introduce two of the oldest results regarding schlicht functions, namely $abs(a_2) <= 2$ and the Koebe Quarter Theorem (@thm:koebequarter). There are many applications of the latter, for instance, we used it in the proof of Mergelyan's Theorem (@thm:mergelyan).

#lemma[
  Let $f : DD -> CC$ be schlicht and define $h(z) = 1 / (f(z)) = 1 / z + sum_(n=0)^oo b_n z^n$. Let
  $
    A_r = {z in CC : r < abs(z) < 1}
  $
  be an annulus for $0 < r < 1$. Then $exists eta > 0$ such that $forall r in (0, 1)$ ($eta$ independent of $r$), $h(A_r)$ lies in an ellipse with a semi-major axis $alpha = (1 / r + abs(b_1) eta) sqrt(1 + eta r^3)$ and a semi-minor axis $beta = (1 / r - abs(b_1) eta) sqrt(1 + eta r^3)$.
]

#proof[
  Let $tilde(h)(z) = sqrt((overline(b_1)) / (abs(b_1))) h(z (overline(b_1)) / (abs(b_1))) - sqrt((overline(b_1)) / (b_1)) b_0$, so that
  $
    tilde(h)(z) = 1 / z + sum_(n=1)^oo ((overline(b_1)) / (abs(b_1)))^((1 + n) / 2) b_n z^n.
  $
  Heuristically, we apply a rigid transformation to $h$ so that $tilde(h)$ satisfies the theorem hypothesis. Trivially, if the conclusions of the statement are satisfied for $tilde(h)$, then they naturally follow for $h$. Hence, without loss of generality, we consider only $h(z)$ such that $b_0 = 0$ and $b_1 in RR$, or when $h(z) = 1 / z + b_1 z + phi(z)$ where $phi(z) = Order(z^2)$. For $z = r ee^(ii theta)$,
  $
    h(z) & = 1 / r (cos theta - ii sin theta) + b_1 r (cos theta + ii sin theta) + phi(r ee^(ii theta)) \
    &= ((1 / r + b_1 r) cos theta + Re phi) + ii ((b_1 r - 1 / r) sin theta + Im phi).
  $
  TO BE CONTINUED
]

#theorem[
  If $f : DD -> CC$ is schlicht and expands to $sum_(n=1)^oo a_n z^n$, then $abs(a_2) <= 2$.
] <thm:schlichta2leq2>

#theorem("Koebe Quarter Theorem")[
  If $f : DD -> CC$ is schlicht, then the image $f(DD)$ contains the open disk of radius $1 / 4$ centered at $f(0)$.
] <thm:koebequarter>

#chapter-section("bieberbach_conjecture")[
  #include "bieberbach_conjecture/index.typ"
]
