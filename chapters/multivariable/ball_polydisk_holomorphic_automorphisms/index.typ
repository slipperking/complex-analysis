#import "/lib.typ": *

== The Group of Holomorphic Automorphisms on $DD^n$ and $B^n$
A function $bold(f) : Omega subset.eq CC^m -> CC^n$ is called _holomorphic_ iff each of its component functions is holomorphic. It is important to allow for vector-valued outputs, since we are interested in automorphisms on complex domains in higher dimensions.

For the aforesaid purpose, we require a generalization of the Schwarz Lemma (@lem:schwarz), which is equivalent to several results of Cartan.

In preparation, we will introduce several relevant concepts.

#definition("Multi-Index Notation")[
  A _multi-index_ is an $n$-tuple of nonnegative integers $bold(k) = (k_1, dots, k_n) in ZZ_(gt.eq 0)^n$.
  We define
  $
    abs(bold(k)) = sum_(j=1)^n k_j, quad
    bold(z)^(bold(k)) = product_(j=1)^n z_j^(k_j), quad
    partial^(bold(k)) = (partial^(abs(bold(k)))) / (partial z_1^(k_1) dots.c partial z_n^(k_n)) = product_(j=1)^n pdv(, z_j, [k_j]),
  $
  where $bold(z) = (z_1, dots, z_n) in CC^n.$
] <def:multiindex>

#definition[
  A polynomial $bold(psi) : CC^n -> CC^m$ of several variables is said to be _homogeneous of degree $d$_ iff
  $
    bold(psi)(lambda bold(z)) = lambda^d bold(psi)(bold(z)) quad forall lambda in CC, bold(z) in CC^n,
  $
  or equivalently, iff $bold(psi)$ can be written as
  $
    bold(psi)(bold(z)) = sum_(abs(bold(k)) = d) bold(a)_(bold(k)) bold(z)^(bold(k))
  $
  where $bold(k) in ZZ_(gt.eq 0)^n$ is a multi-index.
] <def:homogeneouspolynomial>

#proposition[
  Let $bold(psi) : CC^n -> CC^m$ be a homogeneous polynomial of degree $d$.
  + For any multi-index $bold(alpha) = (alpha_1, dots, alpha_n)$ with $norm(bold(alpha)) = r <= d$,
    $
      partial^(bold(alpha)) bold(psi)(bold(z)) = (partial^r bold(psi)) / (partial z_1^(alpha_1) dots.c partial z_n^(alpha_n))(bold(z))
    $
    is a homogeneous polynomial of degree $d-r$. <itm:homogeneouspolynomialderivatives_less>
  + If $r = d != 0$, then $partial^(bold(alpha)) bold(psi)$ is constant (and there exists a multi-index $bold(alpha)$ with $norm(bold(alpha)) = d$ such that $partial^(bold(alpha)) bold(psi)$ is nonzero). <itm:homogeneouspolynomialderivatives_equality>
  + If $r > d$, then $partial^(bold(alpha)) bold(psi) equiv 0$. <itm:homogeneouspolynomialderivatives_greater>
] <prop:homogeneouspolynomialderivatives>

#proof[
  Writing $bold(psi)(bold(z)) = sum_(abs(bold(k)) = d) bold(a)_(bold(k)) bold(z)^(bold(k))$ with coefficients $bold(a)_(bold(k)) in CC^m$, we compute
  $
    partial^(bold(alpha)) bold(psi)(bold(z)) = sum_(abs(bold(k)) = d) bold(a)_(bold(k)) product_(j=1)^n (k_j !) / ((k_j - alpha_j) !) z_j^(k_j - alpha_j), quad bold(k) = (k_1, dots, k_n),
  $
  where terms with $k_j < alpha_j$ vanish. For each remaining term, the total degree is
  $
    (k_1 - alpha_1) + dots.c + (k_n - alpha_n) = d - norm(bold(alpha)).
  $
  Hence, $partial^(bold(alpha)) bold(psi)$ is a homogeneous polynomial of degree $d - norm(bold(alpha))$, establishing @itm:homogeneouspolynomialderivatives_less.

  If $r = d$, every surviving monomial has degree $0$, so $partial^(bold(alpha)) bold(psi)$ is constant. Moreover, since $bold(psi)$ has degree exactly $d$, there exists some multi-index $bold(k)$ with $abs(bold(k)) = d$ and $bold(a)_(bold(k)) != bold(0)$; choosing $bold(alpha) = bold(k)$ yields a nonzero constant derivative. This proves @itm:homogeneouspolynomialderivatives_equality.

  Finally, if $r > d$, then for every term in the expansion, at least one $k_j < alpha_j$, so all summands vanish identically. Thus $partial^(bold(alpha)) bold(psi) equiv 0$, verifying @itm:homogeneouspolynomialderivatives_greater.
]

#lemma("Cartan")[
  Let $Omega subset CC^n$ be a bounded region, and suppose that $bold(f) = (f_1, dots, f_n) : Omega -> Omega$ is holomorphic. If $exists bold(a) in Omega$ such that $bold(f)(bold(a)) = bold(a)$ and the complex Jacobian at $bold(a)$ is the identity matrix, or equivalently, if
  $
    bold(J)_(bold(f))(bold(a)) = mat(
      pdv(f_1, z_1)(bold(a)), dots.c, pdv(f_1, z_n)(bold(a));
      dots.v, dots.down, dots.v;
      pdv(f_n, z_1)(bold(a)), dots.c, pdv(f_n, z_n)(bold(a))
    ) = bold(I) = mat(
      1, dots.c, 0;
      dots.v, dots.down, dots.v;
      0, dots.c, 1
    ),
  $ <eq:multivarcartan1_jacobian>
  then $bold(f)(bold(z)) equiv bold(z)$ is the identity map.
] <lem:multivarcartan1>

