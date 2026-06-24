#import "/lib.typ": *
#show: docs-subsubchapter.with(
  title: [Classifying Growth of Meromorphic Functions],
  route: "classifying_meromorphic_growth",
)
#lbl(
  theorem[
    Let $f$ be holomorphic on $overline(D(0, R))$ for $R > 0$ and define $M(r, f)$ to be $max_(abs(z) <= r) abs(f(z)) = max_(abs(z) = r) abs(f(z))$ for $0 < r < R$; then
    $ T(r, f) <= logp M(r, f) <= (R + r) / (R - r) T(R, f). $
  ],
  <thm:nevanlinna_entire_function_maximum_modulus_sandwich>,
)

#proof[
  Since $f$ is holomorphic in $D(0, r)$, $N(r, f) equiv 0$ and hence
  $
    T(r, f) = m(r, f) = 1 / (2 uppi) integral_0^(2 uppi) logp abs(f(r ee^(ii theta))) dtheta <= 1 / (2 uppi) integral_0^(2 uppi) logp M(r, f) dtheta,
  $
  which proves the first inequality. Since $T >= 0$ trivially, if $M <= 1$ the second assertion holds trivially. Hence, assume $M > 1$; by the Poisson--Jensen formula (@thm:poisson_jensen_formula), letting $z in partial D(0, r)$ be where $abs(f)$ attains $M$, we have
  $
    logp M(r, f) &= 1 / (2 uppi) integral_0^(2 uppi) log abs(f(R ee^(ii theta))) (R^2 - r^2) / abs(R ee^(ii theta) - z)^2 dtheta \
    &quad + sum_(j = 1)^m log abs((R (z - a_j)) / (R^2 - overline(a_j) z)) - sum_(k = 1)^n log abs((R (z - b_k)) / (R^2 - overline(b_k) z)) \
    &<= 1 / (2 uppi) integral_0^(2 uppi) log abs(f(R ee^(ii theta))) (R^2 - r^2) / abs(R ee^(ii theta) - z)^2 dtheta \
    &<= 1 / (2 uppi) integral_0^(2 uppi) log abs(f(R ee^(ii theta))) (R^2 - r^2) / (R - r)^2 dtheta \
    &<= 1 / (2 uppi) integral_0^(2 uppi) logp abs(f(R ee^(ii theta))) (R + r) / (R - r) dtheta = (R + r) / (R - r) T(R, f).
  $
  (The Möbius transformation-like terms of the zeros $<= 0$ since they map to the unit disk, and the second summation vanishes since there are no $b_k$ by holomorphy).
]

#lbl(
  definition[
    The _order of a meromorphic function_ $f : CC -> extcomplex$, denoted $rho = rho(f)$, is given by
    $ rho = limsup_(r -> oo) (logp T(r, f)) / (log r), $
    equivalent to the condition that $T(r, f) = Order(r^(rho + epsilon))$ for any $epsilon > 0$ but not for $epsilon < 0$.
  ],
  <def:order_of_meromorphic_function>,
)

#proof[of equivalent definitions][
  For any prescribed $epsilon > 0$ there exists $r' > 0$ such that for any $r > r'$,
  $ (logp T(r, f)) / (log r) <= rho + epsilon ==> T(r, f) <= r^(rho + epsilon). $
  Assume there exists some $epsilon > 0$ such that
  $ T(r, f) = order(r^(rho - epsilon)). $
  Then there exist finite $c, r'$ such that $forall r > r'$,
  $
    T(r, f) <= c r^(rho - epsilon) & ==> logp T(r, f) <= Order(1) + (rho - epsilon) log r \
                                   & ==> (logp T(r, f)) / (log r) <= rho - epsilon,
  $
  which is a contradiction. The converse follows similarly to the case of entire functions in @sec:classifying_growth_of_entire_functions.
]

#theorem[
  Let $rho_M$ be the order of a non-constant entire function $f$ as defined in @sec:classifying_growth_of_entire_functions and let $rho_T$ be the order as defined in @def:order_of_meromorphic_function. Then $rho_M = rho_T$.
]

