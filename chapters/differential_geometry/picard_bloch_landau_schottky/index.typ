#import "/lib.typ": *

== The Great Picard, Bloch, Landau, and Schottky Theorems

Recall the Casorati--Weierstrass Theorem, one of the earliest results on the value distribution near essential singularities:

#thm-state.thm-restate("thm:casoratiweierstrass", final: true)

We will now prove a more advanced characterization of this distribution by methods of differential geometry.

#theorem("Picard's Great Theorem", restate: true, restate-keys: ("thm:greatpicard",))[
  Suppose $f$ is holomorphic on a punctured neighborhood $D^*(z_0, delta)$ of $z_0$. If $z_0$ is an essential singularity of $f$, then $f(D^*(z_0, delta))$ omits at most one value of $CC$.
] <thm:greatpicard>

#proof[
  Without loss of generality, assume $z_0 = 0$ and that $f$ omits the values $0$ and $1$ (otherwise, consider $z |-> (1)/(beta - alpha) (f(z + z_0) - alpha)$, where $alpha$ and $beta$ are the omitted values). Define the family
  $ cal(F) = {z |-> f(z / n): n in NN} $
  of holomorphic functions on $D^*(0, delta)$. Since $f$ omits $0$ and $1$, each element of $cal(F)$ does as well. By the Fundamental Normality Test (@thm:fundamentalnormalitytest), $cal(F)$ is spherically normal. Thus, there exists a subsequence ${f_(n_k)}_(k in NN) subset.eq cal(F)$ that converges locally uniformly on $D^*(0, delta)$ in the spherical metric. By @prop:locallyuniformlysphericallyconvergentholomorphicsequenceuniformlimit, this subsequence converges locally uniformly either to a holomorphic function on $D^*(0, delta)$ or to $oo$ thereon.

  1. Suppose ${f_(n_k)}_(k in NN)$ converges locally uniformly to a holomorphic function on $D^*(0, delta)$. Then ${f_(n_k)}_(k in NN)$ is uniformly bounded on $partial D(0, delta / 2)$. Hence, there exists $M > 0$ such that
    $ abs(f(z / (n_k))) = abs(f_(n_k) (z)) < M quad forall z in partial D(0, delta / 2), k in NN. $
    In other words, $f$ is bounded by $M$ on every circle $partial D(0, delta / (2 n_k))$ for $k in NN$. By the Maximum Modulus Principle (@thm:maximum-modulus), $f$ is then bounded by $M$ on each annulus $overline(D(0, delta / (2 n_k))) without D(0, delta / (2 n_(k + 1)))$ for $k in NN$. As
    $
      union.big_(k in NN) overline(D(0, delta / (2 n_k))) without D(0, delta / (2 n_(k + 1))) = overline(D(0, delta / (2 n_1))) without {0},
    $
    it follows that $f$ is bounded on $D^*(0, delta / 2)$. By Riemann's Removable Singularity Theorem (@thm:riemannremovablesingularities), $f$ therefore extends holomorphically to $0$.

  2. Suppose ${f_(n_k)}_(k in NN)$ converges locally uniformly to $oo$ on $D^*(0, delta)$. Then, for every $epsilon > 0$, there exists $N in NN$ such that, for all $k > N$,
    $ abs((1)/(f(z / (n_k)))) = abs((1)/(f_(n_k) (z))) < epsilon quad forall z in partial D(0, delta / 2). $
    By the same reasoning as in the previous case, $abs((1)/(f)) < epsilon$ on
    $
      union.big_(k > N) overline(D(0, delta / (2 n_k))) without D(0, delta / (2 n_(k + 1))) supset D^*(0, delta / (2 n_(N + 1))).
    $
    Thus, by the definition of the limit, $lim_(z -> 0) 1 / f(z) = 0$, so $f$ has a pole at $0$.

  In either case, we have derived a meromorphic continuation of $f$ to $0$, contradicting the assumption that $0$ is an essential singularity of $f$.
]

#corollary[
  Suppose that $f$ is meromorphic on a punctured neighborhood $D^*(z_0, delta)$ of $z_0$. If $f(D^*(z_0, delta))$ omits at least three different values of $extcomplex$, then $f$ has a meromorphic continuation to $z_0$.
] <cor:greatpicardmeromorphic>

#proof[
  A linear fractional transformation maps the omitted values to $0$, $1$, and $oo$, mapping $f$ so that it exhibits holomorphy. Similar to @cor:montelcaratheodory, the preceding result is preserved under the inverse linear fractional transformation.
]

#remark[
  An accumulation point of poles is an essential singularity on the Riemann sphere.
]