#proof[
  By @thm:taylorexpansionmultivariable, we have the expansion
  $
    bold(f)(bold(z)) & = sum_(abs(bold(k)) = 0)^oo bold(a)_(bold(k)) (bold(z) - bold(a))^(bold(k)) = sum_(j=0)^oo bold(psi)_j (bold(z) - bold(a)) \
    & = bold(a) + sum_(j=1)^oo sum_(abs(bold(k)) = j) bold(a)_(bold(k)) (bold(z) - bold(a))^(bold(k)),
  $ <eq:multivarcartan1_taylorseries>
  which is absolutely convergent on some polydisk centered at $bold(a)$, where $bold(a)_(bold(k)) = (partial^(bold(k)) bold(f)(bold(a))) / (product_(j=1)^n k_j !)$ and $bold(k) = (k_1, dots, k_n)$. The terms have been rearranged (from absolute convergence) so that the inner summation is a homogeneous polynomial $bold(psi)_j$ with a zero at $bold(z) = bold(a)$ and degree $j$.

  Trivially, $bold(a)_(1, 0, dots, 0) = pdv(bold(f), z_1)(bold(a)) = (1, 0, dots, 0)$ by @eq:multivarcartan1_jacobian. Similarly, $bold(a)_(0, 1, 0, dots, 0) = (0, 1, 0, dots, 0), dots, bold(a)_(0, dots, 0, 1) = (0, dots, 0, 1)$. Hence, the linear homogeneous polynomial of @eq:multivarcartan1_taylorseries equals
  $
    (z_1 - a_1, dots, z_n - a_n) = bold(z) - bold(a),
  $
  and the entire expansion is thus equal to
  $
    bold(f)(bold(z)) = bold(z) + sum_(j=2)^oo sum_(abs(bold(k)) = j) bold(a)_(bold(k)) (bold(z) - bold(a))^(bold(k)).
  $
  Define a sequence of holomorphic functions ${bold(f)_k (bold(z))}_(k in NN)$ by
  $
    bold(f)_1 = bold(f), quad bold(f)_(k+1) = bold(f)_k compose bold(f) quad forall k in NN.
  $
  Assume the existence of some $m in NN$, the smallest $j gt.eq 2$ such that $bold(psi)$ is not identically zero. Because
  $
    bold(f)_1 (z) = bold(z) + bold(psi)_m (bold(z) - bold(a)) + sum_(j > m) bold(psi)_j (bold(z) - bold(a)),
  $
  it then follows that
  $
    bold(f)_2 (bold(z))
    &= bold(z) + bold(psi)_m (bold(z) - bold(a)) + sum_(j > m) bold(psi)_j (bold(z) - bold(a)) \
    &quad""+ bold(psi)_m (bold(z) - bold(a) + sum_(j gt.eq m) bold(psi)_j (bold(z) - bold(a))) + sum_(j > m) bold(psi)_j (bold(f)(bold(z)) - bold(a)) \
    &= bold(z) + 2 bold(psi)_m (bold(z) - bold(a)) \
    &quad""+ ("homogeneous polynomials of degree" > m)(bold(z) - bold(a)).
  $
  Assume, for induction, that
  $
    bold(f)_k (bold(z)) & = bold(z) + k bold(psi)_m (bold(z) - bold(a)) \
                        & quad ""+ ("homogeneous polynomials of degree" > m)(bold(z) - bold(a)).
  $
  Then we have
  $
    bold(f)_(k+1) (bold(z))
    &= bold(z) + sum_(j gt.eq m) bold(psi)_j (bold(z) - bold(a)) \
    &quad"" + k bold(psi)_m (bold(z) - bold(a) + sum_(j gt.eq m) ("degree" j "hom. polynomial")(bold(z) - bold(a))) \
    &wide ""+ sum_(j > m) ("homogeneous polynomial of degree" j)(bold(f)(bold(z)) - bold(a)) \
    &= bold(z) + (k + 1) bold(psi)_m (bold(z) - bold(a))\
    &quad""+ ("degree" > m "homogeneous polynomials")(bold(z) - bold(a)).
  $
  Since $bold(f)_k (Omega) subset.eq Omega$ for any $k$, the sequence ${bold(f)_k}_(k in NN)$ is uniformly bounded on $Omega$. By Montel's Theorem (@thm:montelmultivar), there exists a subsequence ${bold(f)_(k_l)}_(l in NN)$ that converges locally uniformly to some holomorphic function $tilde(bold(f))$ by virtue of Weierstrass (@thm:weierstrassconvergencemultivar).

  Since $bold(psi)_m equiv.not 0$, there exists $bold(alpha)$ satisfying $norm(bold(alpha)) = m$ such that
  $
    partial^(bold(alpha)) bold(psi)_m equiv bold(c) != bold(0)
  $
  is a nonzero constant by @prop:homogeneouspolynomialderivatives. Consequently,
  $
    partial^(bold(alpha)) ("homogeneous polynomials of degree" > m)(bold(z) - bold(a))
  $
  is a homogeneous polynomial with degree $gt.eq 1$ and thus vanishes as $bold(z) -> bold(a)$. Similarly, $bold(z) |-> bold(z)$ is homogeneous with degree $1 < m$ and thus $partial^(bold(alpha)) z$ vanishes. Therefore,
  $
    partial^(bold(alpha)) bold(f)_k (bold(a)) = k bold(c),
  $
  which diverges as $k -> oo$. Weierstrass' Convergence Theorem (@thm:weierstrassconvergencemultivar) gives that $partial^(bold(alpha)) bold(f)_(k_l) (bold(a)) -> partial^(bold(alpha)) tilde(bold(f))(bold(a))$ which must be finite by holomorphy, contradicting the divergence. Hence, the assumed value for $m$ cannot exist and hence $bold(psi)_j equiv 0$ for all $j gt.eq 2$. Thus, $bold(f)(bold(z)) equiv bold(z)$ on some polydisk centered at $bold(a)$. By the Identity Theorem (@thm:identitymultivar), $bold(f)(bold(z)) equiv bold(z)$ on $Omega$.
]

