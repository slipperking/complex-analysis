#import "/lib.typ": *

== The Group of Holomorphic Automorphisms on $DD^n$ and $B^n$
A function $Vb(f) : Omega subset.eq CC^m -> CC^n$ is called _holomorphic_ iff each of its component functions is holomorphic. It is important to allow for vector-valued outputs, since we are interested in automorphisms on complex domains in higher dimensions.

For the aforesaid purpose, we require a generalization of the Schwarz Lemma (@lem:schwarz), which is equivalent to several results of Cartan.

In preparation, we will introduce several relevant concepts.

#definition("Multi-Index Notation")[
  A _multi-index_ is an $n$-tuple of nonnegative integers $Vb(k) = (k_1, dots, k_n) in ZZ_(gt.eq 0)^n$.
  We define
  $
    abs(Vb(k)) = sum_(j=1)^n k_j, quad
    Vb(z)^(Vb(k)) = product_(j=1)^n z_j^(k_j), quad
    partial^(Vb(k)) = (partial^(abs(Vb(k)))) / (partial z_1^(k_1) dots.c partial z_n^(k_n)) = product_(j=1)^n pdv(, z_j, [k_j]),
  $
  where $Vb(z) = (z_1, dots, z_n) in CC^n.$
] <def:multiindex>

#definition[
  A polynomial $Vb(psi) : CC^n -> CC^m$ of several variables is said to be _homogeneous of degree $d$_ iff
  $
    Vb(psi)(lambda Vb(z)) = lambda^d Vb(psi)(Vb(z)) quad forall lambda in CC, Vb(z) in CC^n,
  $
  or equivalently, iff $Vb(psi)$ can be written as
  $
    Vb(psi)(Vb(z)) = sum_(abs(Vb(k)) = d) Vb(a)_(Vb(k)) Vb(z)^(Vb(k))
  $
  where $Vb(k) in ZZ_(gt.eq 0)^n$ is a multi-index.
] <def:homogeneouspolynomial>

#proposition[
  Let $Vb(psi) : CC^n -> CC^m$ be a homogeneous polynomial of degree $d$.
  + For any multi-index $Vb(alpha) = (alpha_1, dots, alpha_n)$ with $abs(Vb(alpha)) = r <= d$,
    $
      partial^(Vb(alpha)) Vb(psi)(Vb(z)) = (partial^r Vb(psi)) / (partial z_1^(alpha_1) dots.c partial z_n^(alpha_n))(Vb(z))
    $
    is a homogeneous polynomial of degree $d-r$. <itm:homogeneouspolynomialderivatives_less>
  + If $r = d != 0$, then $partial^(Vb(alpha)) Vb(psi)$ is constant (and there exists a multi-index $Vb(alpha)$ with $abs(Vb(alpha)) = d$ such that $partial^(Vb(alpha)) Vb(psi)$ is nonzero). <itm:homogeneouspolynomialderivatives_equality>
  + If $r > d$, then $partial^(Vb(alpha)) Vb(psi) equiv 0$. <itm:homogeneouspolynomialderivatives_greater>
] <prop:homogeneouspolynomialderivatives>

#proof[
  Writing $Vb(psi)(Vb(z)) = sum_(abs(Vb(k)) = d) Vb(a)_(Vb(k)) Vb(z)^(Vb(k))$ with coefficients $Vb(a)_(Vb(k)) in CC^m$, we compute
  $
    partial^(Vb(alpha)) Vb(psi)(Vb(z)) = sum_(abs(Vb(k)) = d) Vb(a)_(Vb(k)) product_(j=1)^n (k_j !) / ((k_j - alpha_j) !) z_j^(k_j - alpha_j), quad Vb(k) = (k_1, dots, k_n),
  $
  where terms with $k_j < alpha_j$ vanish. For each remaining term, the total degree is
  $
    (k_1 - alpha_1) + dots + (k_n - alpha_n) = d - abs(Vb(alpha)).
  $
  Hence, $partial^(Vb(alpha)) Vb(psi)$ is a homogeneous polynomial of degree $d - abs(Vb(alpha))$, establishing @itm:homogeneouspolynomialderivatives_less.

  If $r = d$, every surviving monomial has degree $0$, so $partial^(Vb(alpha)) Vb(psi)$ is constant. Moreover, since $Vb(psi)$ has degree exactly $d$, there exists some multi-index $Vb(k)$ with $abs(Vb(k)) = d$ and $Vb(a)_(Vb(k)) != Vb(0)$; choosing $Vb(alpha) = Vb(k)$ yields a nonzero constant derivative. This proves @itm:homogeneouspolynomialderivatives_equality.

  Finally, if $r > d$, then for every term in the expansion, at least one $k_j < alpha_j$, so all summands vanish identically. Thus $partial^(Vb(alpha)) Vb(psi) equiv 0$, verifying @itm:homogeneouspolynomialderivatives_greater.
]

#lemma("Cartan")[
  Let $Omega subset CC^n$ be a bounded region, and suppose that $Vb(f) = (f_1, dots, f_n) : Omega -> Omega$ is holomorphic. If $exists Vb(a) in Omega$ such that $Vb(f)(Vb(a)) = Vb(a)$ and the complex Jacobian at $Vb(a)$ is the identity matrix, or equivalently, if
  $
    Vb(J)_(Vb(f))(Vb(a)) = mat(
      pdv(f_1, z_1)(Vb(a)), dots.c, pdv(f_1, z_n)(Vb(a));
      dots.v, dots.down, dots.v;
      pdv(f_n, z_1)(Vb(a)), dots.c, pdv(f_n, z_n)(Vb(a))
    ) = Vb(I) = mat(
      1, dots.c, 0;
      dots.v, dots.down, dots.v;
      0, dots.c, 1
    ),
  $ <eq:multivarcartan1_jacobian>
  then $Vb(f)(Vb(z)) equiv Vb(z)$ is the identity map.
] <lem:multivarcartan1>

