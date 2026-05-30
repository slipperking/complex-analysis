#import "/lib.typ": *
== Properties of $T(r, f)$ and the First Fundamental Theorem
#proposition[
  If $f_k$ ($k = 1, dots, n$) are meromorphic in $D(0, R)$, then for $0 < r < R$,
  1. $N(r, product_(k = 1)^n f_k) <= sum_(k = 1)^n N(r, f_k)$. <itm:nevanlinnathreefunctionsmiscproperties_Nprodsubadd>
  2. $N(r, sum_(k = 1)^n f_k) <= sum_(k = 1)^n N(r, f_k)$ (subadditivity). <itm:nevanlinnathreefunctionsmiscproperties_Nsubadd>
  3. $m(r, product_(k = 1)^n f_k) <= sum_(k = 1)^n m(r, f_k)$.  <itm:nevanlinnathreefunctionsmiscproperties_mprodsubadd>
  4. $m(r, sum_(k = 1)^n f_k) <= log n + sum_(k = 1)^n m(r, f_k)$. <itm:nevanlinnathreefunctionsmiscproperties_msubaddconst>
  5. $T(r, product_(k = 1)^n f_k) <= sum_(k = 1)^n T(r, f_k)$. <itm:nevanlinnathreefunctionsmiscproperties_Tprodsubadd>
  6. $T(r, sum_(k = 1)^n f_k) <= log n + sum_(k = 1)^n T(r, f_k)$. <itm:nevanlinnathreefunctionsmiscproperties_Tsubaddconst>
] <prop:nevanlinnathreefunctionsmiscproperties>

#proof[
  Let $z$ be an arbitrary point in the disk. If $m_k$ is the pole order of $f_k$ at $z$ (0 if it is not a pole), then the pole order at $z$ of $sum_k f_k$ does not exceed $max_k m_k$. It is hence clear that $n(r, sum_k f_k) <= sum_k n(r, f_k)$.

  Moreover, if ${b_k^((j))}_j$ are the poles of $f_k$ in the disk counted according to orders, and ${b^((j))}_j$ are the poles of $sum_k f_k$, then
  $
    sum_(k = 1)^n sum_j log abs(r / b_k^((j))) >= sum_j log abs(r / b^((j))).
  $
  Recognizing that
  $
    N(r, sum_k f_k) = sum_j log abs(r / b^((j))) + n(0, sum_k f_k) log r \
    sum_(k = 1)^n N(r, f_k) = sum_(k = 1)^n sum_j log abs(r / b_k^((j))) + sum_k n(0, f_k) log r,
  $
  @itm:nevanlinnathreefunctionsmiscproperties_Nsubadd then follows. Since the pole order at $z$ of $product_k f_k$ does not exceed $sum_k m_k$, it also follows that $n(r, product_k f_k) <= sum_k n(r, f_k)$. The same logic can be applied henceforth to prove @itm:nevanlinnathreefunctionsmiscproperties_Nprodsubadd.

  @itm:nevanlinnathreefunctionsmiscproperties_mprodsubadd and @itm:nevanlinnathreefunctionsmiscproperties_msubaddconst are clear from @prop:lognonnegativepartproperties. @itm:nevanlinnathreefunctionsmiscproperties_Tprodsubadd and @itm:nevanlinnathreefunctionsmiscproperties_Tsubaddconst follow the previous inequalities.
]

#theorem[
  Let $f: D(0, R) -> extcomplex$ be meromorphic such that $f(z) = c z^k + Order(z^(k + 1))$. For $0 < r < R$,
  $
    T(r, f) &= 1 / (2 uppi) integral_0^(2 uppi) N(r, ee^(ii theta), f) dtheta + 1 / (2 uppi) integral_0^(2 uppi) log abs(c_theta) dtheta \
    &= 1 / (2 uppi) integral_0^(2 uppi) N(r, ee^(ii theta), f) dtheta +
    cases(
      log abs(c) quad & "if" k < 0,
      logp abs(c) quad & "if" k = 0,
      0 quad & "if" k > 0,
    ),
  $
  where $c_theta$ is the first nonzero coefficient of the Laurent expansion of $f - ee^(ii theta)$ at the origin.
] <thm:nevanlinnacartanidentity>

