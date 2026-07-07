#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Biholomorphy],
  route: "biholomorphy",
)
In @sec:conformality-of-holomorphic-mapping, it was asserted that for a holomorphic function $f(z)$, the map $w = f(z)$ is conformal when $f'(z) != 0$.

We have the following immediate assertion:

#lbl(
  theorem[Open Mapping Theorem][
    Suppose $U subset.eq CC$ is a region (open, nonempty, and connected). Then the image of any holomorphic and non-constant function $f:U -> CC$, $f(U)$, is a region.
  ],
  <thm:open-mapping>,
)

#proof[
  The nonemptiness of $f(U)$ is an immediate conclusion from the fact that $U$ is nonempty and $f$ is defined on all of $U$.

  Let $w_0$ be an arbitrary point in $f(U)$. Then $exists z_0 in U$ such that $f(z_0) = w_0$. Since $f$ is non-constant, the function $f - w_0$ has an isolated zero at $z_0$. Thus for sufficiently small $rho > 0$, the only zero of $f - w_0$ in $overline(D(z_0, rho))$ is at $z_0$.

  By @thm:hurwitz-shifts, then there exists $delta > 0$ such that $forall epsilon in D(0, delta)$, $f(z) - w_0 - epsilon$ has exactly one zero in $overline(D(z_0, rho))$. In other words, $forall w_0 in f(U)$, $exists delta > 0$ such that $forall w in D(w_0, delta)$, $exists! z in overline(D(z_0, rho))$ such that $f(z) = w$. Thus, $D(w_0, delta) subset.eq f(U)$. Thus, $f(U)$ is an open set since each contained point has a fully contained open neighborhood.

  Let $w_1, w_2 in f(U)$ be arbitrary and distinct. Then there exist $z_1, z_2 in U$ such that $f(z_1) = w_1$ and $f(z_2) = w_2$. By the connectivity of $U$, there exists a path $gamma subset U$ that connects $z_1$ and $z_2$. Then $f(gamma) subset f(U)$ is a curve that joins $w_1$ and $w_2$. Thus, $f(U)$ is connected.
  // todo, have some result to justify path connectedness and connectedness
]

Holomorphic injectivity, or univalence, satisfies the proceeding assertion:

#lbl(
  lemma[
    Let $U subset.eq CC$ be a region and suppose $f:U -> CC$ is univalent. Then $f'$ is non-vanishing on $U$.
  ],
  <lem:univalent-non-vanishing-derivative>,
)

#proof[
  Suppose, for the sake of contradiction, that $f$ is univalent on $U$ such that $exists z_0 in U$ such that $f'(z_0) = 0$. Let $w_0 = f(z_0)$. The previous statement is equivalent to: $f(z) - w_0$ has a zero at $z_0$ with multiplicity $m >= 2$.

  Since $f$ is univalent, neither $f-w_0$ nor $f'$ may have accumulation points in $U$. Thus, $exists rho > 0$ such that $z_0$ is the only zero of either $f - w_0$ and $f'$ contained in $overline(D(z_0, rho)) subset U$. By @thm:hurwitz-shifts, $exists delta > 0$ such that $forall w in D^*(w_0, delta)=D(w_0, delta) without {w_0}$, the equation $f(z) = w$ has $m$ solutions in $overline(D(z_0, rho))$, which cannot lie all at a single point (unless that point is $z_0$ itself, which cannot be the case as $z_0$ already maps to $w_0 != w$), as otherwise $z_0$ would not be the only zero of $f'$ in $overline(D(z_0,rho))$. This contradicts the univalence of $f$.
]

Conversely, we have the following statement on local univalence and invertibility.

#lbl(
  theorem[
    Let $U subset.eq CC$ be a region and suppose $f:U -> CC$ is holomorphic. If $f'(z_0) != 0$ for some $z_0 in U$, then there exists an open neighborhood of $z_0$ on which $f$ is univalent.
  ],
  <thm:non-vanishing-derivative-univalent-on-neighborhood>,
)