#proof[
  By @thm:taylorexpansionmultivariable, we have the expansion
  $
    Vb(f)(Vb(z)) & = sum_(abs(Vb(k)) = 0)^oo Vb(a)_(Vb(k)) (Vb(z) - Vb(a))^(Vb(k)) = sum_(j=0)^oo Vb(psi)_j (Vb(z) - Vb(a)) \
                 & = Vb(a) + sum_(j=1)^oo sum_(abs(Vb(k)) = j) Vb(a)_(Vb(k)) (Vb(z) - Vb(a))^(Vb(k)),
  $ <eq:multivarcartan1_taylorseries>
  which is absolutely convergent on some polydisk centered at $Vb(a)$, where $Vb(a)_(Vb(k)) = (partial^(Vb(k)) Vb(f)(Vb(a))) / (product_(j=1)^n k_j !)$ and $Vb(k) = (k_1, dots, k_n)$. The terms have been rearranged (from absolute convergence) so that the inner summation is a homogeneous polynomial $Vb(psi)_j$ with a zero at $Vb(z) = Vb(a)$ and degree $j$.

  Trivially, $Vb(a)_(1, 0, dots, 0) = pdv(Vb(f), z_1)(Vb(a)) = (1, 0, dots, 0)$ by @eq:multivarcartan1_jacobian. Similarly, $Vb(a)_(0, 1, 0, dots, 0) = (0, 1, 0, dots, 0), dots, Vb(a)_(0, dots, 0, 1) = (0, dots, 0, 1)$. Hence, the linear homogeneous polynomial of @eq:multivarcartan1_taylorseries equals
  $
    (z_1 - a_1, dots, z_n - a_n) = Vb(z) - Vb(a),
  $
  and the entire expansion is thus equal to
  $
    Vb(f)(Vb(z)) = Vb(z) + sum_(j=2)^oo sum_(abs(Vb(k)) = j) Vb(a)_(Vb(k)) (Vb(z) - Vb(a))^(Vb(k)).
  $
  Define a sequence of holomorphic functions ${Vb(f)_k (Vb(z))}_(k in NN)$ by
  $
    Vb(f)_1 = Vb(f), quad Vb(f)_(k+1) = Vb(f)_k compose Vb(f) quad forall k in NN.
  $
  Assume the existence of some $m in NN$, the smallest $j gt.eq 2$ such that $Vb(psi)$ is not identically zero. Because
  $
    Vb(f)_1 (z) = Vb(z) + Vb(psi)_m (Vb(z) - Vb(a)) + sum_(j > m) Vb(psi)_j (Vb(z) - Vb(a)),
  $
  it then follows that
  $
    Vb(f)_2 (Vb(z))
    &= Vb(z) + Vb(psi)_m (Vb(z) - Vb(a)) + sum_(j > m) Vb(psi)_j (Vb(z) - Vb(a)) \
    &quad""+ Vb(psi)_m (Vb(z) - Vb(a) + sum_(j gt.eq m) Vb(psi)_j (Vb(z) - Vb(a))) + sum_(j > m) Vb(psi)_j (Vb(f)(Vb(z)) - Vb(a)) \
    &= Vb(z) + 2 Vb(psi)_m (Vb(z) - Vb(a)) \
    &quad""+ ("homogeneous polynomials of degree" > m)(Vb(z) - Vb(a)).
  $
  Assume, for induction, that
  $
    Vb(f)_k (Vb(z)) & = Vb(z) + k Vb(psi)_m (Vb(z) - Vb(a)) \
                    & quad ""+ ("homogeneous polynomials of degree" > m)(Vb(z) - Vb(a)).
  $
  Then we have
  $
    Vb(f)_(k+1) (Vb(z))
    &= Vb(z) + sum_(j gt.eq m) Vb(psi)_j (Vb(z) - Vb(a)) \
    &quad"" + k Vb(psi)_m (Vb(z) - Vb(a) + sum_(j gt.eq m) ("degree" j "hom. polynomial")(Vb(z) - Vb(a))) \
    &wide ""+ sum_(j > m) ("homogeneous polynomial of degree" j)(Vb(f)(Vb(z)) - Vb(a)) \
    &= Vb(z) + (k + 1) Vb(psi)_m (Vb(z) - Vb(a))\
    &quad""+ ("degree" > m "homogeneous polynomials")(Vb(z) - Vb(a)).
  $
  Since $Vb(f)_k (Omega) subset.eq Omega$ for any $k$, the sequence ${Vb(f)_k}_(k in NN)$ is uniformly bounded on $Omega$. By Montel's Theorem (@thm:montelmultivar), there exists a subsequence ${Vb(f)_(k_l)}_(l in NN)$ that converges locally uniformly to some holomorphic function $tilde(Vb(f))$ by virtue of Weierstrass (@thm:weierstrassconvergencemultivar).

  Since $Vb(psi)_m equiv.not 0$, there exists $Vb(alpha)$ satisfying $abs(Vb(alpha)) = m$ such that
  $
    partial^(Vb(alpha)) Vb(psi)_m equiv Vb(c) != Vb(0)
  $
  is a nonzero constant by @prop:homogeneouspolynomialderivatives. Consequently,
  $
    partial^(Vb(alpha)) ("homogeneous polynomials of degree" > m)(Vb(z) - Vb(a))
  $
  is a homogeneous polynomial with degree $gt.eq 1$ and thus vanishes as $Vb(z) -> Vb(a)$. Similarly, $Vb(z) |-> Vb(z)$ is homogeneous with degree $1 < m$ and thus $partial^(Vb(alpha)) z$ vanishes. Therefore,
  $
    partial^(Vb(alpha)) Vb(f)_k (Vb(a)) = k Vb(c),
  $
  which diverges as $k -> oo$. Weierstrass' Convergence Theorem (@thm:weierstrassconvergencemultivar) gives that $partial^(Vb(alpha)) Vb(f)_(k_l) (Vb(a)) -> partial^(Vb(alpha)) tilde(Vb(f))(Vb(a))$ which must be finite by holomorphy, contradicting the divergence. Hence, the assumed value for $m$ cannot exist and hence $Vb(psi)_j equiv 0$ for all $j gt.eq 2$. Thus, $Vb(f)(Vb(z)) equiv Vb(z)$ on some polydisk centered at $Vb(a)$. By the Identity Theorem (@thm:identitymultivar), $Vb(f)(Vb(z)) equiv Vb(z)$ on $Omega$.
]