#proof[
  For $theta in [0, 2 uppi]$, from @eq:nevanlinnacountingjensensformulaexposition2 on $f - ee^(ii theta)$ (let $c_theta$ be the first nonzero coefficient of the Laurent series) we obtain
  $
    log abs(c_theta) = N(r, f) - N(r, ee^(ii theta), f) + 1 / (2 uppi) integral_0^(2 uppi) log abs(f(r ee^(ii phi.alt) - ee^(ii theta))) dif phi.alt.
  $
  Therefore, by integrating in $theta$,
  $
    1 / (2 uppi) integral_0^(2 uppi) log abs(c_theta) dtheta &= N(r, f) - 1 / (2 uppi) integral_0^(2 uppi) N(r, ee^(ii theta), f) dtheta \
    &quad "" + 1 / (2 uppi) integral_0^(2 uppi) [integral_0^(2 uppi) log abs(f(r ee^(ii phi.alt) - ee^(ii theta))) dif phi.alt] dtheta.
  $ <eq:nevanlinnacartanidentity_intermediate>
  For any $w in CC^*$,
  $
    logp abs(w) = 1 / (2 uppi) integral_0^(2 uppi) log abs(w - ee^(ii theta)) dtheta,
  $ <eq:jensensformulalinearcase>
  which follows directly from Jensen's formula on the function $z mapsto w - z$ (by considering when $w in overline(DD)$ and $abs(w) > 1$). Letting $phi.alt in [0, 2 uppi]$, we have by setting $w = f(r ee^(ii phi.alt))$,
  $
    logp abs(f(r ee^(ii phi.alt))) = 1 / (2 uppi) integral_0^(2 uppi) log abs(f(r ee^(ii phi.alt)) - ee^(ii theta)) dtheta.
  $
  Hence, from absolute convergence we have
  $
    m(r, f) &= 1 / (2 uppi) integral_0^(2 uppi) [1 / (2 uppi) integral_0^(2 uppi) log abs(f(r ee^(ii phi.alt)) - ee^(ii theta)) dtheta] dif phi.alt \
    &= 1 / (2 uppi) integral_0^(2 uppi) [1 / (2 uppi) integral_0^(2 uppi) log abs(f(r ee^(ii phi.alt)) - ee^(ii theta)) dif phi.alt] dtheta.
  $
  From @eq:nevanlinnacartanidentity_intermediate, it follows that
  $
    T(r, f) = 1 / (2 uppi) integral_0^(2 uppi) N(r, ee^(ii theta), f) dtheta + 1 / (2 uppi) integral_0^(2 uppi) log abs(c_theta) dtheta.
  $
  If $f(0) = oo$, then subtracting $ee^(ii theta)$ from $f$ does not modify the first nonzero coefficient of the Laurent series ($c = c_theta$). Thus, in this case
  $
    T(r, f) = 1 / (2 uppi) integral_0^(2 uppi) N(r, ee^(ii theta), f) dtheta + log abs(c)
  $
  Otherwise, $c_theta = f(0) - ee^(ii theta)$ unless this quantity is 0 (cancels), which can happen for at most one $theta$ value, which is negligible when integrated. Thus by @eq:jensensformulalinearcase,
  $
    1 / (2 uppi) integral_0^(2 uppi) log abs(c_theta) dtheta = 1 / (2 uppi) integral_0^(2 uppi) log abs(f(0) - ee^(ii theta)) dtheta =
    cases(
      logp abs(c) & "if" f(0) != 0\, ,
      0 & "otherwise".,
    ) #qedhere
  $
]

