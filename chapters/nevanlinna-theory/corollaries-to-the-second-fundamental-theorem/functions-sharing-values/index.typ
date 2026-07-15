#import "/lib.typ": *
#show: docs-subsubchapter.with(
  title: [Functions Sharing Values],
  route: "functions-sharing-values",
  label: <sec:functions-sharing-values>,
)

In Nevanlinna's explanation of the various applications of the Second Fundamental Theorem, he proved:

#lbl(
  theorem[Nevanlinna's Five-Value Theorem][
    Let $f_1, f_2$ be two meromorphic, admissible functions on $D(0, R_0)$ ($R_0 < oo$). For each $a in extcomplex$, let $E_1 (a) = {z : f_1 (z) = a}$, $E_2 (a) = {z : f_2 (z) = a}$. Then if $E_1 (a) equiv E_2 (a)$ for at least five different values#footnote[The compared sets are allowed to be empty (in this case both functions omit $a$), and we do not consider the multiplicities at each potential solution. For instance, for $f_1 (z) = z$ and $f_1 (z) = z^2$, $0$ is a shared value.] of $a in extcomplex$, then $f_1 equiv f_2$.

    If $f_1, f_2$ are two merely meromorphic (not necessarily admissible) functions on $CC$ and if $E_1 (a) equiv E_2 (a)$ for at least five different values of $a in extcomplex$, then either $f_1 equiv f_2$ everywhere or they are both constant.
  ],
  <thm:nevanlinna-five-value-theorem>,
)

#proof[
  Assume that five values $a_1$ to $a_5$ exist for which $E_1 (a_1) = E_2 (a_1), dots, E_1 (a_5) = E_2 (a_5)$. Without loss of generality, assume they are finite (otherwise a Möbius transformation can be utilized to map a value outside these five to the infinity point).

  Because
  $ overline(N) (r, a_nu, f_1) = overline(N) (r, a_nu, f_2) $
  for $nu = 1, dots, 5$, $0 < r < R_0$, quantify this value by $N_nu (r)$. We now assume that $f_1 in.not equiv f_2$. Now each shared value corresponds to an infinity of $Psi = 1 \/ (f_2 - f_1)$.

  Now assuming that $f_1$, $f_2$ are not identically equal, we have
  $
    sum_(nu = 1)^5 N_nu (r) & <= N(r, Psi) <= T(r, Psi) = T(r, f_2 - f_1) + Order(1) \
                            & <= T(r, f_1) + T(r, f_2) + Order(1)
  $
  trivially by the First Fundamental Theorem (@thm:nevanlinna-first-fundamental-theorem) and the properties of the characteristic. Applying @eq:deficiency-relation-fundamental-inequality gives
  $
    4 T(r, f_j) - S(r, f_j) & <= overline(N) (r, f_j) + sum_(nu = 1)^5 N_nu (r) - N_0 (r, 0, f_j') quad j = 1, 2, \
                3 T(r, f_j) & <= S(r, f_j) + sum_(nu = 1)^5 N_nu (r).
  $
  Summing this inequality for both values of $j$ and applying the upper bound gives
  $
    T(r, f_1) + T(r, f_2) & <= 1 / 3 [S(r, f_1) + S(r, f_2)] + 2 / 3 sum_(nu = 1)^5 N_nu (r) \
                          & <= 1 / 3 [S(r, f_1) + S(r, f_2)] + 2 / 3 [T(r, f_1) + T(r, f_2)] + Order(1).
  $
  If $R_0 < oo$, then outside a set $E_0$ of logarithmic measure not exceeding $4$, or $integral_(E_0) dr / (R_0 - r) <= 4$, by the Second Fundamental Theorem estimates (@thm:nevanlinna-second-fundamental-theorem-part-2) and the fact that $logp T(r, f) = order(T(r, f))$,
  $
    (1 - order(1)) [T(r, f_1) + T(r, f_2)] & <= Order(log 1 / (R_0 - r)) \
    & ==> limsup_(r -> R_0^- \ r in.not E_0) T(r, f_j) / (log 1 / (R_0 - r)) = Order(1).
  $
  We now aim to extend this outside of $E_0$.

  For any $r^* in E_0$, let $r' in {r_n}$ be the infimum of values exceeding $r^*$ not in $E_0$. If $r^* = r'$, then arbitrarily close to $r^*$, there are points for which the limit superior assertion holds. By continuity, this holds at $r^*$ as well.

  Hence, assume $r' > r^*$. Then $[r^*, r_n) subset.eq E_0$, we must have $integral_(r^*)^(r_n) dr / (R_0 - r) = log((R_0 - r^*) / (R_0 - r')) <= 4$, so $log(1 / (R_0 - r^*)) >= log(1 / (R_0 - r')) - 4$. Since $log(1 / (R_0 - r))$ is continuous and non-vanishing for $r$ sufficiently close to $R_0$ and $T$ is non-decreasing,
  $
    T(r^*, f_j) / (log 1 / (R_0 - r^*)) <= T(r', f_j) / (log 1 / (R_0 - r')) (1 + 4 / (log 1 / (R_0 - r') - 4)) = Order(T(r', f_j) / (log 1 / (R_0 - r'))).
  $
  This shows that
  $ limsup_(r -> R_0^-) T(r, f_j) / (log 1 / (R_0 - r)) = Order(1), $
  which contradicts the admissibility of $f_j$. Hence, our original assumption that $f_1 equiv.not f_2$ is false, completing the first statement of the theorem.

  On the other hand, if $R_0 = oo$, then outside a set $E_0$ of linear measure not exceeding $4$, by the Second Fundamental Theorem estimates (@thm:nevanlinna-second-fundamental-theorem-part-2), $S(r, f_j) = order(T(r, f_j))$, and thus
  $
    T(r, f_1) + T(r, f_2) & <= order(T(r, f_1)) + order(T(r, f_2)) + Order(1) \
                          & ==> T(r, f_1) + T(r, f_2) = Order(1).
  $
  Then $f_1, f_2$ are constant, or the assumption that $f_1 equiv.not f_2$ was false. This concludes the theorem.
]

#remark[
  The functions $f_1 : z mapsto exp(z)$ and $f_2 : z mapsto exp(-z)$ imply that five cannot be sharpened to four. Indeed,
  $
    E_1 (0) = E_2 (0) = emptyset = E_1 (oo) = E_2 (oo),
  $
  $ E_1 (1) = E_2 (1) = {2 uppi ii k}_(k in ZZ), $
  and
  $ E_1 (-1) = E_2 (-1) = {2 uppi ii k + uppi ii}_(k in ZZ). $
  It can be verified algebraically that $0$, $oo$, $1$, $-1$ are the only "shared" values; the first two are omitted values while any solution must satisfy $ee^(2 z) = 1$, which corresponds to points where $exp$ attains $1$ and $-1$.
]

The recent developments of Nevanlinna has generalized preexisting results to more arbitrary domains such as annuli. A generalization of the Five-Value theorem on annuli is given in @xuwang2016.

Further results on Nevanlinna theory, such as the value distribution of derivatives, the Ahlfors' theory, and the proofs of the theorems given at the end of @sec:differential-geometry, we refer to @hayman1964meromorphic.
