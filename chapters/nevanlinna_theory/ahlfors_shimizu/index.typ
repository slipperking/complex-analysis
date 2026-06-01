#import "/lib.typ": *
== The Ahlfors--Shimizu Characteristic

We now provide a second formulation of the first fundamental theorem, given by Ahlfors and Shimizu, found independently of each other.

#lemma[
  Let $U$ be a positively oriented bounded region by a piecewise $C^1$ simple closed boundary. Let $f$ be a (not identically 0) holomorphic function on an open neighborhood of $overline(U)$, $G in C^2({abs(f(z)) : z in overline(U)})$. Then
  $
    I = integral.cont_(partial U) nabla_(vu(n)) G(abs(f(z))) abs(dz) = integral_U g(abs(f(z))) abs(f'(z))^2 r dr and dtheta,
  $ <eq:ahlforsshimizugreens_statement>
  where $z = r ee^(ii theta)$, $g(R) = G''(R) + frac(1, R, style: "horizontal") G'(R)$, and $vu(n)$ is the unit normal vector pointing towards the exterior of $partial U$.
] <lem:ahlforsshimizugreens>

#proof[
  Let the zeros of $f$ in $U$ (which are finite, otherwise they accumulate) be ${z_k}_(k=1)^n$. Choose $epsilon' > 0$ so that for any $0 < epsilon < epsilon'$ the disks ${D(z_k, epsilon)}_(k=1)^n$ each lie in the open set $U$ and are pairwise disjoint from one another.

  Applying Green's Theorem (@thm:real_green)#footnote[We define $vu(n)$ to be the normal vector pointing into the region, so for the $partial U$ integral, $vu(n)$ points outwards and for the summation integrals $vu(n)$ points into the disks.]
  $
    (integral.cont_(partial U) + sum_(k=1)^n integral.cont_(partial D(z_k, epsilon))) vb(v) dot vu(n) dif s = integral.double_(U without union.big D(z_k, epsilon)) div vb(v) dif A
  $
  to $I$, we have
  $
    I &= (integral.cont_(partial U) + sum_(k=1)^n integral.cont_(partial D(z_k, epsilon))) grad G(abs(f(z))) dot vu(n) abs(dz) \ &= integral.double_(U without union.big D(z_k, epsilon)) laplacian G(abs(f(z))) r dr dtheta.
  $ <eq:ahlforsshimizugreens_greensapplication>
  Letting $R = abs(f(z)) = sqrt(f(z) overline(f(z)))$ and adopting the elliptic notations $partial_z = pdv(, z, style: "horizontal")$, $partial_(overline(z)) = pdv(, overline(z), style: "horizontal")$ etc.,
  $
    partial_z R = (partial_z (f overline(f))) / (2R) = (f' overline(f) + f overline(partial_(overline(z)) f)) / (2R) = (f' overline(f)) / (2R), wide partial_(overline(z)) R = (partial_(overline(z)) (f overline(f))) / (2R) = (f overline(f')) / (2R),
  $
  and
  $
    (partial_z R)(partial_(overline(z)) R) = (abs(f)^2 abs(f')^2) / (4R^2) = abs(f')^2 / 4, \
    partial_(z overline(z)) R = partial_(overline(z)) ((f' overline(f)) / (2R)) = (2 f' overline(f') R - 2 f' overline(f) ((f overline(f')) / (2R))) / (4R^2) = (2 abs(f')^2 R^2 - abs(f' f)^2) / (4R^3) = abs(f')^2 / (4R),
  $
  since
  $
    partial_(overline(z)) G(R) = G'(R) partial_(overline(z)) R quad "and" quad partial_z G'(R) = G''(R) partial_z R,
  $
  $
    partial_(z overline(z)) G(R) = partial_z G'(R) partial_(overline(z)) R + G'(R) partial_(overline(z) z) R &= G''(R) (f' overline(f)) / (2R) dot (f overline(f')) / (2R) + G'(R) abs(f')^2 / (4R) \
    &= abs(f')^2 / 4 (G''(R) + (G'(R)) / R),
  $
  it follows that $laplacian G(abs(f(z))) = g(R) abs(f')^2$. Substituting this in @eq:ahlforsshimizugreens_greensapplication gives
  $
    (integral.cont_(partial U) + sum_(k=1)^n integral.cont_(partial D(z_k, epsilon))) grad G(abs(f(z))) dot vu(n) abs(dz) = integral.double_(U without union.big D(z_k, epsilon)) laplacian G(abs(f(z))) r dr dtheta.
  $
  As $epsilon -> 0^+$, the right-hand side is simply the desired quantity in @eq:ahlforsshimizugreens_statement. By the continuous differentiability of $G$, $exists M > 0$ such that $abs(grad G dot vu(n)) <= M$ on $union.big_k overline(D(z_k, epsilon))$, thus
  $
    abs(integral.cont_(partial D(z_k, epsilon)) grad G dot vu(n) dif s) <= integral_0^(2 uppi) M epsilon dtheta -> 0 quad "as" quad epsilon -> 0^+.
  $
  Thus, the left-hand side expression of @eq:ahlforsshimizugreens_greensapplication also tends to that of @eq:ahlforsshimizugreens_statement.
]

We apply @lem:ahlforsshimizugreens to
$
  G(R) = log sqrt(1 + R^2) ==> g(R) = (1 - R^2) / (1 + R^2)^2 + 1/R (R / (1 + R^2)) = 2 / (1 + R^2)^2.
$
Let $f$ be meromorphic on $overline(D(0, r))$ with no poles on the boundary, and let its poles in the interior be at each ${b_j}_(j=1)^n$ of respective orders ${k_j}_(j=1)^n$. Let $epsilon' > 0$ such that $forall 0 < epsilon < epsilon'$, the disks $overline(D(b_j, epsilon))$ are disjoint and all lie in $D(0, r)$. We aim to apply the lemma on this multiply connected region on which $f$ is holomorphic.

In a prescribed small disk containing a pole (fix $j$), $f$ has the Laurent series
$
  f(z) = sum_(i = -k_j)^oo c_i (z - b_j)^i = phi.alt(z) / (z - b_j)^(k_j),
$
where $phi.alt$ is analytic and non-vanishing in the closed disk (choose $epsilon$ such that $1\/f$ is analytic therein too). On the boundary $partial D(b_j, epsilon)$,
$
  abs(f(z)) = abs(phi.alt(z)) epsilon^(-k_j).
$
This implies that
$
  G(abs(f(z))) & = log abs(f(z)) + log sqrt(1 + 1 / abs(f(z))^2) \
               & = log abs(phi.alt(z)) - k_j log epsilon + log sqrt(1 + 1 / abs(f(z))^2).
$
On the contour defined by $partial D(b_j, epsilon)$#footnote[The outwards normal vector actually points directly into the interior, since the disk is removed from the pertinent region.],
$
  nabla_(vu(n)) G(abs(f(z))) = -pdv(, epsilon) G(abs(f(z))) = k_j / epsilon - (pdv(, epsilon)abs(phi.alt(z))) / abs(phi.alt(z)) - (pdv(, epsilon) (1 / abs(f(z))^2)) / (2 + 2 / abs(f(z))^2) = k_j / epsilon + Order(1)
$
as $epsilon -> 0^+$, where $Order(1)$ is uniform in $t$ (for $z = b_j + epsilon ee^(ii t)$). By the lemma,
$
  &(integral.cont_(partial D(0, r)) + sum_(j=1)^n integral.cont_(partial D(b_j, epsilon))) nabla_(vu(n)) G(abs(f(z))) abs(dz) \
  & wide wide ""= integral.double_(D(0,r) without union.big D(b_j, epsilon)) (2 abs(f'(z))^2) / (1 + abs(f(z))^2)^2 dif A,
$
which requires the computation
$
  integral.cont_(partial D(b_j, epsilon)) (k_j / epsilon + Order(1)) abs(dz) = integral_0^(2 uppi) (k_j + epsilon dot Order(1)) dtheta = 2 uppi k_j + Order(epsilon).
$
Taking the limit $epsilon -> 0^+$ hence gives
$
  &1 / (2 uppi) integral_0^(2 uppi) nabla_(vu(n)) G(abs(f(r ee^(ii theta)))) r dtheta + n(r, f) \
  & wide wide ""= 1 / uppi integral_0^(2 uppi) integral_0^r (abs(f'(rho ee^(ii theta)))^2) / (1 + abs(f(rho ee^(ii theta)))^2)^2 rho dr dtheta.
$
Let the expression on the right-hand side be denoted by $A(r, f)$. We thus derive
$
  A(r, f) = r / (2 uppi) integral_0^(2 uppi) pdv(, r) log sqrt(1 + abs(f(r ee^(ii theta)))^2) dtheta + n(r, f).
$
By dividing by $r$, changing variables, and integrating from 0 to $r$, we have
$
  integral_0^r (A(t, f) dt) / t
  &= lim_(epsilon -> 0^+) integral_epsilon^r 1 / (2 uppi) dv(, t) integral_0^(2 uppi) log sqrt(1 + abs(f(t ee^(ii theta)))^2) dtheta dt + integral_epsilon^r n(0, f) / t dt \
  &quad "" + N(r, f) - n(0, f) log r. \
  &= lim_(epsilon -> 0^+) integral_epsilon^r n(0, f) / t dt - 1 / (2 uppi) integral_0^(2 uppi) log sqrt(1 + abs(f(epsilon ee^(ii theta)))^2) dtheta \
  &quad "" + N(r, f) - n(0, f) log r + 1 / (2 uppi) integral_0^(2 uppi) log sqrt(1 + abs(f(r ee^(ii theta)))^2) dtheta.
$ <eq:ahlforsshimizuderivation_convergentintegral>
For $f(0) != oo$,
$
  integral_0^r (A(t, f) dt) / t & = 1 / (2 uppi) integral_0^(2 uppi) log sqrt(1 + abs(f(r ee^(ii theta)))^2) dtheta \
                                & quad ""- 1 / (2 uppi) integral_0^(2 uppi) log sqrt(1 + abs(f(0))^2) dtheta \
                                & wide ""+ N(r, f)
$ <eq:ahlforsshimizuderivation_regularcase>
The limit expression of @eq:ahlforsshimizuderivation_convergentintegral is written in its present form to ensure convergence in the event of a pole. Thus assume a pole; let $f(z) = c z^k + Order(z^(k+1))$, where $k < 0$ and $c != 0$. It follows that
$
  abs(f(epsilon ee^(ii theta))) = abs(c) epsilon^k + Order(epsilon^(k+1)) = abs(c) epsilon^k (1 + Order(epsilon)) \
  log abs(f(epsilon ee^(ii theta))) = log abs(c) + k log epsilon + log(1 + Order(epsilon))
$
where the errors are uniform in $theta$. Since
$
  log sqrt(1 + abs(f(epsilon ee^(ii theta)))^2) &= log abs(f(epsilon ee^(ii theta))) + log sqrt(1 + 1 / abs(f(epsilon ee^(ii theta)))^2) \
  &= log abs(f(epsilon ee^(ii theta))) + Order(abs(f(epsilon ee^(ii theta)))^(-2)) \
  &= log abs(c) + k log epsilon + Order(epsilon),
$
it follows from $k = -n(0, f)$, that
$
  integral_epsilon^r n(0, f) / t dt - 1 / (2 uppi) integral_0^(2 uppi) log sqrt(1 + abs(f(epsilon ee^(ii theta)))^2) dtheta = -k log r - log abs(c) + Order(epsilon) \
  -> n(0, f) log r - log abs(c) quad "as" quad epsilon -> 0.
$
Hence, from @eq:ahlforsshimizuderivation_convergentintegral, we have for $f(0) = oo$,
$
  integral_0^r (A(t, f) dt) / t &= N(r, f) - log abs(c) \
  &quad ""+ 1 / (2 uppi) integral_0^(2 uppi) log sqrt(1 + abs(f(r ee^(ii theta)))^2) dtheta.
$ <eq:ahlforsshimizuderivation_singularcase>
For each $a in extcomplex$, let $W = (1 + overline(a) w) / (w - a)$ (for $a = oo$, $W equiv w$), where $w = f(z)$, and denote the function $W = F(z)$. Set using limits on $w$ and $a$:
$
  k(w, a) = 1 / sqrt(1 + abs(W)^2) = abs(w - a) / sqrt(abs(w - a)^2 + abs(1 + overline(a) w)^2) = abs(w - a) / sqrt((1 + abs(w)^2)(1 + abs(a)^2)).
$
For $w = oo$, taking the corresponding limit then gives
$
  k(oo, a) = 1 / sqrt(1 + abs(a)^2).
$
Moreover,
$
  abs(dv(W, z)) = (abs(a)^2 + 1) / abs(w - a)^2 abs(dv(w, z)).
$
Therefore,
$
  1 / (1 + abs(W)^2) abs(dv(W, z)) = (abs(a)^2 + 1) / abs(w - a)^2 k(w, a)^2 abs(dv(w, z)) = 1 / (1 + abs(w)^2) abs(dv(w, z)).
$
Substituting in their corresponding functions, it follows that
$ f^sharp equiv F^sharp ==> A(r, f) = A(r, F). $
Let
$
  T_0(r, f) = T_0(r, F) = integral_0^r (A(t, f) dt) / t = integral_0^r (A(t, F) dt) / t,
$
which is known as the _Ahlfors--Shimizu characteristic function_ of $f$ and $F$. Observe that if $w = f(z)$ attains $a$ with order $k$, then $1 + overline(a) f(z) = 1 + abs(a)^2 >= 1$, and $f(z) - a$ has a zero of multiplicity $k$. Hence, $F$ has a pole at $z$ of order $k$. More importantly,
$
  N(r, F) = N(r, a, f).
$ <eq:ahlforsshimizuriemannsphererotationcountingfunction>
Define the _Ahlfors--Shimizu proximity function_ to be equal to:
$
  m_0(r, F) & = 1 / (2 uppi) integral_0^(2 uppi) log sqrt(1 + abs(F(r ee^(ii theta)))^2) dtheta \
            & = m_0(r, a, f) = 1 / (2 uppi) integral_0^(2 uppi) log(1 / k(f(r ee^(ii theta)), a)) dtheta
$ <eq:ahlforsshimizuproximity>
Assume $F(0) != oo$, or when $f(0) != a$. Applying @eq:ahlforsshimizuderivation_regularcase on the function $F$, we have
$
  T_0(r, F) = N(r, F) + m_0(r, F) - m_0(0, F).
$ <eq:ahlforsshimizufirstfundamentaltheorem_regularcase>
If $a != oo$ and $f(z) = a + c_k z^k + c_(k+1) z^(k+1) + dots.c$ ($k >= 1$, $c = c_k$), since $F(z) = (1 + abs(a)^2) / (c z^k) + Order(1 / z^(k-1))$, applying @eq:ahlforsshimizuderivation_singularcase on $F$ yields
$
  T_0(r, F) = N(r, F) + m_0(r, F) - log abs((1 + abs(a)^2) / c).
$ <eq:ahlforsshimizufirstfundamentaltheorem_singularcase>

#theorem[First Fundamental Theorem in Ahlfors--Shimizu Form][
  Let $f$ be meromorphic on $D(0, R)$ (where $0 < R <= oo$). For $0 < r < R$ and $a in extcomplex$ such that $f(0) != a$,
  $ T_0(r, f) = N(r, a, f) + m_0(r, a, f) - m_0(0, a, f). $
  If $f(0) = a != oo$, then
  $ T_0(r, f) = N(r, a, f) + m_0(r, a, f) - log abs(1 + abs(a)^2 / c), $
  where $c$ is the first nonzero coefficient of the Laurent expansion of $f - a$. If $f(0) = a = oo$, then
  $ T_0(r, f) = N(r, a, f) + m_0(r, a, f) - log abs(c) $
  where $c$ is the first non-zero coefficient of the Laurent series of $f$.
] <thm:nevanlinnafirstfundamentaltheoremahlforsshimizu>

#proof[
  The first two cases follow from substituting @eq:ahlforsshimizuriemannsphererotationcountingfunction and @eq:ahlforsshimizuproximity into @eq:ahlforsshimizufirstfundamentaltheorem_regularcase and @eq:ahlforsshimizufirstfundamentaltheorem_singularcase. The final case is simply a rewriting of @eq:ahlforsshimizuderivation_singularcase.
]

#theorem[
  Let $f : D(0, R) -> extcomplex$ be meromorphic. Then for each $0 < r < R$, the Nevanlinna characteristic $T$ and the Ahlfors--Shimizu characteristic $T_0$ differ by a term that is uniformly bounded in $r$.
]

#proof[
  Observe that for $z in partial D(0, r)$,
  $ logp abs(f(z)) <= log sqrt(1 + abs(f(z))^2) = 1/2 log(1 + abs(f(z))^2). $
  Since $1 + x^2 <= 2 max{1, x^2}$ for any real $x$,
  $ 1/2 log(1 + abs(f(z))^2) <= 1/2 log 2 + logp abs(f(z)). $
  Integrating and adding $N$, we have
  $ T(r, f) <= m_0(r, f) + N(r, f) <= 1/2 log 2 + T(r, f). $
  By the First Fundamental Theorem (@thm:nevanlinnafirstfundamentaltheoremahlforsshimizu) in Ahlfors--Shimizu Form with $a = oo$, if we let
  $
    C = cases(m_0(0, a, f) quad & "if" f(0) != oo, log abs(c) quad & "if" f(0) = oo),
  $
  where $c$ is the first nonzero coefficient of the Laurent expansion of $f$, it follows that
  $ T(r, f) - C <= T_0(r, f) <= T(r, f) + 1/2 log 2 - C, $
  where $C$ does not depend on $R$.
]

Let $S$ be the Riemann sphere but centered at $(0, 0, 1\/2)$, diameter 1, with a stereographic projection with center $(0, 0, 1)$. Letting
$
  bold(sigma)(w) = 1 / (abs(w)^2 + 1) (Re w, Im w, abs(w)^2),
$
for two points $w_1, w_2 in extcomplex$, their spherical points are $bold(sigma)(w_1), bold(sigma)(w_2)$. The Euclidean distance between the two points on the sphere is verifiable (after manual simplification) to be $k(w_1, w_2)$. Thus, $k$ is the _chordal_ distance function, and is thus geometrically invariant under rotations of the sphere. The mapping $W$ of $w$ is precisely such a transformation: geometrically it rotates points on the Riemann sphere. Geometrically, the invariance of $m_0$ is now clear.

Let $w = u + ii v$ be a point in the projected plane and let $dif u dif v$ be an area element on the plane. Then the corresponding area element on the sphere is equal to:
$
  dif A_S &= norm(bold(sigma)'_u times bold(sigma)'_v) dif u dif v = (dif u dif v) / (abs(w)^2 + 1)^4 norm(mat(-u^2 + v^2 + 1; -2u v; 2u) times mat(-2u v; u^2 - v^2 + 1; 2v)) \
  &= (dif u dif v) / (abs(w)^2 + 1)^4 norm((-2u v^2 - 2u^3 - 2u, -2u^2 v - 2v^3 - 2v, 1 - (u^2 + v^2)^2)) \
  &= (dif u dif v) / (abs(w)^2 + 1)^3 norm((-2u, -2v, 1 - abs(w)^2)) = (dif u dif v) / (abs(w)^2 + 1)^3 sqrt(2 abs(w)^2 + 1 + abs(w)^4) \
  &= (dif u dif v) / (abs(w)^2 + 1)^2
$
The surface area of a surface $E subset.eq S$ is given by
$
  integral_E dif A_S = integral.double_(bold(sigma)^(-1) (E)) (dif u dif v) / (abs(w)^2 + 1)^2.
$
For $w = f(z)$, pulling back to $z$ gives $A(r)= 1/uppi integral.double_(bold(sigma)(f(D(0,r)))) dif A$ or the area of the image of $f$ on the Riemann sphere, counted according to multiplicities (referring to overlaps when not univalent), divided by the area of the Riemann sphere.

This completes the geometric explanation for @thm:nevanlinnafirstfundamentaltheoremahlforsshimizu. This area is invariant under rotations of $S$. In particular, we rotate the north pole $(0, 0, 1)$ corresponding to $oo$ to the point corresponding to $a$.