#definition("Reinhardt Domain")[
  An open domain $Omega subset.eq CC^n$ is a _Reinhardt domain_ centered at $Vb(a) = (a_1, dots, a_n) in CC^n$ iff $forall Vb(zeta) = (zeta_1, dots, zeta_n) in Omega$,
  $
    {(z_1, dots, z_n) in CC^n : abs(z_k - a_k) = abs(zeta_k - a_k), 1 <= k <= n}
  $
  is fully contained in $Omega$. In other words, $Omega$ is invariant under all rotations about the center $Vb(a)$ in each coordinate.
] <def:reinhardtdomain>

#definition[
  A Reinhardt domain $Omega subset.eq CC^n$ centered at $Vb(a) = (a_1, dots, a_n)$ is said to be _complete_ iff $forall Vb(zeta) = (zeta_1, dots, zeta_n) in Omega$, the polydisk
  $
    {(z_1, dots, z_n) in CC^n : abs(z_k - a_k) <= abs(zeta_k - a_k), 1 <= k <= n}
  $
  is contained in $Omega$.
] <def:completereinhardtdomain>

#definition("Circular Domain")[
  An open domain $Omega subset.eq CC^n$ is a _circular domain_ centered at $Vb(a) in CC^n$ iff $forall Vb(zeta) in Omega$,
  $
    {Vb(a) + ee^(ii theta) (Vb(zeta) - Vb(a)) : 0 <= theta < 2 uppi}
  $
  is fully contained in $Omega$.
] <def:circulardomain>

#definition[
  A circular domain $Omega subset.eq CC^n$ centered at $Vb(a) = (a_1, dots, a_n)$ is said to be _complete_ iff $forall Vb(zeta) in Omega$,
  $
    {Vb(a) + mu (Vb(zeta) - Vb(a)) : forall mu in overline(DD)}
  $
  is contained in $Omega$.
] <def:completecirculardomain>

#proposition[
  Let $U_0 subset.eq CC^(n_0), U_1 subset.eq CC^(n_1), U_2 subset.eq CC^(n_2)$ be open domains with $n_i gt.eq 1$ for each $i$, and let $Vb(f) : U_1 -> U_2$ and $Vb(g) : U_0 -> U_1$ be holomorphic maps. Define the composition $Vb(h) : U_0 -> U_2$ by $Vb(h)(Vb(z)) = Vb(f)(Vb(g)(Vb(z)))$. Then for every $Vb(z) in U_0$, the complex Jacobian matrix of $Vb(h)$ at $Vb(z)$ is
  $
    Vb(J)_(Vb(h))(Vb(z)) = Vb(J)_(Vb(f))(Vb(g)(Vb(z))) dot Vb(J)_(Vb(g))(Vb(z)).
  $
] <prop:jacobianchainrule>

#proof[
  Fix $Vb(z) in U_0$ and let $Vb(w) = Vb(g)(Vb(z)) in U_1$. Write
  $
    Vb(h)(Vb(z)) = (h_1 (Vb(z)), dots, h_(n_2) (Vb(z))),
  $
  where each $h_l : U_0 -> CC$ is holomorphic for $l = 1, dots, n_2$. Similarly, write
  $
    Vb(g)(Vb(z)) = (g_1 (Vb(z)), dots, g_(n_1) (Vb(z))), quad Vb(f)(Vb(z)) = (f_1 (Vb(z)), dots, f_(n_2) (Vb(z))),
  $
  where each $g_p : U_0 -> CC$ and each $f_l : U_1 -> CC$ is holomorphic for $p = 1, dots, n_1$ and $l = 1, dots, n_2$. Then $h_l (Vb(z)) = f_l (Vb(g)(Vb(z)))$ for each $l$. By the chain multivariable rule, the complex Jacobian of $Vb(h)$ at $Vb(z)$ is the $n_2 times n_0$ matrix
  $
    Vb(J)_(Vb(h)) & = mat(
                      pdv(h_1, z_1), dots, pdv(h_1, z_(n_0));
                      dots.v, dots.down, dots.v;
                      pdv(h_(n_2), z_1), dots, pdv(h_(n_2), z_(n_0))
                    ) \
                  & = mat(
                      sum_(p=1)^(n_1) pdv(f_1, g_p)(Vb(g)) pdv(g_p, z_1), dots, sum_(p=1)^(n_1) pdv(f_1, g_p)(Vb(g)) pdv(g_p, z_(n_0));
                      dots.v, dots.down, dots.v;
                      sum_(p=1)^(n_1) pdv(f_(n_2), g_p)(Vb(g)) pdv(g_p, z_1), dots, sum_(p=1)^(n_1) pdv(f_(n_2), g_p)(Vb(g)) pdv(g_p, z_(n_0))
                    ) \
                  & = mat(
                      pdv(f_1, g_1)(Vb(g)), dots, pdv(f_1, g_(n_1))(Vb(g));
                      dots.v, dots.down, dots.v;
                      pdv(f_(n_2), g_1)(Vb(g)), dots, pdv(f_(n_2), g_(n_1))(Vb(g))
                    )
                    mat(
                      pdv(g_1, z_1), dots, pdv(g_1, z_(n_0));
                      dots.v, dots.down, dots.v;
                      pdv(g_(n_1), z_1), dots, pdv(g_(n_1), z_(n_0))
                    )
                    = Vb(J)_(Vb(f))(Vb(g)) dot Vb(J)_(Vb(g)). #qedhere
  $
]

