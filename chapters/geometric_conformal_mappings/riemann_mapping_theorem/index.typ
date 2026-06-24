#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [The Riemann Mapping Theorem],
  route: "riemann_mapping_theorem",
)
The Riemann Mapping Theorem is one of the most profound results in complex analysis; in the case of one dimension, it establishes sufficient conditions for the biholomorphic equivalence between two open subsets of the complex plane.

If there exists a biholomorphism $f$ between two regions, then the two regions are said to be _conformally equivalent_, _holomorphically equivalent_, or _biholomorphically equivalent_. As a required intermediate for the proof, we first introduce:
#definition("Holomorphic Logarithms")[
  Suppose $Phi:U -> CC^* = CC without {0}$ is holomorphic, where $U$ is simply connected. Define the _holomorphic logarithm_ of $Phi(z)$ to be a branch of
  $
    log(Phi(z)) = integral_gamma (Phi'(zeta)) / (Phi(zeta)) dzeta + log(Phi(z_0))
  $
  for any $z_0 in U$, where the integral is path-independent $gamma subset U$ is any piecewise $C^1$ curve from $z_0$ to $z$.

  Similarly, define the _holomorphic powers_ of $Phi(z)$ to be branches of $(Phi^alpha) (z) = ee^(alpha log(Phi(z)))$, where $log(Phi(z))$ is the holomorphic logarithm.
]
The path independence of the definition is provided by the simple connectivity of $U$. The result is the heuristic concatenation of several different branches of the complex logarithm, unique up to an additive factor of $2 uppi ii k$, where this additive factor is the same throughout.
#theorem("Riemann Mapping Theorem")[
  Let $U subset CC$ (a proper subset, in other words, $U != CC$) be a simply connected (nonempty) open region. Let $z_0 in U$ be arbitrary. Then there exists a unique biholomorphism $f:U -> DD$ such that $f(z_0) = 0$ and $f'(z_0) in RR_(> 0)$.
] <thm:riemann_mapping>

