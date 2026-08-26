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
#lbl(
  lemma[
    Let $U subset.eq CC$ be an open, nonempty, simply connected region and fix $z_0 in U$. There is a sequence ${U_n}_(n in NN)$ of bounded simply connected polygonal domains such that
    $ z_0 in U_1, quad overline(U_n) subset.double U_(n + 1), quad union.big_(n in NN) U_n = U. $
    Moreover, every point of $partial U_n$ satisfies the exterior segment condition in @thm:barrier-exterior-segment.
  ],
  <lem:simply-connected-polygonal-exhaustion>,
)
#proof[
  If $U = CC$, the interiors of the closed squares centered at $z_0$ with side lengths $2 n$ already give the required exhaustion. Suppose therefore that $U != CC$. For $z in CC$, define
  $ delta(z) = inf({abs(z - a) : a in CC without U}). $
  The triangle inequality gives $abs(delta(z) - delta(zeta)) <= abs(z - zeta)$, so $delta$ is continuous. Choose $n_0 in NN$ such that $abs(z_0) < n_0$ and $1 / n_0 < delta(z_0)$, and for each $n in NN$ set
  $ E_n = {z in CC : abs(z) <= n_0 + n "and" delta(z) >= 1 / (n_0 + n)}. $
  Each $E_n$ is closed because $delta$ is continuous and bounded because $abs(z) <= n_0 + n$; hence $E_n$ is compact. Moreover, if $z in E_n$, then
  $ abs(z) <= n_0 + n < n_0 + n + 1 quad "and" quad delta(z) >= 1 / (n_0 + n) > 1 / (n_0 + n + 1). $
  Both inequalities are strict for the defining bounds of $E_(n + 1)$, so continuity of $abs(dot.c)$ and $delta$ gives $E_n subset interior(E_(n + 1))$.

  Let $K_n$ be the connected component of $E_n$ containing $z_0$. This component exists because the choice of $n_0$ places $z_0$ in $interior(E_n)$ for every $n$, and it is compact because every component of a compact set is closed. Since $K_n$ is connected, contains $z_0$, and lies in $E_n subset interior(E_(n + 1))$, it is contained in $K_(n + 1)$ (as $K_n$ lies in the connected component of $E_(n+1)$ containing $z_0$).

  In fact, $K_n subset interior(K_(n + 1))$: for each $z in K_n$, since $exists r$ such that $D(z,r) subset.eq E_(n + 1)$. Then $K_n union D(z,r)$ is a connected subset of $interior(E_(n + 1))$, so it lies entirely in $K_(n + 1)$ (as this is the maximal connected subset containing $z_0$). Then a neighborhood of $K_n$ lies in $K_(n+1)$, so $K_n subset.double interior(K_(n + 1))$.

  Finally, the sets $K_n$ exhaust $U$. Given $z in U$, choose a path $gamma : [0, 1] -> U$ from $z_0$ to $z$. Its image is a compact subset of $U$, so
  $ M = max_(0 <= t <= 1) abs(gamma(t)) < oo quad "and" quad m = min_(0 <= t <= 1) delta(gamma(t)) > 0. $
  Choose $n$ sufficiently large so that $n_0 + n > M$ and $1 / (n_0 + n) < m$ (i.e., $n > max(M, 1 / m) - n_0$). Then
  $ abs(gamma(t)) < n_0 + n quad "and" quad delta(gamma(t)) > 1 / (n_0 + n) $
  for every $0 <= t <= 1$. Hence $gamma([0, 1]) subset E_n$, which places $z$ in the same component of $E_n$ as $z_0$. Thus $z in K_n$, proving $union.big_(n in NN) K_n = U$.

  Set
  $ sigma_n = inf({abs(z_2 - z_1) : z_2 in K_n and z_1 in CC without interior(K_(n + 1))}), $
  which is positive because $K_n subset.double interior(K_(n + 1))$. Consider the grid of compact squares
  $ Q_n^((j, k)) = {x + ii y : j sigma_n / 2 <= x <= (j + 1) sigma_n / 2, k sigma_n / 2 <= y <= (k + 1) sigma_n / 2} $
  and let
  $ cal(G)_n = {Q_n^((j, k)) : (j, k) in ZZ^2 "and" Q_n^((j, k)) inter K_n != emptyset}. $
  This collection is finite because $K_n$ is compact. Each square has diagonal $sigma_n / sqrt(2) < sigma_n$; hence no square in $cal(G)_n$ can meet $CC without interior(K_(n + 1))$. Therefore,
  $ tilde(K_n) = union.big_(Q in cal(G)_n) Q $
  is a compact superset of $K_n$ contained in $interior(K_(n + 1))$.

  In fact, $K_n subset.double interior(tilde(K_n))$. Otherwise, some $z in K_n$ would lie on $partial tilde(K_n)$. If $z in partial tilde(K_n)$ lay on the side of some square, the square adjacent across that edge would also meet $K_n$ at $z$ and would belong to $cal(G)_n$, so the edge (interior) could not lie on the boundary. At a grid vertex, every adjacent square containing $z$ would likewise belong to $cal(G)_n$, again contradicting $z in partial tilde(K_n)$. Thus
  $ K_n subset.double interior(tilde(K_n)) subset K_(n + 1) subset.double interior(tilde(K_(n + 1))). $

  The interior of $tilde(K_n)$ may fail to be simply connected because the grid union can surround holes. Then let $W_n$ be the component of $extcomplex without tilde(K_n)$ containing $oo$, and define the filled hull
  $ P_n = extcomplex without W_n. $
  Thus $P_n$ consists of $tilde(K_n)$ together with every bounded component of $CC without tilde(K_n)$, effectively "filling in the holes."

  We claim that $P_n subset.double U$. Since $U$ is simply connected, $extcomplex without U$ is connected. It contains $oo$ and is disjoint from $tilde(K_n) subset U$, so it lies entirely in $W_n$. Taking complements gives $P_n subset U$; since $P_n$ is compact, $P_n subset.double U$.

  Filling holes preserves compact nesting, so
  $ P_n subset.double interior(P_(n + 1)). $
  Set $U_n = interior(P_n)$. Because
  $ K_n subset interior(tilde(K_n)) subset U_n subset P_n subset U $
  and $union.big_(n in NN) K_n = U$, we have $union.big_(n in NN) U_n = U$. The complement of $U_n$ in the extended plane is connected, so $U_n$ is simply connected. Its boundary is polygonal because filling holes only removes some boundary components of the finite grid union.

  Finally, every point of $partial U_n$ admits an exterior line segment: at an edge choose a segment pointing into the exterior half-plane, and at a vertex choose one lying in an exterior sector. This concludes the proof.
]