#lemma("Cartan")[
  Let $Omega subset CC^n$ be a bounded complete circular domain centered at $Vb(0)$, and suppose that $Vb(f) = (f_1, dots, f_n) : Omega -> Omega$ is a biholomorphism. If $Vb(f)(Vb(0)) = Vb(0)$, then $Vb(f)$ is linear.
] <lem:multivarcartan2>

#proof[
  Let $Vb(rho)_theta (Vb(z)) = ee^(ii theta) Vb(z)$ for all $theta in RR$ and suppose that $Vb(phi) = Vb(rho)_(-theta) compose Vb(f)^(-1) compose Vb(rho)_theta compose Vb(f)$. By @prop:jacobianchainrule, we must have that
  $
    Vb(J)_(Vb(phi))(Vb(z))
    &= Vb(J)_(Vb(rho)_(-theta))(Vb(f)^(-1) compose Vb(rho)_theta compose Vb(f)(Vb(z))) dot Vb(J)_(Vb(rho)_(-theta) compose Vb(f)^(-1))(Vb(rho)_theta compose Vb(f)(Vb(z))) \
    &quad""dot Vb(J)_(Vb(rho)_(-theta) compose Vb(f)^(-1) compose Vb(rho)_theta)(Vb(f)(Vb(z))) dot Vb(J)_(Vb(rho)_(-theta) compose Vb(f)^(-1) compose Vb(rho)_theta compose Vb(f))(Vb(z)) \
    Vb(J)_(Vb(phi))(Vb(0))
    &= mat(
      ee^(-ii theta), dots, 0;
      dots.v, dots.down, dots.v;
      0, dots, ee^(-ii theta)
    ) dot Vb(J)_(Vb(f)^(-1))(Vb(0)) dot mat(
      ee^(ii theta), dots, 0;
      dots.v, dots.down, dots.v;
      0, dots, ee^(ii theta)
    ) dot Vb(J)_(Vb(f))(Vb(0)) \
    &= ee^(-ii theta) ee^(ii theta) (Vb(J)_(Vb(f)^(-1)) dot Vb(J)_(Vb(f)))(Vb(0)) = Vb(I).
  $
  By @lem:multivarcartan1, $Vb(phi)(Vb(z)) equiv Vb(z)$ on $Omega$. Hence, $Vb(f) compose Vb(rho)_theta = Vb(rho)_theta compose Vb(f)$ for all $theta in RR$. Together with @thm:taylorexpansionmultivariable, write
  $
    Vb(f)(Vb(z)) = sum_(Vb(k) : abs(Vb(k)) = 0)^oo Vb(a)_(Vb(k)) Vb(z)^(Vb(k))
  $ <eq:multivarcartan2_taylorseries>
  on a polydisk centered at $Vb(0)$. Thus,
  $
    Vb(f) compose Vb(rho)(Vb(z)) = sum_(Vb(k) : abs(Vb(k)) = 0)^oo Vb(a)_(Vb(k)) (ee^(ii theta) Vb(z))^(Vb(k)) = sum_(Vb(k) : abs(Vb(k)) = 0)^oo Vb(a)_(Vb(k)) ee^(ii theta abs(Vb(k))) Vb(z)^(Vb(k)).
  $
  On the other hand, composing with $Vb(rho)_theta$ with @eq:multivarcartan2_taylorseries gives
  $
    Vb(rho)_theta compose Vb(f)(Vb(z)) = ee^(ii theta) sum_(Vb(k) : abs(Vb(k)) = 0)^oo Vb(a)_(Vb(k)) Vb(z)^(Vb(k)) = sum_(Vb(k) : abs(Vb(k)) = 0)^oo Vb(a)_(Vb(k)) ee^(ii theta) Vb(z)^(Vb(k)).
  $
  Hence, by the uniqueness of power series expansions, we must either have that $Vb(a)_(Vb(k)) = Vb(0)$, $ee^(ii theta) equiv ee^(ii theta abs(Vb(k)))$, or equivalently, that $forall theta in RR$,
  $
    theta abs(Vb(k)) equiv theta mod 2 uppi ==> abs(Vb(k)) equiv 1 mod 2 uppi #[(by letting $theta = 1$)].
  $
  This is only possible when $abs(Vb(k)) = 1$ by irrationality, and thus $Vb(a)_(Vb(k)) = Vb(0)$ for all $abs(Vb(k)) != 1$. Therefore, $Vb(f)$ must be linear.
]

