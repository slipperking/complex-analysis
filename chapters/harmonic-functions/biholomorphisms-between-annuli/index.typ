#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Biholomorphisms between Annuli and the General Riemann Mapping Theorem],
  route: "biholomorphisms-between-annuli",
)


The Riemann Mapping states that any two open null-homotopic proper subsets of $CC$ are conformally equivalent. The natural extension to this problem is the existence of such a conformal mapping between regions containing "holes." The existence of such holes is a question of algebraic topology. One answer to such a classification is given by isomorphisms of the regions' fundamental groups.


As a matter of fact, any region with one "hole" (doubly connected) will be conformally equivalent to an annular region. This problem will be entertained later below. Another interesting question pertaining to this is the extent to which these biholomorphisms are unique. We provide a result that is of similar spirit.
#lbl(
  theorem[
    Suppose $R_1, R_2 > 1$ and let $ A_1 = {z in CC : 1 < abs(z) < R_1} quad "and" quad A_2 = {z in CC : 1 < abs(z) < R_2}. $
    Then the two annuli $A_1$ and $A_2$ are biholomorphically equivalent iff $R_1 = R_2$.
  ],
  <thm:annular-conformal-equivalence>,
)
#proof[
  The reverse implication is automatic ($R_1 = R_2$ implies biholomorphic equivalence).

  Conversely, for the sake of contradiction, assume that there exists a biholomorphism $phi.alt:A_1 -> A_2$.
  #claim[
    Exactly one of the following two cases is true:
    + For any sequence ${z_j}_(j in NN) subset A_1$ whose accumulation points are all in $partial DD$, $w_j = phi.alt(z_j)$ has accumulation points in $partial DD$; and for any sequence ${z_j}_(j in NN) subset A_1$ with accumulation points all in $partial D(0, R_1)$, $w_j = phi.alt(z_j)$ has all accumulation points in $partial D(0, R_2)$.
    + For any sequence ${z_j}_(j in NN) subset A_1$ whose accumulation points are all in $partial DD$, $w_j = phi.alt(z_j)$ has accumulation points in $D(0, R_2)$; and for any sequence ${z_j}_(j in NN) subset A_1$ with accumulation points all in $partial D(0, R_1)$, $w_j = phi.alt(z_j)$ has all accumulation points in $partial DD$.
  ]
  #proof[
    First we must show that for any $z_j -> partial A_1$ (not necessarily convergent but rather simply that $abs(z_j)$ has all accumulation points in ${1, R_1}$), $w_j$ has all its accumulation points in $partial A_2$.

    This general scenario is obtained from a property known as _properness_ (of $phi.alt$): for any compact $K subset.double A_2$, its preimage ($phi.alt^(-1)(K)$ is compact). Obviously properness is true as $phi.alt^(-1)$ is continuous (in general, any homeomorphism is proper) and maps a compact set (here $K$) to a compact set.

    Then for any convergent subsequence ${w_(j_k)}_k$ converging to $w_oo$ within $overline(A_2)$ (there exists at least one by Bolzano--Weierstrass), if $w_oo in A_2$, then by properness $phi.alt^(-1) ({w_(j_k)}_k union {w_oo}) subset.double A_1$ is compact. Note that this is equivalent to ${z_(j_k)}_k union phi.alt^(-1) (w_oo)$ being compact, meaning that $z_j$ has an accumulation point in $A_1$, which is impossible, hence implying all accumulation points of ${w_j}$ lie on the boundary $partial A_2$.

    We now show that all sequences approaching the same boundary component of $A_1$ are mapped toward the same boundary component of $A_2$. Consider first sequences ${z_j}_j$ for which $abs(z_j) -> 1$, and let $C_2 = {w in A_2 : abs(w) = (1 + R_2) / 2}$. By properness, $C_1 = phi.alt^(-1)(C_2) subset.double A_1$ is compact. Hence, for $0 < epsilon < op("dist")(C_1, partial DD)$, we have
    $ C_1 inter {z in A_1 : 1 < abs(z) < 1 + epsilon} = emptyset. $
    Suppose there were two sequences ${z_j}_j$ and ${z'_j}_j$ such that $abs(z_j) -> 1$ and $abs(z'_j) -> 1$, but $abs(phi.alt(z_j)) -> 1$ and $abs(phi.alt(z'_j)) -> R_2$. For all sufficiently large $j$, the points $z_j$ and $z'_j$ both lie in the path-connected annulus ${z in A_1 : 1 < abs(z) < 1 + epsilon}$. Thus they can be joined by a curve contained entirely in this annulus. The image of this curve under $phi.alt$ joins points lying in different components of $A_2 without C_2$. The modulus of this image then traverses from $""<(1 + R_2) / 2$ to $"">(1 + R_2) / 2$. By the Intermediate Value Theorem, there exists a point at which it attains $(1 + R_2) / 2$. Therefore the image curve must intersect $C_2$, contradicting the choice of $epsilon$.

    Together with the preceding boundary-accumulation argument, exactly one of the following is true:

    + For every sequence ${z_j}_j subset A_1$ with $abs(z_j) -> 1$, we have $abs(phi.alt(z_j)) -> 1$.
    + For every sequence ${z_j}_j subset A_1$ with $abs(z_j) -> 1$, we have $abs(phi.alt(z_j)) -> R_2$.

    Without loss of generality, we assume the former case (for the second case, replacing $phi.alt$ with the inversion $z arrow.r R_2 / phi.alt(z)$ reduces it to the first case).

    Applying the same argument to a sufficiently thin path-connected annulus near $partial D(0, R_1)$ shows that exactly one of the following is true:

    + For every sequence ${z_j}_j subset A_1$ with $abs(z_j) -> R_1$, we have $abs(phi.alt(z_j)) -> 1$.
    + For every sequence ${z_j}_j subset A_1$ with $abs(z_j) -> R_1$, we have $abs(phi.alt(z_j)) -> R_2$.

    The first possibility cannot occur (under the previous "without loss of generality" assumption). Indeed, suppose that $abs(phi.alt(z_j)) -> 1$ whenever either $abs(z_j) -> 1$ or $abs(z_j) -> R_1$. Fix a point $z_0 in A_1$, by definition $abs(phi.alt(z_0)) > 1$. Then the set
    $ S = {z in A_1 : abs(phi.alt(z)) >= abs(phi.alt(z_0))} $
    is compact neighborhood of $z_0$ lying in $A_1$: the closedness is direct from continuity of $phi.alt$. Then $abs(phi.alt)$ attains its maximum $M >= abs(phi.alt(z_0)) > 1$ in $K$; moreover it is the absolute maximum of $abs(phi.alt)$ attained in the interior of $A_1$. Then by the Maximum Modulus Principle (@thm:maximum-modulus), $phi.alt$ would then by constant, which is impossible as it must map surjectively to $A_2$.

    This concludes the proof (in the second case recall the inversion we have performed to obtain a dichotomous result).
  ]
  Once again, without loss of generality assume $abs(z_j) -> 1$ implies $abs(w_j) -> 1$ and $abs(z_j) -> R_1$ implies $abs(w_j) -> R_2$ (by composing with an inversion, if necessary).

  Then define the function
  $
    psi(z) & = log abs(z) log R_2 - log abs(phi.alt(z)) log R_1 \
           & = Re[log z log R_2 - log phi.alt(z) log R_1],
  $
  which is harmonic (as the real part of a holomorphic function). This function extends continuously to $partial A_1$ and vanishes thereon.

  By the Boundary Maximum Principle (@prop:subharmonic-boundary-maximum-principle), the function vanishes identically to $0$. Therefore, $forall z in A_1$,
  $ log abs(z) log R_2 = log abs(phi.alt(z)) log R_1 ==> abs(phi.alt(z)) = abs(z)^((log R_2) / (log R_1)). $
  Let $A_1^* = A_1 without RR_(< 0)$ be a region on which one can always define a holomorphic branch of $psi(z) = z^((log R_2) / (log R_1))$. Then $psi$ is nonvanishing and $g equiv phi.alt / psi$ has a constant modulus of $1$ in $A_1^*$. Then for $z in A_1^*$,
  $
    g'(z) = pdv(, z) abs(g(z))^2 / overline(g(z)) &= 1 / overline(g(z))^2 [pdv(, z) [abs(g(z))^2] overline(g(z)) - abs(g(z))^2 pdv(, z) overline(g(z))] \
    &=1 / overline(g(z))^2 [pdv(, z) [abs(g(z))^2] overline(g(z)) - abs(g(z))^2 overline(pdv(, overline(z)) g(z))] \
    & = (pdv(1, z) overline(g(z))) / overline(g(z))^2 = 0.
  $
  Then $g$ must be constant, more concretely a fixed unit value. Then on $A_1^*$,
  $ g equiv ee^(ii theta) ==> phi.alt(z) = z^((log R_2) / (log R_1)). $
  In order for this to extend to $RR_(<0) inter A_1$, $(log R_2) / (log R_1)$ must be an integral value; moreover for univalence to hold this must be equal to $1$. Therefore, $R_1 = R_2$.
]
Thus, the only biholomorphism between two annuli is a scaling, otherwise no such biholomorphism exists. Therefore, if we can show that a doubly connected region is conformally equivalent to an annulus, we can classify them by the ratio of their radii.