#definition("Reinhardt Domain")[
  An open connected domain $Omega subset.eq CC^n$ is a _Reinhardt domain_ centered at $bold(a) = (a_1, dots, a_n) in CC^n$ iff $forall bold(zeta) = (zeta_1, dots, zeta_n) in Omega$,
  $
    {(z_1, dots, z_n) in CC^n : abs(z_k - a_k) = abs(zeta_k - a_k), 1 <= k <= n}
  $
  is fully contained in $Omega$. In other words, $Omega$ is invariant under all rotations about the center $bold(a)$ in each coordinate.
] <def:reinhardtdomain>

#definition[
  A Reinhardt domain $Omega subset.eq CC^n$ centered at $bold(a) = (a_1, dots, a_n)$ is said to be _complete_ iff $forall bold(zeta) = (zeta_1, dots, zeta_n) in Omega$, the polydisk
  $
    {(z_1, dots, z_n) in CC^n : abs(z_k - a_k) <= abs(zeta_k - a_k), 1 <= k <= n}
  $
  is contained in $Omega$.
] <def:completereinhardtdomain>

#definition("Circular Domain")[
  An open connected domain $Omega subset.eq CC^n$ is a _circular domain_ centered at $bold(a) in CC^n$ iff $forall bold(zeta) in Omega$,
  $
    {bold(a) + ee^(ii theta) (bold(zeta) - bold(a)) : 0 <= theta < 2 uppi}
  $
  is fully contained in $Omega$.
] <def:circulardomain>

#definition[
  A circular domain $Omega subset.eq CC^n$ centered at $bold(a) = (a_1, dots, a_n)$ is said to be _complete_ iff $forall bold(zeta) in Omega$,
  $
    {bold(a) + mu (bold(zeta) - bold(a)) : forall mu in overline(DD)}
  $
  is contained in $Omega$.
] <def:completecirculardomain>

#proposition[
  Let $U_0 subset.eq CC^(n_0), U_1 subset.eq CC^(n_1), U_2 subset.eq CC^(n_2)$ be open domains with $n_i gt.eq 1$ for each $i$, and let $bold(f) : U_1 -> U_2$ and $bold(g) : U_0 -> U_1$ be holomorphic maps. Define the composition $bold(h) : U_0 -> U_2$ by $bold(h)(bold(z)) = bold(f)(bold(g)(bold(z)))$. Then for every $bold(z) in U_0$, the complex Jacobian matrix of $bold(h)$ at $bold(z)$ is
  $
    bold(J)_(bold(h))(bold(z)) = bold(J)_(bold(f))(bold(g)(bold(z))) dot bold(J)_(bold(g))(bold(z)).
  $
] <prop:jacobianchainrule>

#proof[
  Fix $bold(z) in U_0$ and let $bold(w) = bold(g)(bold(z)) in U_1$. Write
  $
    bold(h)(bold(z)) = (h_1 (bold(z)), dots, h_(n_2) (bold(z))),
  $
  where each $h_l : U_0 -> CC$ is holomorphic for $l = 1, dots, n_2$. Similarly, write
  $
    bold(g)(bold(z)) = (g_1 (bold(z)), dots, g_(n_1) (bold(z))), quad bold(f)(bold(z)) = (f_1 (bold(z)), dots, f_(n_2) (bold(z))),
  $
  where each $g_p : U_0 -> CC$ and each $f_l : U_1 -> CC$ is holomorphic for $p = 1, dots, n_1$ and $l = 1, dots, n_2$. Then $h_l (bold(z)) = f_l (bold(g)(bold(z)))$ for each $l$. By the chain multivariable rule, the complex Jacobian of $bold(h)$ at $bold(z)$ is the $n_2 times n_0$ matrix
  $
    bold(J)_(bold(h)) & = mat(
                          pdv(h_1, z_1), dots, pdv(h_1, z_(n_0));
                          dots.v, dots.down, dots.v;
                          pdv(h_(n_2), z_1), dots, pdv(h_(n_2), z_(n_0))
                        ) \
                      & = mat(
                          sum_(p=1)^(n_1) pdv(f_1, g_p)(bold(g)) pdv(g_p, z_1), dots, sum_(p=1)^(n_1) pdv(f_1, g_p)(bold(g)) pdv(g_p, z_(n_0));
                          dots.v, dots.down, dots.v;
                          sum_(p=1)^(n_1) pdv(f_(n_2), g_p)(bold(g)) pdv(g_p, z_1), dots, sum_(p=1)^(n_1) pdv(f_(n_2), g_p)(bold(g)) pdv(g_p, z_(n_0))
                        ) \
                      & = mat(
                          pdv(f_1, g_1)(bold(g)), dots, pdv(f_1, g_(n_1))(bold(g));
                          dots.v, dots.down, dots.v;
                          pdv(f_(n_2), g_1)(bold(g)), dots, pdv(f_(n_2), g_(n_1))(bold(g))
                        )
                        mat(
                          pdv(g_1, z_1), dots, pdv(g_1, z_(n_0));
                          dots.v, dots.down, dots.v;
                          pdv(g_(n_1), z_1), dots, pdv(g_(n_1), z_(n_0))
                        )
                        = bold(J)_(bold(f))(bold(g)) dot bold(J)_(bold(g)). #qedhere
  $
]

