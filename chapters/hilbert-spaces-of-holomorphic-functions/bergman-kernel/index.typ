#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [The Bergman Kernel],
  route: "bergman-kernel",
)
#let berg = $A^2 (Omega)$
Fix $Omega$ be an open region and let $z_0 in Omega$ be fixed. Then let $A^2 (Omega)$ be the Hilbert space of square integrable holomorphic functions on $Omega$. Recall @ex:hilbert-space-bergman-space:
#thm-state.thm-restate("bergman-space")
For each $f in Omega$, @prop:bergman-space-function-bounded-by-norm-in-compact-set gives:
$
  abs(f(z_0)) <= 1 / (r sqrt(uppi)) norm(f).
$
Moreover, the mapping $phi.alt$ between $berg$ and $CC$ given by
$ phi.alt : f (in berg) |-> f(z_0) (in CC) $
is a bounded linear functional on $berg$: linearity is trivial and boundedness follows from @prop:bergman-space-function-bounded-by-norm-in-compact-set. Then by the Riesz Representation Theorem (@thm:riesz-representation), there as a unique $k_(z_0) in berg$, dependent on $z_0$ but not $f in berg$, such that
$ f(z_0) = phi.alt(f) = chev(f, k_(z_0)). #tag[(for all $f in berg$)] $
Then
$
  f(z_0) = integral.double_Omega f(zeta) overline(k_(z_0) (zeta)) dif xi dif eta. #tag[(where $zeta = xi + ii eta$)]
$
#let berg-t = math-markup(eref(<eq:bergman-integral-formula>)[(#sym.ast.op)])
#definition[Bergman Kernel][
  Let $Omega$ be an open region, define the _Bergman kernel_ to be a complex function $K (z, w)$ of two variables in $berg$, given by $K (z, w) = overline(k_z (w))$, where $k_z (w)$ is the unique Riesz representer for the linear functional $f mapsto f(z)$.
]
Then the previous equation is simply
#etarget(<eq:bergman-integral-formula>)[
  $
    f(z_0) = integral.double_Omega f(zeta) K (z_0, zeta) dif xi dif eta. #tag[#math-markup(link-wrap: true)[(#sym.ast.op)]]
  $
]
#theorem[Conjugate-symmetry of the Bergman Kernel][
  For any $z, w in Omega$,
  $ K (z, w) = overline(K (w, z)). $
] <thm:bergman-kernel-conjugate-symmetry>
#proof[
  By the integral representation in #berg-t, $forall z, w in Omega$, letting $f = z |-> overline(K (w, z)) = k_w (z)$,
  $
    overline(K (w, z)) & = k_w (z) = integral.double_Omega k_w (zeta) overline(k_z (zeta)) dif xi dif eta \
                       & = overline(integral.double_Omega k_z (zeta) overline(k_w (zeta)) dif xi dif eta) \
                       & = overline(k_z (w)) = overline(overline(K (z, w))) = K (z, w), #tag[(by #berg-t)]
  $
  proving the assertion.
]
#corollary[
  The Bergman Kernel $K (z, w)$ is holomorphic in the first argument: $pdv(, overline(z)) K (z, w) = 0$ for all $z in Omega$.
] <cor:bergman-kernel-left-holomorphy>
#proof[
  Since $overline(K (w,z)) = k_w (z)$ is holomorphic in $z$, it follows from @thm:bergman-kernel-conjugate-symmetry that $K (z, w)$ is holomorphic in $z$.
]
Moreover, certain properties of the Bergman kernel that we have discussed previously uniquely determine the Bergman kernel:
#theorem[Reproducing Property of $K (dot, dot)$][
  If $tilde(K) : Omega^2 -> CC$ satisfies $w mapsto overline(tilde(K)(z, w)) in berg$ for each $z in Omega$, and if for all $f in berg$,
  $
    f(z) = integral.double_Omega f(zeta) tilde(K)(z, zeta) dif xi dif eta,
  $
  then $tilde(K) equiv K$ on $Omega^2$.
] <thm:bergman-kernel-property-uniqueness>
#proof[
  Let $f$ be the Bergman kernel $zeta mapsto K (zeta, w)$ (holomorphic in the left argument by @cor:bergman-kernel-left-holomorphy). Then $forall z, w in Omega$,
  $
    K (z, w) & = integral.double_Omega K (zeta, w) tilde(K)(z, zeta) dif xi dif eta \
    & = overline(integral.double_Omega overline(tilde(K)(z, zeta)) K (w, zeta) dif xi dif eta) #tag[(by @thm:bergman-kernel-conjugate-symmetry)]\
    & = overline(overline(tilde(K)(z, w))),
  $
  where the last step uses #berg-t and $zeta |-> overline(tilde(K)(z,zeta)) in berg$. Therefore, $K(z, w) = tilde(K)(z, w) ==> K equiv tilde(K)$ on $Omega^2$.
]
Therefore, in the search of a Bergman kernel for a specified domain, if one can construct a function satisfying the properties outlined in @thm:bergman-kernel-property-uniqueness, then one can ascertain that it is the Bergman kernel.
#theorem[
  Let $A^2(Omega)$ be the Bergman space of square-integrable functions on any open region $Omega subset.eq CC$. Then $A^2(Omega)$ has a complete countable orthonormal system ${e_j}$.
] <thm:bergman-space-complete-countable-orthonormal-system-existence>
(There are several approaches to prove this theorem.)
// #proof[
//   Exhaust $Omega$ by compact sets ${K_n}_(n in NN)$ according to @lem:polygonal-exhaustion, such that there are finitely many connected components in each $extcomplex without K_n$, and each $K_n$ has a well-defined area (as it is a polygonal grid). Letting the connected components of $Omega$'s complement be ${W_i}_(i in I union {oo})$ (where $W_oo$ is the component with $oo$), by taking
//   $
//     {V_(j, n)}_(j = 1)^(k_n) = {V : V "is a connected component of" extcomplex without K_n : exists i : W_i subset.eq V}
//   $
//   such that $V_(1, n)$ is the component containing $W_oo$, and letting
//   $
//     tilde(K_n) = CC without union.big_(j = 1)^(k_n) V_(j, n),
//   $
//   we may remove all "extraneous" holes. It may then also be verified rather easily that ${tilde(K_n)}_n$ is an exhaustion.