#proof[
  First consider the case for when $U$ is a bounded region. In other words, $exists R > 0$ such that $U subset.eq D(0, R)$.

  Define $cal(F)$ to be the family of all univalent functions $alpha:U -> DD$ (not necessarily surjective) such that $alpha(z_0) = 0$. This family is well-defined and nonempty.

  To prove this assertion, observe that since $z_0 in D(0, R)$, it follows that $forall z in U subset.eq D(0, R)$, $abs(z - z_0) < 2 R$, and consequently, $abs((z - z_0) / (2 R)) < 1$. Therefore,
  $
    alpha(z) = (z - z_0) / (2 R)
  $
  maps $U$ to $DD$, and it is linear and univalent. This shows that $alpha in cal(F)$. It is easy to prove that $cal(F)$ is infinite; any function in the form of $z |-> (z - z_0) / zeta$ for $zeta >= 2 R$ also lies in $cal(F)$.

  Since $cal(F)$ is uniformly bounded on $U$, by Montel's Theorem (@thm:montel), $cal(F)$ is a normal family. Let $r > 0$ satisfy $overline(D(z_0, r)) subset U$. Then by Cauchy's Estimate (@thm:cauchys_estimate), $forall alpha in cal(F)$, $abs(alpha') <= 1 / r$ on $overline(D(z_0, r))$. Hence, we have
  #lbl(
    $
      0 < M = sup_(alpha in cal(F)) abs(alpha'(z_0)) <= 1 / r,
    $,
    <eq:riemann_mapping_fixedpointderivativesupremum>,
  )
  where we can assure that $M$ is positive since each $alpha in cal(F)$ is univalent at $z_0$ and by @lem:univalentnonvanishingderivative.

  If $M$ is an accumulation point of ${abs(alpha'(z_0))}_(alpha in cal(F))$, there exists a sequence ${alpha_n}_(n in NN) subset.eq cal(F)$ such that ${abs(alpha'_n (z_0))}_(n in NN)$ converges to $M$. If $M$ is attained as a maximum or that $abs(alpha'(z_0)) = M$ for some $alpha in cal(F)$, we may let each $alpha_n equiv alpha$.

  By the normality of $cal(F)$, there exists a subsequence ${alpha_(n_k) (z)}_(k in NN) subset.eq {alpha_n (z)}_(n in NN)$ such that ${alpha_(n_k) (z)}_(k in NN)$ is locally uniformly convergent in $U$ to a function $doubletilde(alpha)(z)$ (holomorphy of which is provided by @thm:weierstrass_convergence). By definition, $abs(doubletilde(alpha)'(z_0)) = M$, and define a function sequence with $tilde(alpha)_(n_k) = alpha_(n_k) abs(doubletilde(alpha)'(z_0)) / (doubletilde(alpha)'(z_0)) in cal(F)$, whose locally uniform limit is $f$. It follows that $f$ is a rotation of $doubletilde(alpha)$ such that $f'(z_0) = M$.

  Let $zeta_1, zeta_2 in U$ be arbitrary and different. Choose $r' > 0$ to satisfy $0 < r' < abs(zeta_1 - zeta_2)$, and let $psi_k (z) = tilde(alpha)_(n_k) (z) - tilde(alpha)_(n_k) (zeta_2)$. Since each $tilde(alpha)_(n_k)$ is univalent in $U$, it follows that each $psi_k$ is non-vanishing in $U without {zeta_2}$ and consequently, in $overline(D(zeta_1, r'))$. By @thm:hurwitzsimplecase, it follows that the locally uniform limit of $psi_k$, or $psi = f(z) - f(zeta_2)$, is either non-vanishing or is identically zero in $overline(D(zeta_1, r'))$. The latter is an impossibility since $psi'(z_0) = M > 0$. Hence, $f(z) = f(zeta_2)$ has no solutions for $z in overline(D(zeta_1, r'))$. In particular, $f(zeta_1) != f(zeta_2)$. By the arbitrariness of $zeta_1$ and $zeta_2$, the univalence of $f$ follows.

  Additionally, since $forall k in NN$, $abs(tilde(alpha)_(n_k)) < 1$ in $U$, it follows that $f(U) subset.eq overline(DD)$. By the Open Mapping Theorem (@thm:open_mapping), the condition becomes $f(U) subset.eq DD$. Since $tilde(alpha)_(n_k) (z_0) = 0$ for all $k in NN$ and $tilde(alpha)_(n_k) (z_0) -> 0 = f(z_0)$, it follows that $f in cal(F)$.

  Lastly, we aim to prove that $f$ maps $U$ to $DD$ surjectively. For the sake of contradiction, assume that $exists xi in DD^*$ such that $xi in.not f(U)$. Consider the unit disk automorphism $phi_xi (z) = (z - xi) / (1 - z overline(xi))$. Since $phi_xi (z)$ vanishes when $z = xi$, and since $f(z) = xi$ has no solutions in $U$, there exists a holomorphic square root
  $
    mu(z) = sqrt(phi_xi compose f(z)) in DD
  $
  for $z in U$. Let $tau = mu(z_0) = sqrt(-xi)$, and let
  $
    eta(z) = phi_tau compose mu(z),
  $
  where $phi_tau = (z - tau) / (1 - z overline(tau))$. Since $eta(z_0) = phi_tau (tau) = 0$, it follows that $eta in cal(F)$. Let $tilde(eta) = abs(eta'(z_0)) / (eta'(z_0)) eta$, which is also in $cal(F)$. However, since $tilde(eta)' = abs(eta'(z_0)) / (eta'(z_0)) eta'$, we have
  $
    tilde(eta)'(z_0) & = abs((f'(z_0) (phi'_tau compose tau) (phi'_xi compose 0)) / (2 sqrt(phi_xi compose 0))) \
    & = M / (2 sqrt(abs(xi))) (1 - overline(tau) tau) / ((1 - tau overline(tau))^2) (1 - overline(xi) xi) / ((1 - 0 overline(xi))^2) \
    & = M / (2 sqrt(abs(xi))) (1 - abs(xi)^2) / (1 - abs(xi)) = (M (1 + abs(xi))) / (2 sqrt(abs(xi))).
  $
  Additionally, since
  $
    (sqrt(abs(xi)) - 1)^2 > 0 <==> 1 + abs(xi) > 2 sqrt(abs(xi)) <==> (1 + abs(xi)) / (2 sqrt(abs(xi))) > 1,
  $
  it follows that $tilde(eta)'(z_0) > M$, which is a contradiction of @eq:riemann_mapping_fixedpointderivativesupremum.

  Hence, $f:U -> DD$ is biholomorphic. To prove the uniqueness of $f$, suppose $g:U -> DD$ is an arbitrary biholomorphism such that $g(z_0) = 0$ and $g'(z_0) > 0$. Then, $phi = f compose g^(-1) in Aut(DD)$, and by @thm:holomorphicautomorphismgrouponunitdisk, $phi(z) = phi_a (z ee^(ii theta))$ for some $a in DD$ and $0 <= theta < 2 uppi$. Since $phi(0) = 0$, it follows that $a = 0$. Since $phi'(0) = f'(z_0) (g^(-1))'(0) = f'(z_0) / (g'(z_0)) > 0$, and $phi'(0) = phi'_0 (0) ee^(ii theta) = ee^(ii theta) > 0$, it follows that $theta = 0$. Hence, we have $phi(z) = z$ and $f equiv g$.

  Next, assume that $U$ is unbounded. It is easy to show that the boundary $partial U$ contains at least two points. Indeed, if $partial U = emptyset$, $U$ would be closed because $partial U subset.eq U$ and open by assumption. By @thm:connected_topological_space_clopen_sets, $U$ would either be equal to $emptyset$ or $CC$, both of which are impossibilities. Additionally, if $partial U$ comprises exactly one point $a in CC$, then in subspace defined by $X = CC without {a}$, $U$ is clopen (by the same reason as before, open by assumption and closed because $X without U = CC without overline(U)$ is open). It follows that $U = X = CC without {a}$, which is not simply connected.

  Suppose $xi_1$ and $xi_2$ are two distinct points in $partial U$. Let us apply the linear transformation $rho(z) = (z - xi_1) / (xi_2 - xi_1)$ to $U$, and denote the resulting region by $U' = rho(U)$. It follows that $0, 1 in partial U'$. Consider a branch $psi(z)$ of the holomorphic square root $z |-> sqrt(z - 1)$ (existent by the holomorphic logarithm from simple connectivity and the fact that $1 in.not U'$). Trivially, $psi$ is univalent in $U'$.

  In addition, we assert that $psi(U') inter (-psi(U')) = emptyset$. If not, then $exists xi in psi(U')$ such that $-xi in psi(U')$. By definition, $exists z_1, z_2 in U'$ such that $psi(z_1) = xi$ and $psi(z_2) = -xi$. It would then follow that $sqrt(z_1 - 1) = -sqrt(z_2 - 1)$ and $z_1 = z_2$. It follows that $xi = 0$, which is obtained when $z_1 = z_2 = psi^(-1)(xi) = 1$. Since $1 in partial U'$ and $U'$ is open, $1 in.not U'$, which is an impossibility.

  Fix $xi in psi(U')$ to be arbitrary. By the Open Mapping Theorem (@thm:open_mapping), there exists an open neighborhood $D(xi, epsilon) subset.eq psi(U')$. It follows that $D(-xi, epsilon) inter psi(U') = emptyset$. Therefore, $forall z in U'$, $abs(psi(z) + xi) >= epsilon$, and consequently, $abs(1 / (psi(z) + xi)) <= 1 / epsilon$. Hence, the function $phi(z) = 1 / (z + xi)$ maps $U'$ to a bounded region that lies within the compact disk $overline(D(0, 1 / epsilon))$. Denote $phi compose psi(U')$ by $tilde(U)$.

  It is easy to see that $tilde(U)$ is simply connected. Let $tilde(U) = phi compose psi compose rho(U)$. To prove this, it suffices to show that the line integral of any holomorphic function over any closed curve in $tilde(U)$ vanishes. Let $g:tilde(U) -> CC$ be holomorphic, and let $Gamma subset tilde(U)$ be a closed piecewise $C^1$ curve. Then
  $
    integral.cont_Gamma g(w) dif w
    =
    integral.cont_(rho^(-1) compose psi^(-1) compose phi^(-1)(Gamma))
    g compose phi compose psi compose rho(z) dot (phi compose psi compose rho)'(z) dz=0,
  $
  by Cauchy--Goursat (@thm:cauchygoursattheorem), since $U$ is simply connected by assumption, $rho^(-1) compose psi^(-1) compose phi^(-1)(Gamma)$ is a closed piecewise $C^1$ curve in $U$, and the integrand is holomorphic on $U$. Therefore, $tilde(U)$ is simply connected.

  Hence, we may use our previous result and establish a biholomorphism $tilde(f):tilde(U) -> DD$, unique up to a transformation in $Aut(DD)$. Let $f = tilde(f) compose phi compose psi compose rho$, which is a biholomorphism from $U$ to $DD$. Similarly, it is unique up to a transformation in $Aut(DD)$, and the same assertion follows.
]

#remark[
  It is natural that we require $U != CC$; if there exists a univalent function $f:CC -> DD$, then by Liouville's Theorem (@thm:liouville), $f$ would be a constant function.

  As we will see in @sec:multivariatecomplexanalysis, this theorem and many other properties of one-variable holomorphic functions do not extend to functions of several complex variables.
]