Picard's Great Theorem is also a generalization of Picard's Little Theorem (@thm:littlepicard):
#thm-state.thm-restate("thm:littlepicard", final: true)
#proof[
  Let $g(z) = f(1 / z)$ with an isolated singularity at $0$ and a removable singularity at $oo$. By Picard's Great Theorem (@thm:greatpicard), $g(z)$ has a meromorphic extension to $z = 0$. If $z = 0$ is removable, by virtue of @prop:removablesingularityatinftyentireconstant and @thm:liouville, the constancy of $g$ and $f$ follows.

  If instead $z = 0$ is a pole of $g$, then $z = oo$ is a pole of $f$, and hence $f$ is a polynomial. Assume, for the sake of contradiction that $f$ is non-constant. Then $forall w in CC$, the Fundamental Theorem of Algebra (@thm:fundamental-theorem-of-algebra) gives the existence of some $z in CC$ such that $f(z) = w$. Hence, $f$ attains every value $w in CC$. This contradicts the statement and hence $f$ is constant.
]

The efforts of many mathematicians resulted in several alternative proofs following that of Picard; the geometric realization of Ahlfors (@thm:schwarzahlforspick) was followed by results discovered by R. M. Robinson. Other approaches from Nevanlinna theory appeared later in the 20th century.

Picard's original proof, providing an advanced characterization of the value distribution at essential singularities, relied primarily on the properties of the elliptic modular function (as a "covering map"). From this, Picard deduced that the function would necessarily extend holomorphically across the singularity, contradicting its essential nature. Thus, his proof established that near an essential singularity, a holomorphic function attains every complex value, with at most one exception, infinitely often.

More importantly, we have shown the utility of even seemingly fundamental differential geometry, which can also be used in the proof of many other important results.

The methods of differential geometry can also be used to prove the statements of the following theorems (which can also be independently used to prove the Picard theorems), but is made meaningful with the notion of Riemann surfaces.

#theorem("Bloch")[
  Let $f:DD -> CC$ be holomorphic such that $abs(f'(0)) = 1$. Then there is a region $S subset.eq DD$ on which $f$ is univalent such that $f(S)$ contains a disk with a radius of at least $sqrt(3) / 4$ (known as a schlicht disk).
] <thm:bloch>

#remark[
  _Bloch's constant_ $B$ is defined as the supremum of the radii of such disks that can be contained in $f(DD)$ for any holomorphic function $f:DD -> CC$ satisfying $f'(0) = 1$.

  The precise value of $B$ remains unknown to this day. In 1937, H. Grunsky and L. Ahlfors established the bound
  $ B <= (Gamma((1)/(3)) Gamma((11)/(12)))/(Gamma((1)/(4))) sqrt((sqrt(3) - 1)/(2)), $
  where $Gamma$ denotes the Gamma function (as in @eq:gammafunction). Later the lower bound of $sqrt(3) / 4$ was given, then to be refined to $B >= sqrt(3) / 4 + (10^(-12))/(13)$ by M. Bonk, which was further improved to $B >= sqrt(3) / 4 + 1 / 5000$ in 1996 by H. Chen and P. M. Gauthier.

  Grunsky and Ahlfors actually conjectured that the upper bound in their inequality is exact -- that is, $B = (Gamma((1)/(3)) Gamma((11)/(12)))/(Gamma((1)/(4))) sqrt((sqrt(3) - 1)/(2))$.
]

#theorem("Landau")[
  The image of any holomorphic function $f$ in $DD$ satisfying $f(0) = 0$ and $f'(0) = 1$ contains a disk with radius of at least $1 / 2$.
]

#remark[
  Similarly, the estimate $1 / 2$ is not optimal. It was established that the corresponding _Landau's constant_ lies between $1 / 2$ and $(Gamma((1)/(3)) Gamma((5)/(6)))/(Gamma((1)/(6)))$.
]

Without Riemann surfaces, the proof of the two aforesaid results are rather difficult, as a distinction must be established for a point $w in f(DD)$ which two values $z_1, z_2$ map to. Otherwise, when we describe a schlicht disk at a point in the image, we may be talking about different "sheets" or "branches," although each fixed sheet may describe perfectly well-defined analytic functions, although they describe different "copies." More details may be found in~@ahlforsanextensionofschwarzlemma.

Hence, for simplicity, we entertain a much simpler case without algebraic branch points.

#theorem[
  Let $f:DD -> CC$ be univalent such that $abs(f'(0)) = 1$. Then $f(DD)$ contains a disk with a radius of at least $sqrt(3) / 4$.
]