//   For each $i$, choose $a_i in W_i$ (for the component containing $oo$, choose $W_oo in.rev a_oo = oo$); for all $1 <= j <= k_n$, choose $i_(j, n)$ such that $W_i_(j, n) subset.eq V_(j, n)$ (and more specifically, $W_oo subset.eq V_(1, n)$). Then ${a_i_(j, n)}_(j = 1)^(k_n)$ is a set containing exactly one point from each connected component of $tilde(K_n)$'s complement.

//   Then for any $f in A^2 (Omega)$,
//   $ norm(f)^2 = lim_(n -> oo) integral.double_(tilde(K_n)) abs(f(z))^2 dx dy, $
//   implying that for any $epsilon > 0$, for $n > N$ for some large $N$,
//   $
//     integral.double_(Omega without tilde(K_n)) abs(f(z))^2 dx dy < epsilon^2 / 8.
//   $
//   By Mergelyan's Theorem (@thm:mergelyan), there exists a rational function $psi_(n, f)$, with poles in ${a_i_(j, n)}_(j = 1)^(k_n)$, such that $abs(psi_(n,f)(z) - f(z)) < epsilon / (4 sqrt(op("area")(K_n)))$ over $tilde(K_n)$. By subtracting the principal parts from $psi_(n, f)$ at each pole, we obtain a function that is holomorphic on $CC without {a_i_(j,n)}$ with removable singularities at each previous pole. Then extending to $CC$, @prop:removable-singularity-at-infinity-entire-constant implies that the difference is a constant (in other words, $psi_(n, f)$ is an exact constant away from the sum of all principal parts). In particular, $psi_(n, f)$ has the expression
//   $
//     psi_(n, f) (z) = c_(0, n) + sum_(l = 1)^(M_n) c_(1, n)^((l)) z^l + sum_(j = 2)^(k_n) sum_(l = 1)^(M_n) c_(j, n)^((l)) (z - a_i_(j, n))^(-l)
//   $
//   (where $M_n >= 1$ can be chosen to be independent of $j$; recall we can set $c_(j, n)^((l))$ to be $0$ if necessary). Moreover, each $c_(j, n)^((l))$ (or $c_(0,n)$) maybe approximated by some element $tilde(c_(j, n)^((l)))$ (or $tilde(c_(0,n))$) in $QQ + ii QQ$ within an accuracy of
//   $
//     0<abs(tilde(c_(j, n)^((l))) - c_(j, n)^((l))) < (frac(epsilon, sqrt(op("area") tilde(K_n)), style: "horizontal")) / (4 k_n M_n max{limits(sup)_(z in tilde(K_n) \ 2 <= j <= k_n \ l in NN_(<=M_n)) abs(z - a_i_(j, n))^(-l), limits(sup)_(z in tilde(K_n) \ l in NN_(<= M_n)) abs(z)^l} + 4),
//   $
//   giving that
//   $
//     & abs(psi_(n, f) (z) - tilde(c_(0,n)) - sum_(j = 1)^(k_n) sum_(l = 1)^(M_n) tilde(c_(j, n)^((l))) [(z - a_i_(j, n))^(-l) "or" z^(l)]) \
//     & wide <= sum_j sum_l abs(tilde(c_(j, n)^((l))) - c_(j, n)^((l))) [abs(z-a)^(-l) "or" abs(z)^l] + abs(tilde(c_(0, n)^((l))) - c_(0, n)^((l))) \
//     & wide <= epsilon / sqrt(op("area") tilde(K_n)) [4 k_n M_n max{limits(sup)_(z in tilde(K_n) \ 2 <= j <= k_n \ l in NN_(<=M_n)) abs(z - a_i_(j, n))^(-l), limits(sup)_(z in tilde(K_n) \ l in NN_(<= M_n)) abs(z)^l} + 4]^(-1) \
//     &wide wide wide dot (sum_j sum_l [abs(z-a)^(-l) "or" abs(z)^l] + 1) \
//     & wide <= epsilon / sqrt(op("area") tilde(K_n)) [4 k_n M_n max{limits(sup)_(z in tilde(K_n) \ 2 <= j <= k_n \ l in NN_(<=M_n)) abs(z - a_i_(j, n))^(-l), limits(sup)_(z in tilde(K_n) \ l in NN_(<= M_n)) abs(z)^l} + 4]^(-1) \
//     &#{ math.wide * 3 } dot [M_n k_n max{limits(sup)_(z in tilde(K_n) \ 2 <= j <= k_n \ l in NN_(<=M_n)) abs(z - a_i_(j, n))^(-l), limits(sup)_(z in tilde(K_n) \ l in NN_(<= M_n)) abs(z)^l}+1] \
//     & wide = epsilon / (4 sqrt(op("area") tilde(K_n))). #tag[(for all $z in tilde(K_n)$)]
//   $
//   Then the function
//   $
//     tilde(psi_(n, f))(z) = [tilde(c_(0,n)) + sum_(l = 1)^(M_n) tilde(c_(1, n)^((l))) z^l + sum_(j = 2)^(k_n) sum_(l = 1)^(M_n) tilde(c_(j, n)^((l))) (z - a_i_(j, n))^(-l)] cases(0 & quad "if" quad z in.not tilde(K_n)\,, 1 &quad "if" quad z in K_n.)
//   $
//   can be characterized by a sequence of $k_n M_n + 1$ rational numbers. Therefore, each $f in A^2(Omega)$ can be approximated within an accuracy of $epsilon / 4$ by a function $tilde(psi_(n, f))(z)$ corresponding uniquely to an element in the countable set $QQ^(k_n M_n + 1)$.

