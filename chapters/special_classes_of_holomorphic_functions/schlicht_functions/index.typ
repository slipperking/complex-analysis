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

We will introduce two of the oldest results regarding schlicht functions, namely $abs(a_2) <= 2$ and the Koebe Quarter Theorem (@thm:koebe_quarter). There are many applications of the latter, for instance, we used it in the proof of Mergelyan's Theorem (@thm:mergelyan).

#lemma[
  Let $f : DD -> CC$ be schlicht and define $h(z) = 1 / (f(z)) = 1 / z + sum_(n=0)^oo b_n z^n$. Let
  $
    A_r = {z in CC : r < abs(z) < 1}
  $
  be an annulus for $0 < r < 1$. Then $exists eta > 0$ such that $forall r>0$ sufficiently small ($eta$ independent of $r$), $h(A_r)$ lies in an ellipse with a semi-major axis $ alpha = (1 / r + abs(b_1) eta) sqrt(1 + eta r^3) $ and a semi-minor axis $ beta = (1 / r - abs(b_1) eta) sqrt(1 + eta r^3). $
] <lem:schlicht_inverse_annulus_image_in_ellipse>

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
  for some constant $eta'>0$, so that $ [Re h(r ee^(ii theta))]^2/ alpha'^2 + [Im h(r ee^(ii theta))]^2 / beta'^2 &< 1 + 2eta'^2 r^6 + (2 cos theta Re phi.alt) / alpha' - (2 sin theta Im phi.alt) / beta'\
  &<1+ order(r^3) + 4eta' r^3<1+eta r^3 $
  for some constant $eta>0$ and sufficiently small $r$. From rearrangement, $ [Re h(r e^(ii theta))]^2/ (alpha' sqrt(1+eta r^3))^2 + [Im h(r e^(ii theta))]^2 / (beta' sqrt(1+eta r^3))^2 <1. $
  Define $alpha,beta$ as in the theorem statement. It follows that $h(r e^(ii theta))$ lies in the region bounded by the ellipse centered at $0$ with semi-major and semi-minor axes $alpha,beta$, respectively.

  Since $h(0) = oo$, it follows that $h$ (which is injective by the univalence of $f$) maps $D(0,r)$ to a neighborhood of $oo$ and maps $partial D(0,r)$ to the interior of the previous ellipse.

  By the Jordan Curve Theorem (@thm:jordancurve), $CC without h(partial D(0,r))$ contains two connected regions. Since $h$ maps a neighborhood $U$ of $partial D(0,r)$ to a neighborhood of $h(partial D(0,r))$ by the Open Mapping Theorem (@thm:openmapping), for a point $w in h(partial D(0,r))$, there exists a disk $D(w,epsilon) subset.eq h(U)$, which intersects both $jinterior h(partial D(0,r))$ and $jexterior h(partial D(0,r))$ (because $w$ is an accumulation point of both sets as it lies in the boundary).

  Thus, there exist points in $U$ which map into $jinterior h(partial D(0,r))$, (hence map to points in the ellipse). Because $h$ maps connected sets to connected sets, and no point in $h(D(0,r))$ can map to $jinterior h(partial D(0,r))$ (as otherwise the set would be disconnected), therefore all points inside $A_r$ map into $jinterior h(partial D(0,r))$.
]

