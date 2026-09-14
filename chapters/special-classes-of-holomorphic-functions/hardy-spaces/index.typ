#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Hardy Spaces],
  route: "hardy-spaces",
)
(The knowledge of measure spaces or measure theory will not be required for the understanding of this section, but rather for purely motivational purposes.)

The definition of a Lebesgue space or $L^p$ space in real analysis approximately defines the $L^p (S, mu)$ space for a given set (a measure space) $(S, Sigma, mu)$ (for $1<=p<oo$), by $ L^p (S, mu) = {f : S -> CC "measurable" : norm(f)_(L^p (S, mu)) < oo}, $
where the $L^p$ norm of $f$ is given by
$ norm(f)_(L^p (S, mu)) = (integral_S abs(f)^p dd(mu))^(1 / p). $
Moreover, $ norm(f)_(L^oo (S, mu)) = cases(op("ess. sup") abs(f) quad &"if" quad mu(S) = 0, 0 quad & "otherwise") $ (where $op("ess. sup")$ is the essential supremum, or the infimum of supremums over subsets of $S$ omitting a set of measure $0$).
In $DD$, we provide the following (somewhat) analogous formulation:
#lbl(
  definition[Hardy Space][
    For a holomorphic function $f : DD -> CC$, define the $H^p$ norm (for $0 < p < oo$) to be
    $ norm(f)_(H^p) = sup_(r in (0, 1)) (1 / (2 uppi) integral_0^(2 uppi) abs(f(r ee^(ii theta)))^p dtheta)^(1 / p), $
    and
    $ norm(f)_(H^oo) = sup_(r in (0, 1)) sup_(theta in [0, 2 uppi]) abs(f(r ee^(ii theta))) = sup_(z in DD) abs(f(z)). $
    Then the space $H^p$ is simply the set of such functions with a finite Hardy $p$-norm. Moreover $H^oo$ class is simply the space of bounded holomorphic functions on $DD$.
  ],
  <def:hardy-space>,
)
Immediately, we have
#lbl(
  theorem[
    Any $f in H^oo$ with $f equiv.not 0$ can be factorized by
    $ f(z) = F(z) B(z), $ <eq:blaschke-factorization-of-H-oo>
    where $B$ is a Blaschke Product (@thm:blaschke-product with an additional $z^m$ factor) constructed on the zeros of $f$; and $F$ is a bounded, non-vanishing holomorphic function on $DD$ such that $norm(f)_(H^oo) = norm(F)_(H^oo)$.
  ],
  <thm:blaschke-factorization-of-H-oo>,
)
#proof[
  The assertions follow immediately from an application of @lem:hardy-oo-function-blaschke-condition and @cor:blaschke-product-factorization.
]
In a series of papers published by Godfrey H. Hardy and Frigyes Riesz, it was found that many of the properties of $H^oo$ functions apply to the weaker ($H^oo subset.eq H^p$) class of $H^p$ for finite $p$, including that of @thm:blaschke-factorization-of-H-oo.
#todo()
#lbl(
  proposition[
    For $p in RR_(> 0)$ and $f in H^p$, $abs(f)^p$ is subharmonic.
  ],
  <prop:hardy-modulus-power-is-subharmonic>,
)
#proof[
  For each point $z in DD without {z in DD: f(z) = 0}$, $log abs(f(z))$ is locally harmonic as it is the real part of a locally holomorphic function. Therefore, $z |-> exp[p log abs(f(z))]$, the composition between a non-decreasing convex function and a harmonic function, is subharmonic on $DD without {z in DD: f(z) = 0}$ by @thm:composition-of-non-decreasing-convex-and-subharmonic-is-subharmonic. Then at each point at which $abs(f)^p$ does not vanish, $abs(f)^p$ satisfies the local sub-mean-value property.

  Since $abs(f)^p$ vanishes at each point of ${z in DD: f(z) = 0}$, it satisfies the local sub-mean-value property at such points (since $abs(f)^p >= 0$ everywhere).

  By @thm:subharmonic-function-sub-mean-value-property, $abs(f)^p$ is subharmonic on $DD$.
]
#lbl(
  lemma[Hardy][
    For any $f:DD -> CC$ holomorphic and any $p in RR_(> 0)$, for any two $0 < r_1 < r_2 < 1$,
    $
      integral_0^(2 uppi) abs(f(r_1 ee^(ii theta)))^p dtheta <= integral_0^(2 uppi) abs(f(r_2 ee^(ii theta)))^p dtheta.
    $
  ],
  <lem:hardy-integral-increasing-in-radius>,
)
#proof[
  By @thm:solution-to-the-dirichlet-problem, $exists! u in C(partial D(0, r_2))$ such that $u$ is harmonic in $D(0,r_2)$ and that $u equiv abs(f)^p$ on $partial D(0,r_2)$. By the subharmonicity of $abs(f)^p$, $u >= abs(f)^p$ on $overline(D(0,r_2))$, and hence on $overline(D(0,r_1))$.

  Therefore,
  $
    integral_0^(2 uppi) abs(f(r_2 ee^(ii theta)))^p dtheta &= integral_0^(2 uppi) u(r_2 ee^(ii theta)) dtheta \
    &= 2 uppi u(0) = integral_0^(2 uppi) u(r_1 ee^(ii theta)) dtheta #tag[(mean-value property)]\
    & >= integral_0^(2 uppi) abs(f(r_1 ee^(ii theta)))^p dtheta. qedhere
  $
]
#theorem[
  For $0 < p_1 < p_2 <= oo$, $H^(p_2)$ is a proper subclass of $H^(p_1)$: $ H^(p_2) subset.neq H^(p_2). $
]
#proof[
  We aim to prove the existence of some function $f$ which lies in $H^(p_1)$ but not $H^(p_2)$. The function we concern ourselves with is
  $ f:z |-> (1 - z)^(-1 / p) = exp[-Log(1 - z) / p], $
  for $z in DD$, where $Log$ is the principal branch logarithm and $p in (p_1, p_2)$ is fixed. The use of the principal branch is justified, as $z |-> 1 - z$ maps $DD$ to $D(1, 1) subset CC without R_(<= 0)$.

  Since for any $r in (0,1)$,
  $
    integral_0^(2 uppi) abs(f(r ee^(ii theta)))^(p_1) dtheta &= integral_0^(2 uppi) abs(1 - r ee^(ii theta))^(-p_1 / p) dtheta \
    &<= integral_0^(2 uppi) abs(Im(1 - r ee^(ii theta)))^(-p_1 / p) dtheta \
    &<= integral_0^(2 uppi) (r abs(sin theta))^(-p_1 / p) dtheta \
    &= 4 r^(-p_1 / p) integral_0^(uppi / 2) (sin theta)^(-p_1 / p) dtheta,
  $
  and since $sin theta >= (2 theta) / uppi$ for $theta in [0, uppi / 2]$,
  $
    integral_0^(2 uppi) abs(f(r ee^(ii theta)))^(p_1) dtheta &=4 (2 / uppi)^(-p_1 / p) r^(-p_1 / p) integral_0^(uppi / 2) theta^(-p_1 / p) dtheta \
    &= 4 (2 / uppi)^(-p_1 / p) r^(-p_1 / p) evaluated(theta^(1 - p_1 / p))_0^(uppi / 2) \
    &=c r^(-p_1 / p) quad "since" quad 1 - p_1 / p > 0.
  $
  Moreover, since $abs(f)$ is bounded on $overline(D(0, 1/2))$ by some constant $M$,
  $
    abs(integral_0^(2 uppi) abs(f(r ee^(ii theta)))^(p_1) dtheta) &<= max{2 uppi M^(p_1), sup_(r in (1/2, 1)) c r^(-p_1 / p)} \
    &<= max{2 uppi M^(p_1), c 2^(p_1 / p)} < oo,
  $
  we then have $f in H^(p_1)$. Moreover, observe that for all $r in (0, 1)$, if $p_2 != oo$,
  $
    integral_0^(2 uppi) abs(f(r ee^(ii theta)))^(p_2) dtheta & = integral_0^(2 uppi) abs(1 - r ee^(ii theta))^(-p_2 / p) dtheta \
    & >= integral_0^(2 uppi) (abs(Im(1 - r ee^(ii theta))) + abs(Re(1 - r ee^(ii theta))))^(-p_2 / p) dtheta \
    & >= 2 integral_0^(uppi) [r (sin theta - cos theta) + 1]^(-p_2 / p) dtheta \
    & = 2 integral_0^(uppi) [r (sin theta - cos theta) + 1]^(-p_2 / p) dtheta.
  $
  Since for any $r in (0,1)$, $theta in [0, uppi]$,
  $ r (sin theta - cos theta) + 1 <= 1 - r + 2 theta, $
  it follows that
  $
    integral_0^(2 uppi) abs(f(r ee^(ii theta)))^(p_2) dtheta & = 2 integral_0^uppi (1 - r + 2 theta)^(-p_2 / p) dtheta \
    & = evaluated(((1 - r + 2 theta)^(1 - p_2 / p)) / (1 - p_2 / p))_0^uppi \
    & = ((1 - r + 2 uppi)^(1 - p_2 / p) - (1 - r)^(1 - p_2 / p)) / (1 - p_2 / p).
  $
  Taking the limit superior as $r -> 1^-$,
  $
    limsup_(r -> 1^-) integral_0^(2 uppi) abs(f(r ee^(ii theta)))^(p_2) dtheta >= ((1 - r + 2 uppi)^(1 - p_2 / p) - (1 - r)^(1 - p_2 / p)) / (1 - p_2 / p) = oo
  $
  since $1 - p_2 / p < 0$ (if $p_2 = oo$ then this is trivial as $f$ is not bounded). Hence
  $
    (H^(p_1) in.rev) f in.not H^(p_2).
  $
  It suffices to show $H^(p_2) subset.neq H^(p_1)$ (the inclusion). This is already known for $p_2 = oo$, so assume $p_2 != oo$.

  Assume an arbitrary $f in H^(p_2)$. Then there exists $M > 0$ (independent of $r$) such that $forall r in (0,1)$,
  $ integral_0^(2 uppi) abs(f(r ee^(ii theta)))^(p_2) dtheta <= M. $
  Let $phi.alt:RR_(>= 0) -> RR$ be given by $x |-> x^(p_2 / p_1)$. Let $g(theta) = abs(f(r ee^(ii theta)))^(p_1)$.

  Then by holomorphy, $g in C([0, 2 uppi])$ and $phi.alt$ is convex since $p_2 / p_1$. Then
  $
    integral_0^(2 uppi) abs(f(r ee^(ii theta)))^(p_1) dtheta &= 2 uppi [(1 / (2 uppi) integral_0^(2 uppi) abs(f(r ee^(ii theta)))^(p_1) dtheta)^(p_2 / p_1)]^(p_1 / p_2) \
    &= 2 uppi [phi.alt compose (#[average of $g$ in $[0, 2 uppi]$])]^(p_1 / p_2) \
    &<= 2 uppi [#[average of $phi.alt compose g$ in $[0, 2 uppi]$]]^(p_1 / p_2) \
    &= 2 uppi [1 / (2 uppi) integral_0^(2 uppi) abs(f(r ee^(ii theta)))^(p_2) dtheta]^(p_1 / p_2) <= M (2 uppi)^(1 - p_1 / p_2).
  $
  by application of Jensen's Inequality (@thm:jensens-inequality-convexity). This proves the inclusion.
]
#theorem[
  Fix $p in RR_(> 0) union {oo}$. For any $f in H^p$ such that ${a_n}_(n in NN) subset DD^*$ are its zeros in order of increasing modulus, counting multiplicities ($f(0) != 0$); $f$ satisfies the Blaschke condition (refer to @thm:blaschke-product).
] <thm:hardy-function-blaschke-condition>
#proof[
  If $f$ has only finitely many nonzero zeros, the assertion is immediate. We may assume $p != oo$ as we have already proved this case in @lem:hardy-oo-function-blaschke-condition.

  By Jensen's Formula (@thm:jensens-formula), for each $k in NN$, for any $r in (abs(a_k), 1)$, $k <= n(r, 0, f)$, giving that
  $
    log abs(f(0)) &= 1 / (2 uppi) integral_0^(2 uppi) log abs(f(r ee^(ii theta))) dtheta + sum_(j=1)^(n(r, 0, f)) log abs(a_j / r) \
    &<= 1 / (2 uppi) integral_0^(2 uppi) log abs(f(r ee^(ii theta))) dtheta + sum_(j=1)^k log abs(a_j / r),
  $ <eq:hardy-function-satisfies-blaschke-condition-intermediate>
  where $n(r, 0, f)$ counts the zeros of $f$ in $overline(D(0, r))$. Since $1 / t <= t^(p - 1)$ for $t >= 1$, integrating from $1$ to $x >= 1$, we have $ integral_1^x dt / t <= integral_1^x t^(p - 1) ==> log x <= 1 / p x^p - 1 / p < 1 / p x^p. $
  For $x in (0, 1)$, the inequality continues to hold as the left-hand side is negative. Therefore, applying this to @eq:hardy-function-satisfies-blaschke-condition-intermediate, we have
  $
    log abs(f(0)) &<= lim_(r -> 1^-) 1 / (2 uppi p) integral_0^(2 uppi) abs(f(r ee^(ii theta)))^p dtheta + sum_(j=1)^k log abs(a_j / r) \
    & <= 1 / p norm(f)_(H^p)^p + sum_(j=1)^k log abs(a_j).
  $
  Since $k$ was arbitrary, taking $k -> oo$,
  $
    sum_(j = 1)^oo log 1 / abs(a_j) <= 1 / p norm(f)_(H^p)^p - log abs(f(0)).
  $ <eq:hardy-function-satisfies-blaschke-condition-intermediate-2>
  For $t >= 1$, $-1 <= -1 / t$, therefore for $x >= 1$
  $
    integral_1^x -dt <= integral_1^x -dt/t ==> 1 - x <= log 1 / x.
  $
  Similarly, for $x, t < 1$, we have $-1 > -1 / t$. Thus,
  $ integral_x^1 -dt > integral_x^1 - dt / t ==> x - 1 > log x ==> 1 - x <= log 1 / x, $
  which holds everywhere in $RR_(> 0)$. Then @eq:hardy-function-satisfies-blaschke-condition-intermediate-2 yields
  $ sum_(j = 1)^oo (1 - abs(a_j)) <= 1 / p norm(f)_(H^p)^p - log abs(f(0)) < oo. qedhere $
]