#lemma("Cartan")[
  Let $Omega subset CC^n$ be a bounded complete circular domain centered at $bold(0)$, and suppose that $bold(f) = (f_1, dots, f_n) : Omega -> Omega$ is a biholomorphism. If $bold(f)(bold(0)) = bold(0)$, then $bold(f)$ is linear.
] <lem:multivarcartan2>

#proof[
  Let $bold(rho)_theta (bold(z)) = ee^(ii theta) bold(z)$ for all $theta in RR$ and suppose that $bold(phi) = bold(rho)_(-theta) compose bold(f)^(-1) compose bold(rho)_theta compose bold(f)$. By @prop:jacobianchainrule, we must have that
  $
    bold(J)_(bold(phi))(bold(z))
    &= bold(J)_(bold(rho)_(-theta))(bold(f)^(-1) compose bold(rho)_theta compose bold(f)(bold(z))) dot bold(J)_(bold(rho)_(-theta) compose bold(f)^(-1))(bold(rho)_theta compose bold(f)(bold(z))) \
    &quad""dot bold(J)_(bold(rho)_(-theta) compose bold(f)^(-1) compose bold(rho)_theta)(bold(f)(bold(z))) dot bold(J)_(bold(rho)_(-theta) compose bold(f)^(-1) compose bold(rho)_theta compose bold(f))(bold(z)) \
    bold(J)_(bold(phi))(bold(0))
    &= mat(
      ee^(-ii theta), dots, 0;
      dots.v, dots.down, dots.v;
      0, dots, ee^(-ii theta)
    ) dot bold(J)_(bold(f)^(-1))(bold(0)) dot mat(
      ee^(ii theta), dots, 0;
      dots.v, dots.down, dots.v;
      0, dots, ee^(ii theta)
    ) dot bold(J)_(bold(f))(bold(0)) \
    &= ee^(-ii theta) ee^(ii theta) (bold(J)_(bold(f)^(-1)) dot bold(J)_(bold(f)))(bold(0)) = bold(I).
  $
  By @lem:multivarcartan1, $bold(phi)(bold(z)) equiv bold(z)$ on $Omega$. Hence, $bold(f) compose bold(rho)_theta = bold(rho)_theta compose bold(f)$ for all $theta in RR$. Together with @thm:taylorexpansionmultivariable, write
  $
    bold(f)(bold(z)) = sum_(bold(k) : abs(bold(k)) = 0)^oo bold(a)_(bold(k)) bold(z)^(bold(k))
  $ <eq:multivarcartan2_taylorseries>
  on a polydisk centered at $bold(0)$. Thus,
  $
    bold(f) compose bold(rho)(bold(z)) = sum_(bold(k) : abs(bold(k)) = 0)^oo bold(a)_(bold(k)) (ee^(ii theta) bold(z))^(bold(k)) = sum_(bold(k) : abs(bold(k)) = 0)^oo bold(a)_(bold(k)) ee^(ii theta abs(bold(k))) bold(z)^(bold(k)).
  $
  On the other hand, composing with $bold(rho)_theta$ with @eq:multivarcartan2_taylorseries gives
  $
    bold(rho)_theta compose bold(f)(bold(z)) = ee^(ii theta) sum_(bold(k) : abs(bold(k)) = 0)^oo bold(a)_(bold(k)) bold(z)^(bold(k)) = sum_(bold(k) : abs(bold(k)) = 0)^oo bold(a)_(bold(k)) ee^(ii theta) bold(z)^(bold(k)).
  $
  Hence, by the uniqueness of power series expansions, we must either have that $bold(a)_(bold(k)) = bold(0)$, $ee^(ii theta) equiv ee^(ii theta abs(bold(k)))$, or equivalently, that $forall theta in RR$,
  $
    theta abs(bold(k)) equiv theta mod 2 uppi ==> abs(bold(k)) equiv 1 mod 2 uppi #[(by letting $theta = 1$)].
  $
  This is only possible when $abs(bold(k)) = 1$ by irrationality, and thus $bold(a)_(bold(k)) = bold(0)$ for all $abs(bold(k)) != 1$. Therefore, $bold(f)$ must be linear.
]

#remark[
  If $n = 1$, then $Omega = D(0, R)$ for some $R > 0$ and any automorphism $f$ with a fixed point $0$ is a rotation in the form of $z |-> ee^(ii theta) z$, hence linear, the effective statement of the Schwarz Lemma (@lem:schwarz).
]

#theorem[The Holomorphic Automorphism Group on $DD^n$][
  The holomorphic automorphism group of the polydisk $DD^n$ consists solely of biholomorphisms in the form of
  $
    bold(z) = (z_1, dots, z_n) |-> bold(P)(ee^(ii theta_1) (z_1 - a_1) / (1 - overline(a_1) z_1), dots, ee^(ii theta_n) (z_n - a_n) / (1 - overline(a_n) z_n)),
  $ <eq:holomorphicautomorphismgrouponpolydisk_statement>
  where $bold(P)$ is a $n times n$ permutation matrix (for coordinate permutations), $(theta_1, dots, theta_n) in RR^n$, and $(a_1, dots, a_n) in DD^n$. Moreover, every such map is indeed an automorphism.
] <thm:holomorphicautomorphismgrouponpolydisk>