#proof[
  Since $f$ is non-constant, for sufficiently large $r$, $logp M(r, f) = log M(r, f)$. For the remainder of this proof we will assume the two are equivalent. From @thm:nevanlinna_entire_function_maximum_modulus_sandwich it is apparent that (under $R = 2r$ for sufficiently large $r$)
  $
    (logp T(r, f)) / (log r) <= (logp log M(r, f)) / (log r) <= (log 3) / (log r) + (logp T(2r, f)) / (log(2r)) dot (log(2r)) / (log r).
  $
  Letting $r -> oo$ in the limit superior gives that
  $ rho_T <= rho_M <= rho_T ==> rho_T = rho_M. #qedhere $
]

#lbl(
  proposition[
    Let $f : CC -> extcomplex$ be a meromorphic function of finite order $rho$. Then for every $epsilon > 0$ and every $a in extcomplex$,
    + $m(r, a, f) = Order(r^(rho + epsilon))$. #enum-lbl(<itm:meromorphicfunctionfiniteorderestimates_proximity>)
    + $N(r, a, f) = Order(r^(rho + epsilon))$. #enum-lbl(<itm:meromorphicfunctionfiniteorderestimates_counting>)
    + $n(r, a, f) = Order(r^(rho + epsilon))$. #enum-lbl(<itm:meromorphicfunctionfiniteorderestimates_discretecounting>)
  ],
  <prop:meromorphicfunctionfiniteorderestimates>,
)

#proof[
  By the First Fundamental Theorem of Nevanlinna theory (@thm:nevanlinna_first_fundamental_theorem),
  $ m(r, a) = T(r, f) + Order(1) - N(r, a) $
  and since $m(r, a) >= 0$ and $N(r, a) >= 0$, we obtain
  $ m(r, a) <= T(r, f) + Order(1) quad "and" quad N(r, a) <= T(r, f) + Order(1). $
  Because $f$ has order $rho$, we have
  $ T(r, f) = Order(r^(rho + epsilon)), $
  which proves @itm:meromorphicfunctionfiniteorderestimates_proximity and @itm:meromorphicfunctionfiniteorderestimates_counting. Since
  $
    N(2r, a, f) - N(r, a, f) & = integral_r^(2r) (n(x, a, f)) / x dx \
                             & >= n(r, a, f) integral_r^(2r) dx / x = log 2 dot n(r, a, f),
  $
  it follows from @itm:meromorphicfunctionfiniteorderestimates_counting that
  $
    n(r, a, f) <= (N(2r, a, f) - N(r, a, f)) / (log 2) <= N(2r, a, f) / (log 2) = Order((2r)^(rho + epsilon)) = Order(r^(rho + epsilon))
  $
  and hence @itm:meromorphicfunctionfiniteorderestimates_discretecounting follows.
]

#lbl(
  theorem[
    Let $f : CC -> extcomplex$ be a meromorphic function of finite order $rho$. For $a in CC$, let $r_n (a)$ denote the moduli of the zeros of $f(z) - a$ (counted with multiplicity) in non-decreasing order, and let $r_n (oo)$ denote the moduli of the poles of $f$ in non-decreasing order. Then for every $epsilon > 0$ and every $a in extcomplex$,
    $ sum_n 1 / (r_n (a)^(rho + epsilon)) < oo. $
  ],
  <thm:meromorphicfunctionfiniteorderestimatessum>,
)

#proof[
  Observe that
  $ rho + epsilon > limsup_(r -> oo) (logp T(r, f)) / (log r) >= limsup_(r -> oo) (log N(r, f)) / (log r). $
  Since
  $ N(ee r, f) - N(r, f) = integral_r^(ee r) (n(x, f) dx) / x >= integral_r^(ee r) (n(r, f) dx) / x = n(r, f), $
  it follows that $n <= N$, and
  $ rho + epsilon > limsup_(r -> oo) (log n(r, f)) / (log r), $
  and hence the conclusion follows for $a = oo$ by @thm:nonzerosequencepowersummationconvergence. Assume $a$ is finite; observe that
  $ T(r, f) = T(r, a, f) + Order(1) = T(r, frac(1, f - a)) + Order(1) $
  by the First Fundamental Theorem (@thm:nevanlinna_first_fundamental_theorem). It follows that $rho$ is the order of $1/(f-a)$. Applying the previous result to this function, whose poles are precisely at ${ r_n (a) }$, the conclusion follows.
]