#proof[
  For $w in f(DD)$, let $phi.alt(w)$ denote the radius of the largest schlicht disk in $f(DD)$ centered at $w$ (it is mapped to univalently by $f$ on some subdomain). Trivially, $phi.alt$ is $C^0$ and vanishes toward the boundary of $f(DD)$.

  Define the metric
  $ rho(w) = A / (sqrt(phi.alt(w)) (A^2 - phi.alt(w))), quad dif s = rho(w) abs(dif w) $
  for $w in f(DD)$ and $rho(w) != 0$, where $A^2 > sup_w phi.alt(w)$ is a constant. We may assume that $sup_w phi.alt(w)$ is finite, since otherwise the theorem is already proved for $f$.

  For every point $w_0 in f(DD)$, the bounding circle corresponding to $phi.alt(w_0)$ passes through a (at least one) boundary point, denoted by $b = b_(w_0)$. Let $phi.alt_(w_0) (w) = abs(w - b)$ and let
  $ rho_(w_0) (w) = A / (sqrt(phi.alt_(w_0) (w)) (A^2 - phi.alt_(w_0) (w))), quad w in D(w_0, phi.alt(w_0)). $
  By the definition of $phi.alt$, we have $phi.alt_(w_0) >= phi.alt$ everywhere in this neighborhood. Since $rho_(w_0) = (phi.alt_(w_0) |-> sqrt(phi.alt_(w_0)))^* (phi |-> (2 A)/(A^2 - phi^2))$ is the pullback of the hyperbolic metric in @eq:poincaremetricscaledcurvature, the metric $rho_(w_0) (w)$ has the constant negative curvature of $-1$.

  Our goal is to construct $rho_(w_0)$ so that it is the function of a supporting metric for $rho$ (satisfies the criteria for @thm:schwarzahlforspicksupportingmetric). For $rho_(w_0) <= rho$ to be satisfied, we consider
  $
    sqrt(phi.alt_(w_0) (w)) (A^2 - phi.alt_(w_0) (w)) >= sqrt(phi.alt(w)) (A^2 - phi.alt(w)), quad phi.alt_(w_0) (w) >= phi.alt(w).
  $
  In particular, we want
  $ t |-> sqrt(t) (A^2 - t) $
  to be increasing on $[0, phi.alt(w_0) + delta]$ for arbitrary $delta > 0$. The function itself can be calculated to be increasing for $t <= A^2 / 3$ by elementary methods (using derivative tests). Therefore, the conditions for a supporting metric are satisfied if $A^2 / 3 >= sup_(w in f(DD)) phi.alt(w) + delta >= phi.alt(w_0) + delta$. Without loss of generality we let $delta -> 0^+$ and thus, under the condition that $A^2 / 3 > sup_w phi.alt(w)$, @thm:schwarzahlforspicksupportingmetric gives that
  $ rho(w) abs(dif w) <= (2 abs(dz)) / (1 - abs(z)^2). $
  Let $z = 0$, $w = f(0)$, so that by the theorem conditions, $abs(dv(w, z)) = 1$, and therefore
  $ rho(f(0)) <= 2 ==> A <= 2 sqrt(phi.alt(f(0))) [A^2 - phi.alt(f(0))]. $
  By the previous assumptions on $A$, the corresponding function on the right-hand side is increasing, and since $phi.alt(f(0)) <= sup_w phi.alt(w)$, we have
  $ A^2 <= 4 sup_w phi.alt(w) (A^2 - sup_w phi.alt(w))^2. $
  As $A^2 / 3 -> sup_w phi.alt(w)^+$ ($A$ was chosen arbitarily, so this is valid), it follows that
  $ sup_w phi.alt(w) >= sqrt(3) / 4. #qedhere $
]

It is however notable that the proof follows similarly for general functions, but instead we consider functions $f:DD -> W$, where $W$ is a Riemann surface and the "singularities" are not only boundary points but also algebraic branch points (where $f' = 0$).

#theorem[Landau--Carathéodory][
  Let $f(z) = sum_(n = 0)^oo a_n z^n$ such that $a_1 != 0$ and $f$ is holomorphic on $D(0, r)$. If $f$ omits $0$ and $1$, then $exists R$ dependent only on $a_0$ and $a_1$ such that $r <= R$.
]

#theorem[Schottky][
  Suppose that $f:DD -> CC$ is holomorphic and omits $0$ and $1$. Then
  $ log abs(f(z)) < (1 + abs(z))/(1 - abs(z)) (7 + logp abs(f(0))), $
  where $logp(x) = max{0, log x}$ (common notation in Nevanlinna theory).
]

#proof[
  Consider conformal map $zeta_1 (w):CC without [0, 1] -> CC without overline(DD)$, which extends to $0$, $1$, and $oo$ continuously such that $zeta_1 (oo) = oo$, $zeta_1 (1) = 1$, $zeta_1 (0) = -1$. Explicitly, we have the relationship
  $ zeta_1 + 1 / zeta_1 = 4 w - 2 $
  as an affine transformation of the inverse _Joukowski transform_ (inverse of $z |-> z + z^(-1)$). The solution is given by $ zeta_1=(2w-1)+2w sqrt(1-1/w) = (2w-1)+2w exp[1/2 Log(1-1/w)], $
  where the branch cut of the square root is taken to be the negative real axis, which maps to $[0,1]$ in terms of $w$ (and with the principal branch logarithm). Moreover, this explicit map maps $[0,1]$ to $partial DD$, since for $w in [0,1]$, the term involving the square root is purely imaginary thus $abs(zeta_1) = sqrt(4w^2 + 1 - 4w - 4w^2+4w)=1$. Because as $w -> oo$, $zeta_1 -> oo$, $zeta_1$ here is a valid conformal map.
]