#proof[
  Let $bold(f) in Aut(DD^n)$ be arbitrary, and set $bold(alpha) = (alpha_1, dots, alpha_n) = bold(f)(bold(0))$. Define the Möbius transformation $bold(phi)(z_1, dots, z_n) = ((z_1 - alpha_1) / (1 - overline(alpha_1) z_1), dots, (z_n - alpha_n) / (1 - overline(alpha_n) z_n)) in Aut(DD^n)$. It follows that $bold(phi) compose bold(f)(bold(0)) = bold(0)$ and $bold(phi) compose bold(f) in Aut(DD^n)$.

  By @lem:multivarcartan2, the map $bold(phi) compose bold(f)$ is linear, so $bold(phi) compose bold(f)(bold(z)) = bold(A) bold(z)$ for some invertible constant matrix $bold(A) = mat(zeta_(1,1), dots, zeta_(1,n); dots.v, dots.down, dots.v; zeta_(n,1), dots, zeta_(n,n))$, hence $bold(A) in Aut(DD^n)$. Thus,
  $
    abs(sum_(j=1)^n zeta_(k,j) z_j) < 1 quad forall bold(z) in DD^n, forall k in {1, dots, n},
  $
  which implies $abs(zeta_(k,j)) <= 1$ for all $j, k in {1, dots, n}$ (for if $abs(zeta_(k,j)) > 1$, then choosing $z_j = 1 / abs(zeta_(k,j)) + epsilon$ with $0 < epsilon < 1 - 1 / abs(zeta_(k,j))$ and $z_l = 0$ for $l != j$ yields a contradiction).

  For each $j in {1, dots, n}$, define the sequence ${bold(z)_(j,k)}_(k in NN)$ for each $k in NN$ by
  $
    bold(z)_(j,k) = (z_(j,k,1), dots, z_(j,k,n)) = ((1 - 1 / k) abs(zeta_(j,1)) / zeta_(j,1), dots, (1 - 1 / k) abs(zeta_(j,n)) / zeta_(j,n)) in DD^n,
  $
  where we informally let $abs(zeta_(j,i)) / zeta_(j,i) = 0$ if $zeta_(j,i) = 0$. Then, for all $j in {1, dots, n}$ and $k in NN$,
  $
    bold(phi) compose bold(f)(bold(z)_(j,k)) = (1 - 1 / k)mat(display(sum_(i=1)^n (abs(zeta_(j,i)) / zeta_(j,i)) zeta_(1,i)); dots.v; display(sum_(i=1)^n (abs(zeta_(j,i)) / zeta_(j,i)) zeta_(j,i)); dots.v; display(sum_(i=1)^n (abs(zeta_(j,i)) / zeta_(j,i)) zeta_(n,i))) in DD^n.
  $
  In particular, the $j$-th component is
  $
    (1 - 1 / k) sum_(i=1)^n abs(zeta_(j,i)) in DD.
  $
  As $k -> oo$,
  $
    sum_(i=1)^n abs(zeta_(j,i)) <= 1 wide forall j in {1, dots, n}.
  $ <eq:holomorphicautomorphismgrouponpolydisk_absolutesumestimate>
  Now consider, for each $j in {1, dots, n}$, the sequence $bold(z)'_(j,k) = (0, dots, 0, 1 - 1 / k, 0, dots, 0)$, where $1 - 1 / k$ is in the $j$-th position. Then
  $
    bold(phi) compose bold(f)(bold(z)'_(j,k)) = (1 - 1 / k)(zeta_(1,j), dots, zeta_(n,j)).
  $
  As $k -> oo$, $bold(z)'_(j,k) -> bold(e)_j in partial(DD^n)$ (the $j$-th unit basis vector), so the limit is
  $
    bold(zeta)_j = (zeta_(1,j), dots, zeta_(n,j)) in overline(DD^n) .
  $
  Because the function $bold(A)$ is injective on all of $CC^n$, if $bold(zeta)_j in DD^n$ (within the interior), then $bold(A)^(-1) in Aut(DD^n)$ would map $bold(zeta)_j$ to $bold(e)_j in partial(DD^n)$, which is an impossibility. Hence, $bold(zeta)_j in partial(DD^n)$, and consequently, $max_(i in {1, dots, n}) abs(zeta_(i,j)) = 1$. Combined with @eq:holomorphicautomorphismgrouponpolydisk_absolutesumestimate, this forces exactly one entry in the $j$-th column of $bold(A)$ to have absolute value $1$ (of the form $ee^(ii theta_j)$), with all others zero.

  Invertibility of $bold(A)$ ensures each column has at least one nonzero entry, so $bold(A)$ is a monomial matrix, which factors to
  $
    bold(A) = bold(P) op("diag")(ee^(ii theta_1), dots, ee^(ii theta_n))
  $
  for some permutation matrix $bold(P)$. Therefore,
  $
    bold(f)(bold(z)) = bold(phi)^(-1) compose (bold(P) op("diag")(ee^(ii theta_1), dots, ee^(ii theta_n)) bold(z)).
  $
  Let $sigma : NN_(<= n) -> NN_(<= n)$ be the permutation induced by $bold(P)$. The map $bold(A)$ multiplies the $m$-th input coordinate $z_m$ by $ee^(ii theta_m)$ and permutes to place it in the $sigma(m)$-th output position, so the $sigma(m)$-th coordinate of $bold(A) bold(z)$ is $ee^(ii theta_m) z_m$. Applying $bold(phi)^(-1)$ componentwise then gives, for the $k$-th output coordinate,
  $
    (bold(f)(bold(z)))_k = phi_(alpha_k)^(-1) (ee^(ii theta_(sigma^(-1)(k))) z_(sigma^(-1)(k))) = (ee^(ii theta_(sigma^(-1)(k))) z_(sigma^(-1)(k)) + alpha_k) / (1 + overline(alpha_k) ee^(ii theta_(sigma^(-1)(k))) z_(sigma^(-1)(k))).
  $
  Set $a_(sigma^(-1)(k)) = -alpha_k ee^(-ii theta_(sigma^(-1)(k))) in DD$. Then
  $
    (bold(f)(bold(z)))_k = (ee^(ii theta_(sigma^(-1)(k))) z_(sigma^(-1)(k)) + alpha_k) / (1 + overline(alpha_k) ee^(ii theta_(sigma^(-1)(k))) z_(sigma^(-1)(k))) = ee^(ii theta_(sigma^(-1)(k))) (z_(sigma^(-1)(k)) - a_(sigma^(-1)(k))) / (1 - overline(a_(sigma^(-1)(k))) z_(sigma^(-1)(k))).
  $
  Hence,
  $
    (bold(f)(bold(z)))_(sigma(k)) = ee^(ii theta_k) (z_k - a_k) / (1 - overline(a_k) z_k) <==> bold(f)(bold(z)) = bold(P)(ee^(ii theta_1) (z_1 - a_1) / (1 - overline(a_1) z_1), dots, ee^(ii theta_n) (z_n - a_n) / (1 - overline(a_n) z_n)),
  $
  as in @eq:holomorphicautomorphismgrouponpolydisk_statement. Finally, each automorphism of this form lies in $Aut(DD^n)$ trivially.
]

