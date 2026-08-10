#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [The Perron Method and the Solution to the Dirichlet Problem],
  route: "perron-method-and-the-solution-to-the-dirichlet-problem",
)
The method we provide here is due to Oskar Perron, which will subsequently apply to a large variety of curves (although it is not of highest possible generality, it will suffice for our general purposes).

Similar to the Riemann Mapping Theorem, the solution here will also pertain largely to solving an extremal problem. Moreover, as a corollary to the problem, one also will obtain a proof of the Riemann Mapping Theorem (which in spirit, is much closer to the original proof of the mapping theorem).
#lbl(
  proposition[Boundary Maximum Principle][
    Let $U subset CC$ be a bounded region and $h:U -> RR$ be subharmonic. Suppose that there is some $A in RR$ such that
    $
      limsup_(z -> q \ z in U) h(z) <= A
    $
    for every $q in partial U$. Then $h <= A$ throughout $U$.
  ],
  <prop:subharmonic-boundary-maximum-principle>,
)
#proof[
  For each $epsilon > 0$, define $ E_epsilon = {z in U : h(z) >= A + epsilon} subset.eq U. $
  We aim to show that $E_epsilon = emptyset$, thus for contradiction, first assume otherwise.

  Let $z in CC without E_epsilon$. If we are able to show that a neighborhood of $z$ lies in $CC without E_epsilon$, then $CC without E_epsilon$ is open and $E_epsilon$ is then closed.

  + If $z in CC without overline(U)$, such a neighborhood holds trivially, in particular $exists V in.rev {z}$ open such that $V in CC without overline(U) subset.eq CC without E_epsilon$.

  + If $z in partial U$, then $exists delta > 0$ such that for all $forall zeta in U$ with $abs(z - zeta) < delta$,
    $ h(zeta) < limsup_(zeta -> z \ zeta in U) h(zeta) + epsilon <= A + epsilon $
    by the definition of $limsup$, meaning that $U inter D(z, delta) subset.eq CC without E_epsilon$. Moreover, $D(z, delta) without U subset.eq CC without E_epsilon$ as well since $E_epsilon subset.eq U$. Therefore, $D(z, delta) subset.eq CC without E_epsilon$.

  + If $z in U without E_epsilon$, then $h(z) < A + epsilon$. By continuity, there exists a neighborhood $V in.rev z$ on which $h < A + epsilon$ holds.

  Therefore, $CC without E_epsilon$ is open; then $E_epsilon$ is closed in $CC$. Since $U$ is bounded, $E_epsilon$ is compact. Then $h$ attains a finite maximum $A'$ within $E_epsilon$ by continuity (by the Extreme Value Theorem, @thm:extreme-value) at some point $z$.

  By definition of $E_epsilon$, $A' >= h(z) >= A + epsilon$ for $z in E_epsilon$. Outside of $E_epsilon$, $A' >= h$ continues to hold as $h < A + epsilon$. Therefore $A'$ is an absolute maximum of $h$ on all of $U$. By the Maximum Principle for subharmonic functions (@thm:maximum-principle-for-subharmonic-functions), $h equiv A' >= A + epsilon$ must be constant on $U$.

  Therefore $forall q in partial U$, $limsup_(zeta -> q \ zeta in U) h(zeta) = A' > A$, which contradicts the hypothesis. Therefore, $E_epsilon$ must be the empty set.

  Hence, for any $epsilon > 0$, $E_epsilon = emptyset$; which implies that $forall z in U$, $h(z) <= A$.
]
#lbl(
  theorem[Solution to the Dirichlet Problem][
    Let $U$ be a bounded open region such that for each point $p in partial U$, there is a barrier $b_p : overline(U) -> RR$. Then $forall f in C(partial U, RR)$, $exists! u in C(overline(U), RR)$ harmonic in $U$ such that $u equiv f$ on $partial U$.
  ],
  <thm:solution-to-the-dirichlet-problem>,
)
#proof[
  Let
  #lbl(
    $ S = {psi : psi "is subharmonic on" U "and" forall p in partial U, limsup_(z -> p \ z in U) psi(z) <= f(p)} $,
    <eq:solution-to-the-dirichlet-problem-S-set>,
  )
  By the compactness of $partial U$, let $m = min_(z in partial U) f(z)$ and $M = max_(z in partial U) f(z)$. Then $(z mapsto m) in S$, meaning $S != emptyset$. Let $u:U -> RR$ be defined by
  $ u(z) = sup_(psi in S) psi(z). $
  It will turn out to be the case that $u$ is the precise solution for which we are searching, it remains to verify its harmonicity and extension to $f$.
  #claim[
    $sup_(z in U) u(z) <= M$.
  ]
  #proof[
    Let $psi in S$. Then for every $q in partial U$,
    $
      limsup_(z -> q \ z in U) psi(z) <= f(q) <= M.
    $
    By @prop:subharmonic-boundary-maximum-principle, $psi <= M$ on $U$. Taking the supremum over $psi in S$ gives $u <= M$.
  ]
  #claim[
    The function $u$ is harmonic in $U$.
  ]
  #proof[
    Let $overline(D(a,r)) subset.double U$ be arbitrary. Then for each $p in D(a,r)$, since $u(p) = sup_(psi in S) psi(p)$, there is some sequence of functions ${psi_(p,n)}_n$ such that $lim_(n -> oo) psi_(p,n) (p) = u(p)$.

    For $z in U$, define the function sequence ${Psi_(p,n)}_n$ of partial maximums $ Psi_(p,n) (z) = max_(k = 1)^n psi_(p,k) (z). $
    By @prop:subharmonic-pointwise-maximum-is-subharmonic, ${Psi_(p,n)}_n$ is a pointwise-increasing sequence of subharmonic functions on $U$.

    For each $n$, the function $Psi_(p,n)$ is continuous on $partial D(a,r)$. Then by the Poisson Integral Formula (@eq:poisson-integral-formula-2), there is a continuous function $phi_(p,n)$ on $overline(D(a,r))$ which is identical to $Psi_(p,n)$ on the boundary and harmonic on the interior. Now let
    $
      Phi_(p,n) (z) = cases(Psi_(p,n) (z) & quad "if" quad z in.not D(a,r), phi_(p,n)(z) & quad "if" quad z in D(a,r)",")
    $
    of which we aim to show subharmonicity (continuity follows since the pieces agree on the circle). By @thm:subharmonic-function-sub-mean-value-property, it suffices to show the sub-mean-value property holds locally at each point.
    + If $z in U without overline(D(a,r))$, then by openness, there exists a disk $overline(D(z, epsilon')) subset.double U without overline(D(a,r))$. By the subharmonicity of $Psi_(p,n) equiv Phi_(p,n)$, the local sub-mean-value property holds therein.
    + If $z in D(a,r)$, then there is a disk centered at $z$ therein such that $Phi_(p, n) equiv phi_(p, n)$ thereon. Then in this smaller disk the sub-mean-value property holds by harmonicity.
    + Lastly, if $z in partial D(a,r)$, observe that by construction, $Phi_(p, n) (z) = Psi_(p,n) (z)$. Moreover, by @prop:subharmonicity-weakened-to-continuity-on-boundary-harmonicity-in-interior, for $zeta in D(a,r)$, $Psi_(p,n) (zeta) <= phi_(p, n) (zeta)$. Moreover, for all $zeta in U$, this inequality continues to hold. Let $overline(D(z, epsilon)) subset.double U$ be arbitrary. Therefore by @thm:subharmonic-function-sub-mean-value-property, $Psi_(p, n)$ satisfies the global sub-mean-value property, and
    $
      Phi_(p, n) (z) = Psi_(p,n) (z) <= 1 / (2 uppi) integral_0^(2 uppi) Psi_(p, n) (z + epsilon ee^(ii theta)) dtheta <= 1 / (2 uppi) integral_0^(2 uppi) Phi_(p, n) (z + epsilon ee^(ii theta)) dtheta.
    $
    Then at $z$, $Phi_(p, n)$ also satisfies the local sub-mean-value property.

    By @thm:subharmonic-function-sub-mean-value-property, $Phi_(p, n)$ is subharmonic. Moreover, by construction, both $Phi_(p, n)$ and $Psi_(p, n)$ are contained within $S$ (defined in @eq:solution-to-the-dirichlet-problem-S-set). Since $Psi_(p, 1) <= Psi_(p, 2) <= dots.c$, for $z in U without D(a,r)$, $Phi_(p, 1) (z) <= Phi_(p, 2) (z) <= dots.c$.

    Moreover, in $D(a,r)$, $forall n in NN$, $Phi_(p, n) - Phi_(p, n + 1)$ is harmonic (as it is equal to $phi_(p,n) - phi_(p, n+1)$) and is non-positive on the boundary. By the Maximum Principle (@thm:maximum-principle-for-real-harmonic-functions), it is non-positive everywhere in $overline(D(a,r))$. Therefore, $ Phi_(p, 1) <= Phi_(p, 2) <= Phi_(p, 3) <= dots.c $ throughout $U$. Since for each $n$,
    $
      psi_(p, n) (p) & <= Psi_(p, n) (p) <= Phi_(p, n) (p) <= u(p) #tag[(since $Phi_(p, n) in S$)]
    $
    and $lim_(n -> oo) psi_(p,n) (p) = u(p)$, it follows that $lim_(n -> oo) Phi_(p,n) (p) = u(p)$. We now aim to show that this limit holds not only at $p$ but also any arbitrary point $q in D(a,r)$.

    Fix such $q$ and define similarly the sequence ${psi_(q, n)} subset.eq S$ such that $lim_(n -> oo) psi_(q,n) (q) = u(q)$. Now for each $n$, $z in U$, define
    $
      Lambda_n (z) = max({psi_(q, k) (z) : k in NN_(<= n)} union {psi_(p, k) (z) : k in NN_(<= n)}).
    $
    Then $Lambda_n$ is the maximum of finitely many subharmonic functions and hence subharmonic itself (@prop:subharmonic-pointwise-maximum-is-subharmonic). Moreover, (@eq:solution-to-the-dirichlet-problem-S-set) $Lambda_n in S$, ${Lambda_n}$ is pointwise-increasing in $U$, and for fixed $epsilon$ and sufficiently large $n$, $ psi_(q, n) (q) <= Lambda_n (q) < u(q) + epsilon. $
    Taking $epsilon -> 0$ gives $ lim_(n -> oo) psi_(q,n) (q) = u(q) <= lim_(n -> oo) Lambda_n (q) <= u(q), $
    meaning $lim_(n -> oo) Lambda_n (q) = u(q)$.

    On $overline(D(a,r))$, the Poisson Integral Formula gives a solution $lambda_n in C(overline(D(a,r)))$ to the Dirichlet problem with $lr(Lambda_n|)_(partial D(a,r))$ such that $lambda_n$ is harmonic in $D(a,r)$. Then defining
    $
      Eta_n (z) = cases(Lambda_n (z) & quad "if" quad z in.not D(a,r), lambda_n (z) & quad "if" quad z in D(a,r)",")
    $
    $Eta_n$ is continuous and subsequently subharmonic by justification identical to that of $Phi_(p, n)$ (via the sub-mean-value property). Moreover, similar to the case of $Phi_(p, n)$, we have $Eta_n in S$ and $Eta_n <= u$, and
    $ u(q) = lim_(n -> oo) psi_(q, n) (q) <= lim_(n -> oo) Lambda_n (q) <= lim_(n -> oo) Eta_n (q) <= u(q). $
    By the Maximum Principle (@thm:maximum-principle-for-real-harmonic-functions, as with previously), $Eta_n - Eta_(n + 1)$ is harmonic in $D(a,r)$ and non-positive on the boundary and therefore non-positive throughout. Then ${Eta_n}_n$ is pointwise-increasing everywhere in $U$.

    Both $Eta_n$ and $Phi_(p, n)$ are harmonic in $D(a,r)$ and by Harnack's Principle (@thm:harnacks-principle), $Phi_(p, n) arrows Phi_p$ and $Eta_n arrows Eta$ locally uniformly in this disk, where $Phi_p$ and $Eta$ are each either $oo$ or harmonic in the disk (the former is an impossibility since $Phi_(p, n), Eta_n <= u <= M$). Therefore the two sequences have harmonic limits in $D(a,r)$. By the discussion above, $Eta(q) = u(q)$ and $Phi_p (p) = u(p)$.

    For every $n$, we have $Psi_(p,n) <= Lambda_n$ on $U$. On $partial D(a,r)$, this gives
    $
      phi_(p,n) = Psi_(p,n) <= Lambda_n = lambda_n.
    $
    Since $phi_(p,n)$ and $lambda_n$ are harmonic on $D(a,r)$, the Maximum Principle (@thm:maximum-principle-for-real-harmonic-functions) gives
    $
      phi_(p,n) <= lambda_n ==> Phi_(p, n) <= Eta_n ==> Phi_p <= Eta
    $
    throughout $D(a,r)$. Moreover, $Eta_n in S$, so $Eta_n <= u$ for every $n$; hence $Eta <= u$. Therefore, $Phi_p <= Eta <= u$ on $D(a,r)$. Then $Phi_p - Eta <= 0$ throughout $D(a,r)$ and $ u(p) = Phi_p (p) <= Eta(p) <= u(p) ==> Eta(p) = u(p), $
    meaning $(Phi_p - Eta)(p) = 0$. By the Maximum Principle once more, $Phi_p equiv Eta$ in $D(a,r)$. Then since $Phi_p (q) = Eta(q) = u(q)$ and $q$ was arbitrary, $Phi_p equiv u$ throughout $D(a,r)$. Therefore, $u$ is harmonic on $D(a,r)$. Since $D(a,r)$ was arbitrary, $u$ is harmonic in $U$.
  ]
  #claim[
    The function $u$ extends continuously to $f$: for each $p in partial U$, $lim_(z -> p \ z in U) u(z) = f(p)$.
  ]
  #proof[
    Fix $p in partial U$ and $epsilon > 0$, and let $b = b_p$ be a barrier at $p$.

    By continuity of $f$, choose a relatively open neighborhood $V$ of $p$ in $partial U$ such that $ abs(f(p) - f(q)) < epsilon $ for every $q in V$ and $K = partial U without V$ is nonempty. Since $b < 0$ on the compact set $K$, let $eta = -max_(q in K) b(q) > 0$. Thus $b(q) <= -eta$ for every $q in K$. Set
    $
      C = max{1, (M - f(p) - epsilon) / eta} quad "and" quad D = max{1, (f(p) - epsilon - m) / eta}.
    $
    Then, for every $q in K$, if $(M - f(p) - epsilon) / eta > 1$,
    $
      M + C b(q) <= M - C eta <= f(p) + epsilon,
    $
    and if $C = 1$, we must have $(M - f(p) - epsilon) / eta <= 1$, implying
    $ M - f(p) -epsilon <= eta <= -b(q) ==> M + C b (q) = M + b(q) <= f(p) + epsilon. $
    Similarly, one derives $f(p) - epsilon <= m - D b(q)$.

    Let $psi in S$ be arbitrary. The function $psi + C b$ is subharmonic. For $q in V$,
    $
      limsup_(zeta -> q \ zeta in U) (psi(zeta) + C b(zeta)) <= f(q) + C b(q) <= f(q) < f(p) + epsilon.
    $
    For $q in K$, we instead have
    $
      limsup_(zeta -> q \ zeta in U) (psi(zeta) + C b(zeta)) <= f(q) + C b(q) <= M + C b(q) <= f(p) + epsilon.
    $
    Hence, by the Boundary Maximum Principle (@prop:subharmonic-boundary-maximum-principle), $psi + C b <= f(p) + epsilon$ throughout $U$. Taking the supremum over $psi in S$,
    $
      sup_(psi in S) psi(z) + C b <= f(p) + epsilon ==> u(z) <= f(p) + epsilon - C b(z)
    $
    for every $z in U$. As $z -> p$ within $U$, $b(z) -> b(p) = 0$, so
    $ limsup_(z -> p \ z in U) u(z) <= f(p) + epsilon -> f(p). $
    as $epsilon -> 0^+$. Notice that $z mapsto f(p) - epsilon + D b(z)$ is subharmonic, and on $V$, we have
    $
      f(p) - epsilon + D b(q) <= f(p) - epsilon < f(q),
    $
    while on $K$, we have $f(p) - epsilon + D b(q) <= m <= f(q)$. Thus $f(p) - epsilon + D b in S$, and hence
    $
      u(z) >= f(p) - epsilon + D b(z) = f(p) - epsilon + D b(z).
    $
    Letting $z -> p$ within $U$ gives
    $
      liminf_(z -> p \ z in U) u(z) >= f(p) - epsilon -> f(p).
    $
    as $epsilon -> 0^+$. Therefore,
    $
      lim_(z -> p \ z in U) u(z) = f(p).
    $
    Since $p in partial U$ was arbitrary, $u$ extends continuously to $overline(U)$ by setting $u equiv f$ on $partial U$.
  ]
  This completes the proof.
]
