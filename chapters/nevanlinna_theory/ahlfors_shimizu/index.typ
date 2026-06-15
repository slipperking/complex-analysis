#import "/lib.typ": *
== The Ahlfors--Shimizu Characteristic

We now provide a second formulation of the first fundamental theorem, given by Ahlfors and Shimizu, found independently of each other.

#lemma[
  Let $U$ be a positively oriented bounded region by a piecewise $C^1$ simple closed boundary. Let $f$ be a (not identically $0$) holomorphic function on an open neighborhood of $overline(U)$, $G in C^2(f(overline(U)))$. Then
  $
    I = integral.cont_(partial U) nabla_(vu(n)) G(abs(f(z))) abs(dz) = integral_U g(abs(f(z))) abs(f'(z))^2 r dr and dtheta,
  $ <eq:ahlfors_shimizu_green_statement>
  where $z = r ee^(ii theta)$, $g(R) = G''(R) + 1 / R G'(R)$, and $vu(n)$ is the unit normal vector pointing towards the exterior of $partial U$.
] <lem:ahlfors_shimizu_green>

#proof[
  Let the zeros of $f$ in $U$ (which are finite, otherwise they accumulate) be ${z_k}_(k=1)^n$. Choose $epsilon' > 0$ so that for any $0 < epsilon < epsilon'$ the disks ${D(z_k, epsilon)}_(k=1)^n$ each lie in the open set $U$ and are pairwise disjoint from one another (we do this to ensure $g$ is continuous, as $g$ is singular when $R = abs(f(z)) = 0$).

  Applying Green's Theorem (@thm:real_green)#footnote[We define $vu(n)$ to be the normal vector pointing into the multiply connected region, so for the $partial U$ integral, $vu(n)$ points outwards and for the summation integrals $vu(n)$ points into the disks.]
  $
    (integral.cont_(partial U) + sum_(k=1)^n integral.cont_(partial D(z_k, epsilon))) vb(v) dot vu(n) dif s = integral.double_(U without union.big D(z_k, epsilon)) div vb(v) dif A
  $
  to $I$ (so letting $vb(v) = grad G(abs(f(z)))$), we have
  $
    I &= (integral.cont_(partial U) + sum_(k=1)^n integral.cont_(partial D(z_k, epsilon))) grad G(abs(f(z))) dot vu(n) abs(dz) \ &= integral.double_(U without union.big D(z_k, epsilon)) laplacian G(abs(f(z))) r dr dtheta.
  $ <eq:ahlfors_shimizu_green_greensapplication>
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
  it follows that $laplacian G(abs(f(z))) = g(R) abs(f')^2$. Substituting this in @eq:ahlfors_shimizu_green_greensapplication gives
  $
    (integral.cont_(partial U) + sum_(k=1)^n integral.cont_(partial D(z_k, epsilon))) grad G(abs(f(z))) dot vu(n) abs(dz) = integral.double_(U without union.big D(z_k, epsilon)) laplacian G(abs(f(z))) r dr dtheta.
  $
  As $epsilon -> 0^+$, the right-hand side is simply the desired quantity in @eq:ahlfors_shimizu_green_statement. By the continuous differentiability of $G$, $exists M > 0$ such that $abs(grad G dot vu(n)) <= M$ on $union.big_k overline(D(z_k, epsilon))$, thus
  $
    abs(integral.cont_(partial D(z_k, epsilon)) grad G dot vu(n) dif s) <= integral_0^(2 uppi) M epsilon dtheta -> 0 quad "as" quad epsilon -> 0^+.
  $
  Thus, the left-hand side expression of @eq:ahlfors_shimizu_green_greensapplication also tends to that of @eq:ahlfors_shimizu_green_statement.
]
We apply @lem:ahlfors_shimizu_green to
$
  G(R) = log (sqrt(1 + R^2) / 2) ==> g(R) = (1 - R^2) / (1 + R^2)^2 + 1/R (R / (1 + R^2)) = 2 / (1 + R^2)^2.
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
  G(abs(f(z))) & = log abs(f(z)) + log sqrt(1 + 1 / abs(f(z))^2) - log 2 \
               & = log abs(phi.alt(z)) - k_j log epsilon + log sqrt(1 + 1 / abs(f(z))^2) - log 2.
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
  & wide wide ""= 1 / (4 uppi) integral.double_(D(0,r)) (4 abs(f'(z))^2) / (1 + abs(f(z))^2)^2 dif A = 1 / (4 uppi) integral.double_D(0,r) f^sharp (z)^2 dif A\
  //  & wide wide ""= 1 / (4 uppi) integral_0^(2 uppi) integral_0^r (4 abs(f'(rho ee^(ii theta)))^2) / (1 + abs(f(rho ee^(ii theta)))^2)^2 rho dif rho dtheta.