#remark[
  If $n = 1$, then $Omega = D(0, R)$ for some $R > 0$ and any automorphism $f$ with a fixed point $0$ is a rotation in the form of $z |-> ee^(ii theta) z$, hence linear, the effective statement of the Schwarz Lemma (@lem:schwarz).
]

#theorem[The Holomorphic Automorphism Group on $DD^n$][
  The holomorphic automorphism group of the polydisk $DD^n$ consists solely of biholomorphisms in the form of
  $
    Vb(z) = (z_1, dots, z_n) |-> Vb(P)(ee^(ii theta_1) (z_1 - a_1) / (1 - overline(a_1) z_1), dots, ee^(ii theta_n) (z_n - a_n) / (1 - overline(a_n) z_n)),
  $ <eq:holomorphicautomorphismgrouponpolydisk_statement>
  where $Vb(P)$ is a $n times n$ permutation matrix (for coordinate permutations), $(theta_1, dots, theta_n) in RR^n$, and $(a_1, dots, a_n) in DD^n$. Moreover, every such map is indeed an automorphism.
] <thm:holomorphicautomorphismgrouponpolydisk>

#proof[
  Let $Vb(f) in Aut(DD^n)$ be arbitrary, and set $Vb(alpha) = (alpha_1, dots, alpha_n) = Vb(f)(Vb(0))$. Define the Möbius transformation $Vb(phi)(z_1, dots, z_n) = ((z_1 - alpha_1) / (1 - overline(alpha_1) z_1), dots, (z_n - alpha_n) / (1 - overline(alpha_n) z_n)) in Aut(DD^n)$. It follows that $Vb(phi) compose Vb(f)(Vb(0)) = Vb(0)$ and $Vb(phi) compose Vb(f) in Aut(DD^n)$.

  By @lem:multivarcartan2, the map $Vb(phi) compose Vb(f)$ is linear, so $Vb(phi) compose Vb(f)(Vb(z)) = Vb(A) Vb(z)$ for some invertible constant matrix $Vb(A) = mat(zeta_(1,1), dots, zeta_(1,n); dots.v, dots.down, dots.v; zeta_(n,1), dots, zeta_(n,n))$, hence $Vb(A) in Aut(DD^n)$. Thus,
  $
    abs(sum_(j=1)^n zeta_(k,j) z_j) < 1 quad forall Vb(z) in DD^n, forall k in {1, dots, n},
  $
  which implies $abs(zeta_(k,j)) <= 1$ for all $j, k in {1, dots, n}$ (for if $abs(zeta_(k,j)) > 1$, then choosing $z_j = 1 / abs(zeta_(k,j)) + epsilon$ with $0 < epsilon < 1 - 1 / abs(zeta_(k,j))$ and $z_l = 0$ for $l != j$ yields a contradiction).

  For each $j in {1, dots, n}$, define the sequence ${Vb(z)_(j,k)}_(k in NN)$ for each $k in NN$ by
  $
    Vb(z)_(j,k) = (z_(j,k,1), dots, z_(j,k,n)) = ((1 - 1 / k) abs(zeta_(j,1)) / zeta_(j,1), dots, (1 - 1 / k) abs(zeta_(j,n)) / zeta_(j,n)) in DD^n,
  $
  where we informally let $abs(zeta_(j,i)) / zeta_(j,i) = 0$ if $zeta_(j,i) = 0$. Then, for all $j in {1, dots, n}$ and $k in NN$,
  $
    (Vb(phi) compose Vb(f))(Vb(z)_(j,k)) = (1 - 1 / k)(sum_(i=1)^n (abs(zeta_(j,i)) / zeta_(j,i)) zeta_(1,i), dots, sum_(i=1)^n (abs(zeta_(j,i)) / zeta_(j,i)) zeta_(j,i), dots, sum_(i=1)^n (abs(zeta_(j,i)) / zeta_(j,i)) zeta_(n,i)) in DD^n.
  $
  In particular, the $j$-th component is
  $
    (1 - 1 / k) sum_(i=1)^n abs(zeta_(j,i)) in DD.
  $
  As $k -> oo$,
  $
    sum_(i=1)^n abs(zeta_(j,i)) <= 1 wide forall j in {1, dots, n}.
  $ <eq:holomorphicautomorphismgrouponpolydisk_absolutesumestimate>
  Now consider, for each $j in {1, dots, n}$, the sequence $Vb(z)'_(j,k) = (0, dots, 0, 1 - 1 / k, 0, dots, 0)$, where $1 - 1 / k$ is in the $j$-th position. Then
  $
    Vb(phi) compose Vb(f)(Vb(z)'_(j,k)) = (1 - 1 / k)(zeta_(1,j), dots, zeta_(n,j)).
  $
  As $k -> oo$, $Vb(z)'_(j,k) -> Vb(e)_j in partial(DD^n)$ (the $j$-th unit basis vector), so the limit is
  $
    Vb(zeta)_j = (zeta_(1,j), dots, zeta_(n,j)) in overline(DD^n) .
  $
  Because the function $Vb(A)$ is injective on all of $CC^n$, if $Vb(zeta)_j in DD^n$ (within the interior), then $Vb(A)^(-1) in Aut(DD^n)$ would map $Vb(zeta)_j$ to $Vb(e)_j in partial(DD^n)$, which is an impossibility. Hence, $Vb(zeta)_j in partial(DD^n)$, and consequently, $max_(i in {1, dots, n}) abs(zeta_(i,j)) = 1$. Combined with @eq:holomorphicautomorphismgrouponpolydisk_absolutesumestimate, this forces exactly one entry in the $j$-th column of $Vb(A)$ to have absolute value $1$ (of the form $ee^(ii theta_j)$), with all others zero.

  Invertibility of $Vb(A)$ ensures each column has at least one nonzero entry, so $Vb(A)$ is a monomial matrix, which factors to
  $
    Vb(A) = Vb(P) op("diag")(ee^(ii theta_1), dots, ee^(ii theta_n))
  $
  for some permutation matrix $Vb(P)$. Therefore,
  $
    Vb(f)(Vb(z)) = Vb(phi)^(-1) compose (Vb(P) op("diag")(ee^(ii theta_1), dots, ee^(ii theta_n)) Vb(z)).
  $
  Let $sigma : NN_(<= n) -> NN_(<= n)$ be the permutation induced by $Vb(P)$. The map $Vb(A)$ multiplies the $m$-th input coordinate $z_m$ by $ee^(ii theta_m)$ and permutes to place it in the $sigma(m)$-th output position, so the $sigma(m)$-th coordinate of $Vb(A) Vb(z)$ is $ee^(ii theta_m) z_m$. Applying $Vb(phi)^(-1)$ componentwise then gives, for the $k$-th output coordinate,
  $
    (Vb(f)(Vb(z)))_k = phi_(alpha_k)^(-1) (ee^(ii theta_(sigma^(-1)(k))) z_(sigma^(-1)(k))) = (ee^(ii theta_(sigma^(-1)(k))) z_(sigma^(-1)(k)) + alpha_k) / (1 + overline(alpha_k) ee^(ii theta_(sigma^(-1)(k))) z_(sigma^(-1)(k))).
  $
  Set $a_(sigma^(-1)(k)) = -alpha_k ee^(-ii theta_(sigma^(-1)(k))) in DD$. Then
  $
    (Vb(f)(Vb(z)))_k = (ee^(ii theta_(sigma^(-1)(k))) z_(sigma^(-1)(k)) + alpha_k) / (1 + overline(alpha_k) ee^(ii theta_(sigma^(-1)(k))) z_(sigma^(-1)(k))) = ee^(ii theta_(sigma^(-1)(k))) (z_(sigma^(-1)(k)) - a_(sigma^(-1)(k))) / (1 - overline(a_(sigma^(-1)(k))) z_(sigma^(-1)(k))).
  $
  Hence,
  $
    (Vb(f)(Vb(z)))_(sigma(k)) = ee^(ii theta_k) (z_k - a_k) / (1 - overline(a_k) z_k) <==> Vb(f)(Vb(z)) = Vb(P)(ee^(ii theta_1) (z_1 - a_1) / (1 - overline(a_1) z_1), dots, ee^(ii theta_n) (z_n - a_n) / (1 - overline(a_n) z_n)),
  $
  as in @eq:holomorphicautomorphismgrouponpolydisk_statement. Finally, each automorphism of this form lies in $Aut(DD^n)$ trivially.
]

