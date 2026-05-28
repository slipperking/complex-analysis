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
  The Koebe functions are more extremal in the sense that it satisfies the conclusion $abs(a_n) = n$ for all $n in NN$; its power series is given by
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
  be an annulus for $0 < r < 1$. Then $exists eta > 0$ such that $forall r>0$ sufficiently small ($eta$ independent of $r$), $h(A_r)$ lies in an ellipse with a semi-major axis $ alpha = (1 / r + abs(b_1) eta) sqrt(1 + eta r^3) $ and a semi-minor axis $ beta = (1 / r - abs(b_1) eta) sqrt(1 + eta r^3). $
]

#proof[
  Let $ tilde(h)(z) = sqrt((overline(b_1)) / (abs(b_1))) h(z sqrt((overline(b_1)) / abs(b_1))) - sqrt((overline(b_1)) / abs(b_1)) b_0 $ (where the branch or value of the square root is the same across), so that
  $
    tilde(h)(z) = 1 / z + sum_(n=1)^oo ((overline(b_1)) / (abs(b_1)))^((1+n)/2) b_n z^n = 1/z + sum_(n=0)^oo tilde(b_n) z^n, "where" tilde(b_0)=0 and tilde(b_1) = abs(b_1).
  $
  Heuristically, we applied a rigid transformation to $h$ so that the result has no constant term and whose linear coefficient is real. Trivially, if the conclusions of the statement are satisfied for $tilde(h)$, then they naturally follow for $h$. Hence, without loss of generality, we consider only $h(z)$ such that $b_0 = 0$ and $b_1 in RR$, or when $h(z) = 1 / z + b_1 z + phi.alt(z)$ where $phi.alt(z) = Order(z^2)$. For $z = r ee^(ii theta)$,
  $
    h(z) & = 1 / r (cos theta - ii sin theta) + b_1 r (cos theta + ii sin theta) + phi.alt(r ee^(ii theta)) \
         & = ((1 / r + b_1 r) cos theta + Re phi.alt) + ii ((b_1 r - 1 / r) sin theta + Im phi.alt).
  $
  Let $alpha' = 1/r + b_1 r$ and let $beta' = 1/r - b_1 r$. Then
  $
    [Re h(r ee^(ii theta))]^2/ alpha'^2 + [Im h(r e^(ii theta))]^2 / beta'^2 &= cos^2 theta + [Re phi.alt]^2/alpha'^2 + (2 cos theta Re phi) / alpha'
    \ & wide"" + sin^2 theta + [Im phi.alt]^2 / beta'^2 - (2 sin theta Im phi.alt) / beta'.
  $
  Since for all $alpha' / (1/(2r)) = 2 + 2b_1r^2 -> 2$, and $beta' / (1/(2r)) = 2-2b_1 r^2 -> 2$ as $r -> 0^+$, for sufficiently small $r$, $alpha'>1/(2r)$ and $beta' > 1/(2r)$. Similarly, for sufficiently small $r$
  $
    abs((Re phi.alt(r ee^(ii theta)))/ alpha'),abs((Im phi.alt(r ee^(ii theta)))/ beta') < Order(r^2)/(1/(2r)) = Order(r^3)< eta' r^3,
  $
  for some constant $eta'>0$, so that $ [Re h(r ee^(ii theta))]^2/ alpha'^2 + [Im h(r ee^(ii theta))]^2 / beta'^2 &< 1 + 2eta'^2 r^6 + (2 cos theta Re phi) / alpha' - (2 sin theta Im phi.alt) / beta'\
  &<1+ order(r^3) + 4eta' r^3<1+eta r^3 $
  for some constant $eta>0$ and sufficiently small $r$. From rearrangement, $ [Re h(r e^(ii theta))]^2/ (alpha' sqrt(1+eta r^3))^2 + [Im h(r e^(ii theta))]^2 / (beta' sqrt(1+eta r^3))^2 <1. $
  Define $alpha,beta$ as in the theorem statement. It follows that $h(r e^(ii theta))$ lies in the region bounded by the ellipse centered at $0$ with semi-major and semi-minor axes $alpha,beta$, respectively.

  Since $h(0) = oo$, it follows that $h$ (which is injective by the univalence of $f$) maps $D(0,r)$ to a neighborhood of $oo$ and maps $partial D(0,r)$ to the interior of the previous ellipse.

  By the Jordan Curve Theorem (@thm:jordancurve), $CC without h(partial D(0,r))$ contains two connected regions. Since $h$ maps a neighborhood $U$ of $partial D(0,r)$ to a neighborhood of $h(partial D(0,r))$ by the Open Mapping Theorem (@thm:openmapping), for a point $w in h(partial D(0,r))$, there exists a disk $D(w,epsilon) subset.eq h(U)$, which intersects both $jinterior h(partial D(0,r))$ and $jexterior h(partial D(0,r))$ (because $w$ is an accumulation point of both sets as it lies in the boundary).

  Thus, there exist points in $U$ which map into $jinterior h(partial D(0,r))$, (hence map to points in the ellipse). Because $h$ maps connected sets to connected sets, and no point in $h(D(0,r))$ can map to $jinterior h(partial D(0,r))$ (as otherwise the set would be disconnected), therefore all points inside $A_r$ map into $jinterior h(partial D(0,r))$.
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