#definition[
  The _conjugate transpose_ or _Hermitian transpose_ of a complex matrix $bold(U)$ is defined as $bold(U)^dagger = overline(bold(U))^top$, or the transpose of the matrix with each element replaced with its complex conjugate.
]

#definition[
  A matrix $bold(U)$ is said to be _unitary_ iff its inverse is its conjugate transpose, or iff $bold(U)^dagger bold(U) = bold(U) bold(U)^dagger = bold(I)$.
]

#definition[
  A matrix $bold(M)$ is said to be _monomial_ iff it has exactly one nonzero entry in each row and each column.
]

#theorem("Spectral Theorem")[
  For any unitary matrix $bold(U)$, there exists a unitary matrix $bold(V)$ such that $bold(U) = bold(V) bold(D) bold(V)^dagger$, where $bold(D)$ is a diagonal matrix whose diagonal entries are all of unit modulus.
] <thm:unitaryspectraltheorem>

#proof[
  Because $norm(bold(U) bold(z))^2 = bold(z)^dagger bold(U)^dagger bold(U) bold(z) = norm(bold(z))^2$ for any $bold(z) in CC^n$, any eigenvalue $lambda_1$ (existence given by the Fundamental Theorem of Algebra in @thm:fundamentaltheoremofalgebra on the characteristic equation) of $bold(U)$ must satisfy
  $
    bold(U) bold(v)_1 = lambda_1 bold(v)_1 ==> norm(bold(U) bold(v)_1) = norm(bold(v)_1) = abs(lambda_1) norm(bold(v)_1) ==> abs(lambda_1) = 1,
  $
  where $norm(bold(v)_1) = 1$ is the corresponding eigenvector in $CC^n$. Then
  $
    bold(U)^(-1) bold(U) bold(v)_1 = bold(U)^(-1) lambda_1 bold(v)_1 ==> 1 / (lambda_1) bold(v)_1 = bold(U)^(-1) bold(v)_1 ==> overline(lambda_1) bold(v)_1 = bold(U)^dagger bold(v)_1.
  $
  Let $bold(v)_1^perp = {bold(w) : bold(v)_1^dagger bold(w) = bold(0)} subset CC^n$ be an $(n - 1)$-dimensional subspace. For any $bold(w) in bold(v)_1^perp$,
  $
    bold(v)_1^dagger bold(U) bold(w) = (bold(U)^dagger bold(v)_1)^dagger bold(w) = (overline(lambda_1) bold(v)_1)^dagger bold(w) = lambda_1 bold(v)_1^dagger bold(w) = 0,
  $
  so $bold(U) bold(w) in bold(v)_1^perp$. Hence $bold(v)_1^perp$ is invariant under $bold(U)$. The restriction of $bold(U)$ to $bold(v)_1^perp$, $bold(U)|_(bold(v)_1^perp)$, yields another eigenvalue $lambda_2 in partial DD$ with eigenvector $bold(v)_2 in bold(v)_1^perp$ satisfying $abs(lambda_2) = 1$ and $norm(bold(v)_2) = 1$. Similarly, we may define $bold(v)_2^perp subset bold(v)_1^perp$, which is an $(n - 2)$-dimensional subspace invariant under $bold(U)$. Repeating this process inductively, we obtain an orthonormal basis ${bold(v)_1, dots, bold(v)_n}$ of eigenvectors of $bold(U)$ with corresponding eigenvalues $lambda_1, dots, lambda_n in partial DD$. Setting
  $
    bold(V) = mat(bold(v)_1, dots.c, bold(v)_n), quad bold(D) = op("diag")(lambda_1, dots.c, lambda_n)
  $
  gives that
  $
    bold(V)^dagger bold(U) bold(V) = bold(V)^dagger mat(bold(U) bold(v)_1, dots.c, bold(U) bold(v)_n) = bold(V)^dagger mat(lambda_1 bold(v)_1, dots.c, lambda_n bold(v)_n) = bold(V)^dagger bold(V) bold(D).
  $
  The $k$-th diagonal entry of $bold(V)^dagger bold(V)$ is equal to $bold(v)_k^dagger bold(v)_k = norm(bold(v)_k)^2 = 1$, while the non-diagonal entries correspond to $bold(v)_k^dagger bold(v)_l$ for some $k != l$, which vanish by orthogonality in construction. Thus, $bold(V)^dagger bold(V) = bold(I)$ (unitary) and $bold(V) bold(D) bold(V)^dagger = bold(U)$.
]