$
Let the expression on the right-hand side be denoted by $A(r, f)$. We thus derive
$
  A(r, f) = r / (2 uppi) integral_0^(2 uppi) pdv(, r) log(sqrt(1 + abs(f(r ee^(ii theta)))^2) / 2) dtheta + n(r, f).
$
By dividing by $r$, changing variables, and integrating from $0$ to $r$, we have
$
  integral_0^r (A(t, f) dt) / t
  &= lim_(epsilon -> 0^+) [integral_epsilon^r 1 / (2 uppi) dv(, t) integral_0^(2 uppi) log(sqrt(1 + abs(f(t ee^(ii theta)))^2) / 2) dtheta dt \
    &quad ""+ integral_epsilon^r n(0, f) / t dt] + N(r, f) - n(0, f) log r. \
  &= lim_(epsilon -> 0^+) integral_epsilon^r n(0, f) / t dt - 1 / (2 uppi) integral_0^(2 uppi) log (sqrt(1 + abs(f(epsilon ee^(ii theta)))^2) / 2) dtheta \
  &quad "" + N(r, f) - n(0, f) log r + 1 / (2 uppi) integral_0^(2 uppi) log(sqrt(1 + abs(f(r ee^(ii theta)))^2)/2) dtheta.
$ <eq:ahlforsshimizuderivation_convergentintegral>
The limit expression of @eq:ahlforsshimizuderivation_convergentintegral is written in its present form to ensure convergence in the event of a pole.
#definition[Ahlfors--Shimizu Proximity Function][
  For $a in extcomplex$, define the _Ahlfors--Shimizu proximity function_ to be equal to:
  $ m_0(r, a, f) = 1 / (2 uppi) integral_0^(2 uppi) log(1 / k(f(r ee^(ii theta)), a)) dtheta $ <eq:ahlforsshimizuproximity> for finite $a$ and
  $ m_0(r, f) = 1/(2 uppi) integral_0^(2 uppi) log (1 / k(f(r,ee^(ii theta)), oo)) dtheta $ for $a = oo$,
  where $ k(w, a) = cases(
    (2 abs(w - a)) / sqrt((1 + abs(w)^2)(1 + abs(a)^2)) quad & a!= oo and w != oo\,,
    2 / sqrt(1 + abs(w)^2) quad & a = oo and w != oo\,,
    2/sqrt(1 + abs(a)^2) quad & w= oo and a != oo\,,
    0 quad & w= oo and a = oo.
  ) $ <eq:ahlforsshimizuchordaldistance>
]
#theorem[Ahlfors--Shimizu Characteristic Function][
  The _Ahlfors--Shimizu characteristic function_ $T_0(r, f)$ is defined by
  $
    T_0(r, f) = integral_0^r (A(t, f) dt) / t.
  $
]
#theorem[
  For $f$ meromorphic on a neighborhood of $overline(D(0,r))$, then $ T_0(r,f) = N(r,f) + m_0(r,f) - m_0(0,f) $ for $f(0) != oo$, and
  $ T_0(r,f) = N(r,f) + m_0(r,f) - log abs(c / 2) $
  if $f(0) = oo$, where for some $k<0$, $c in CC^*$ satisfies $f(z) = c z^k + Order(z^(k+1))$ as $z -> 0$.
] <thm:nevanlinna_first_fundamental_theorem_ahlfors_shimizusimplecase>
#proof[
  In the first case for $f(0) != oo$, from @eq:ahlforsshimizuderivation_convergentintegral, we have
  $
    integral_0^r (A(t, f) dt) / t & = 1 / (2 uppi) integral_0^(2 uppi) log(sqrt(1 + abs(f(r ee^(ii theta)))^2)/2) dtheta \
                                  & quad ""- 1 / (2 uppi) integral_0^(2 uppi) log(sqrt(1 + abs(f(0))^2)/2) dtheta + N(r, f) \
                        T_0(r, f) & = N(r, f) + m_0(r, f) - m_0(0, f).
  $ <eq:ahlforsshimizuderivation_regularcase>
  Now assume a pole; let $f(z) = c z^k + Order(z^(k+1))$, where $k < 0$ and $c != 0$. It follows that
  $
    abs(f(epsilon ee^(ii theta))) = abs(c) epsilon^k + Order(epsilon^(k+1)) = abs(c) epsilon^k (1 + Order(epsilon)) \
    log abs(f(epsilon ee^(ii theta))) = log abs(c) + k log epsilon + log(1 + Order(epsilon))
  $
  where the errors are uniform in $theta$. Since
  $
    log(sqrt(1 + abs(f(epsilon ee^(ii theta)))^2)/2) &= log abs(f(epsilon ee^(ii theta))) + log sqrt(1 + 1 / abs(f(epsilon ee^(ii theta)))^2) - log 2 \
    &= log abs(f(epsilon ee^(ii theta))) + Order(abs(f(epsilon ee^(ii theta)))^(-2)) - log 2 \
    &= log abs(c / 2) + k log epsilon + Order(epsilon),
  $
  it follows from $k = -n(0, f)$, that
  $
    &integral_epsilon^r n(0, f) / t dt - 1 / (2 uppi) integral_0^(2 uppi) log(sqrt(1 + abs(f(epsilon ee^(ii theta)))^2)/2) dtheta \
    &wide wide = -k log r - log abs(c) + Order(epsilon) + log 2 \
    &wide wide -> n(0, f) log r - log abs(c/2) quad "as" quad epsilon -> 0.
  $
  Hence, from @eq:ahlforsshimizuderivation_convergentintegral,
  $
    integral_0^r (A(t, f) dt) / t &= N(r, f) - log abs(c/2) \
    &quad ""+ 1 / (2 uppi) integral_0^(2 uppi) log(sqrt(1 + abs(f(r ee^(ii theta)))^2)/2) dtheta \
    T_0(r, f) & = N(r, f) + m_0(r, f) - log abs(c/2). #qedhere
  $ <eq:ahlforsshimizuderivation_singularcase>
]
#theorem[First Fundamental Theorem in Ahlfors--Shimizu Form][
  Let $f$ be meromorphic on $D(0, R)$ (where $0 < R <= oo$). For $0 < r < R$ and $a in extcomplex$ such that $f(0) != a$,
  $ T_0(r, f) = N(r, a, f) + m_0(r, a, f) - m_0(0, a, f). $
  If $f(0) = a != oo$, then
  $ T_0(r, f) = N(r, a, f) + m_0(r, a, f) - log abs((1 + abs(a)^2) / (2c_a)), $
  where $c_a$ is the first nonzero coefficient of the Laurent expansion of $f - a$. If $f(0) = a = oo$, then
  $ T_0(r, f) = N(r, a, f) + m_0(r, a, f) - log abs(c / 2) $
  where $c$ is the first non-zero coefficient of the Laurent series of $f$.
] <thm:nevanlinna_first_fundamental_theorem_ahlfors_shimizu>

