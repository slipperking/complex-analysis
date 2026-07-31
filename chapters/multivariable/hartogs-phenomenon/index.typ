#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Hartogs' Phenomenon],
  route: "hartogs-phenomenon",
)
One of the most prominent results of complex function theory is _Hartogs' phenomenon_, which reveals a fundamental difference between holomorphic functions of one variable and those of several variables. First discovered by Friedrich Hartogs in 1906, it essentially states that holomorphic functions in several complex variables exhibit a surprising rigidity.

To understand the sense of Hartogs' phenomenon, consider the simple example of $z |-> 1 / z$ in one complex variable. This function is holomorphic on $CC^*$ with a singularity at $0$ that cannot be removed. However, in the case of several complex variables, Hartogs' phenomenon asserts that if a function is holomorphic in a domain that excludes a compact subset, it can be extended to a holomorphic function on the entire domain, including the excluded subset. One immediate conclusion from this is that isolated singularities are _always_ removable in higher dimensions.

#lbl(
  theorem[Hartogs' Extension Theorem][
    Let $Omega subset.eq CC^n$ ($n >= 2$) be a domain and $K subset.eq Omega$ be a compact subset such that $Omega without K$ is connected. Then any holomorphic function $f : Omega without K -> CC$ has a unique extension to a holomorphic function $tilde(f) : Omega -> CC$ such that $tilde(f) equiv f$ on $Omega without K$.
  ],
  <thm:hartogsextensiontheorem>,
)

Hartogs, in 1906, first proved his extension theorem using an integral formula, but was considered to be incomplete with gaps. In 1939, Fueter gave a proof for the case $n = 2$, and later Bochner and Martinelli developed more general integral kernel methods for higher dimensions. Finally, Ehrenpreis, in 1961, provided a succinct and analytic proof using the $overline(partial)$ operator: by multiplying the function by a smooth cutoff or bump function and then solving a $overline(partial)$-problem to correct the non-holomorphy introduced by the cutoff, one can construct the desired extension.

The general study of complex function theory in multiple variables is made practical with the definition of differential forms in multiple variables and in particular the $overline(partial)$-problem, whose utility in a single variable has already been preluded to many times before.

Only certain cases of @thm:hartogsextensiontheorem are proved here.

#lbl(
  proposition[
    Let $Omega subset.eq CC^n$ be a Reinhardt domain centered at $bold(0)$. Let $f : Omega -> CC$ be holomorphic. Then $f$ admits the unique Laurent expansion
    #lbl(
      $
        f(bold(z)) = sum_(bold(k) in ZZ^n) a_(bold(k)) bold(z)^(bold(k)), quad a_(bold(k)) in CC,
      $,
      <eq:reinhardtlaurentexpansion>,
    )
    converging absolutely and uniformly on compact subsets of $Omega$.
  ],
  <prop:reinhardtlaurentexpansion>,
)

#proof[
  Let $bold(w) = (w_1, dots, w_n) in Omega$ with each $w_j != 0$. Since $Omega$ is a Reinhardt domain, for every $bold(theta) = (theta_1, dots, theta_n) in [-uppi, uppi]^n$ the point
  $
    z_j = w_j ee^(ii theta_j), quad j in NN_(<= n)
  $
  lies in $Omega$; moreover, the set of all such points, $K$, is compact in $Omega$. Assuming that a Laurent expansion exists and converges uniformly on this compact set, termwise integration on both sides of $(f(bold(z)))/ (bold(z)^(bold(k) + (1, dots, 1))) = sum_(bold(j) in ZZ^n) a_(bold(j)) bold(z)^(bold(j) - bold(k) - (1, dots, 1))$ gives
  $
    a_(bold(k))
    &= 1 / ((2 uppi ii)^n) integral_K (f(bold(z))) / (bold(z)^(bold(k) + (1, dots, 1))) dif bold(z) \
    &= (bold(w)^(-bold(k))) / ((2 uppi)^n) integral_([-uppi, uppi]^n) f(w_1 ee^(ii theta_1), dots, w_n ee^(ii theta_n)) ee^(-ii (k_1 theta_1 + dots + k_n theta_n)) dtheta_1 dots.c dtheta_n,
  $
  which shows that the coefficients $a_(bold(k))$ are uniquely determined.

  To prove the existence of such an expansion, again fix $w in Omega$. Because $Omega$ is Reinhardt, there exists $epsilon > 0$ such that the polyannulus
  $
    Omega(bold(w), epsilon) = {bold(z) = (z_1, dots, z_n) in CC^n : abs(w_j) - epsilon < abs(z_j) < abs(w_j) + epsilon, j in NN_(<= n)}
  $
  is contained in $Omega$. On this set one may perform one-variable Laurent expansions (@thm:laurent-expansion-of-holomorphic-function) successively in each coordinate, holding the others fixed. Since $f$ is holomorphic on $Omega$, this procedure yields
  $
    f(bold(z)) = sum_(bold(k) in ZZ^n) a_(bold(k)) (bold(w)) bold(z)^(bold(k)),
  $
  a Laurent series converging uniformly on a neighborhood of $w$. If $bold(w)' in Omega(bold(w), epsilon)$, then the same construction gives
  $
    f(z) = sum_(bold(k) in ZZ^n) a_(bold(k)) (bold(w)') z^(bold(k)).
  $
  By uniqueness of Laurent coefficients (in the one-variable expansions), it follows that $a_(bold(k)) (bold(w)') = a_(bold(k)) (bold(w))$. Thus the coefficient functions $a_(bold(k)) (bold(w))$ are locally constant on $Omega$, and since $Omega$ is connected they are constant throughout $Omega$; we therefore write them simply as $a_(bold(k))$.

  Consequently,
  $
    f(bold(z)) = sum_(bold(k) in ZZ^n) a_(bold(k)) bold(z)^(bold(k))
  $
  holds in a neighborhood $U_bold(w)$ of every point $bold(w)$ in $Omega$. If $K subset Omega$ is compact, then ${U_bold(w) : bold(w) in K}$ is an open cover of $K$, and hence it admits a finite subcover. Then the uniform convergence of the series on $K$ follows from the uniform convergence on each $U_bold(w)$ in the subcover. The absolute convergence follows from the absolute convergence of the one-variable Laurent expansions used in the construction.
  #todo[Rethink this, make constructions more explicit and clear.]
]

#lbl(
  proposition[
    Let $Omega subset CC^n$ be a Reinhardt domain centered at $bold(0)$ such that $Omega$ satisfies the condition that for every $j in NN_(<= n)$, there exists a point in $Omega$ of the form $w_j bold(e)_j$ ($bold(e)_j$ is the $j$-th unit vector and $w_j in CC^*$). Then any holomorphic function $f : Omega -> CC$ has the expansion
    $
      f(bold(z)) = sum_(bold(k) in ZZ_(>= 0)^n) a_(bold(k)) bold(z)^(bold(k)),
    $
    which converges locally uniformly and absolutely on $Omega$.
  ],
  <prop:hartogslaurentexpansionnonnegative>,
)