A _unitary transformation_ is a map in the form of $bold(z) |-> bold(U) bold(z)$, where $bold(U)$ is a unitary matrix.

#proposition[
  For any $a in DD$,
  $
    bold(w) &= (w_1, dots, w_n) = bold(phi)_a (bold(z)) \
    &=((z_1 - a) / (1 - overline(a) z_1), z_2 (sqrt(1 - abs(a)^2)) / (1 - overline(a) z_1), z_3 (sqrt(1 - abs(a)^2)) / (1 - overline(a) z_1), dots, z_n (sqrt(1 - abs(a)^2)) / (1 - overline(a) z_1))
  $ <eq:unitballsimpleautomorphism_statement>
  lies in $Aut(B^n)$, where $bold(z) = (z_1, dots, z_n)$. Moreover, $bold(phi)_a^(-1) = bold(phi)_(-a)$.
] <prop:unitballsimpleautomorphism>

#proof[
  For $bold(z) = (z_1, dots, z_n) in B^n$, because $sum_(k=2)^n abs(z_k)^2 < 1 - abs(z_1)^2$,
  $
    norm(bold(phi)_a (bold(z)))^2
    &= 1 / abs(1 - overline(a) z_1)^2 [abs(z_1 - a)^2 + sum_(k=2)^n (1 - abs(a)^2) abs(z_k)^2] \
    &< 1 / ((1 - overline(a) z_1)(1 - a overline(z_1))) [(z_1 - a)(overline(z_1) - overline(a)) + (1 - abs(z_1)^2)(1 - abs(a)^2)] \
    &= (abs(z_1)^2 + abs(a)^2 - 2 Re(overline(a) z_1) + 1 + abs(a z_1)^2 - abs(a)^2 - abs(z_1)^2) / (1 + abs(a z_1)^2 - 2 Re(overline(a) z_1)) = 1.
  $
  Hence, $bold(phi)_a$ maps $B^n$ to $B^n$. A simple calculation shows that
  $
    w_1 = (z_1 - a) / (1 - overline(a) z_1) ==> z_1 = (w_1 + a) / (1 + overline(a) w_1), quad z_k = w_k (1 - overline(a) z_1) / (sqrt(1 - abs(a)^2)) = w_k (sqrt(1 - abs(a)^2)) / (1 + overline(a) w_1),
  $
  and hence $bold(phi)_a$ is bijective, admitting the inverse $bold(phi)_(-a)$. Therefore, $bold(phi)_a in Aut(B^n)$.
]

#proposition[
  A function $bold(f)$ is a unitary transformation iff $bold(f) in Aut(B^n)$ and $bold(f)(bold(0)) = bold(0)$.
] <prop:unitballautomorphismfixedpointatzero>