#theorem[
  For (non-constant) meromorphic $f$ in $D(0, R)$, $T(r, f)$ is a nondecreasing convex (not necessarily strictly convex) function of $log r$ (for $0 < r < R$).
] <thm:nevanlinnacharacteristicnondecreasingconvex>

#proof[
  Applying $dv(, log r, style: "horizontal")$ to @thm:nevanlinnacartanidentity, we have
  $
    dv(T(r, f), log r) &= 1 / (2 uppi) dv(, log r) integral_0^(2 uppi) N(r, ee^(ii theta), f) dtheta \
    &= 1 / (2 uppi) integral_0^(2 uppi) [(n(r, ee^(ii theta), f) - n(0, ee^(ii theta), f)) / r dv(r, log r) + n(0, ee^(ii theta), f)] dtheta \
    &= 1 / (2 uppi) integral_0^(2 uppi) n(r, ee^(ii theta), f) dtheta >= 0
  $
  by Lebesgue's Dominated Convergence Theorem. Because the counting function $n$ is nondecreasing in $r$, it is also nondecreasing in $log r$.
]

#theorem[First Fundamental Theorem of Nevanlinna Theory][
  Let $f$ be (non-constant) meromorphic on $D(0, R)$ where $0 < r <= oo$. Then for any $a in CC$,
  $ T(r, a, f) = T(r, f) - log abs(c) + epsilon(r, a, f), $
  where $abs(epsilon(r, a, f)) <= logp abs(a) + log 2$ for $0 < r < R$ and $c$ is the first nonzero coefficient of the innermost Laurent series expansion of $f(z) - a$ about the origin.
] <thm:nevanlinnafirstfundamentaltheorem>

#proof[
  Since for $z in partial D(0, r)$, by the properties of $logp$ as in @prop:lognonnegativepartproperties,
  $
    logp abs(f(z) - a) <= logp (abs(f(z)) + abs(a)) <= log 2 + logp abs(f(z)) + logp abs(a).
  $
  Integrating over $partial D(0, r)$ implies
  $ m(r, f - a) <= log 2 + m(r, f) + logp abs(a). $
  From
  $
    logp abs(f(z)) <= logp (abs(f(z) - a) + abs(a)) <= log 2 + logp abs(f(z) - a) + logp abs(a),
  $
  we obtain
  $ m(r, f) <= log 2 + m(r, f - a) + logp abs(a). $
  Letting $epsilon(r, a, f) = m(r, f - a) - m(r, f)$, the two proximity-related inequalities give
  $ abs(epsilon(r, a, f)) <= log 2 + logp abs(a). $
  Then by @prop:nevanlinnafirsttheorematzero, and the fact that the poles of $f$ match those of $f - a$ (more importantly, $N(r, f - a) = N(r, f)$),
  $
    T(r, 0, f - a) & = N(r, 0, f - a) + m(r, 0, f - a) \
                   & = N(r, f - a) + m(r, f - a) - log abs(c) \
                   & = N(r, f) + m(r, f - a) - log abs(c) \
                   & = N(r, f) + m(r, f) + epsilon(r, a, f) - log abs(c) \
                   & = T(r, f) + epsilon(r, a, f) - log abs(c). #qedhere
  $
]

For $R = oo$, we have
$ N(r, a, f) + m(r, a, f) = T(r, f) + Order(1), $
which shows that $T$ is essentially independent of the choice of $a$, except for a bounded $Order(1)$ term. Thus, this motivates why $T$ is _characteristic_ of $f$.

As we have seen before, it is often pedantic and somewhat annoying to account for cases where $f(0)$ is either zero or infinity, which is a minor grievance in Nevanlinna theory. Expositions from~@hayman1964meromorphic and~@holland1973introduction tend to leave out this tedious treatment. However, here we will make this distinction whenever necessary for completeness.

#corollary[
  Let $f$ be (non-constant) meromorphic on $D(0, R)$. Then for $0 < r <= oo$,
  $ 1 / (2 uppi) integral_0^(2 uppi) m(r, ee^(ii theta), f) dtheta <= log 2. $
]