#proof[
  By @prop:reinhardtlaurentexpansion, $f$ has an expansion matching the form of @eq:reinhardtlaurentexpansion. Now for a fixed $j in NN_(<= n)$, if not all $a_(bold(k))$'s with $k_j < 0$ are zero, then fixing all variables except $z_j$ gives a Laurent expansion that does not uniformly converge on all compact neighborhoods of $w_j bold(e)_j in Omega$ (either a pole or an essential singularity with respect to $z_j$). Thus, we are left only with $bold(k)$ containing nonnegative components, and the conclusion holds.
]

#lbl(
  theorem[Hartogs' Extension Theorem for Reinhardt Domains][
    Let $Omega subset CC^n$ be a Reinhardt domain centered at $bold(0)$ such that $Omega$ satisfies the condition that for every $j in NN_(<= n)$, there exists a point in $Omega$ of the form $a_j bold(e)_j$ ($bold(e)_j$ is the $j$-th unit vector and $a_j in CC^*$). Let $f : Omega -> CC$ be holomorphic. Then $f(bold(z))$ can be analytically continued to the complete Reinhardt domain $tilde(Omega)$ defined by
    $
      tilde(Omega) = {(rho_1 z_1, rho_2 z_2, dots, rho_n z_n) in CC^n : 0 <= rho_j <= 1, j in NN_(<= n), (z_1, dots, z_n) in Omega}
    $
    In other words, $exists tilde(f) : tilde(Omega) -> CC$ holomorphic such that $tilde(f) equiv f$ on $Omega$.
  ],
  <thm:hartogsextensiontheoremforreinhardt-domains>,
)

#proof[
  By @prop:hartogslaurentexpansionnonnegative, $f$ has the expansion
  $
    f(bold(z)) = sum_(bold(k) in ZZ_(>= 0)^n) a_(bold(k)) bold(z)^(bold(k)),
  $
  which absolutely converges on $Omega$. Substituting $(rho_1 z_1, dots, rho_n z_n)$ for $bold(z) in Omega$ with $0 <= rho_j <= 1$ for each $j in NN_(<= n)$ gives
  $
    abs(tilde(f)(rho_1 z_1, dots, rho_n z_n)) = abs(sum_(bold(k) in ZZ_(>= 0)^n) a_(bold(k)) (rho_1 z_1)^(k_1) dots.c (rho_n z_n)^(k_n)) <= sum_(bold(k) in ZZ_(>= 0)^n) abs(a_(bold(k)) bold(z)^(bold(k))),
  $
  which converges. The function $tilde(f) : tilde(Omega) -> CC$ is then holomorphic as it is given by a power series expansion, and it satisfies $tilde(f) equiv f$ on $Omega$.
]

#example[
  Set $r > 0$ and let
  $
    Omega(r) = B^n without r overline(B^n) = {bold(z) : r < norm(bold(z)) < 1}
  $
  define a Reinhardt domain. Then any holomorphic function $f : Omega(r) -> CC$ can be analytically continued to the entire unit ball $B^n$ by @thm:hartogsextensiontheoremforreinhardt-domains.
]