#proof[
  Because $B^n$ is a bounded complete circular domain centered at $bold(0)$, from @lem:multivarcartan2 we have that $bold(f) equiv bold(U)$ for some constant invertible matrix
  $
    bold(U) = mat(zeta_(1,1), dots.c, zeta_(1,n); dots.v, dots.down, dots.v; zeta_(n,1), dots.c, zeta_(n,n)).
  $
  Similarly, we have $bold(f)^(-1) = bold(U)^(-1)$, so $norm(bold(z)) = norm(bold(U)^(-1) bold(U) bold(z))$. Observe that
  $
    norm(1 / (norm(bold(z))) bold(f)(bold(z))) = norm(bold(f)((bold(z)) / (norm(bold(z))))) = 1 ==> norm(bold(U) bold(z))^2 = norm(bold(z))^2.
  $
  More explicitly, we have
  $
    bold(U) bold(z) = (sum_(k=1)^n zeta_(1,k) z_k, dots, sum_(k=1)^n zeta_(n,k) z_k) ==> norm(bold(U) bold(z))^2 = sum_(j=1)^n abs(sum_(k=1)^n zeta_(j,k) z_k)^2.
  $
  Letting $bold(z) = bold(e)_i$ ($1 <= i <= n$) be the $i$-th unit basis vector, we obtain
  $
    norm(bold(U) bold(z)) = 1 = norm((zeta_(1,i), dots, zeta_(n,i)))^2 = sum_(k=1)^n abs(zeta_(k,i))^2 = sum_(k=1)^n zeta_(k,i) overline(zeta_(k,i)).
  $ <eq:unitballautomorphismfixedpointatzero_diagonalentries>
  Letting $bold(z) = (sqrt(2)) / (2) (bold(e)_i + bold(e)_j)$ ($i != j$), we have
  $
    norm(bold(U) bold(z)) = 1
    &= 1 / (2) norm((zeta_(1,i) + zeta_(1,j), dots, zeta_(n,i) + zeta_(n,j)))^2 = 1 / (2) sum_(k=1)^n abs(zeta_(k,i) + zeta_(k,j))^2 \
    &= 1 / (2) sum_(k=1)^n (abs(zeta_(k,i)^2) + abs(zeta_(k,j)^2) + 2 Re(zeta_(k,i) overline(zeta_(k,j)))) = 1 + sum_(k=1)^n Re(zeta_(k,i) overline(zeta_(k,j))),
  $
  which implies that $sum_(k=1)^n Re(zeta_(k,i) overline(zeta_(k,j))) = 0$. Similarly, letting $bold(z) = (sqrt(2)) / (2) (bold(e)_i + ii bold(e)_j)$ gives
  $
    norm(bold(U) bold(z)) = 1
    &= 1 / (2) norm((zeta_(1,i) + ii zeta_(1,j), dots, zeta_(n,i) + ii zeta_(n,j)))^2 = 1 / (2) sum_(k=1)^n abs(zeta_(k,i) + ii zeta_(k,j))^2 \
    &= 1 / (2) sum_(k=1)^n (abs(zeta_(k,i)^2) + abs(zeta_(k,j)^2) + 2 Im(zeta_(k,i) overline(zeta_(k,j)))) = 1 + sum_(k=1)^n Im(zeta_(k,i) overline(zeta_(k,j))),
  $
  which implies that $sum_(k=1)^n Im(zeta_(k,i) overline(zeta_(k,j))) = 0$. Therefore, by @eq:unitballautomorphismfixedpointatzero_diagonalentries, for all $i, j in {1, dots, n}$, observe that
  $
    (bold(U)^dagger bold(U))_(j,i) = sum_(k=1)^n zeta_(k,i) overline(zeta_(k,j)) = delta_(j,i),
  $
  where $delta_(j,i)$ is the Kronecker delta. Hence, we have $bold(U)^dagger bold(U) = bold(I)$, and thus $bold(U)$ is unitary.

  Conversely, if $bold(f)(bold(z)) = bold(U) bold(z)$ for some unitary matrix $bold(U)$, then for any $bold(z) in B^n$,
  $
    norm(bold(f)(bold(z)))^2 = norm(bold(U) bold(z))^2 = bold(z)^dagger bold(U)^dagger bold(U) bold(z) = bold(z)^dagger bold(z) = norm(bold(z))^2,
  $
  so $bold(f)$ maps $B^n$ to $B^n$. Since $bold(U)$ is invertible with unitary inverse $bold(U)^dagger$, the map $bold(f)$ is bijective with inverse $bold(f)^(-1)(bold(w)) = bold(U)^dagger bold(w)$, which also maps $B^n$ to $B^n$. Therefore, $bold(f) in Aut(B^n)$ and $bold(f)(bold(0)) = bold(0)$.
]

#definition[
  A group $G$ (under juxtaposition) is said to be _divisible_ iff for every $g in G$ and every positive integer $n$, there exists some $h in G$ such that $h^n = g$.
]

#proposition[
  The divisibility of a group is preserved under group isomorphisms.
] <prop:groupdivisibilitypreservedunderisomorphisms>

#proof[
  Let $phi : G -> H$ be a group isomorphism between groups $G$ and $H$ with juxtaposition.

  Assume $G$ is divisible. Fix $y in H$ and a positive integer $n$. Since $phi$ is bijective there is $x in G$ with $phi(x) = y$. By divisibility of $G$ there exists $h in G$ with $h^n = x$. Applying $phi$ and using the homomorphism property gives
  $
    phi(h)^n = phi(h^n) = phi(x) = y.
  $
  Thus every element of $H$ has an $n$-th root, so $H$ is divisible.

  Conversely, if $H$ is divisible then the same argument applied to $phi^(-1) : H -> G$ shows $G$ is divisible. Therefore divisibility is preserved under group isomorphisms.
]

#theorem[The Holomorphic Automorphism Group on $B^n$][
  The holomorphic automorphism group $Aut(B^n)$ consists solely of biholomorphisms in the form of
  $
    bold(z) |-> bold(U)^(-1) bold(phi)_a compose bold(V) bold(z),
  $ <eq:holomorphicautomorphismgrouponunitball_statement>
  where $bold(U), bold(V)$ are unitary matrices, $a in DD$, and $bold(phi)_a$ is defined as in @eq:unitballsimpleautomorphism_statement (and every such function lies in $Aut(B^n)$).
] <thm:holomorphicautomorphismgrouponunitball>

#proof[
  Let $bold(f) in Aut(B^n)$ be arbitrary, and set $bold(alpha) = bold(f)(bold(0))$. Then there exists a unitary matrix $bold(U)$ such that $bold(U) bold(alpha) = (norm(bold(alpha)), 0, dots, 0)$.

  Now let $bold(phi)_(norm(bold(alpha)))$ be as in @prop:unitballsimpleautomorphism, mapping $(norm(bold(alpha)), 0, dots, 0)$ to $bold(0)$. Then, the map $bold(phi)_(norm(bold(alpha))) compose bold(U) bold(f) in Aut(B^n)$ fixes $bold(0)$, so by @prop:unitballautomorphismfixedpointatzero it is a unitary transformation, say $bold(V)$. Therefore,
  $
    bold(phi)_(norm(bold(alpha))) compose bold(U) bold(f) equiv bold(V) ==> bold(f)(bold(z)) equiv bold(U)^(-1) bold(phi)_(norm(bold(alpha)))^(-1) compose bold(V) bold(z).
  $
  The converse is trivial.
]