#thm-state.thm-restate("thm:riemann-mapping")
#proof[
  First consider the case where $U$ is a bounded region whose boundary is sufficiently regular (in the sense that each point admits a barrier) and $0 in U$. Then there is a solution $u$ to the Dirichlet Problem (@thm:solution-to-the-dirichlet-problem) in $U$ with the continuous boundary function $z mapsto -log abs(z)$. Obviously, the function $u$ cannot be equivalent to $-log abs(z)$ in the interior since the latter would approach $oo$ at $0$. Let
  $ Phi(z) = log abs(z) + u(z), $
  then $Phi$ vanishes on $partial U$ and approaches $-oo$ near $0$. Then for some $epsilon > 0$,
  $ Phi(z) < 0 $
  on $overline(D(0, epsilon)) without {0}$. On $U without overline(D(0, epsilon))$, the function $Phi$ is harmonic, is zero on the portion of the boundary contained in $partial U$, and is negative on $partial D(0, epsilon)$. Thus @prop:subharmonic-boundary-maximum-principle first gives $Phi <= 0$ there. Combining this with the strict inequality near $0$ gives $Phi <= 0$ throughout $U without {0}$. If $Phi$ vanished at an interior point, the Maximum Principle (@thm:maximum-principle-for-real-harmonic-functions) applied on the connected region $U without {0}$ would force $Phi$ to be constant, contradicting $Phi(z) -> -oo$ as $z -> 0$. Therefore, $Phi < 0$ throughout $U without {0}$.

  Let $psi(z) = u'_x (z) - ii u'_y (z)$, which is complex-harmonic ($laplacian psi equiv 0$). By elliptic regularity, $psi$ is $C^oo$, and moreover,
  $
    pdv(psi, overline(z)) equiv 1 / 2 (pdv(, x) + ii pdv(, y))(u'_x - ii u'_y) equiv 1 / 2 (u''_(x x) + u''_(y y)) = 0.
  $
  Therefore, $psi$ is holomorphic on the simply connected set $U$, thus the function
  $ f(z) = integral_0^z psi(zeta) dzeta + u(0) $
  is well-defined and holomorphic. Moreover,
  $
    Re f(z) & = integral_0^z [u'_x (zeta) dd((Re(zeta))) + u'_y (zeta) dd((Im(zeta)))] + u(0) \
            & = integral_0^z dd((u(zeta))) + u(0) = u(z).
  $
  Therefore, $f$ is a holomorphic function whose real part is $u$, unique up to an additive imaginary constant. Define the holomorphic function
  $ F(z) = z exp[f(z)]. $
  Observe that $F(U) subset.eq DD$ since
  $ abs(F(z)) = abs(z) exp(Re f(z)) = exp(Phi(z)) < 1 $
  for $z != 0$, while $F(0) = 0$. It has precisely one zero, and since
  $ F'(0) = evaluated(exp[f(z)] (1 + z f'(z)))_(z = 0) = exp(u(0)) > 0, $
  it is a simple zero. Moreover, $abs(F(z)) = exp(Phi(z)) -> 1$ whenever $z -> partial U$ from within $U$. Consequently, $F : U -> DD$ is proper by the same boundary-compactness argument used in the proof of @thm:annular-conformal-equivalence.

  We next prove that every $w in DD$ is assumed exactly once. We aim to use the Argument Principle, but note that $F$ need not be holomorphic on a neighborhood of $overline(U)$, and hence we exhaust $U$ with compact sets. Choose $rho$ with $abs(w) < rho < 1$ and set
  $ K_rho = {z in U : abs(F(z)) <= rho}. $
  Since $overline(D(0, rho)) subset.double DD$ is compact and $K_rho = F^(-1)(overline(D(0, rho)))$, properness gives that $K_rho subset.double U$ is compact. By @lem:simply-connected-polygonal-exhaustion, choose a polygonal exhaustion ${V_n}_(n in NN)$ of $U$. For all sufficiently large $n$, $K_rho subset.double V_n$, and hence $abs(F) > rho > abs(w)$ on $partial V_n$.

  On $partial V_n$ we have $abs(w / F) < 1$. By compactness, the same inequality holds on some open neighborhood of $partial V_n$. Therefore, $1 - w / F$ attains values in $D(1, 1) subset CC^*$ on this neighborhood and $eta = Log(1 - w / F)$ is holomorphic there (using the principal branch). Since
  $ F(z) - w = F(z) (1 - w / F(z)), $
  logarithmic differentiation gives
  $ (F'(z)) / (F(z) - w) - (F'(z)) / F(z) = eta'(z), $
  where the right-hand side is the derivative of a holomorphic function on a neighborhood of $partial V_n$. Let $gamma : [0, 1] -> partial V_n$ be a closed piecewise $C^1$ parametrization. Neither $F$ nor $F - w$ vanishes on $partial V_n$, so the Argument Principle (@thm:argument-principle-holomorphic) yields
  $
    N_(V_n) (F - w) - N_(V_n) (F) & = 1 / taui integral.cont.ccw_(partial V_n) [(F'(z)) / (F(z) - w) - (F'(z)) / F(z)] dz \
                                  & = 1 / taui integral.cont.ccw_(partial V_n) eta'(z) dz \
                                  & = 1 / taui integral_0^1 eta'(gamma(t)) gamma'(t) dt \
                                  & = 1 / taui [eta(gamma(1)) - eta(gamma(0))] = 0.
  $
  Thus $N_(V_n) (F - w) = N_(V_n) (F) = 1$, where zeros are counted with multiplicity. Every zero of $F - w$ in all of $U$ belongs to $K_rho subset V_n$, so this is also the total number of solutions of $F(z) = w$ in $U$. Since $w$ was arbitrary, $F$ is bijective; the multiplicity statement also gives $F' != 0$, so $F : U -> DD$ is biholomorphic.

  Now lift the regularity restriction upon $partial U$. By @lem:simply-connected-polygonal-exhaustion, choose a nested exhaustion ${U_n}_(n in NN)$ of $U$ by simply connected polygonal domains with $0 in U_1$. Every point of $partial U_n$ satisfies the exterior segment condition, so the regular-boundary case gives a biholomorphism $F_n : U_n -> DD$ such that $F_n (0) = 0$ and $F_n ' (0) in RR_(>0)$.

  For fixed $m$, the tail ${F_n}_(n >= m)$ is defined and bounded by $1$ on $U_m$, so it is normal there by Montel's Theorem (@thm:montel). We construct nested subsequences inductively.

  First choose a subsequence ${F_(n_(1, k))}_(k in NN)$ converging locally uniformly on $U_1$.

  If for a given $j$, ${F_(n_(j, k))}_(k in NN)$ converges locally uniformly on $U_j$, discard finitely many terms so that $n_(j, k) >= j + 1$. The remaining functions are defined and bounded by $1$ on $U_(j + 1)$; Montel's Theorem therefore provides a further subsequence ${F_(n_(j + 1, k))}_(k in NN)$ converging locally uniformly on $U_(j + 1)$.

  Let $G_k = F_(n_(k, k))$ be the diagonal subsequence. For each fixed $j$, the tail ${G_k}_(k >= j)$ is a subsequence of the sequence chosen at stage $j$, so it converges locally uniformly on $U_j$ to a holomorphic limit $Psi_j : U_j -> overline(DD)$ by Weierstrass (@thm:weierstrass-convergence). These limits agree on overlaps: if $i < j$, then both $Psi_i$ and $evaluated(Psi_j)_(U_i)$ are limits of the same tail on $U_i$. Consequently, they define a holomorphic function $Psi : U -> overline(DD)$ satisfying $evaluated(Psi)_(U_j) = Psi_j$, and $G_k -> Psi$ locally uniformly on $U$.

  It remains to show that $Psi$ is a biholomorphism and not a constant limit. Since $U$ is bounded, choose $0 < r < R$ such that
  $ D(0, r) subset.eq U_1 subset.eq U subset.eq D(0, R). $
  Let $H_k = G_k^(-1) : DD -> U_(n_(k, k))$. Schwarz's Lemma (@lem:schwarz) applied to $z mapsto G_k (r z)$ and $z mapsto (H_k (z)) / R$ gives
  $ abs(evaluated(dv(, z) (G_k (r z)))_(z = 0)) = r abs(G'_k (0)) <= 1 $
  and
  $ abs(evaluated(dv(, z) ((H_k (z)) / R))_(z = 0)) = 1 / (R G'_k (H_k (0))) = 1 / (R G'_k (0)) <= 1; $
  hence
  $ 1 / R <= G'_k (0) <= 1 / r quad "and" quad r <= H'_k (0) <= R. $
  Consequently, by the Weierstrass Convergence Theorem (@thm:weierstrass-convergence), $Psi'(0) = lim_(k -> oo) G'_k (0) >= 1 / R > 0$, so $Psi$ is nonconstant. Since $Psi(U) subset.eq overline(DD)$, the Open Mapping Theorem (@thm:open-mapping) then implies that $Psi(U) subset DD$.

  The family ${H_k}$ is uniformly bounded by $R$ on $DD$, so Montel's Theorem provides indices $k_1 < k_2 < dots.c$ for which $H_(k_j) -> H$ locally uniformly on $DD$, where $H : DD -> overline(U)$ is holomorphic. Replace ${G_k}$ by the corresponding subsequence ${G_(k_j)}$. Since the original sequence ${G_k}$ converges locally uniformly to $Psi$, this subsequence still converges to $Psi$. Relabeling the paired subsequences as ${G_k}$ and ${H_k}$, we henceforth have
  $ G_k arrows Psi "locally uniformly on" U quad "and" quad H_k arrows H "locally uniformly on" DD, $
  while $G_k (H_k (w)) = w$ and $H_k (G_k (z)) = z$ whenever the expressions are defined. By Weierstrass convergence, $H'_k (0) >= r$ for each $k$ gives $H'(0) >= r > 0$, so $H$ is nonconstant.

  We claim that $H(DD) subset U$ rather than merely $H(DD) subset.eq overline(U)$. Fix $a in CC without U$. Every function $H_k - a$ is nonvanishing on $DD$; hence Hurwitz's Theorem (@thm:hurwitz-simple-case) implies that $H - a$ is either nonvanishing or identically zero. The latter is impossible because $H$ is nonconstant. Since $a$ was arbitrary, $H$ omits $CC without U$, proving the claim.#footnote[The Open Mapping Theorem alone is insufficient: it would only give $H(DD) subset.eq interior(overline(U))$, which may be strictly larger than $U$. For example, if $U$ is a slit disk such as $DD without RR_(<= 0)$, then $interior(overline(U)) = DD$.]

  We may now pass to the limit in the inverse identities. Fix $w in DD$. Since $H(w) in U$, choose a compact neighborhood $H(w) in.rev L subset.double U$. Since $H_k (w) -> H(w)$, we have $H_k (w) in L$ for all sufficiently large $k$. Moreover, the exhaustion ensures that $L$ lies in the domain of $G_k$ for all sufficiently large $k$. Therefore,
  $
    abs(G_k (H_k (w)) - Psi(H(w))) & <= abs(G_k (H_k (w)) - Psi(H_k (w))) \
                                   & quad "" + abs(Psi(H_k (w)) - Psi(H(w))) -> 0.
  $
  The first term tends to $0$ because $G_k arrows Psi$ on $L$, while the second tends to $0$ because $H_k (w) -> H(w)$ and $Psi$ is continuous. Since $G_k (H_k (w)) = w$ for every $k$, it follows that
  $ Psi(H(w)) = w. $
  As $w in DD$ was arbitrary, this equality holds throughout $DD$.

  Conversely, fix $z in U$. The exhaustion places $z$ in the domain of $G_k$ for all sufficiently large $k$. Since $G_k (z) -> Psi(z) in DD$, choose a compact neighborhood $M subset.double DD$ of $Psi(z)$; then $G_k (z) in M$ for all sufficiently large $k$. Hence,
  $
    abs(H_k (G_k (z)) - H(Psi(z))) & <= abs(H_k (G_k (z)) - H(G_k (z))) \
                                   & quad "" + abs(H(G_k (z)) - H(Psi(z))) -> 0.
  $
  Here the first term tends to $0$ because $H_k -> H$ uniformly on $M$, and the second tends to $0$ by the continuity of $H$. Since $H_k (G_k (z)) = z$ for all sufficiently large $k$, we conclude that
  $ H(Psi(z)) = z. $
  As $z in U$ was arbitrary, this equality holds throughout $U$.

  Therefore, $Psi : U -> DD$ is biholomorphic for every bounded simply connected proper region $U$.

  Finally, an arbitrary distinguished point $z_0$ is reduced to $0$ by translation. If $U$ is unbounded, apply the square-root and linear-fractional reduction to a bounded simply connected region established in the preceding proof of @thm:riemann-mapping, apply the bounded case above, and compose the resulting maps. A disk automorphism then imposes $Psi(z_0) = 0$ and $Psi'(z_0) > 0$. Uniqueness follows from the classification of $Aut(DD)$ in @thm:holomorphic-automorphism-group-on-unit-disk.
]