#proof[
  Let $w_0 = f(z_0)$. Since $lim_(z -> z_0) f(z) - w_0 = 0$ and $lim_(z -> z_0) (f(z) - w_0) / (z - z_0) != 0$, it follows that $z_0$ is a simple zero of $f(z) - w_0$. Let $V$ be an open neighborhood (relatively compact in $U$) of $z_0$ whose closure does not contain other zeros of $f - w_0$. By @thm:hurwitz-shifts, $exists delta > 0$ such that $forall w in D(w_0, delta)$, $f(z) = w$ has only one solution for $z$ satisfying $z in V$. Therefore, we can choose a relatively compact open subset $W$ of $V$ such that $f(W) subset.eq D(w_0, delta)$, on which $f$ is univalent.
]

Moreover, if $w = f(z)$ is univalent and surjective, mapping $U$ to $G$, then its inverse $z = f^(-1)(w)$ is univalent on $G$. Such bijective holomorphic functions are known as _biholomorphisms_ or _biholomorphic_ functions.

We will now study holomorphic functions from a more geometric perspective.

#lbl(
  theorem[
    Let $Omega subset.eq CC$ be a region, and let $gamma subset Omega$ be a rectifiable simple closed counterclockwise-oriented curve that is null-homotopic in $Omega$. Denote $jinterior(gamma)$ by $U$. If $f:Omega -> CC$ is holomorphic and maps $gamma$ injectively to a simple closed curve $Gamma$, then $w = f(z)$ is univalent in $U$, $f(U) = jinterior(Gamma)$, and $Gamma$ is traversed counterclockwise.
  ],
  <thm:boundary-of-conformal-map>,
)

#proof[
  Let $w_0 in CC$. Let $k=k(w_0)$ be the number of zeros of $f - w_0$ in $U$. By the Argument Principle (@thm:argument-principle-holomorphic), for $w_0 in.not Gamma$,
  $
    k = 1 / taui integral.cont.ccw_(gamma) (f'(z)) / (f(z) - w_0) dz = 1 / taui integral.cont.ccw_(Gamma) (dif w) / (w - w_0) = Ind_Gamma (w_0).
  $
  + If $w_0 in jexterior(Gamma)$, the expression vanishes since $Ind_Gamma (w_0)=0$. Then $f(z) = w_0$ has no solution in $U$ (i.e. $k=0$).

  + If $w_0 in jinterior(Gamma)$, then $Gamma$ winds around $w_0$ exactly once, and hence, in other words, $forall w_0 in jinterior(Gamma)$, $f(z) = w_0$ has a unique solution in $U$ (i.e. $k=1$).

  + If $w_0$ lies on $Gamma$, then it can be shown that $f - w_0$ has no zeros in $U$.

    Indeed, for the sake of contradiction, assume that $exists z_0 in U$ such that $f(z_0) = w_0$. By the Open Mapping Theorem (@thm:open-mapping), $exists delta > 0$ such that $D(w_0, delta) subset.eq f(U)$, or equivalently, $forall w in D(w_0, delta)$, $f - w$ has zeros in $U$. Since $w_0$ lies on $Gamma$, a subset of $D(w_0, delta)$ lies in the exterior of $Gamma$. It was previously established that $f - w$ has no zeros if $w in D(w_0, delta) inter jexterior(Gamma)$. Thus, we have a contradiction, and no such $z_0$ exists, implying $k=0$.

  We then have
  $
    k = cases(
      0 & quad "if" w_0 in overline(jexterior(Gamma)),
      1 & quad "if" w_0 in jinterior(Gamma)
    ).
  $
  Hence, $f$ is univalent in $U$ (since for each $w_0$, $k$ is at most one).

  Moreover, any point $z_0 in U$ must map to either $jinterior(Gamma)$ or $overline(jexterior(Gamma))$. The latter is an impossibility since otherwise $k != 0$. This $f(U) = jinterior(Gamma)$.
]

We will now give examples of biholomorphisms.

#example[
  The only biholomorphisms which map $DD$ to itself are in the form of
  #lbl(
    $
      w = ee^(ii theta) (z - a) / (1 - overline(a) z), quad a in DD, theta in RR.
    $,
    <eq:biholomorphism-unit-disk-automorphism>,
  )
  This follows directly from @thm:holomorphic-automorphism-group-on-unit-disk.
]