//   Then
//   $ abs(tilde(psi_(n, f))(z) - f(z)) <= abs(psi_(n, f) (z) - f(z)) + abs(psi_(n,f)(z) - tilde(psi_(n, f)) (z)), $
//   giving that
//   $
//     &sqrt(integral.double_Omega abs(psi_(n, f)(z) - f(z))^2 dx dy) \
//     &wide<= sqrt(integral.double_tilde(K_n) (epsilon / (2 sqrt(op("area") tilde(K_n))))^2 dx dy + integral.double_(Omega without tilde(K_n)) abs(f(z))^2 dx dy)\
//     &wide<= sqrt(epsilon^2 / 4 + epsilon^2 / 8)
//   $
// ]
#proof[
  Enumerate
  $
    Omega inter (QQ + ii QQ) = {z_n}_(n in NN) subset.eq Omega,
  $
  such that $overline({z_n}_n) = overline(Omega)$, or in other words ${z_n}_n$ is countable dense in $Omega$. For each fixed $n in NN$, $f |-> f(z_n)$ is a bounded linear functional by  @prop:bergman-space-function-bounded-by-norm-in-compact-set. Then let $k_(z_n) in A^2(Omega)$ be its unique Riesz representer, so that
  $
    f(z_n) = chev(f, k_(z_n))
  $
  for every $f in berg$. Define $S = overline(span{k_z_n}_n)$, which is Hilbert space in $berg$. Suppose $f in S^perp$. Then for any $n in NN$, $ f(z_n) = chev(f, k_z_n) = 0. $
  Because ${z_n}$ has an accumulation point in $Omega$ and $f(z_n) = 0$ for each $n$, by the Identity Theorem (@thm:identity), $f equiv 0$. Then $S^perp = {0}$. Since $S$ is closed, any $f in berg$ can be decomposed, by @thm:orthogonal-decomposition, into $f_1 + f_2$, where $f_1 in S$ and $f_2 in S^perp = {0}$. Then $f in S$, implying $berg = S$; then $k_z_n$ densely spans $berg$.

  For any $f in berg$ for any $epsilon > 0$, choose $ tilde(f) = sum_(j = 1)^l c_j k_z_n_j $ such that $norm(tilde(f) - f) < epsilon / 2$. Letting $tilde(c_j) in QQ + ii QQ$ be chosen such that $ abs(c_j - tilde(c_j)) < epsilon / (2 l max{1, max_j norm(k_z_n_j)}) $ and letting $ doubletilde(f) = sum_(j=1)^l tilde(c_j) k_z_n_j, $ we see that
  $
    norm(tilde(f) - doubletilde(f)) = norm(sum_(j = 1)^l (c_j - tilde(c_j)) k_z_n_j) <= sum_(j = 1)^l epsilon / (2 l max{1, max_j norm(k_z_n_j)}) norm(k_z_n_j) <= epsilon / 2,
  $
  whence $ norm(f - doubletilde(f)) <= norm(tilde(f) - f) + norm(tilde(f) - doubletilde(f)) < epsilon. $
  Therefore, any $f in berg$ can be arbitrarily approximated by an element in
  $ {sum_(j = 1)^l tilde(c_j) k_z_n_j : l in NN, (forall j in NN_(<= l)) n_j in NN, c_j in QQ + ii QQ}, $
  which is countable (see equivalent justification in the proof of @prop:hilbert-space-separable-equiv-having-complete-countable-orthonormal-system; essentially the set $union.big_(l = 1)^oo NN^l times (QQ + ii QQ)^l$ is countable). Therefore @prop:hilbert-space-separable-equiv-having-complete-countable-orthonormal-system implies, from separability, the existence of a complete countable orthonormal system.
  #todo[Checks]
]
#proof[(Alternative)][
  A reader who has learned measure theory could note that $L^2(Omega)$ is a separable Hilbert space, and by @thm:hilbert-subspace-of-space-with-countable-complete-orthonormal-system, $A^2(Omega)$ is separable and has a complete countable orthonormal system by @prop:hilbert-space-separable-equiv-having-complete-countable-orthonormal-system.
]