#definition[
  The _conjugate transpose_ or _Hermitian transpose_ of a complex matrix $Vb(U)$ is defined as $Vb(U)^dagger = overline(Vb(U))^top$, or the transpose of the matrix with each element replaced with its complex conjugate.
]

#definition[
  A matrix $Vb(U)$ is said to be _unitary_ iff its inverse is its conjugate transpose, or iff $Vb(U)^dagger Vb(U) = Vb(U) Vb(U)^dagger = Vb(I)$.
]

#theorem("Spectral Theorem")[
  For any unitary matrix $Vb(U)$, there exists a unitary matrix $Vb(V)$ such that $Vb(U) = Vb(V) Vb(D) Vb(V)^dagger$, where $Vb(D)$ is a diagonal matrix whose diagonal entries are all of unit modulus.
] <thm:unitaryspectraltheorem>

#proof[
  Because $norm(Vb(U) Vb(z))^2 = Vb(z)^dagger Vb(U)^dagger Vb(U) Vb(z) = norm(Vb(z))^2$ for any $Vb(z) in CC^n$, any eigenvalue $lambda_1$ (existence given by the Fundamental Theorem of Algebra in @thm:fundamentaltheoremofalgebra on the characteristic equation) of $Vb(U)$ must satisfy
  $
    Vb(U) Vb(v)_1 = lambda_1 Vb(v)_1 ==> norm(Vb(U) Vb(v)_1) = norm(Vb(v)_1) = abs(lambda_1) norm(Vb(v)_1) ==> abs(lambda_1) = 1,
  $
  where $norm(Vb(v)_1) = 1$ is the corresponding eigenvector in $CC^n$. Then
  $
    Vb(U)^(-1) Vb(U) Vb(v)_1 = Vb(U)^(-1) lambda_1 Vb(v)_1 ==> (1) / (lambda_1) Vb(v)_1 = Vb(U)^(-1) Vb(v)_1 ==> overline(lambda_1) Vb(v)_1 = Vb(U)^dagger Vb(v)_1.
  $
  Let $Vb(v)_1^perp = {Vb(w) : Vb(v)_1^dagger Vb(w) = Vb(0)} subset CC^n$ be an $(n - 1)$-dimensional subspace. For any $Vb(w) in Vb(v)_1^perp$,
  $
    Vb(v)_1^dagger Vb(U) Vb(w) = (Vb(U)^dagger Vb(v)_1)^dagger Vb(w) = (overline(lambda_1) Vb(v)_1)^dagger Vb(w) = lambda_1 Vb(v)_1^dagger Vb(w) = 0,
  $
  so $Vb(U) Vb(w) in Vb(v)_1^perp$. Hence $Vb(v)_1^perp$ is invariant under $Vb(U)$. The restriction of $Vb(U)$ to $Vb(v)_1^perp$, $Vb(U)|_(Vb(v)_1^perp)$, yields another eigenvalue $lambda_2 in partial DD$ with eigenvector $Vb(v)_2 in Vb(v)_1^perp$ satisfying $abs(lambda_2) = 1$ and $norm(Vb(v)_2) = 1$. Similarly, we may define $Vb(v)_2^perp subset Vb(v)_1^perp$, which is an $(n - 2)$-dimensional subspace invariant under $Vb(U)$. Repeating this process inductively, we obtain an orthonormal basis ${Vb(v)_1, dots, Vb(v)_n}$ of eigenvectors of $Vb(U)$ with corresponding eigenvalues $lambda_1, dots, lambda_n in partial DD$. Setting
  $
    Vb(V) = mat(Vb(v)_1, dots.c, Vb(v)_n), quad Vb(D) = op("diag")(lambda_1, dots.c, lambda_n)
  $
  gives that
  $
    Vb(V)^dagger Vb(U) Vb(V) = Vb(V)^dagger mat(Vb(U) Vb(v)_1, dots.c, Vb(U) Vb(v)_n) = Vb(V)^dagger mat(lambda_1 Vb(v)_1, dots.c, lambda_n Vb(v)_n) = Vb(V)^dagger Vb(V) Vb(D).
  $
  The $k$-th diagonal entry of $Vb(V)^dagger Vb(V)$ is equal to $Vb(v)_k^dagger Vb(v)_k = norm(Vb(v)_k)^2 = 1$, while the non-diagonal entries correspond to $Vb(v)_k^dagger Vb(v)_l$ for some $k != l$, which vanish by orthogonality in construction. Thus, $Vb(V)^dagger Vb(V) = Vb(I)$ (unitary) and $Vb(V) Vb(D) Vb(V)^dagger = Vb(U)$.
]