#theorem[Area Principle][
  If $f$ is schlicht and if
  $ h(z) = 1/f(z) = 1/z+sum_(j=0)^oo b_j z^j, $
  then $sum_(j=0)^oo j abs(b_j)^2 <= 1$.
]
#proof[
  By @lem:schlicht_inverse_annulus_image_in_ellipse, for sufficiently small $r>0$, $h(A_r)$ lies in an ellipse $E_r$ with a semi-major axis $ alpha = (1 / r + abs(b_1) eta) sqrt(1 + eta r^3) $ and a semi-minor axis $ beta = (1 / r - abs(b_1) eta) sqrt(1 + eta r^3). $ The area of the ellipse is given by $uppi alpha beta = uppi (1 / r^2 - abs(b_1)^2 eta^2) (1 + eta r^3)$. On the other hand,
  $
    uppi/r^2 (1+eta r^3) >= uppi (1 / r^2 - abs(b_1)^2 eta^2) (1 + eta r^3) & = op("area")(E_r) \
                                                                            & >= op("area")(h(A_r)),
  $
  where
  $
    op("area")(h(A_r))&=1/(2ii)integral.double_A_r abs(h'(z))^2 dzetabar and dzeta #tag[(Lusin Area Theorem)] \
    & = integral_r^1 integral_0^(2 uppi) abs(h'(rho ee^(ii theta)))^2 rho dtheta dif rho \
    & = integral_r^1 integral_0^(2 uppi) abs(-rho^(-2) ee^(-2 ii theta)+sum_(j=0)^oo j b_j rho^(j-1) ee^(ii theta(j-1)))^2 rho dtheta dif rho \
    & = integral_r^1 integral_0^(2 uppi) [rho^(-4)+(sum_(j=0)^oo j b_j rho^(j-1) ee^(ii theta(j-1)))overline(sum_(j=0)^oo j b_j rho^(j-1) ee^(ii theta(j-1))) \ &wide""+ 2 Re(-rho^(-2) overline(ee^(-2 ii theta)) sum_(j=0)^oo j b_j rho^(j-1) ee^(ii theta(j-1)))] rho dtheta dif rho \
    &= integral_r^1 [2 uppi rho^(-3) + integral_0^(2 uppi) sum_(j,k in ZZ_(>=0)) j k b_j overline(b_k)ee^(ii theta (j-k)) rho^(j+k-1) dif theta\
      &wide""- 2/rho integral_0^(2 uppi) Re(sum_(j=0)^oo j b_j rho^(j-1) ee^(ii theta(j+1))) dtheta ] dif rho #tag[(a)] \
    &= integral_r^1 [2 uppi rho^(-3) + sum_(j,k in ZZ_(>=0)) j k b_j overline(b_k)(integral_0^(2 uppi) ee^(ii theta (j-k))dtheta) rho^(j+k-1) \
      &wide""- 2/rho Re(sum_(j=0)^oo j b_j rho^(j-1) integral_0^(2 uppi)ee^(ii theta(j+1))) dtheta] dif rho. #tag[(b)]
  $
  Observe that for any $n in ZZ$,
  $
    integral_0^(2 uppi) ee^(ii n theta) dtheta = cases(2 uppi& quad "if" quad n = 0\,, evaluated(1 / (n ii) ee^(ii n theta))_0^(2 uppi) & quad "otherwise") = cases(2 pi& quad "if" n=0\,, 0 & quad "otherwise".)
  $
  Thus, in the second term, only terms with $j=k$ persist. In the third term, since $j+1$ never vanishes, the entire third term vanishes as well.

  As a result, we are hence left with
  $
    uppi/r^2 (1+eta r^3) & >= integral_r^1 (2 uppi rho^(-3) + 2uppi sum_(j=0)^oo j^2 abs(b_j)^2 rho^(2j-1)) dif rho \
    & =evaluated(-uppi rho^(-2))_r^1 + uppi sum_(j=0)^oo j abs(b_j)^2 evaluated(rho^(2j))_r^1=uppi / r^2 - uppi + uppi sum_(j=0)^oo j abs(b_j)^2(1 - r^(2j)).
  $
  Thus, $ 1 + eta r^3 >= sum_(j=0)^oo j abs(b_j)^2 (1-r^(2j)). $
  Since each term in the right-hand side is always positive, for any $N in NN$,
  $ 1 + eta r^3 >= sum_(j=0)^N j abs(b_j)^2 (1-r^(2j)). $
  Taking $r -> 0^+$,
  $ 1 >= sum_(j=0)^N j abs(b_j)^2, $
  which holds for any $N$. Thus, letting $N -> oo$ gives the desired result.
]

#theorem[
  If $f : DD -> CC$ is schlicht and expands to $sum_(n=1)^oo a_n z^n$, then $abs(a_2) <= 2$.
] <thm:schlicht_a2_leq_2>
#proof[

]

#theorem("Koebe Quarter Theorem")[
  If $f : DD -> CC$ is schlicht, then the image $f(DD)$ contains the open disk of radius $1 / 4$ centered at $f(0)$.
] <thm:koebe_quarter>

#chapter-section("bieberbach_conjecture")[
  #include "bieberbach_conjecture/index.typ"
]