#lbl(
  example[
    The only biholomorphisms which map $HH^+$ to $DD$ are in the form of
    #lbl(
      $
        w = ee^(ii theta) (z - a) / (z - overline(a)), quad a in HH^+, theta in RR.
      $,
      <eq:biholomorphism-upper-half-plane-to-unit-disk>,
    )
  ],
  <ex:biholomorphisms-upper-half-plane-to-unit-disk>,
)

#proof[
  First assume $y = Im(z) > 0$. It follows that
  $
    abs(w) = abs((z - a) / (z - overline(a))) = sqrt(((x - Re(a))^2 + (y - Im(a))^2) / ((x - Re(a))^2 + (y + Im(a))^2)) < 1.
  $
  Therefore, this transformation maps $HH^+$ to $DD$. The inverse mapping is equal to
  #lbl(
    $
      z = (w overline(a) - a ee^(ii theta)) / (w - ee^(ii theta)).
    $,
    <eq:biholomorphism-upper-half-plane-to-unit-disk-inverse>,
  )

  Assume $w in DD$. We then have
  $
    Im(z) &= Im(((w overline(a) - a ee^(ii theta)) (overline(w) - ee^(-ii theta))) / (abs(w - ee^(ii theta))^2)) \
    & = (abs(w)^2 Im(overline(a)) - Im(a ee^(ii theta) overline(w)) - Im(w overline(a) ee^(-ii theta)) + Im(a)) / (abs(w - ee^(ii theta))^2) \
    & = ((1 - abs(w)^2) Im(a)) / (abs(w - ee^(ii theta))^2) > 0.
  $
  Hence, $z$ maps $DD$ to $HH^+$ univalently and surjectively since it is also an element in $Aut(extcomplex)$.

  Let $psi(z)$ be the biholomorphism from $HH^+$ to $DD$ in the form of $psi(z) = (z - ii) / (z + ii)$ (for $theta = 0$ and $a = ii$, known as the _Cayley transform_). Let $f$ be an arbitrary biholomorphism from $HH^+$ to $DD$. It follows that $phi = f compose psi^(-1)$ is a holomorphic automorphism on $DD$. Since $phi in Aut(DD)$, we have
  $
    f(z) = phi compose psi(z) & = ee^(ii theta) (z (1 - a) - ii (a + 1)) / (z (1 - overline(a)) + ii (overline(a) + 1)) \
    & = ee^(ii theta) (z (1 - a) / (1 - overline(a)) + ii (a + 1) / (overline(a) - 1)) / (z - ii (overline(a) + 1) / (overline(a) - 1)) \
    & = ee^(ii theta) (1 - a) / (1 - overline(a)) (z - ii (a + 1) / (1 - a)) / (z - overline(ii (a + 1) / (1 - a))).
  $
  Obviously, $ee^(ii theta) (1 - a) / (1 - overline(a))$ attains every value on the unit disk for varying $a$ and $theta$. Similarly, the values attained by $ii (a + 1) / (1 - a)$ cover the upper half-plane for $a in DD$ (since it is in the form of @eq:biholomorphism-upper-half-plane-to-unit-disk-inverse). Thus, all biholomorphisms from $HH^+$ to $DD$ are in the form of @eq:biholomorphism-upper-half-plane-to-unit-disk.
]

Let us now introduce some important properties of linear fractional transformations. By @prop:mobius-transformation-composition-matrix-multiplication, it follows that the composition of two linear fractional transformations is also a linear fractional transformation.

#lbl(
  theorem[
    Let $cal(C)$ be the collection of subsets of $extcomplex$ that are circles or $L union {oo}$, where $L$ is a straight line in $CC$ (known as _generalized circles_). Then every linear fractional transformation $f:extcomplex -> extcomplex$ maps elements of $cal(C)$ to elements of $cal(C)$.
  ],
  <thm:linear-fractional-transformation-maps-circles-to-circles>,
)