A _unitary transformation_ is a map in the form of $Vb(z) |-> Vb(U) Vb(z)$, where $Vb(U)$ is a unitary matrix.

#proposition[
  For any $a in DD$,
  $
    Vb(w) &= (w_1, dots, w_n) = Vb(phi)_a (Vb(z)) \
    &=((z_1 - a) / (1 - overline(a) z_1), z_2 (sqrt(1 - abs(a)^2)) / (1 - overline(a) z_1), z_3 (sqrt(1 - abs(a)^2)) / (1 - overline(a) z_1), dots, z_n (sqrt(1 - abs(a)^2)) / (1 - overline(a) z_1))
  $ <eq:unitballsimpleautomorphism_statement>
  lies in $Aut(B^n)$, where $Vb(z) = (z_1, dots, z_n)$. Moreover, $Vb(phi)_a^(-1) = Vb(phi)_(-a)$.
] <prop:unitballsimpleautomorphism>

#proof[
  For $Vb(z) = (z_1, dots, z_n) in B^n$, because $sum_(k=2)^n abs(z_k)^2 < 1 - abs(z_1)^2$,
  $
    norm(Vb(phi)_a (Vb(z)))^2
    &= (1) / abs(1 - overline(a) z_1)^2 [abs(z_1 - a)^2 + sum_(k=2)^n (1 - abs(a)^2) abs(z_k)^2] \
    &< (1) / ((1 - overline(a) z_1)(1 - a overline(z_1))) [(z_1 - a)(overline(z_1) - overline(a)) + (1 - abs(z_1)^2)(1 - abs(a)^2)] \
    &= (abs(z_1)^2 + abs(a)^2 - 2 Re(overline(a) z_1) + 1 + abs(a z_1)^2 - abs(a)^2 - abs(z_1)^2) / (1 + abs(a z_1)^2 - 2 Re(overline(a) z_1)) = 1.
  $
  Hence, $Vb(phi)_a$ maps $B^n$ to $B^n$. A simple calculation shows that
  $
    w_1 = (z_1 - a) / (1 - overline(a) z_1) ==> z_1 = (w_1 + a) / (1 + overline(a) w_1), quad z_k = w_k (1 - overline(a) z_1) / (sqrt(1 - abs(a)^2)) = w_k (sqrt(1 - abs(a)^2)) / (1 + overline(a) w_1),
  $
  and hence $Vb(phi)_a$ is bijective, admitting the inverse $Vb(phi)_(-a)$. Therefore, $Vb(phi)_a in Aut(B^n)$.
]

#proposition[
  A function $Vb(f)$ is a unitary transformation iff $Vb(f) in Aut(B^n)$ and $Vb(f)(Vb(0)) = Vb(0)$.
] <prop:unitballautomorphismfixedpointatzero>

