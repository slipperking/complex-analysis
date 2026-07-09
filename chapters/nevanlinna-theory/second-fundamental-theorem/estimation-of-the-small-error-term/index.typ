#import "/lib.typ": *
#show: docs-subsubchapter.with(
  title: [The Estimation of $S(r, f)$],
  route: "estimation-of-the-small-error-term",
)
The second part of the Second Fundamental Theorem is typically a suitable estimate on $S(r, f)$.
#thm-state.thm-restate("thm:nevanlinna-second-fundamental-theorem-part-2", final: true)
Modern results vastly improve said estimations, and the search for a sharp estimation is one of the most challenging questions in Nevanlinna Theory.

#lbl(
  lemma[
    Let $z in CC$ be arbitrary and fixed and suppose $0 < r < oo$. Let $ E_k = {theta : -uppi < theta < uppi and abs(z - r ee^(ii theta)) < k r} $ for each $0 < k <= 1$. It follows that
    $ I = integral_(E_k) log abs(frac(r, z - r ee^(ii theta))) dtheta < uppi k (1 - log k). $
  ],
  <lem:nevanlinna-small-error-term-estimation-1>,
)

#proof[
  Let $z = rho ee^(ii psi)$. Performing a substitution of $theta.alt = theta - psi$, we have $I = integral_(E'_k) log abs(frac(r, rho - r ee^(ii theta.alt))) dif theta.alt$, where $E'_k = {theta.alt : -uppi - psi < theta.alt < uppi - psi and abs(rho - r ee^(ii theta.alt)) < k r}$.

  Because the exponential is periodic every $2 uppi ii$, we may assume that $E'_k$ is restricted to $-uppi < theta.alt < uppi$ instead of $-uppi - psi < theta.alt < uppi - psi$. The expression $abs(rho - r ee^(ii theta.alt)) = k r$ gives at most two symmetric solutions $plus.minus theta_0$ (let $theta_0 >= 0$).

  Evidently, for $theta.alt > uppi / 2$ or $-theta.alt < -uppi / 2$,
  $
    abs(rho - r ee^(ii theta.alt)) = sqrt(rho^2 + r^2 - 2 r rho cos(theta.alt))>= r >= k r,#tag[(Law of Cosines)]
  $
  so it follows that $theta_0 <= uppi / 2$, and furthermore, all $-theta_0 < theta.alt < theta_0$ lie in $E'_k$ by the geometry of a circle. Since $abs(rho - r ee^(ii theta.alt)) >= abs(Im(rho - r ee^(ii theta.alt))) = r abs(sin(theta.alt))$, assuming that $E'_k != emptyset$, it follows that
  $
    I & = 2 integral_0^(theta_0) log abs(frac(r, rho - r ee^(ii theta.alt))) dif theta.alt <= 2 integral_0^(theta_0) log csc(theta.alt) dif theta.alt < 2 integral_0^(theta_0) log(uppi / (2 theta.alt)) dif theta.alt \
    & = 2 theta_0 log(uppi / 2) - 2 integral_0^(theta_0) log(theta.alt) dif theta.alt = 2 theta_0 log(uppi / 2) - 2 (theta_0 log(theta_0) - theta_0) \
    &= 2 theta_0 (log(uppi / (2 theta_0)) + 1).
  $

  Since $uppi / 2 sin x >= x$ for $x in [0, uppi / 2]$, it follows that $theta_0 <= uppi / 2 sin theta_0 <= (uppi k) / 2$.
  Moreover, $theta mapsto 2 theta (log(uppi / (2 theta)) + 1)$ is an increasing function of $0 <= theta <= uppi / 2$; thus we may replace all instances of $theta_0$ with $(uppi k) / 2$, proving the lemma.
]

#lbl(
  lemma[
    Let ${z_nu}_(nu = 1)^n$ be $n >= 1$ (possibly indistinct) complex numbers. Define $delta(z) = min{abs(z - z_nu) : nu in NN_(<= n)}$. It follows that for any $r > 0$,
    $
      frac(1, 2 uppi) integral_0^(2 uppi) logp r / (delta(r ee^(ii theta))) dtheta <= 2 log n + 1 / 2
    $
  ],
  <lem:nevanlinna-small-error-term-estimation-2>,
)