#proof[
  For $a != oo$, consider the Möbius transformation $W=(1 + overline(a) w) / (w - a)$, where $w = f(z)$, and denote the function $W = F(z)$. Then
  $
    abs(F'(z)) &= abs(dv(W, w) dv(w, z)) = abs((overline(a)(w-a) - (1+overline(a) w)) / (w - a)^2)abs(f'(z)) = (1 + abs(a)^2) / abs(w-a)^2 abs(f'(z))\
    (2 abs(F'(z))) / (1+abs(F(z))^2) &= 2 / (1+abs((1 + overline(a) w) / (w - a))^2) (1+abs(a)^2)/abs(w-a)^2 = (2 abs(w - a)^2) / (abs(w - a)^2+abs(1 + overline(a) w)^2) (1+abs(a)^2)/abs(w-a)^2 \
    &=2 (abs(a)^2 + 1) / ((w - a)(overline(w)-overline(a))+(1 + overline(a) w)(1+a overline(w))) abs(dv(w, z))\
    &=2 (abs(a)^2 + 1) / (abs(w)^2 + abs(a)^2 - a overline(w) - overline(a) w+ 1+abs(a)^2 abs(w)^2 + overline(a)w + a overline(w)) abs(dv(w, z))\
    &=(2(abs(a)^2 + 1)) / ((abs(w)^2+1)(abs(a)^2+1)) abs(dv(w, z)) = (2 abs(f'(z))) / (1 + abs(f(z))^2). #tag[$(dagger)$]
  $
  In other words, $f^sharp equiv F^sharp$ (where $f^sharp = (2 abs(f')) / (1 + abs(f)^2)$ is the spherical derivative as in @def:sphericalderivative), implying that
  $ A(r,f) = 1/(4 uppi) integral.double_(D(0,r)) f^sharp (z)^2 dif A = 1/(4 uppi) integral.double_(D(0,r)) F^sharp (z)^2 dif A = A(r,F), $ and consequently,
  $ T_0(r,f) = integral_0^r A(t,f) / t dt = integral_0^r A(t,F) / t dt = T_0(r,F).#tag[(a)] $
  If $z$ is a solution to $f(z) = a$ of order $k$, then $1+ overline(a)w = 1+ abs(a)^2 >= 1$. Then $W = F(z)$ has a pole of order $k$. Thus,
  $ N(r,F) equiv N(r,a,f).#tag[(b)] $
  From ($dagger$), since $k(w,a) = (2 abs(w-a)) / sqrt((1+abs(w)^2)(1+abs(a)^2))$,
  $
    f^sharp (z) = F^sharp (z) = k(w,a)^2 (abs(a)^2 + 1) / (2 abs(w-a)^2) = (abs(F'(z)) k(w,a)^2) / 2,
  $
  we arrive at
  $ k(w,a) = 2/sqrt(1+abs(W)^2) = k(W,oo). $
  Then,
  $
    m_0(r, a, f) & = integral_0^(2 uppi) log(1/k(f(r ee^(ii theta)), a)) dtheta \
                 & = integral_0^(2 uppi) log(1/k(F(r ee^(ii theta)), oo)) dtheta = m_0(r, F).#tag[(c)]
  $
  1. From (a), (b), and (c), by applying @thm:nevanlinna_first_fundamental_theorem_ahlfors_shimizusimplecase to $F$, we have $ T_0(r, F) & = N(r, F) + m_0(r, F) - m_0(0, F) \
              & = T_0(r,f) = N(r, a, f) + m_0(r, a, f) - m_0(0, a, f), $
    if $f(0) != a (!= oo)$, since $F(0) = (1 + overline(a) f(0)) / (f(0)-a)$ is finite,
    $
      T_0(r, F) & = N(r, F) + m_0(r, F) - m_0(0, F) \
                & = T_0(r,f) = N(r, a, f) + m_0(r, a, f) - m_0(0, a, f),
    $

  + If $f(0) = a != oo$, then $F(0) = oo$ and $f(z) = a + c_a z^k + Order(z^(k+1))$ for some $k in NN$. Then
    $
      F(z) = (1 + overline(a) a + Order(z^k)) / (c_a z^k + Order(z^(k+1)))
    $
    which implies that
    $
      F(z) z^k = (1 + abs(a)^2 + Order(z^k)) / (c_a + Order(z)) -> (1 + abs(a)^2) / c_a quad "as" quad z -> 0,
    $
    so the leading coefficient of the Laurent expansion of $F$ at 0 is $C = (1 + abs(a)^2) / c_a$. By applying @thm:nevanlinna_first_fundamental_theorem_ahlfors_shimizusimplecase to $F$, we have
    $
      T_0(r, F) & = N(r, F) + m_0(r, F) - log abs(C/2) \
                & = T_0(r,f) = N(r, a, f) + m_0(r, a, f) - log abs((1 + abs(a)^2) / (2 c_a)).
    $
  + If $f(0) != a = oo$, then the assertion follows directly from @thm:nevanlinna_first_fundamental_theorem_ahlfors_shimizusimplecase on $f$.

  + If $f(0) = a = oo$, the assertion also follows from @thm:nevanlinna_first_fundamental_theorem_ahlfors_shimizusimplecase on $f$. #qedhere
]

#theorem[
  Let $f : D(0, R) -> extcomplex$ be meromorphic. Then for each $0 < r < R$, the Nevanlinna characteristic $T$ and the Ahlfors--Shimizu characteristic $T_0$ differ by a term that is uniformly bounded in $r$.
]

#proof[
  Observe that for $z in partial D(0, r)$,
  $ logp abs(f(z)) - log 2 <= log(sqrt(1 + abs(f(z))^2) / 2) = 1/2 log(1 + abs(f(z))^2) - log 2. $
  Since $1 + x^2 <= max{2, 2 x^2}$ for any real $x$,
  $
    1/2 log(1 + abs(f(z))^2) - log 2<= 1/2 (max{log 2, log 2 + 2 log abs(f(z))}) - log 2 \
    <= logp abs(f(z)) - 1/2 log 2.
  $
  Integrating and adding $N$, we have
  $ T(r, f) - log 2 <= m_0(r, f) + N(r, f) <= T(r, f) - 1/2 log 2. $
  By the First Fundamental Theorem (@thm:nevanlinna_first_fundamental_theorem_ahlfors_shimizu) in Ahlfors--Shimizu Form with $a = oo$, if we let
  $
    C = cases(m_0(0, a, f) quad & "if" f(0) != oo, log abs(c / 2) quad & "if" f(0) = oo),
  $
  where $c$ is the first nonzero coefficient of the Laurent expansion of $f$, it follows that
  $ T(r, f) - C - log 2 <= T_0(r, f) <= T(r, f) - 1/2 log 2 - C, $
  where $C$ does not depend on $R$.
]

Let $S$ be the Riemann sphere centered at $(0, 0, 0)$, radius 1, with a stereographic projection with center $(0, 0, 1)$ as in @sec:extendedplaneandsphericality. Letting
$
  bold(sigma)(w) = 1 / (abs(w)^2 + 1) (2 Re w, 2 Im w, abs(w)^2 - 1) = ((2 u, 2 v, u^2 + v^2 - 1)) / (u^2 + v^2 + 1),
$
for $w = u + ii v$, then for two points $w_1, w_2 in extcomplex$, their spherical points are $bold(sigma)(w_1), bold(sigma)(w_2)$. The Euclidean straight-line distance between the two points on the sphere is given by
$
  & norm(bold(sigma)(w_1) - bold(sigma)(w_2)) \
  & wide""= sqrt(
    & ((2 Re w_1)/(abs(w_1)^2+1) - (2 Re w_2)/(abs(w_2)^2+1))^2
      + ((2 Im w_1)/(abs(w_1)^2+1) - (2 Im w_2)/(abs(w_2)^2+1))^2 \
    & ""+ ((abs(w_1)^2-1)/(abs(w_1)^2+1) - (abs(w_2)^2-1)/(abs(w_2)^2+1))^2
  ) \
  & wide""= 1/((abs(w_1)^2+1)(abs(w_2)^2+1)) \
  & wide quad ""times sqrt(
    & 4 Re[w_1(abs(w_2)^2+1) - w_2(abs(w_1)^2+1)]^2 \
    & ""+ 4 Im[w_1(abs(w_2)^2+1) - w_2(abs(w_1)^2+1)]^2 \
    & ""+[(abs(w_1)^2-1)(abs(w_2)^2+1) - (abs(w_2)^2-1)(abs(w_1)^2+1)]^2
  ) \
  & wide""= 2/(rho_1 rho_2) sqrt(abs(w_1 rho_2 - w_2 rho_1)^2 + (rho_1 - rho_2)^2) #tag[(where $rho_i = abs(w_i)^2 + 1$)] \
  & wide""= 2 / (rho_1 rho_2) sqrt(rho_2^2 (rho_1 - 1) + rho_1^2 (rho_2 - 1) - 2 rho_2 rho_1 Re[w_1 overline(w_2)] + (rho_1 - rho_2)^2) \
  & wide""= 2 / (rho_1 rho_2) sqrt(rho_2^2 rho_1 + rho_1^2 rho_2 - 2 rho_2 rho_1 Re[w_1 overline(w_2)] - 2 rho_1 rho_2) \
  & wide""= 2 / sqrt(rho_1 rho_2) sqrt(rho_2 + rho_1 - 2 Re[w_1 overline(w_2)] - 2) = (2 abs(w_1 - w_2)) / sqrt(rho_1 rho_2) = k(w_1, w_2) \
$
Thus, $k$ measures the _chordal_ distance between points on the Riemann sphere, and is thus geometrically invariant under rotations of the sphere. The mapping $W$ of $w$ is precisely such a transformation: geometrically it rotates points on the Riemann sphere. Geometrically, the invariance of $m_0$ is now clear.

Let $w = u + ii v$ be a point in the projected plane and let $dif u dif v$ be an area element on the plane. Then the corresponding area element on the sphere is equal to:
$
  dif A_S & = norm(bold(sigma)'_u times bold(sigma)'_v) dif u dif v \
  & = (dif u dif v) / (abs(w)^2 + 1)^4 norm(mat(2v^2-2u^2 + 2; -4v u; 4u) times mat(-4u v; 2u^2 - 2 v^2 + 2; 4v)) \
  & = (4 dif u dif v) / (abs(w)^2 + 1)^4 norm(mat(-2u v^2 - 2u^3 - 2u; -2u^2 v - 2v^3 - 2v; 1 - (u^2 + v^2)^2)) = (4 dif u dif v) / (abs(w)^2 + 1)^3 norm(mat(-2u; -2v; 1 - abs(w)^2)) \
  & = (4 dif u dif v) / (abs(w)^2 + 1)^3 sqrt(2 abs(w)^2 + 1 + abs(w)^4) = (4 dif u dif v) / (abs(w)^2 + 1)^2
$
The surface area of a surface $E subset.eq S$ is given by
$
  integral_E dif A_S = integral.double_(bold(sigma)^(-1) (E)) (4 dif u dif v) / (abs(w)^2 + 1)^2 = -2 ii integral.double_(bold(sigma)^(-1) (E)) (dif overline(w) dif w) / (abs(w)^2 + 1)^2.
$
For $w = f(z)$, $E = bold(sigma) compose f(D(0,r))$, pulling back to $z$ gives
$
  1/(4 uppi) integral.double_(bold(sigma)(f(D(0,r)))) dif A_S &= 1 /(2 uppi ii) integral.double_D(0,r) ((overline(f'(z)) dzbar) and (f'(z) dz)) / (abs(f(z))^2 + 1)^2 \
  &= 1 / (4 uppi) integral.double_D(0,r) f^sharp (z)^2 dif x dif y\
  &=#[[area of $f$'s image on $S^2$ with multiplicities]] / #[[area of $S^2$ (Riemann sphere)]]\
  &= A(r) #tag[$(star.stroked)$]
$
or the area of the image of $f$ on the Riemann sphere, counted according to multiplicities (referring to overlaps when not univalent), divided by the area of the Riemann sphere ($4 uppi$). In some sense, $A$ measures the amount by which the image of $f$ covers the Riemann sphere.

(Observe the similarity between the first integral of $(star.stroked)$ and the Lusin Area Theorem (@thm:lusinarea)!)

This completes the geometric explanation for the invariances of (a), (b), and (c) in the proof of @thm:nevanlinna_first_fundamental_theorem_ahlfors_shimizu. The covered area and chordal distance are invariant under rotations of $S$. In particular, we rotate the spherical point of $a$ to the north pole $(0, 0, 1)$ corresponding to $oo$.

#remark[
  It is noteworthy that the original Ahlfors--Shimizu formulation uses the Riemann sphere centered at $(0,0, 1\/ 2)$ with diameter $1$, which yields a slightly different proximity function (without the $\/2$ factor) and spherical derivative (without the factor of 2). (Note that the characteristic _does not change_ as the amount a function covers the extended plane (or either sphere) is independent on the size of this sphere).

  This normalization is present throughout Ahlfors' works; in @sec:differential_geometry, the spherical and hyperbolic metrics are also defined without a $2 dot$ factor (and hence yield curvatures of $plus.minus 4$). There is little fundamental difference between the two normalizations, and we have adopted the sphere of diameter $2$ to uniformize better with the previous sections.
]