We now provide a conceptual proof of the Riemann Mapping Theorem based on the Dirichlet problem (which is in fact more historically aligned with the original approach from Riemann). We hope that the proof we provide generalizes easily into more complex domains for readers.
#thm-state.thm-restate("thm:riemann-mapping")
#proof[
  First consider the case where $U$ is a bounded region whose boundary is $C^1$ and $0 in U$. Then there is a solution $u$ to the Dirichlet Problem (@thm:solution-to-the-dirichlet-problem) in $U$ with the continuous boundary function $z mapsto -log abs(z)$ (the barrier existence comes from @thm:barrier-c1-boundary-exterior-segment). Obviously, the function $u$ cannot be equivalent to $-log abs(z)$ in the interior since the latter would approach $oo$ at $0$. Let
  $
    Phi(z) = log abs(z) + u(z),
  $
  then $Phi$ vanishes on $partial U$ and approaches $-oo$ near $0$. Then for some $epsilon > 0$,
  $ Phi(z) < 0 $
  on $overline(D(0, epsilon)) without {0}$. Then $Phi$ is harmonic on $U without overline(D(0, epsilon))$. By @prop:subharmonic-boundary-maximum-principle, $Phi < 0$ on $U without overline(D(0, epsilon))$ and ultimately on $U without {0}$.

  Let $psi(z) = u'_x (z) - ii u'_y (z)$, which is complex-harmonic ($laplacian psi equiv 0$). By elliptic regularity, $psi$ is $C^oo$, and moreover,
  $
    pdv(, overline(z)) psi & equiv 1 / 2(pdv(, x) + ii pdv(, y))(u'_x - ii u'_y) \
                           & equiv 1 / 2 (u''_(x x) + u''_(y y)) = 0.
  $
  Therefore, $psi$ is holomorphic on the simply connected set $U$, thus the function
  $
    f(z) = integral_0^z psi(zeta) dzeta + u(0)
  $
  is well-defined and holomorphic. Moreover,
  $
    Re f(z) & = integral_0^z u'_x (zeta) dd((Re(zeta))) + u'_y (zeta) dd((Im(zeta))) + u(0) \
            & = integral_0^z dd((u(zeta))) = u(z).
  $
  Therefore, $f$ is a holomorphic function whose real part is $u$, unique up to an additive imaginary constant. Define the holomorphic function
  $ F(z) = z exp[f(z)]. $
  Observe that $F(U) subset.eq DD$ since
  $
    abs(F(z)) = abs(z) exp(Re f(z)) = exp(Phi(z)) < 1
  $
  for $z != 0$, while $F(0) = 0$. It has precisely one zero, and since
  $ F'(0) = evaluated(exp[f(z)](1 + z f'(z)))_(z = 0) = exp(u(0)) > 0, $
  it is a simple zero. Moreover, $abs(F(z)) = exp(Phi(z)) -> 1$ whenever $z -> partial U$ from within $U$. Consequently, $F:U -> DD$ is proper by the same boundary-compactness argument used in the proof of @thm:annular-conformal-equivalence.

  We next prove that every $w in DD$ is assumed exactly once. We aim to use the Argument Principle, but note that $F$ need not be holomorphic on a neighborhood of $overline(U)$, and hence we exhaust $U$ with compact sets. Choose $rho$ with $abs(w) < rho < 1$ and set
  $
    K_rho = {z in U : abs(F(z)) <= rho}.
  $
  Since $overline(D(0,rho)) subset.double DD$ is compact and $K_rho = F^(-1)(overline(D(0,rho)))$, properness gives that $K_rho subset.double U$ is compact. Choose a compact exhaustion ${K_n}$ of $U$ with piecewise $C^1$ boundaries, where $K_n = overline(V_n)$, each $V_n subset.double U$ is a relatively compact simply connected domain with piecewise $C^1$ boundary, and
  $
    K_n subset.double interior(K_(n+1)), quad union.big_(n=1)^oo K_n = U.
  $
  For all sufficiently large $n$, $K_rho subset.double V_n$, and hence $abs(F) > rho > abs(w)$ on $partial V_n$.

  On $partial V_n$ we have $abs(w / F) < 1$. By compactness, the same inequality holds on some open neighborhood of $partial V_n$. Therefore, $1 - w / F$ attains values in $D(1,1) subset CC^*$ on this neighborhood and $eta = Log(1 - w / F)$ is holomorphic there (using the principal branch). Since
  $
    F(z) - w = F(z) (1 - w / (F(z))),
  $
  logarithmic differentiation gives
  $
    (F'(z)) / (F(z) - w) - (F'(z)) / F(z) = eta'(z),
  $
  where the right-hand side is the derivative of a holomorphic function on a neighborhood of $partial V_n$. Let $gamma:[0,1] -> partial V_n$ be a closed piecewise $C^1$ parametrization. Neither $F$ nor $F - w$ vanishes on $partial V_n$, so the Argument Principle (@thm:argument-principle-holomorphic) yields
  $
    N_(V_n)(F - w) - N_(V_n)(F) & = 1 / taui integral_(partial V_n) [(F'(z)) / (F(z) - w) - (F'(z)) / F(z)] dz \
                                & = 1 / taui integral_(partial V_n) eta'(z) dz \
                                & = 1 / taui integral_0^1 eta'(gamma(t))gamma'(t) dt \
                                & = 1 / taui [eta(gamma(1)) - eta(gamma(0))] = 0.
  $
  Thus $N_(V_n)(F - w) = N_(V_n)(F) = 1$, where zeros are counted with multiplicity. Every zero of $F - w$ in all of $U$ belongs to $K_rho subset V_n$, so this is also the total number of solutions of $F(z) = w$ in $U$. Since $w$ was arbitrary, $F$ is bijective; the multiplicity statement also gives $F' != 0$, so $F:U -> DD$ is biholomorphic.

  //tbc: extension to a general domain
]