#proof[
  Define the set
  $
    E_nu = {theta in (-uppi, uppi) : abs(z_nu - r ee^(ii theta)) < r / n}
  $
  and let $E = union.big_(nu = 1)^n E_nu$. For $theta in E$, $delta(r ee^(ii theta)) < r / n$, implying that $r / delta(r ee^(ii theta)) > n$. Define
  $
    log_0 x = cases(
      log x quad & "if" x >= n,
      0 quad & "otherwise"
    )(>= 0),
  $
  so that for $theta$ in the prescribed range, we have
  $
    logp r / (delta(r ee^(ii theta))) &= log_0(frac(r, delta(r ee^(ii theta)))) = log_0(frac(r, min_(nu in NN_(<= n)) abs(r ee^(ii theta) - z_nu))) \
    &<= sum_(nu = 1)^n log_0(frac(r, abs(r ee^(ii theta) - z_nu))).
  $
  Since $0 < 1 / n <= 1$, by virtue of @lem:nevanlinna-small-error-term-estimation-1 for $k = 1 / n$,
  #lbl(
    $
      frac(1, 2 uppi) integral_E logp r / (delta(r ee^(ii theta))) dtheta &<= frac(1, 2 uppi) sum_(nu = 1)^n integral_0^(2 uppi) log_0(frac(r, abs(r ee^(ii theta) - z_nu))) dtheta \
      & = frac(1, 2 uppi) sum_(nu = 1)^n integral_0^(2 uppi) log(frac(r, abs(r ee^(ii theta) - z_nu))) dtheta \
      &< frac(1, 2 uppi) sum_(nu = 1)^n frac(uppi, n) (1 + log n) = 1 / 2 + (log n) / 2.
    $,
    <eq:nevanlinna-small-error-term-estimation-2-E-set>,
  )
  For $theta in.not E$, for each $nu$ we have $abs(z_nu - r ee^(ii theta)) >= r / n$ and thus $delta(r ee^(ii theta)) >= r / n$. It follows that
  #lbl(
    $
      frac(1, 2 uppi) integral_(theta in.not E) logp r / (delta(r ee^(ii theta))) dtheta <= 1 / (2 uppi) integral_0^(2 uppi) logp n dtheta <= log n.
    $,
    <eq:nevanlinna-small-error-term-estimation-2-E-complement>,
  )
  Combining @eq:nevanlinna-small-error-term-estimation-2-E-set, @eq:nevanlinna-small-error-term-estimation-2-E-complement gives the desired result.
]