#proof[
  By the First Fundamental Theorem (@thm:nevanlinnafirstfundamentaltheorem), we have
  $
    T(r, f) = N(r, ee^(ii theta), f) + m(r, ee^(ii theta), f) + log abs(c_theta) + epsilon(r, ee^(ii theta), f),
  $
  where $abs(epsilon(r, ee^(ii theta), f)) <= log 2$ and $c_theta$ is the first nonzero coefficient of the Laurent expansion for $f - ee^(ii theta)$. Hence,
  $
    T(r, f) = 1 / (2 uppi) integral_0^(2 uppi) [N(r, ee^(ii theta), f) + m(r, ee^(ii theta), f) + log abs(c_theta) + epsilon(r, ee^(ii theta), f)] dtheta.
  $
  By @thm:nevanlinnacartanidentity, we thus have
  $
    T(r, f) &= T(r, f) - 1 / (2 uppi) integral_0^(2 uppi) log abs(c_theta) dtheta + 1 / (2 uppi) integral_0^(2 uppi) m(r, ee^(ii theta), f) dtheta \
    &quad + 1 / (2 uppi) integral_0^(2 uppi) log abs(c_theta) dtheta + 1 / (2 uppi) integral_0^(2 uppi) epsilon(r, ee^(ii theta), f) dtheta.
  $
  This implies that $integral_0^(2 uppi) m(r, ee^(ii theta), f) dtheta = - integral_0^(2 uppi) epsilon(r, ee^(ii theta), f) dtheta <= 2 uppi log 2. #qedhere$
]

#remark[
  Since $m$ is bounded in the integrated sense, if $T$ is generally large, then for most values, $N$ will be nearly equal to $T$.
]

#proposition[
  Let $f, g$ be meromorphic on $D(0, R)$ and suppose $m in NN$. For any $0 < r < R$, the following properties hold:
  1. $T(r, f g) <= T(r, f) + T(r, g)$. <itm:nevanlinnacharacteristicproperties_prodsubadd>
  2. $T(r, f + g) <= T(r, f) + T(r, g) + Order(1)$. <itm:nevanlinnacharacteristicproperties_subadd>
  3. $T(r, 1 / f) = T(r, f) + Order(1)$. <itm:nevanlinnacharacteristicproperties_inversion>
  4. $T(r, f^n) = n T(r, f)$. <itm:nevanlinnacharacteristicproperties_power>
] <prop:nevanlinnacharacteristicproperties>

#proof[
  Since
  $ N(r, f g), N(r, f + g) <= N(r, f) + N(r, g), $
  and by
  $ logp abs(f g) <= logp abs(f) + logp abs(g), quad logp abs(f + g) <= log 2 + logp abs(f) + logp abs(g), $
  it follows that
  $ m(r, f g) <= m(r, f) + m(r, g), quad m(r, f + g) <= m(r, f) + m(r, g) + Order(1), $
  and the conclusions of @itm:nevanlinnacharacteristicproperties_prodsubadd and @itm:nevanlinnacharacteristicproperties_subadd. @itm:nevanlinnacharacteristicproperties_inversion is a corollary of the First Fundamental Theorem (@thm:nevanlinnafirstfundamentaltheorem). Lastly, because a pole of $f^n$ has order $n$ times of that of $f$, it follows that $N(r, f^n) = n N(r, f)$. If $abs(f) >= 1$, it follows that $logp abs(f^n) = n logp abs(f)$ exactly. If $abs(f) < 1$, $logp abs(f^n) = n logp abs(f) = 0$. Hence, $m(r, f^n) = n m(r, f)$.

  Adding the two quantities $N$ and $m$ together gives @itm:nevanlinnacharacteristicproperties_power.
]

We now provide some classical examples of the Nevanlinna characteristic:

1. Let
  $ f(z) = c (z^p + a_1 z^(p - 1) + dots.c + a_p) / (z^q + b_1 z^(q - 1) + dots.c + b_q), quad c != 0 $
  be an arbitrary rational function in reduced form. If $p > q$, then for sufficiently large $r$, $f -> oo$ in every direction. This implies $logp abs(1 / (f(z) - a)) = 0$ for any complex $a$ and sufficiently large $r$ ($abs(z) > r$). This implies $m(r, a, f) = 0$. Additionally, the equation $f(z) = a$ has $p$ complex solutions by the Fundamental Theorem of Algebra (@thm:fundamentaltheoremofalgebra). Thus, for sufficiently large $r$ ($r > r'$), any $abs(z) > r$ has the property that $n(r, a, f) = n(abs(z), a, f)$,
  $
    N(r, a, f) & = (integral_0^(r') + integral_(r')^r) (n(x, a, f) - n(0, a, f)) / x dx + n(0, a, f) log r \
               & = Order(1) + (n(r', a, f) - n(0, a, f)) (log r - log(r')) \
               & wide "" + n(0, a, f) log r \
               & = p log r + Order(1), quad a != oo.
  $
  Hence,
  $ T(r, f) = p log r + Order(1). $
  Similarly, $T(r, 1 / f) = T(r, f) + Order(1)$ by a preceding result. It then follows that if $p < q$,
  $ T(r, f) = q log r + Order(1). $
  Lastly, the case where $p = q$ (derived with $a != c$) is resolvable with
  $ T(r, f) = p log r + Order(1) = q log r + Order(1). $
  In all cases,
  $ T(r, f) = d log r + Order(1), $
  where $d = max(p, q)$ is defined to be the _degree of the rational function_ $f$.

  Unless $f(oo) = a$, the proximity function vanishes for sufficiently large $r$. In this case, let $alpha$ be the multiplicity at which $f$ attains $a$ at $z = oo$. If $a$ is finite,
  $
    m(r, a, f) = 1 / (2 uppi) integral_0^(2 uppi) logp abs(1 / ((r ee^(ii theta))^(-alpha) Order(1))) dtheta = alpha log r + Order(1) \
    N(r, a, f) = (d - alpha) log r + Order(1).
  $
  If $f$ has a pole of order $alpha$ at $oo$, we have likewise that
  $
    m(r, a, f) = alpha log r + Order(1), quad N(r, a, f) = (d - alpha) log r + Order(1).
  $
2. Consider
  $ exp(z) = exp(r cos theta + ii r sin theta), quad z = r ee^(ii theta). $
  By its entireness, $N(r, f) = 0$ for any $r > 0$, and the proximity is given by
  $
    m(r, f) = 1 / (2 uppi) integral_0^(2 uppi) logp abs(ee^(r ee^(ii theta))) dtheta = 1 / (2 uppi) (integral_0^(uppi / 2) + integral_((3 uppi) / 2)^(2 uppi)) (r cos theta)^+ dtheta = r / uppi.
  $
  Therefore,
  $ T(r) = m(r, f) + N(r, f) = r / uppi. $
  Moreover, $m(r, 0, f) = r / uppi$ and $N(r, 0, f) = 0$, whereas for $a in CC^*$, the solutions to $ee^z = a$ are in the form of $z_k = z_0 + 2 k uppi ii$, where $z_0 = x_0 + ii y_0$. The condition $abs(z_k) <= r$ is equivalent to
  $ abs(y_0 + 2 k uppi)^2 + abs(x_0)^2 <= r^2 ==> abs(y_0 + 2 k uppi) <= r + Order(1). $
  It follows that 
  $ n(r, a, f) = r / uppi + Order(1) ==> N(r, a, f) = r / uppi + Order(1), quad m(r, a, f) = Order(1). $

#chapter-section("classifying_meromorphic_growth")[
  #include "classifying_meromorphic_growth/index.typ"
]
#chapter-section("factorization_of_meromorphic_function")[
  #include "factorization_of_meromorphic_function/index.typ"
]