#proof[
  Because $B^n$ is a bounded complete circular domain centered at $Vb(0)$, from @lem:multivarcartan2 we have that $Vb(f) equiv Vb(U)$ for some constant invertible matrix
  $
    Vb(U) = mat(zeta_(1,1), dots.c, zeta_(1,n); dots.v, dots.down, dots.v; zeta_(n,1), dots.c, zeta_(n,n)).
  $
  Similarly, we have $Vb(f)^(-1) = Vb(U)^(-1)$, so $norm(Vb(z)) = norm(Vb(U)^(-1) Vb(U) Vb(z))$. Observe that
  $
    norm((1) / (norm(Vb(z))) Vb(f)(Vb(z))) = norm(Vb(f)((Vb(z)) / (norm(Vb(z))))) = 1 ==> norm(Vb(U) Vb(z))^2 = norm(Vb(z))^2.
  $
  More explicitly, we have
  $
    Vb(U) Vb(z) = (sum_(k=1)^n zeta_(1,k) z_k, dots, sum_(k=1)^n zeta_(n,k) z_k) ==> norm(Vb(U) Vb(z))^2 = sum_(j=1)^n abs(sum_(k=1)^n zeta_(j,k) z_k)^2.
  $
  Letting $Vb(z) = Vb(e)_i$ ($1 <= i <= n$) be the $i$-th unit basis vector, we obtain
  $
    norm(Vb(U) Vb(z)) = 1 = norm((zeta_(1,i), dots, zeta_(n,i)))^2 = sum_(k=1)^n abs(zeta_(k,i))^2 = sum_(k=1)^n zeta_(k,i) overline(zeta_(k,i)).
  $ <eq:unitballautomorphismfixedpointatzero_diagonalentries>
  Letting $Vb(z) = (sqrt(2)) / (2) (Vb(e)_i + Vb(e)_j)$ ($i != j$), we have
  $
    norm(Vb(U) Vb(z)) = 1
    &= (1) / (2) norm((zeta_(1,i) + zeta_(1,j), dots, zeta_(n,i) + zeta_(n,j)))^2 = (1) / (2) sum_(k=1)^n abs(zeta_(k,i) + zeta_(k,j))^2 \
    &= (1) / (2) sum_(k=1)^n (abs(zeta_(k,i)^2) + abs(zeta_(k,j)^2) + 2 Re(zeta_(k,i) overline(zeta_(k,j)))) = 1 + sum_(k=1)^n Re(zeta_(k,i) overline(zeta_(k,j))),
  $
  which implies that $sum_(k=1)^n Re(zeta_(k,i) overline(zeta_(k,j))) = 0$. Similarly, letting $Vb(z) = (sqrt(2)) / (2) (Vb(e)_i + ii Vb(e)_j)$ gives
  $
    norm(Vb(U) Vb(z)) = 1
    &= (1) / (2) norm((zeta_(1,i) + ii zeta_(1,j), dots, zeta_(n,i) + ii zeta_(n,j)))^2 = (1) / (2) sum_(k=1)^n abs(zeta_(k,i) + ii zeta_(k,j))^2 \
    &= (1) / (2) sum_(k=1)^n (abs(zeta_(k,i)^2) + abs(zeta_(k,j)^2) + 2 Im(zeta_(k,i) overline(zeta_(k,j)))) = 1 + sum_(k=1)^n Im(zeta_(k,i) overline(zeta_(k,j))),
  $
  which implies that $sum_(k=1)^n Im(zeta_(k,i) overline(zeta_(k,j))) = 0$. Therefore, by @eq:unitballautomorphismfixedpointatzero_diagonalentries, for all $i, j in {1, dots, n}$, observe that
  $
    (Vb(U)^dagger Vb(U))_(j,i) = sum_(k=1)^n zeta_(k,i) overline(zeta_(k,j)) = delta_(j,i),
  $
  where $delta_(j,i)$ is the Kronecker delta. Hence, we have $Vb(U)^dagger Vb(U) = Vb(I)$, and thus $Vb(U)$ is unitary.

  Conversely, if $Vb(f)(Vb(z)) = Vb(U) Vb(z)$ for some unitary matrix $Vb(U)$, then for any $Vb(z) in B^n$,
  $
    norm(Vb(f)(Vb(z)))^2 = norm(Vb(U) Vb(z))^2 = Vb(z)^dagger Vb(U)^dagger Vb(U) Vb(z) = Vb(z)^dagger Vb(z) = norm(Vb(z))^2,
  $
  so $Vb(f)$ maps $B^n$ to $B^n$. Since $Vb(U)$ is invertible with unitary inverse $Vb(U)^dagger$, the map $Vb(f)$ is bijective with inverse $Vb(f)^(-1)(Vb(w)) = Vb(U)^dagger Vb(w)$, which also maps $B^n$ to $B^n$. Therefore, $Vb(f) in Aut(B^n)$ and $Vb(f)(Vb(0)) = Vb(0)$.
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
    Vb(z) |-> Vb(U)^(-1) Vb(phi)_a compose Vb(V) Vb(z),
  $ <eq:holomorphicautomorphismgrouponunitball_statement>
  where $Vb(U), Vb(V)$ are unitary matrices, $a in DD$, and $Vb(phi)_a$ is defined as in @eq:unitballsimpleautomorphism_statement (and every such function lies in $Aut(B^n)$).
] <thm:holomorphicautomorphismgrouponunitball>

#proof[
  Let $Vb(f) in Aut(B^n)$ be arbitrary, and set $Vb(alpha) = Vb(f)(Vb(0))$. Then there exists a unitary matrix $Vb(U)$ such that $Vb(U) Vb(alpha) = (abs(Vb(alpha)), 0, dots, 0)$.

  Now let $Vb(phi)_(abs(Vb(alpha)))$ be as in @prop:unitballsimpleautomorphism, mapping $(abs(Vb(alpha)), 0, dots, 0)$ to $Vb(0)$. Then, the map $Vb(phi)_(abs(Vb(alpha))) compose Vb(U) Vb(f) in Aut(B^n)$ fixes $Vb(0)$, so by @prop:unitballautomorphismfixedpointatzero it is a unitary transformation, say $Vb(V)$. Therefore,
  $
    Vb(phi)_(abs(Vb(alpha))) compose Vb(U) Vb(f) equiv Vb(V) ==> Vb(f)(Vb(z)) equiv Vb(U)^(-1) Vb(phi)_(abs(Vb(alpha)))^(-1) compose Vb(V) Vb(z).
  $
  The converse is trivial.
]