#lbl(
  proposition[
    If $f$ is meromorphic on $D(0, R)$, then for $0 < r < R$, letting $c$ be the first nonzero coefficient of the Laurent of expansion of $f$ about the origin,
    $
      m(r, (f')/f) & < 4 logp T(R, f) + 4 logp logp abs(1 / c) \
                   & quad""+ 5 logp R + 6 logp 1 / (R - r) + logp 1 / r + 14.
    $
  ],
  <prop:nevanlinna-log-diff-proximity-estimate>,
)

#proof[
  By the Poisson--Jensen Formula (@thm:poisson-jensen-formula), letting $rho = 1 / 2 (R + r)$, for each non-singular point $z in partial D(0, r)$,
  $
    Re log f(z) & = frac(1, 2 uppi) integral_0^(2 uppi) log abs(f(rho ee^(ii theta))) Re(frac(rho ee^(ii theta) + z, rho ee^(ii theta) - z)) dtheta \
    & quad "" + sum_(k = 1)^(n(rho, 0, f)) Re log(frac(rho (z - a_k), rho^2 - overline(a_k) z)) \ &wide""- sum_(j = 1)^(n(rho, f)) Re log(frac(rho (z - b_j), rho^2 - overline(b_j) z)),
  $
  where ${a_k}$ and ${b_j}$ are the respective zeros and poles in the disk. By @eq:wirtinger-derivative-of-real-part-of-holomorphic-function, we have $pdv(, z) (Re g(z)) = 1 / 2 g'(z)$ for all holomorphic $g$. Applying this with differentiation under the integral sign, we have that
  $
    (f'(z)) / (f(z)) & = 1 / (2 uppi) integral_0^(2 uppi) log abs(f(rho ee^(ii theta))) frac(2 rho ee^(ii theta) dtheta, (rho ee^(ii theta) - z)^2) \
    & quad "" + sum_(k = 1)^(n(rho, 0, f)) (frac(overline(a_k), rho^2 - overline(a_k) z) - frac(1, a_k - z)) + sum_(j = 1)^(n(rho, f)) (frac(1, b_j - z) - frac(overline(b_j), rho^2 - overline(b_j) z)).
  $
  Define $ delta(z) = min({abs(z - a_k) : k in NN_(<= n(rho, 0, f))} union {abs(z - b_j) : j in NN_(<= n(rho, f))}). $
  Evidently the number of zeros and poles is given by
  $
    n = n(rho, f) + n(rho, 0, f).
  $
  Since
  $
    abs(rho^2 - overline(a_k) z) >= rho^2 - r abs(a_k) >= rho^2 - r rho, quad abs(rho^2 - overline(b_j) z) >= rho^2 - r rho,
  $
  it follows that
  #lbl(
    $
      abs(frac(overline(a_k), rho^2 - overline(a_k) z)),abs(frac(overline(b_j), rho^2 - overline(b_j) z)) <= frac(rho, rho^2 - r rho) = frac(1, rho - r),
    $,
    <eq:nevanlinna-log-diff-proximity-estimate-mobius-bounds>,
  )
  and additionally,
  #lbl(
    $
      abs(frac(1, b_j - z)) <= frac(1, delta(z)), quad abs(frac(1, a_k - z)) <= frac(1, delta(z)).
    $,
    <eq:nevanlinna-log-diff-proximity-estimate-inversion-bounds>,
  )
  Furthermore,
  #lbl(
    $
      abs(frac(1, 2 uppi) integral_0^(2 uppi) log abs(f(rho ee^(ii theta))) frac(2 rho ee^(ii theta) dtheta, (rho ee^(ii theta) - z)^2)) <= frac(1, 2 uppi) frac(2 rho, (rho - r)^2) integral_0^(2 uppi) abs(log abs(f(rho ee^(ii theta)))) dtheta \
      = frac(2 rho, (rho - r)^2) [m(rho, f) + m(rho, frac(1, f))].
    $,
    <eq:nevanlinna-log-diff-proximity-estimate-integral-bounds>,
  )
  by @itm:log-nonnegative-part-properties-sum-of-reciprocal-logs of @prop:log-nonnegative-part-properties. Combining @eq:nevanlinna-log-diff-proximity-estimate-mobius-bounds, @eq:nevanlinna-log-diff-proximity-estimate-inversion-bounds, @eq:nevanlinna-log-diff-proximity-estimate-integral-bounds, we have
  $
    abs(frac(f'(z), f(z))) & <= frac(2 rho, (rho - r)^2) [m(rho, f) + m(rho, 1 / f)] \
    &quad""+ sum_(k = 1)^(n(rho, 0, f)) (frac(1, rho - r) + frac(1, delta(z))) + sum_(j = 1)^(n(rho, f)) (frac(1, rho - r) + frac(1, delta(z))) \
    & = frac(2 rho, (rho - r)^2) [m(rho, f) + m(rho, 1 / f)] + n (1 / (rho - r) + 1 / delta(z)).
  $
  By @prop:nevanlinna-first-theorem-at-zero, we have $T(rho, 0, f) = T(rho, f) - log abs(c)$, where $c$ is the first nonzero coefficient of the Laurent expansion of $f$ about the origin. It follows that $m(rho, frac(1, f)) = T(rho, f) - log abs(c) - N(rho, 0, f)$ and $m(rho, f) = T(rho, f) - N(rho, f)$, thus
  $
    m(rho, frac(1, f)) + m(rho, f) & = 2 T(rho, f) - log abs(c) - N(rho, frac(1, f)) \
                                   & quad""- N(rho, f) <= 2 T(rho, f) + 2 logp abs(1 / c),
  $
  and
  $
    abs(frac(f'(z), f(z))) <= frac(4 rho, (rho - r)^2) [T(rho, f) + logp abs(1 / c)] + frac(n, r) (frac(r, rho - r) + frac(r, delta(z))).
  $
  By the subadditive properties of @prop:log-nonnegative-part-properties, we have
  $
    logp abs(frac(f'(z), f(z))) & <= logp [frac(4 rho, (rho - r)^2) [T(rho, f) + logp abs(1 / c)]] \
                                & quad ""+ logp [frac(n, r) (frac(r, rho - r) + frac(r, delta(z)))] + log 2 \
                                & <= logp rho + logp [(2 / (rho - r))^2] + logp [T(rho, f) + logp abs(1 / c)] \
                                & quad "" + logp n/r+ logp(frac(r, rho - r) + frac(r, delta(z))) + log 2 \
                                & <= logp rho + 2 logp 1 / (rho - r) + logp T(rho, f) + logp logp abs(1 / c) \
                                & quad "" + logp n/r + logp r / (rho - r) + logp r/(delta(z)) + 5 log 2.
  $
  Integrating on $abs(z) = r$ with @lem:nevanlinna-small-error-term-estimation-2 gives
  #lbl(
    $
      m(r, (f')/f) & <= logp rho + 2 logp 1 / (rho - r) + logp T(rho, f) + logp logp abs(1 / c) \
      & quad "" + logp n/r + logp r / (rho - r) + 1 / (2 uppi) integral_0^(2 uppi) logp r / (delta(r ee^(ii theta))) dtheta + 5 log 2 \
      & <= logp rho + 3 logp 1 / (rho - r) + logp T(rho, f) + logp logp abs(1 / c) \
      & quad "" + 3 logp n + logp 1 / r + logp r + 1 / 2 + 5 log 2.
    $,
    <eq:nevanlinna-log-diff-proximity-estimate_proximity_primary_estimate>,
  )
  To derive a more useful estimate for $n$, we note that
  $
    N(R, f) >= integral_(rho)^R (n(x, f) dx) / x >= integral_(rho)^R (n(rho, f) dx) / R = n(rho, f) (R - rho) / R, \
    N(R, 0, f) >= n(rho, 0, f) (R - rho) / R.
  $
  Thus,
  $
    n & = n(rho, f) + n(rho, 0, f) <= frac(R, R - rho) [N(R, f) + N(R, 0, f)] \
      & <= frac(R, R - rho) [T(R, f) + T(R, 0, f) - m(R, f) - m(R, 0, f)] \
      & <= frac(R, R - rho) [2 T(R, f) + log abs(1 / c)] <= frac(2 R, R - rho) [T(R, f) + logp abs(1 / c)].
  $
  Using the $logp$ subadditivity properties (as with earlier), we have
  $
    logp n & <= logp (2 R) / (R - rho) + logp T(R, f) + logp logp abs(1 / c) + log 2 \
           & <= logp R + logp 1 / (R - rho) + logp T(R, f) + logp logp abs(1 / c) + 2 log 2
  $
  Substituting this into @eq:nevanlinna-log-diff-proximity-estimate_proximity_primary_estimate, and using $R - rho = rho - r = (R - r) / 2$ we have that (recognizing $logp r, logp rho < logp R$)
  $
    m(r, (f')/f) & <= logp rho + 3 logp 2 / (R - r) + logp T(rho, f) + logp logp abs(1 / c) + logp 1 / r \
                 & quad "" + logp r + 1 / 2 + 5 log 2 + 3 logp R + 3 logp 2 / (R - r) \
                 & quad "" + 3 logp T(R, f) + 3 logp logp abs(1 / c) + 6 log 2 \
                 & < 5 logp R + 17 log 2 + 6 logp 1 / (R - r) + 4 logp T(rho, f) \
                 & quad""+ 4 logp logp abs(1 / c) + logp 1 / r + 1 / 2 \
                 & <= 5 logp R + 17 log 2 + 6 logp 1 / (R - r) + 4 logp T(R, f) \
                 & quad""+ 4 logp logp abs(1 / c) + logp 1 / r + 1 / 2,
  $
  since $T(rho, f) <= T(R, f)$ (@thm:nevanlinna-characteristic-non-decreasing-convex). This proves the proposition.
]

#lbl(
  lemma[Borel][
    Let $T : [r_0, R_0) -> RR$ be an increasing, continuous function satisfying $T > 1$ on all of its domain (where $r_0 < R_0 <= oo$).
    + If $R_0 = oo$, for $r >= r_0$ outside a set $E_0 subset.eq RR_(>= r_0)$ whose linear measure does not exceed 2 (satisfying $integral_(E_0) dr <= 2$ with respect to the Lebesgue measure#footnote["Linear measure" refers to length. Here, the condition is equivalent to the inequality given by $inf{sum_k abs(I_k) : E subset.eq union.big_k I_k} <= 2$ where ${I_k}$ are finite open intervals.]),
      #lbl(
        $
          T(r + frac(1, T(r))) < 2 T(r)
        $,
        <eq:nevanlinna-borel-infinite-radius>,
      )
    + If $R_0 < oo$, then $exists E_0 subset.eq [r_0, R_0)$ satisfying $integral_(E_0) dr / (R_0 - r) <= 2$ such that for $r in [r_0, R_0) without E_0$,
      #lbl(
        $
          T(r + frac(R_0 - r, ee T(r))) < 2 T(r)
        $,
        <eq:nevanlinna-borel-finite-radius>,
      )
      Moreover, for any $R, rho, rho' in (0, R_0)$ such that $R - rho' < ee^(-2) (R - rho)$ (implying that $rho < rho'$), $exists r in (rho, rho')$ such that $r in.not E_0$.
  ],
  <lem:nevanlinna-borel>,
)

#proof[
  We observe the two cases separately.
  + Assume $R_0 = oo$. Then define $r'_0 = r_0 + 1 / T(r_0)$, and
    $
      r_1 = inf{r > r'_0 : #[@eq:nevanlinna-borel-infinite-radius fails]}, quad r'_1 = r_1 + 1 / T(r_1) > r_1,
    $
    and let
    $
      r_2 = inf{r > r'_1 : #[@eq:nevanlinna-borel-infinite-radius fails]}, quad r'_2 = r_2 + 1 / T(r_2) > r_2,
    $
    repeating this process recursively by
    $
      r_n = inf{r > r'_(n - 1) : #[@eq:nevanlinna-borel-infinite-radius fails]}, quad r'_n = r_n + 1 / T(r_n) > r_n.
    $
    It follows that $r_n >= r'_(n - 1) > r_(n - 1)$, and $r_n - r_(n - 1) >= r'_(n - 1) - r_(n - 1)$.

    Let $N in NN union {oo}$ be the largest $n$ for which the infimum in $r_n$ is defined. Observe that by the definition of the infimum, for each $n$, @eq:nevanlinna-borel-infinite-radius must be satisfied throughout each $(r'_(n - 1), r_n)$. Indeed, if there exists some value within this interval for which @eq:nevanlinna-borel-infinite-radius fails, then $r_n$, which was defined by an infimum, would then be at most this new value, contradicting the assertion that it lay within the interval. It follows that the exceptional set must lie outside of the disjoint union; in other words,
    $
      E_0 subset.eq RR_(>= r_0) without union.big_(n = 1)^N (r'_(n - 1), r_n) = union.big_(n = 0)^N [r_n, r'_n].
    $
    We state without proof that subadditivity holds:
    $
      integral_(E_0) dr <= sum_(n = 0)^N (r'_n - r_n).
    $
    By construction, for points sufficiently close to $r_n$ or at $r_n$ itself,
    $
      T(r + frac(1, T(r))) >= 2 T(r),
    $
    continuity allows (in either case) this inequality to be extended to $r = r_n$. Then for each $n$,
    $
      T(r'_n) = T(r_n + frac(1, T(r_n))) >= 2 T(r_n), \ T(r'_n) <= T(r_(n + 1)) ==> T(r_(n + 1)) >= 2 T(r_n).
    $
    Using induction, $T(r_n) >= 2^n T(r_0)$, implying that
    $
      r'_n - r_n = frac(1, T(r_n)) <= frac(1, 2^n T(r_0)) \ sum_(n = 0)^N (r'_n - r_n) <= frac(1, T(r_0)) sum_(n = 0)^oo frac(1, 2^n) = 2 / T(r_0) <= 2.
    $
  + Suppose $R_0 < oo$ in the theorem statement. Let $T_0 (rho) = T(R_0 - ee^(-rho))$, where $rho_0 = log 1 / (R_0 - r_0) <= rho < oo$, so that $T_0$ is an increasing function on $[rho_0, oo)$. By the result above, $exists E'_0 subset.eq [rho_0, oo)$ such that
    $
      integral_(E_0') dif rho <= 2, quad T_0 (rho + frac(1, T_0 (rho))) < 2 T_0 (rho) quad forall rho in.not E'_0.
    $
    Substitute $rho = log 1 / (R_0 - r)$, $r = R_0 - ee^(-rho)$, $E_0 = (rho mapsto R_0 - ee^(-rho))(E'_0)$, so that $T_0 (rho) = T(r)$, and
    $
      integral_(E_0) dr / (R_0 - r) <= 2, quad T(R_0 - (R_0 - r) ee^(-1 / T(r))) < 2 T(r) quad forall r in.not E_0.
    $
    We are left to bound the inequality to be in the form of @eq:nevanlinna-borel-finite-radius. For $x in (0, 1)$, $ ee^(-x) < 1 - (ee - 1) / ee x < 1 - x / ee, $
    thus for $r$ within $[r_0, R_0)$ outside $E_0$, we have from $ee^(-1 / T(r)) < 1 - 1 / (ee T(r))$. Hence,
    $
      T(R_0 - (R_0 - r) ee^(-1 / T(r))) & >= T(R_0 - (R_0 - r) (1 - 1 / (ee T(r)))) \
                                        & = T(r + frac(R_0 - r, ee T(r))).
    $
    If $rho, rho'$ are chosen such that $R_0 - rho' < ee^(-2) (R_0 - rho)$, then
    $
      integral_(rho)^(rho') dr / (R_0 - r) = log(frac(R_0 - rho, R_0 - rho')) > log(ee^2) = 2.
    $
    Since $integral_(E_0) dr / (r_0 - r) <= 2$, there then $(rho, rho') subset.!= E_0$. Thus, $exists r in (rho, rho')$ such that $r in.not E_0$.#qedhere
]

#lbl(
  theorem(
    [Second Fundamental Theorem of Nevanlinna Theory, Part 2],
    restate: true,
    restate-keys: "thm:nevanlinna-second-fundamental-theorem-part-2",
  )[
    + If $R_0 = oo$ and $f$ has finite order, then
      Let $f : D(0, R_0) -> extcomplex$ ($0 < R_0 <= oo$) be meromorphic and non-constant. Define $S(r, f)$ as in @eq:nevanlinna-second-fundamental-theorem-part-1-small-error-term. Then
      $
        S(r, f) = Order(log T(r, f)) + Order(log r) #tag[$(dagger)$]
      $
      as $r -> oo$ through all values.
    + If $R_0 = oo$ and $f$ has infinite order, then $(dagger)$ holds as $r -> oo$ through all values of $r$ outside a set $E$ of finite linear measure.
    + If $R_0 < oo$, then
      $
        S(r, f) = Order(logp T(r, f) + log 1 / (R_0 - r)) #tag[$(dagger.double)$]
      $
      as $r -> R_0^-$ outside a set $E$ satisfying
      $
        integral_E dr / (R_0 - r) < oo.
      $
      Moreover, for any $rho, rho' in (0, R_0)$ such that $R_0 - rho' < ee^(-2) (R_0 - rho)$ (implying that $rho < rho'$), $exists r in (rho, rho')$ such that $r in.not E$.
  ],
  <thm:nevanlinna-second-fundamental-theorem-part-2>,
)

#proof[
  As a function of $r$,
  $
    S(r, f) = m(r, (f')/f) + m(r, frac(phi.alt', phi.alt)) + "constant",
  $
  where $phi.alt(z) = product_(nu = 1)^q (f(z) - a_nu)$, where the constant term does not depend on $r$. In all three perceivable cases,
  #lbl(
    $
      T(r, phi.alt) <= sum_(nu = 1)^q T(r, f - a_nu) = q T(r, f) + Order(1),\
      logp T(r, phi.alt) <= logp T(r, f) + Order(1)
    $,
    <eq:nevanlinna-second-fundamental-theorem-part-2_intermediate>,
  )
  by @prop:nevanlinna-characteristic-properties (product-subadditivity), @thm:nevanlinna-first-fundamental-theorem (first fundamental theorem). In the first case, where $R_0 = oo$, by @prop:nevanlinna-log-diff-proximity-estimate with $R = 2r$,
  $
                     m(r, (f')/f) & < 4 logp T(R, f) + Order(1) + 5 logp(2r) \
                                  & = Order(logp T(2r, f)) + Order(logp r). \
    m(r, frac(phi.alt', phi.alt)) & < 4 logp T(R, phi.alt) + Order(1) + 5 logp(2r) \
                                  & = Order(logp T(2r, phi.alt)) + Order(logp r).
  $
  Since $f$ has finite order, $T(2r, f) = Order((2r)^(rho + epsilon)) = Order(r^rho.alt)$, so $logp T(2r, f) = Order(logp r)$, thus as $r -> oo$, using @eq:nevanlinna-second-fundamental-theorem-part-2_intermediate we have
  $
    m(r, (f')/f) = Order(logp T(2r, f)) + Order(logp r) = Order(log r), \ m(r, frac(phi.alt', phi.alt)) = Order(logp T(2r, phi.alt)) + Order(logp r) = Order(log r).
  $
  Then $S(r, f) = Order(log r)$, clearly satisfying $(dagger)$.

  Now assume $f$ is not necessarily of finite order and $R_0 = oo$. Then by @prop:nevanlinna-log-diff-proximity-estimate with $R = r + 1 / T(r)$,
  $
    m(r, (f')/f) < Order(logp T(r + 1 / T(r, f), f)) + Order(1) + Order(logp r) \
    m(r, frac(phi.alt', phi.alt)) < Order(logp T(r + 1 / T(r, phi.alt), phi.alt)) + Order(1) + Order(logp r)
  $
  By @lem:nevanlinna-borel, there exist some exceptional sets $E_1, E_2$ each of linear measure not exceeding 2 such that for $r in.not E_1 union E_2$,
  $
    logp T(r + 1 / T(r, f), f) <= logp T(r, f) + Order(1) \ logp T(r + 1 / T(r, phi.alt), phi.alt) <= logp T(r, phi.alt) + Order(1)
  $
  thus for $r -> oo$ with $r in.not E_0$,
  $
    S(r, f) = Order(logp T(r, f)) + Order(logp r).
  $
  Lastly, assume that $R_0 < oo$. Now apply @prop:nevanlinna-log-diff-proximity-estimate with $R = r + (R_0 - r) / (ee T(r, f))$ and $R = r + (R_0 - r) / (ee T(r, phi.alt))$, so that for $r$ outside some exceptional set satisfying $integral_E dr / (R_0 - r) <= 4 < oo$, by @lem:nevanlinna-borel,
  $
    m(r, (f')/f) & < Order(logp T(r + (R_0 - r) / (ee T(r, f)), f)) + Order(1) \
                 & quad "" + Order(logp(r + (R_0 - r) / (ee T(r, f)))) + Order(logp (ee T(r, f)) / (R_0 - r)), \
                 & <Order(logp T(r,f)) + Order(1) + Order(logp (ee T(r, f)) / (R_0 - r)) \
                 & = Order(logp T(r, f) + log 1 / (R_0 - r)),
  $
  where the $Order(logp(r + (R_0 - r) / (ee T(r, f))))$ term has been coalesced to $Order(1)$ as $r + (R_0 - r) / (ee T(r, f))$ is bounded.
  $
    m(r, (phi.alt')/phi.alt) &= Order(logp T(r, phi.alt) + log 1 / (R_0 - r)) \
    &<= Order(logp T(r, f) + log 1 / (R_0 - r)). #tag[(by @eq:nevanlinna-second-fundamental-theorem-part-2_intermediate)]
  $
  Therefore,
  $
    S(r, f) = Order(logp T(r, f) + log 1 / (R_0 - r)). #qedhere
  $
]

#lbl(
  proposition[
    If $f : CC -> extcomplex$ is meromorphic and $T(r, f) = Order(log r)$, then $f$ is a rational function.
  ],
  <prop:nevanlinnaorderrationalcondition>,
)

#proof[
  We must have (for any $a in extcomplex$) $N(r, a, f) = Order(log r)$. We assert that $f$ attains each value finitely many times. Otherwise, for each $k in NN$, there exists $r'$ such that $forall r > r'$, $n(r, a, f) > k$. Then
  $
    N(r, a, f) = c + integral_(r')^r (n(x, a, f) - n(0, a, f)) / x dx + n(0, a, f) log r > c + k log r.
  $
  Thus, $N$ eventually grows faster than $k log r$ for any $k$. It follows that each $a$ is attained finitely many times by contradiction. Construct $g = Order(abs(z)^d)$ to be a polynomial with its zeros at each pole (finitely many), counting orders, of $f$.

  Then $h = f g$ is entire, and furthermore, $T(r, h) <= T(r, f) + T(r, g)$. Since $T(r, f) = Order(log r)$ and
  $
    T(r, g) = m(r, g) <= logp M(r, g) = Order(log r),
  $
  then
  $ log M(r, h) <= 3 T(2r, h) = Order(log r). #tag[(by @thm:nevanlinna-entire-function-maximum-modulus-sandwich with $R = 2r$)] $ Then
  $
    M(r, h) <= a r^b + c quad forall r>0,
  $
  where $a, b, c$ are constants. Thus the growth of $h$ may not exceed that of a polynomial. By Cauchy's Estimate (@thm:cauchys-estimate), for any natural number $n$ and positive $r$,
  $
    abs(h^((n)) (0)) <= (n!(a r^b + c)) / r^n = Order(r^(b-n)).
  $
  By letting $r -> oo$, it follows that $h^((n)) (0) = 0$ for any $n>b$. Then there are finitely many terms in the Taylor expansion of $h$, and therefore $h$ is a polynomial. Consequently $f$ is the quotient of two polynomials.
]

#definition[
  Let $f : D(0, R_0) -> extcomplex$ be meromorphic for $R_0 in RR_(> 0) union {oo}$. Then $f$ is said to be _admissible_ if either of the following are true:
  + $R_0 = oo$ and $f$ is non-constant.
  + $R_0 < oo$ and $limsup_(r -> R_0^-) T(r, f) / (log 1 / (R_0 - r)) = oo$.
]

These definitions ensure that $S(r, f)$ is generally sufficiently small:
#lbl(
  theorem[
    An admissible meromorphic function $f : D(0, R_0) -> extcomplex$ (given for $R_0 in RR_(> 0) union {oo}$) pertains to one of the following cases:
    + If $R_0 = oo$ and $f$ has finite order, then $S(r, f) = order(T(r, f))$ for $r -> R_0^-$ through all values.
    + If $R_0 = oo$ and $f$ has infinite order, then $S(r, f) = order(T(r, f))$ for $r -> R_0^-$ outside a set $E_0$ of finite linear measure, which depends on $f$ but not on ${a_nu}$ and $q$.
    + If $R_0 < oo$, then $S(r, f) = order(T(r, f))$ for $r -> R_0^-$ through any sequence ${r_n}_n$ dependent on $f$ but not on ${a_nu}$ and $q$.
  ],
  <thm:nevanlinna-admissibility-error-term-growth>,
)

#proof[
  Assume the conditions of the theorem.
  + Assume $R_0 = oo$ and $f$ has finite order. Then $T(r, f) = Order(r^(rho + epsilon))$, $r^(rho - epsilon) = order(T(r, f))$ (assuming that $rho > 0$), so $log r = order(T(r, f))$. Therefore, by @thm:nevanlinna-second-fundamental-theorem-part-2, it follows that through all values as $r -> oo$,
    $
      S(r, f) = Order(log T(r, f)) + Order(log r) = Order(log T(r, f)) = order(T(r, f)).
    $
    If $rho = 0$, either $log r = order(T(r, f))$ or $T(r, f) = Order(log r)$. The former case is the same as above.

    In the latter case, @prop:nevanlinnaorderrationalcondition gives that $f$ is rational. Hence, as $r -> oo$, $M(r, (f')/f), M(r, sum_(nu = 1)^q (f') / (f - a_nu)) -> 0$. Hence for sufficiently large $r$, $m(r, (f')/f)$ and $m(r, sum_(nu = 1)^q (f') / (f - a_nu))$ vanish and $S(r, f) = Order(1)$, therefore $S / T -> 0$.
  + Assume $R_0 = oo$ and $f$ has infinite order. Then by @thm:nevanlinna-second-fundamental-theorem-part-2, it follows that for $r -> R_0^-$ outside a set $E_0$ of finite linear measure, $S(r, f) = Order(log T(r, f)) + Order(log r)$. Since $(log T(r, f)) / (log r) -> oo$, then $log r = order(T(r, f))$, and thus $S(r, f) = order(T(r, f))$ outside this exceptional set.
  + Assume $R_0 < oo$. Construct two sequences ${rho_n}_n, {rho'_n}_n$ such that $rho_n < rho'_n$, $rho_n, rho'_n -> R_0^-$, and
    $
      lim_(n -> oo) T(rho_n, f) / (log 1 / (R_0 - rho_n)) = oo
    $
    (observe that this is no longer a limit superior) and $rho'_n = R_0 - ee^(-2) (R_0 - rho_n) / 2$, so that $R_0 - rho'_n < ee^(-2) (R_0 - rho_n)$.

    Then by @thm:nevanlinna-second-fundamental-theorem-part-2, there exists some $r_n in (rho_n, rho'_n)$ such that $r_n in.not E_0$. It follows that $R_0 - rho_n > R_0 - r_n > R_0 - rho'_n = (R_0 - rho_n) / (2 ee^2)$. Then for $n -> oo$,
    $
      1 / (R_0 - rho_n) = order(T(rho_n)) = order(T(r_n)),
    $
    since $T$ is a non-decreasing function of radius. Then as $n -> oo$,
    $
      S(r_n, f) = Order[logp T(r_n, f) + log order(T(r_n, f))] = order(T(r_n, f)).#qedhere
    $
]