#theorem[
  Suppose $p > 0$ or $p = oo$ and let $f in H^p$ such that $f$ is not identically $0$. Then the Blaschke product $B(z)$ constructed on the zero set of $f$ (which may contain a $z^m$ term if $f(0) = 0$) locally uniformly converges on $DD$, and furthermore, $f$ can be factorized by
  $ f(z) = F(z) B(z), $
  such that $F in H^p$ and does not vanish in $DD$ and $norm(F)_(H^p) = norm(f)_(H^p)$.
] <thm:hardy-function-blaschke-factorization>
#proof[
  Let ${a_n}_(n in NN)$ be the zero set of $f$ in $DD^*$ in order of increasing modulus, and let $m >= 0$ be the multiplicity of the zero ($m = 0$ if there isn't one) at $0$. Let
  $ B(z) = z^m product_(n=1)^oo [-abs(a_n) / a_n (z - a_n) / (1 - overline(a_n) z)], wide F(z) = f(z) / B(z). $
  Then $F$ extends holomorphically to $DD$ and does not vanish therein. It remains to show the final assertion. If $p = oo$, the assertion follows from @thm:blaschke-factorization-of-H-oo, so assume $0 < p < oo$.

  If $f$ has only finitely many nonzero zeros, then $B$ is a finite Blaschke product, and the boundary argument below, applied directly to $B$ and $F$, proves the norm equality. Thus suppose ${a_n}$ is infinite.

  The use of this infinite product is not actually of great utility as it is not necessarily continuous on $overline(DD)$. Thus we use the partial products
  $ B_N (z) = z^m product_(n=1)^N [-abs(a_n) / a_n (z - a_n) / (1 - overline(a_n) z)], wide F_N (z) = f(z) / (B_N (z)) $
  for $N in NN$.
  Each $F_N$ extends holomorphically to $DD$. Because $B_N$ is a finite product, $abs(B_N (z)) <= 1$ on $DD$ and $abs(B_N (ee^(ii theta))) = 1$. If
  $ m_N (r) = min_(theta in [0, 2 uppi]) abs(B_N (r ee^(ii theta))), $
  then $m_N (r) -> 1$ as $r -> 1^-$. For all $r$ sufficiently close to $1$,
  $
    1 / (2 uppi) integral_0^(2 uppi) abs(f(r ee^(ii theta)))^p dtheta
    &<= 1 / (2 uppi) integral_0^(2 uppi) abs(F_N (r ee^(ii theta)))^p dtheta \
    &<= m_N (r)^(-p) 1 / (2 uppi) integral_0^(2 uppi) abs(f(r ee^(ii theta)))^p dtheta.
  $
  Taking $r -> 1^-$, all inequalities become equalities, and using @lem:hardy-integral-increasing-in-radius gives
  $ norm(F_N)_(H^p) = norm(f)_(H^p). $ <eq:hardy-function-blaschke-factorization-norm-equalities>
  Moreover,
  $
    F_N (z) = F(z) B(z) / (B_N (z)) = F(z) product_(n = N + 1)^oo [-abs(a_n) / a_n (z - a_n) / (1 - overline(a_n) z)],
  $
  so $F_N arrows F$ locally uniformly on $DD$. Hence, for every $0 < r < 1$,
  $
    1 / (2 uppi) integral_0^(2 uppi) abs(F(r ee^(ii theta)))^p dtheta &= lim_(N -> oo) 1 / (2 uppi) integral_0^(2 uppi) abs(F_N (r ee^(ii theta)))^p dtheta \
    &<= norm(f)_(H^p)^p. #tag[(by @eq:hardy-function-blaschke-factorization-norm-equalities)]
  $
  Thus $F in H^p$ and $norm(F)_(H^p) <= norm(f)_(H^p)$. The reverse inequality follows from $f = B F$ and $abs(B) <= 1$ on $DD$, proving equality.
]
#remark[
  We would also like to state that two Hardy spaces $H^(p_1), H^(p_2)$ (which may be $oo$) share their zero sets: the sets
  $ S_1 = {{z in DD : f(z) = 0} : f in H^(p_1)} $ and $ S_2 = {{z in DD : f(z) = 0} : f in H^(p_2)} $
  are equal. Indeed, any $f in H^(p_1)$ has a zero set satisfying the Blaschke condition by @thm:hardy-function-blaschke-condition (the negligence of multiplicities is not substantial, as the series consists solely of positive terms). Then a Blaschke product $B$ may be constructed on this set, which lies in $H^(p_2)$. Similarly, a function in $H^(p_1)$ may be constructed for any function in $H^(p_2)$.
]