#proof[
  Since each linear fractional transformation is a composition of maps in the form of $z |-> a z$, $z |-> z + b$, and $z |-> 1 / z$, it suffices to show that these maps preserve the property of being a circle or a straight line. Consider a circle defined implicitly with
  $ alpha (x^2 + y^2) + beta x + gamma y + delta = 0, quad x, y in RR, alpha, beta, gamma, delta in RR. $
  For $z = x + ii y$, this can be rewritten as
  #lbl(
    $
      &alpha z overline(z) + beta (z + overline(z)) / 2 + gamma (z - overline(z)) / (2 ii) + delta \
      &quad""= alpha z overline(z) + xi z + overline(xi) overline(z) + delta = 0 quad "for" quad xi = beta / 2 + gamma / (2 ii).
    $,
    <eq:linear-fractional-transformation-maps-circles-to-circles-circle-complex-form>,
  )

  If $alpha = 0$, the equation represents a straight line. It is easy to see that a complex dilation or a translation of $z$ will preserve the property of being a straight line or a circle. Indeed, by letting $z = a zeta$ for nonzero $a$ in @eq:linear-fractional-transformation-maps-circles-to-circles-circle-complex-form, we have
  $
    alpha abs(a)^2 zeta overline(zeta) + xi a zeta + overline(xi) overline(a) overline(zeta) + delta = 0,
  $
  which is trivially in the form of @eq:linear-fractional-transformation-maps-circles-to-circles-circle-complex-form. Similarly, if we substitute $z = zeta + b$, we have
  $
    alpha (zeta + b) (overline(zeta) + overline(b)) + xi (zeta + b) + overline(xi) (overline(zeta) + overline(b)) + delta = 0 \
    alpha zeta overline(zeta) + (xi + alpha overline(b)) zeta + (overline(xi) + alpha b) overline(zeta) + alpha abs(b)^2 + 2 Re(xi b) + delta = 0.
  $
  If we substitute $z = 1 / zeta$, we have
  $
    delta zeta overline(zeta) + xi overline(zeta) + overline(xi) zeta + alpha = 0,
  $
  which is in the form of @eq:linear-fractional-transformation-maps-circles-to-circles-circle-complex-form.
]

#remark[
  As in @ex:biholomorphisms-upper-half-plane-to-unit-disk, we can consider extended straight lines in the form of $L union {oo}$ as generalized circles in the Riemann sphere. In other words, the extended line can be geometrically visualized by a circle with infinite radius. In fact, when a circle on the Riemann sphere is projected stereographically onto the complex plane, the result is always either a circle or a straight line.
]

#lbl(
  definition[Cross-Ratio][
    Let $z_1, z_2, z_3, z_4 in extcomplex$ be points such that at least three of them are distinct. The _cross-ratio_ of these points is defined as
    $
      (z_1, z_2; z_3, z_4) = ((z_1 - z_3) (z_2 - z_4)) / ((z_1 - z_4) (z_2 - z_3)).
    $
    If at least one of the four points is $oo$, then the cross-ratio is defined by the limit:
    $
      (oo, z_2; z_3, z_4) & = (z_2 - z_4) / (z_2 - z_3), & (z_1, oo; z_3, z_4) & = (z_1 - z_3) / (z_1 - z_4) \
      (z_1, z_2; oo, z_4) & = (z_2 - z_4) / (z_1 - z_4), & (z_1, z_2; z_3, oo) & = (z_1 - z_3) / (z_2 - z_3)
    $
  ],
  <def:cross-ratio>,
)

One important property of the cross-ratio is that it is invariant under linear fractional transformations. In other words, if $f$ is a linear fractional transformation, then
$
  (f(z_1), f(z_2); f(z_3), f(z_4)) = (z_1, z_2; z_3, z_4).
$
The proof is trivial and can be verified by substituting the definition of the linear fractional transformation into the definition of the cross-ratio.

Furthermore, if a function $f(z_1, z_2, z_3, z_4)$ is invariant under the group of linear fractional transformations, then it is a function of the cross-ratio. In other words, the cross-ratio is the only invariant under the group of linear fractional transformations $Aut(extcomplex)$. Indeed, suppose that
$
  f(phi(z_1), phi(z_2), phi(z_3), phi(z_4)) = f(z_1, z_2, z_3, z_4).
$
We aim to show that $f$ is a function of a cross-ratio. Let
$
  phi(z) = ((z - z_3) (z_2 - z_4)) / ((z - z_4) (z_2 - z_3))
$
be a linear fractional transformation. Then we have
$
  f(phi(z_1), phi(z_2), phi(z_3), phi(z_4)) = f((z_1, z_2; z_3, z_4), 1, 0, oo),
$
which is a function of the cross-ratio.
