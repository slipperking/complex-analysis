#import "/lib.typ": *

=== Classifying Growth of Entire Functions <sec:classifying_growth_of_entire_functions>

#lemma[
  Let $f : overline(D(0,r)) -> CC^*$ (where $r > 0$) be a nowhere-vanishing holomorphic function. It follows that
  $ log abs(f(0)) = 1 / (2 uppi) integral_0^(2 uppi) log abs(f (r ee^(ii theta))) dif theta. $
] <lem:nonvanishingholomorphiclogarithmabsolutemeanvalueproperty>

#proof[
  Without loss of generality, assume $r = 1$. Since $f$ is non-vanishing and $overline(DD)$ is simply connected, we may define the _holomorphic logarithm_ as
  $ log(f(z)) = integral_gamma (f'(z)) / (f(z)) dz + log(f (z_0)) $
  for any fixed $z_0 in overline(DD)$ and all $z in overline(DD)$, where $gamma subset overline(DD)$ is any piecewise smooth curve from $z_0$ to $z$.

  Hence, $log abs(f(z)) = Re [log (f(z))]$ and is therefore harmonic. The assertion then follows from the mean-value property.
]

#theorem("Jensen's Formula")[
  Let $f : overline(D(0,r)) -> CC$ be meromorphic such that $f(0) != 0$. If $a_1, dots, a_m$, $b_1, dots, b_n$ are the zeros and poles of $f$ in $overline(D(0,r))$, counted with multiplicities and orders, respectively, then
  $
    log abs(f(0)) = 1 / (2 uppi) integral_0^(2 uppi) log abs(f (r ee^(ii theta))) dif theta + sum_(k=1)^m log abs(a_k / r) - sum_(k=1)^n log abs(b_k / r).
  $
] <thm:jensensformula>

#proof[
  For simplicity, assume $a_1, dots, a_(m_0)$ are the zeros in $D(0,r)$ and $a_(m_0+1), dots, a_m$ are the zeros on $partial D(0,r)$. Similarly, let $b_1, dots, b_(n_0)$ be the poles in $D(0,r)$ and $b_(n_0+1), dots, b_n$ be the poles on $partial D(0,r)$. Let
  $ f(z) = g(z) (product_(j=1)^m (z - a_j)) / (product_(k=1)^n (z - b_k)), $
  where $g$ is holomorphic and non-vanishing on $overline(D(0,r))$. Since
  $ log abs(f(0)) = log abs(g(0)) + sum_(j=1)^m log abs(a_j) - sum_(k=1)^n log abs(b_k), $
  by @lem:nonvanishingholomorphiclogarithmabsolutemeanvalueproperty on $g$,
  $
    log abs(f(0))
    &= 1 / (2 uppi) integral_0^(2 uppi) log abs(f (r ee^(ii theta)) (product_(k=1)^n (r ee^(ii theta) - b_k)) / (product_(j=1)^m (r ee^(ii theta) - a_j))) dif theta \
    &quad""+ sum_(j=1)^m log abs(a_j) - sum_(k=1)^n log abs(b_k) \
    &= 1 / (2 uppi) integral_0^(2 uppi) log abs(f (r ee^(ii theta))) dif theta + sum_(j=1)^m log abs(a_j) - sum_(k=1)^n log abs(b_k) \
    &quad ""+ 1 / (2 uppi) integral_0^(2 uppi) [sum_(k=1)^n (log r + log abs(1 - b_k / (r ee^(ii theta)))) \
      &wide""- sum_(j=1)^m (log r + log abs(1 - a_j / (r ee^(ii theta))))] dif theta \
    &= 1 / (2 uppi) integral_0^(2 uppi) log abs(f (r ee^(ii theta))) dif theta + sum_(j=1)^m log abs(a_j / r) - sum_(k=1)^n log abs(b_k / r) \
    &quad ""+ Re 1 / taui [(sum_(j=1)^m integral.cont.cw_(partial D(0, abs(a_j \/ r))) - sum_(k=1)^n integral.cont.cw_(partial D(0, abs(b_k \/ r)))) (Log (1 - z) dz) / z] \
    &= 1 / (2 uppi) integral_0^(2 uppi) log abs(f (r ee^(ii theta))) dif theta + sum_(j=1)^m log abs(a_j / r) - sum_(k=1)^n log abs(b_k / r) \
    &quad ""+ Re 1 / taui (sum_(k=n_0+1)^n - sum_(j=m_0+1)^m) integral.cont.ccw_(partial DD) (Log (1 - z) dz) / z
  $
  where $z = a_j \/ (r ee^(ii theta)), b_k \/ (r ee^(ii theta))$, $dif theta = ii dz \/ z$, and the leftover integrals (up until $k=n_0$ and $j=m_0$) for interior points vanish by Cauchy--Goursat (@thm:cauchygoursattheorem), since $(Log(1-z)) / z$ has a removable singularity at $z = 0$.

  We now are left to prove that the remaining integral $I$ vanishes as well, which is not as immediate since the integrand does not extend continuously to the boundary. Let $z = ee^(ii theta)$, $dz = ii ee^(ii theta)$, then (by $psi = theta / 2$)
  $
    I
    &= integral.cont.ccw_(partial DD) (Log (1 - z) dz) / z = integral_0^(2 uppi) log abs(1 - ee^(ii theta)) dif theta = 2 integral_0^uppi log abs(ee^(-ii psi) - ee^(ii psi)) dif psi \
    &= 2 uppi log 2 + 2 integral_0^uppi log abs(sin psi) dif psi = 2 uppi log 2 + 4 integral_0^(uppi \/ 2) log abs(sin psi) dif psi \
    &= 2 uppi log 2 + 4 J.
  $
  Splitting at $uppi \/ 4$ and using $cos$ with a substitution for the second integral then yields
  $
    J = integral_0^(uppi \/ 4) log abs(sin psi) dif psi + integral_0^(uppi \/ 4) log abs(cos psi) dif psi = integral_0^(uppi \/ 4) log abs(1 / 2 sin 2 psi) dif psi.
  $
  Changing back to $theta = 2 psi$, we have
  $ J = J / 2 - uppi / 4 log 2 ==> 4 J = -2 uppi log 2 ==> I = 0. #qedhere $
]

As an immediate consequence, we have:

#corollary("Jensen's Inequality")[
  Let $f$ be holomorphic on $overline(D(0,r))$ such that $f equiv.not 0$ and $f(0) != 0$. It follows that
  $ log abs(f(0)) <= 1 / (2 uppi) integral_0^(2 uppi) log abs(f (r ee^(ii theta))) dif theta. $
] <cor:jensensinequality>

#theorem[Poisson--Jensen Formula][
  Suppose $f$ is a meromorphic function on $overline(D(0,r))$ such that $f equiv.not 0$ on $D(0,r)$ and is non-vanishing and non-infinity on $partial D(0,r)$. Let $a_1, dots, a_m$ and $b_1, dots, b_n$ be the zeros and poles of $f$ in $D(0,r)$, counted with multiplicity and order, respectively (multiplicities and orders count as multiple zeros or poles). Then it follows that
  $
    log abs(f(z)) &= integral_0^(2 uppi) log abs(f(zeta)) P (zeta, z) dif theta \
    &quad ""+ sum_(j=1)^m log abs((r (z - a_j)) / (r^2 - overline(a_j) z)) - sum_(k=1)^n log abs((r (z - b_k)) / (r^2 - overline(b_k) z)),
  $<eq:poisson_jensen_formula_statement>
  where $zeta = r ee^(ii theta)$, $z in D(0,r) without ({a_j}_(j=1)^m union {b_k}_(j=1)^n)$, and $P(zeta, z)$ is the Poisson kernel in @eq:poissonkernelgeneralform.
]<thm:poisson_jensen_formula>

#proof[
  For fixed $z in D(0,r)$ not at zeros or poles, let
  $ g_z (zeta) = f (r phi_(- z / r) (zeta / r)) $
  where $phi_(-a) = (phi_a)^(-1)$ is the unit disk automorphism sending 0 to $a$. Then $g_z$ maps 0 to $f (z)$, and has zeros at $r phi_(- z/r) (zeta / r) = a_k$ or $zeta = r phi_(z/r) (a_k / r)$ and poles at $r phi_(- z/r) (zeta / r) = b_k$ or $zeta = r phi_(z/r) (b_k / r)$. By Jensen's formula (@thm:jensensformula),
  $
    log abs(g_z (0)) & = log abs(f(z)) = 1 / (2 uppi) integral_0^(2 uppi) log abs(g_z (r ee^(ii theta))) dif theta \
                     & quad ""+ sum_(k=1)^m abs(phi_(z/r) (a_k / r)) - sum_(k=1)^n abs(phi_(z/r) (b_k / r)). #qedhere
  $
]

#lemma[
  Let $f : DD -> CC$ be a non-constant bounded holomorphic function whose zeros are $a_1, a_2, dots$, counted according to their multiplicities, ordered such that $abs(a_n) <= abs(a_(n+1))$ for all $n in NN$. Then,
  $ sum_(n=1)^infinity (1 - abs(a_n)) $
  is convergent.
] <lem:boundedholomorphicfunctionblaschkecondition>

#proof[
  First assume $f(0) != 0$ and choose $M$ such that $abs(f) <= M$ on $DD$. Let $n(r, 0, f)$ count the number of zeros of $f$, according to multiplicities, inside $overline(D(0,r))$. By Jensen's Formula (@thm:jensensformula), we have
  $
    log abs(f(0)) & = 1 / (2 uppi) integral_0^(2 uppi) log abs(f (r ee^(ii theta))) dif theta \
                  & quad ""+ sum_(k=1)^(n(r,0,f)) log abs(a_k / r) <= log(M) + sum_(k=1)^(n(r,0,f)) log abs(a_k / r).
  $
  For any fixed positive integer $k$, choose $r$ such that $abs(a_k) < r < 1$. Then $n(r, 0, f) gt.eq k$ and
  $ sum_(k=1)^(n(r,0,f)) log abs(a_j / r) <= sum_(j=1)^k log abs(a_j / r), $
  since each $log abs(a_j / r) < 0$ for $j = k+1, dots, n(r,0,f)$. Therefore,
  $ log abs(f(0)) <= log M + sum_(j=1)^k log abs(a_j / r) = log M + sum_(j=1)^k log abs(a_j) - k log r. $
  Rearranging,
  $ sum_(j=1)^k log abs(a_j) gt.eq log abs(f(0)) - log M + k log r. $
  Now let $r -> 1^-$ with $r > abs(a_k)$. Since $k log r -> 0$, it follows that
  $ sum_(j=1)^k log abs(a_j) gt.eq log abs(f(0)) - log M. $
  This holds for every $k$. Since $log abs(a_j) < 0$ for all $j$, the partial sums $sum_(j=1)^k log abs(a_j)$ are decreasing and bounded below by $log abs(f(0)) - log M$, hence converge to some finite limit, and
  $ sum_(j=1)^infinity log abs(a_j) gt.eq log abs(f(0)) - log M, $
  or equivalently,
  $ log abs(f(0)) <= log abs(M) + sum_(k=1)^infinity log abs(a_k). $
  For any $0 < a < 1$, we have $-log(a) = 1 - a + sum_(n=2)^infinity (1-a)^n a^n > 1 - a$. Hence,
  $ 0 <= sum_(k=1)^infinity (1 - abs(a_k)) < -sum_(k=1)^infinity log abs(a_k) <= log abs(M) - log abs(f(0)). $
  If $f$ has a zero of multiplicity $m$ at $0$, then the argument applies to $z |-> f(z) / z^m$.
]

#theorem("Blaschke Product")[
  Let ${a_k}_(k in NN) subset DD^* = DD without {0}$ be a sequence such that the series $sum_(k=1)^infinity (1 - abs(a_k))$ is convergent (known as the _Blaschke condition_). Then the _Blaschke product_, defined by
  $
    B(z) = product_(k=1)^infinity [-abs(a_k) / a_k phi_(a_k) (z)],
  $<eq:blaschkeproduct_statement>
  (where $phi_a (z)$ is a Möbius transformation in the form of @eq:mobiustransformationgroupofholomorphicautomorphismsunitdisk_statement), locally uniformly converges to an analytic function on $DD$ such that $abs(B) <= 1$ on $DD$, and its only zeros are precisely at each of ${a_k}_(k in NN)$, counted according to multiplicities.
] <thm:blaschkeproduct>

#proof[
  If it can be shown that
  $ sum_(k=1)^infinity abs(abs(a_k) / a_k (a_k - z) / (1 - overline(a_k) z) - 1) $
  locally uniformly converges, we can use @lem:infiniteproductlocallyuniformconvergencecriterion2 to show that the infinite product converges uniformly on compact subsets of $DD$. Let $overline(D(0,r)) subset DD$ be a compact subset. The summand can be bounded with
  $
    abs(abs(a_k) / a_k (a_k - z) / (1 - overline(a_k) z) - 1)
    &= abs(overline(a_k) / abs(a_k) (a_k - z) / (1 - overline(a_k) z) - 1) = abs((abs(a_k)^2 - overline(a_k) z) / (abs(a_k) (1 - overline(a_k) z)) - 1) \
    &= abs((abs(a_k)^2 - overline(a_k) z - abs(a_k) + abs(a_k) overline(a_k) z) / (abs(a_k) (1 - overline(a_k) z))) \
    &= abs((overline(a_k) z (abs(a_k) - 1) + abs(a_k) (abs(a_k) - 1)) / (abs(a_k) (1 - overline(a_k) z))) \
    &= abs(((overline(a_k) z + abs(a_k)) (1 - abs(a_k))) / (abs(a_k) (1 - overline(a_k) z))) \
    &<= (1 - abs(a_k)) (abs(overline(a_k)) (1 + r)) / (abs(a_k) (1 - abs(a_k) r)) < (1 - abs(a_k)) (1 + r) / (1 - r).
  $
  Since
  $
    sum_(k=1)^infinity abs(abs(a_k) / a_k (a_k - z) / (1 - overline(a_k) z) - 1) < (1 + r) / (1 - r) sum_(k=1)^infinity (1 - abs(a_k))
  $
  is convergent (Blaschke condition), by the Weierstrass $M$-Test (@thm:weierstrassmtest), $sum_(k=1)^infinity abs(abs(a_k)/a_k (a_k - z)/(1 - overline(a_k) z) - 1)$ converges uniformly on $overline(D(0,r))$. By @lem:infiniteproductlocallyuniformconvergencecriterion2, the infinite product in @eq:blaschkeproduct_statement converges uniformly on compact subsets of $DD$. The properties of its zeros follow from the lemma.

  Lastly, since $abs(phi_(a_k)) <= 1$ and each partial product is bounded by 1, it follows that $abs(B(z)) <= 1$ on $DD$.
]

#remark[
  A more general Blaschke product has an additional factor of $z^m$ to account for a zero at the origin, similar to the case of the Weierstrass product.
]

#corollary[
  Let $f : DD -> CC$ be bounded and holomorphic whose multiplicity of the zero at 0 is $m$ (if $f$ does not vanish at 0, then $m = 0$). If ${a_n}_(n in NN)$ are its zeros in $DD^*$, counting multiplicities, then
  $ f(z) = F(z) z^m product_(n=1)^infinity [-abs(a_n) / a_n phi_(a_n) (z)], $
  where $F$ is bounded, holomorphic, and non-vanishing on $DD$. Moreover,
  $ sup_(z in DD) abs(f(z)) = sup_(z in DD) abs(F(z)). $
]<cor:blaschkeproductfactorization>

#proof[
  Let
  $ F(z) = f(z) / (z^m product_(n=1)^infinity [-abs(a_k) / a_k phi_(a_n) (z)]). $
  By construction, $F$ extends to its removable singularities to a holomorphic function that does not vanish. Because
  $ sup_(z in DD) abs(z^m product_(n=1)^infinity [-abs(a_n) / a_n phi_(a_n) (z)]) <= 1, $
  it follows that
  $
    sup_(z in DD) abs(F(z)) gt.eq sup_(z in DD) abs(f(z)).
  $<eq:blaschkeproductfactorization_supremuminequalities>
  The partial products
  $ B_n (z) = product_(k=1)^n [-abs(a_k) / a_k phi_(a_k) (z)] $
  give for fixed $theta in RR$, $epsilon > 0$, the existence of $0 < r' < 1$ such that $r' < r < 1$ implies
  $ abs(B_n (r ee^(ii theta))) > 1 - epsilon. $
  Then by the Maximum Modulus Principle (@thm:maximum_modulus),
  $
    sup_(z in DD) abs(f(z) / (z^m B_n (z))) &= sup_(z in DD without overline(D(0,r))) abs(f(z) / (z^m B_n (z))) \ &<= 1 / (r^m (1 - epsilon)) sup_(z in DD) abs(f(z)) -> 1 / (1 - epsilon) sup_(z in DD) abs(f(z))
  $
  as $r -> 1^-$. Letting $epsilon -> 0^+$, $n -> infinity$ gives
  $ sup_(z in DD) abs(F(z)) <= sup_(z in DD) abs(f(z)), $
  which in conjunction with @eq:blaschkeproductfactorization_supremuminequalities, completes the final assertion.
]

From the results above, a recurring theme in complex analysis is hinted at; the rate of growth of functions provides insight towards the distribution of its zeros.

The subjects to be discussed here are relevant and preliminary to Nevanlinna theory, or the study of holomorphic value distribution.

For an entire function $f$, let $M(r, f) = sup_(abs(z) = r) abs(f(z)) = sup_(abs(z) <= r) abs(f(z))$ (by the Maximum Modulus Principle in @thm:maximum_modulus).

#definition("Growth Order of Entire Functions")[
  An entire function $f$ is said to be of _finite order_ if there exists $alpha, r_alpha in RR$ such that
  $ M(r, f) <= exp(r^alpha), quad forall r > r_alpha, $
  or in loose terms, $f$ is of finite order if it grows at most exponentially for large $z$. The _order_ of $f$, or $rho(f)$ is defined to be the infimum of all $alpha$ satisfying the previous condition.
]

#proposition[
  Let $f$ be entire; then if there exist $a, b, alpha, r_(alpha, beta) > 0$ such that
  $ M(r, f) <= exp(a r^alpha + b), quad forall r > r_(alpha, beta), $
  then $rho(f) <= alpha$.
]

#proof[
  For $epsilon > 0$, since $r^epsilon -> infinity$ as $r -> infinity$, for any $epsilon > 0$, there exists $r_epsilon$ such that
  $ r^epsilon gt.eq 2a ==> 1/2 r^(alpha + epsilon) gt.eq a r^alpha $
  for $r > r_epsilon$. There exists $r'_epsilon > 0$ such that
  $ r > r'_epsilon ==> 1/2 r^(alpha + epsilon) gt.eq b. $
  For simplicity, let the value $max{r_epsilon, r'_epsilon}$ be denoted by $r_epsilon$. Then
  $ r > r_epsilon ==> a r^alpha + b <= 1/2 r^(alpha + epsilon) + 1/2 r^(alpha + epsilon) = r^(alpha + epsilon). $
  By assumption, we have
  $ M(r, f) <= exp(a r^alpha + b) <= exp(r^(alpha + epsilon)) ==> alpha + epsilon gt.eq rho(f). $
  Letting $epsilon -> 0^+$, the assertion follows.
]

#theorem[
  The order of an entire $f$ may be explicitly given by
  $ rho(f) = limsup_(r -> infinity) (log (log M(r, f))) / (log r). $
]

#proof[
  By assumption, we have $forall epsilon' > 0$, $exists 0 < epsilon < epsilon'$ (or simply just $forall epsilon > 0$ by the nature of the exponential) such that
  $ M(r, f) <= exp(r^(rho(f) + epsilon)) $
  for some $r'$ and any $r > r'$. Taking logarithms twice we have
  $
    (log (log M(r, f))) / (log r) <= limsup_(r -> infinity) (log (log M(r, f))) / (log r) <= rho(f) + epsilon -> rho(f)
  $
  as $epsilon' -> 0$. Moreover, for any $epsilon > 0$, $r' > 0$, $exists r > r'$ such that
  $
    M(r, f) > exp(r^(rho(f) - epsilon)) ==> limsup_(r -> infinity) (log (log M(r, f))) / (log r) gt.eq rho(f) - epsilon -> rho(f)
  $
  as $epsilon -> 0$. Therefore,
  $ rho(f) <= limsup_(r -> infinity) (log (log M(r, f))) / (log r) <= rho(f). #qedhere $
]

#example[
  The function $sin$ is of order 1, while $exp circle.small exp$ is not of finite order.
]<ex:entire_function_finite_order_sin_exp_exp>

#solution[to @ex:entire_function_finite_order_sin_exp_exp][
  We consider the two examples separately:
  + Observe that
    $
      sup_(abs(z) = r) abs(sin(z)) <= sup_(abs(z) = r) (abs(ee^(ii z)) + abs(ee^(-ii z))) / 2 = sup_(abs(z) = r) (ee^(abs(y)) + ee^(-abs(y))) / 2 <= sup_(abs(z) = r) ee^(abs(y)) = ee^r.
    $
    For $r > 1$, we have $ee^(-r) < 1 < 1/2 ee^r$, and hence for $z = ii r$, we have
    $ abs(sin(z)) = (ee^r - ee^(-r)) / 2 > 1/4 ee^r. $
    Therefore,
    $
      1/4 ee^r < sup_(abs(z) = r) abs(sin(z)) <= ee^r ==> rho(f) = limsup_(r -> infinity) (log (r + Order(1))) / (log r) = 1.
    $
  + Let $z = r$, then
    $
      sup_(abs(z) = r) abs(exp circle.small exp) gt.eq exp(exp(r))
      &==> log circle.small log sup_(abs(z) = r) abs(f(z)) gt.eq r \
      &==> rho(f) gt.eq limsup_(r -> infinity) r / (log r) = infinity. #qedhere
    $
]

The utility of $rho$ is that it gives implications on the rate of which the zeros of an entire function tend to $infinity$. The order for meromorphic functions is more general and is pertinent in Nevanlinna Theory (@sec:nevanlinnatheory). This is quantified technically by the convergence range of the sum given by
$ sum_(n=1)^infinity 1 / abs(a_n)^(k+1), $
where each $a_n$ is a zero. Specifically, the infimum of all such $k$ under which the prescribed sum converges correlates to this right. For example, let $a_n = n$ for each $n$. Then for any $k > 0$, the integral test gives the convergence of the series, while if $a_n = sqrt(a_n)$ (corresponding to a slower approach to $infinity$), the series converges for $k > 1$.

For the following discussions, let $n(r, 0, f)$ count the zeros of $f$ in $D(0,r)$ according to multiplicity.

#lemma[
  If $f$ is entire with $f(0) = 1$, then
  $ log 2 dot n(r, 0, f) <= log M(2r, f). $
]<lem:maximum_moduluszerocountingdoubleradius>

#proof[
  By Jensen's formula (@thm:jensensformula), for $r > 0$, we have
  $
    sum_(k=1)^(n(2r,0,f)) log abs((2r) / a_k) = 1 / (2 uppi) integral_0^(2 uppi) log abs(f (2r ee^(ii theta))) dif theta,
  $
  where $a_1, dots, a_(n(2r,0,f))$ are the zeros of $f$ in $D(0,2r)$, ordered such that each $abs(a_k) <= abs(a_(k+1))$. Then
  $
    sum_(k=1)^(n(r,0,f)) log 2 &<= sum_(k=1)^(n(r,0,f)) log abs((2r) / a_k) <= sum_(k=1)^(n(2r,0,f)) log abs((2r) / a_k) #tag("yo what")\
    &= 1 / (2 uppi) integral_0^(2 uppi) log abs(f (2r ee^(ii theta))) dif theta <= log M(2r, f). #qedhere
  $
]

#theorem[
  For a nonzero complex sequence ${a_k}_(k in NN)$ counting multiplicities (such that $abs(a_1) <= abs(a_2)$, etc.), the sum
  $ sum_(k=1)^infinity 1 / abs(a_k)^sigma $
  converges for any
  $ sigma > limsup_(r -> infinity) (log n(r)) / (log r) $
  where $n(r)$ counts $a_k$ in the closed disk of radius $r$.
]<thm:nonzerosequencepowersummationconvergence>

#proof[
  Choose $sigma'$ such that
  $ sigma > sigma' > limsup_(r -> infinity) (log n(r)) / (log r). $
  For sufficiently large $r$,
  $ (log n(r)) / (log r) < sigma' ==> n(r) <= r^(sigma'). $
  For sufficiently large $k in NN$, by the ordering of zeros, it follows that
  $ k <= n(abs(a_k) + delta) <= (abs(a_k) + delta)^(sigma') $
  for sufficiently small $delta$. As $delta -> 0^+$, we have
  $
    k <= abs(a_k)^(sigma') ==> 1/k gt.eq 1 / abs(a_k)^(sigma') ==> 1 / k^(sigma \/ sigma') gt.eq 1 / abs(a_k)^sigma.
  $
  By the comparison test, we then have the convergence of
  $ sum_(k=1)^infinity 1 / abs(a_k)^sigma. #qedhere $
]

#theorem[
  For an entire function $f$ ($f(0) = 1$) of finite order $rho(f)$ whose zeros are at ${a_k}_(k in NN)$ counting multiplicities (such that $abs(a_1) <= abs(a_2)$, etc.), the sum
  $ sum_(k=1)^infinity 1 / abs(a_k)^(rho(f) + eta) $
  converges for any $eta > 0$.
]<thm:entirefunctionfiniteorderzerossummationconvergence>

#proof[
  By trivial definition, we have
  $ M(2r, f) <= exp((2r)^(rho + epsilon)) $
  for all $epsilon' > 0$ and some $0 < epsilon < epsilon'$. @lem:maximum_moduluszerocountingdoubleradius gives that for any $r > 0$,
  $ log 2 dot n(r, 0, f) <= log M(2r, f). $
  Hence,
  $
    log 2 dot n(r, 0, f) <= (2r)^(rho(f) + epsilon) <==> (n(r, 0, f)) / r^(rho(f) + 2 epsilon) <= 1 / (log 2) 2^(rho(f) + epsilon) r^(-epsilon) -> 0^+
  $
  as $r -> infinity$. Then for sufficiently large $r$, we have
  $ n <= (n(r, 0, f)) / r^(rho(f) + 2 epsilon) <= 1 ==> n(r, 0, f) <= r^(rho(f) + 2 epsilon). $
  For sufficiently large $k in NN$, by the ordering of zeros, it follows that
  $ k <= n(abs(a_k) + delta, 0, f) <= (abs(a_k) + delta)^(rho(f) + 2 epsilon) $
  for sufficiently small $delta$. As $delta -> 0^+$, we have
  $
    k <= abs(a_k)^(rho(f) + 2 epsilon) ==> 1/k gt.eq 1 / abs(a_k)^(rho(f) + 2 epsilon) ==> 1 / k^((rho(f) + eta) \/ (rho(f) + 2 epsilon)) gt.eq 1 / abs(a_k)^(rho(f) + eta).
  $
  The left-hand side as a summation is convergent for $2 epsilon < eta$ or lower, and hence we have the convergence of
  $ sum_(k=1)^infinity 1 / abs(a_k)^(rho(f) + eta). #qedhere $
]

Therefore, for any $r > 0$, the series
$
  sum_(k=1)^infinity abs(r / a_k)^(rho(f) + eta) <= sum_(k=1)^infinity abs(r / a_k)^(floor(rho) + 1) quad "for sufficiently small" eta
$
converges. Then by the Weierstrass Factorization Theorem (@thm:weierstrassfactorization),
$ f(z) = z^m ee^(phi(z)) product_(k=1)^infinity E_(floor(rho)) (z / a_k) $
locally uniformly converges on $CC$, where $phi$ is entire.

#definition[
  The _rank_ of an entire function is the smallest $p in ZZ_(gt.eq 0)$ for which the associated sum
  $ sum_(k=1)^infinity 1 / abs(a_k)^(p+1) $
  converges, where ${a_k}_k$ are its zeros in $CC^*$.
]

The conclusion of @thm:entirefunctionfiniteorderzerossummationconvergence is that the rank of an entire function with finite order is finite. Moreover, the rank $<= floor(rho)$.

#definition[
  Let $f$ be entire of finite rank $p$. By the Weierstrass Factorization theorem (@thm:weierstrassfactorization),
  $ f(z) = z^m ee^(phi(z)) product_(k=1)^infinity E_p (z / a_k). $
  If $phi$ is a polynomial of degree $q$, then $f$ is said to be of finite _genus_ $mu = max{p, q}$.
]

This particular Weierstrass factorization is the _Weierstrass canonical factorization_ of $f$ (the portion corresponding to the product of elementary factors itself is the _Weierstrass canonical product_). Now that we have indulged in the implications of $rho(f)$ to its zero distribution, we now turn to the function $phi$ in the exponential.

#lemma[
  Let $f$ be entire with finite order such that $f(0) = 1$. Let ${a_k}_(k in NN)$ be the zeros of $f$, listed with multiplicities, such that $abs(a_1) <= abs(a_2) <= abs(a_3) <= dots$. Suppose $p > rho(f) - 1$; then for any $z in CC$,
  $ lim_(r -> infinity) sum_(k=1)^(n(r,0,f)) overline(a_k)^(p+1) (r^2 - overline(a_k) z)^(-p-1) = 0. $
]<lem:entirefunctionfiniteorderserieslimitzero>

#proof[
  For fixed $z$, let $r > 2 abs(z)$ such that $a_1, dots, a_(n(r,0,f))$ lie in $D(0,r)$. For each $k$ we obtain
  $
    abs(r^2 - overline(a_k) z) gt.eq r^2 - abs(a_k) abs(z) > r^2 - r dot r/2 = r^2/2 \ ==> abs(a_k)^(p+1) abs(r^2 - overline(a_k) z)^(-p-1) < (2/r)^(p+1)
  $
  since $rho(f) gt.eq 0$ by the logarithm formula. Now by definition of $rho(f)$, @lem:maximum_moduluszerocountingdoubleradius gives the estimate for sufficiently large $r$ and arbitrarily small $epsilon > 0$:
  $ n(r, 0, f) r^(-p-1) <= (log M(2r, 0, f)) / (log 2) r^(-p-1) <= ((2r)^(rho(f) + epsilon) r^(-p-1)) / (log 2). $
  Thus,
  $
    abs(sum_(k=1)^(n(r,0,f)) overline(a_k)^(p+1) (r^2 - overline(a_k) z)^(-p-1)) <= n(r, 0, f) (2/r)^(p+1) <= (r^(rho(f) + epsilon - p - 1) 2^(rho(f) + epsilon + p + 1)) / (log 2).
  $
  Letting $epsilon = (p + 1 - rho(f)) / 2$ (positive by theorem assumption), we obtain
  $
    abs(sum_(k=1)^(n(r,0,f)) overline(a_k)^(p+1) (r^2 - overline(a_k) z)^(-p-1)) <= (2^((3p + 3 - rho(f)) \/ 2) r^(-epsilon)) / (log 2) -> 0 quad "as" quad r -> infinity. #qedhere
  $
]

#theorem[
  Let $f$ be entire with $f(0) = 1$. Then for $p > rho(f) - 1$ ($p$ integer) and $z in CC$,
  $
    lim_(r -> infinity) integral_0^(2 uppi) (r ee^(ii theta) log abs(f (r ee^(ii theta)))) / (r ee^(ii theta) - z)^(p+2) dif theta = 0.
  $
]<thm:poissonjensenlogdiffintegralterm>

#proof[
  For fixed $z$, $r > 2 abs(z)$, we have
  $
    integral_0^(2 uppi) (ii r ee^(ii theta) dif theta) / (r ee^(ii theta) - z)^(p+2) = integral.cont.ccw_(partial D(0,r)) (dif w) / (w - z)^(p+2) = 2 uppi ii Res_(w=z) 1 / (w - z)^(p+2)
  $
  by the Residue Theorem (@thm:residuethm). Since $p + 2 > rho(f) + 1 gt.eq 1$ where $p$ is an integer, we must have $p + 2 gt.eq 2$ and thus
  $ integral_0^(2 uppi) (r ee^(ii theta) dif theta) / (r ee^(ii theta) - z)^(p+2) = 0. $
  Therefore,
  $
    &abs(integral_0^(2 uppi) (r ee^(ii theta) log abs(f (r ee^(ii theta)))) / (r ee^(ii theta) - z)^(p+2) dif theta) \
    &wide wide""= abs(integral_0^(2 uppi) (r ee^(ii theta)) / (r ee^(ii theta) - z)^(p+2) [log abs(f (r ee^(ii theta))) - log M(r, f)] dif theta) \
    &wide wide""<= integral_0^(2 uppi) r / (r\/2)^(p+2) [log M(r, f) - log abs(f (r ee^(ii theta)))] dif theta \
    &wide wide""= 2^(p+3) r^(-p-1) [2 uppi log M(r, f) - integral_0^(2 uppi) log abs(f (r ee^(ii theta))) dif theta] \
    &wide wide""<= 2^(p+4) r^(-p-1) uppi log M(r, f),
  $
  where the last expression uses the inequality derived from Jensen's formula (@cor:jensensinequality) on the remaining integral.

  Now by assumption, we have
  $ log M(r, f) <= r^(rho + epsilon) $
  for any $epsilon > 0$ and sufficiently large $r$. Hence,
  $
    abs(integral_0^(2 uppi) (r ee^(ii theta) log abs(f (r ee^(ii theta)))) / (r ee^(ii theta) - z)^(p+2) dif theta) <= 2^(p+4) r^(rho(f) + epsilon - p - 1) uppi = 2^(p+4) r^((rho(f) - p - 1) \/ 2) uppi
  $
  at $epsilon = (p + 1 - rho(f)) / 2$. Then since $(rho(f) - p - 1) / 2 < 0$, the expression vanishes as $R -> infinity$.
]

#proposition[
  Let $f$ be entire, non-constant, and of finite order such that $f(0) = 1$. Let ${a_k}_(k in NN)$ be the zeros of $f$ counted according to multiplicities such that $abs(a_1) <= abs(a_2) <= abs(a_3) <= dots$. If $p > rho(f) - 1$ is an integer, then
  $ dif^p / (dif z^p) ((f'(z)) / (f(z))) equiv -sum_(k=1)^infinity (p!) / (a_k - z)^(p+1) $
  for all $z in CC$.
]<prop:entirefunctionfiniteorderlogdiffderivatives>

#proof[
  Let $r > 2 abs(z)$. By the Poisson--Jensen Formula (@thm:poisson_jensen_formula), at each non-singular point, we have (the kernel representation derived in @eq:poissonkernelgeneralform)
  $
    Re log f(z) &= 1 / (2 uppi) integral_0^(2 uppi) log abs(f (r ee^(ii theta))) Re ((r ee^(ii theta) + z) / (r ee^(ii theta) - z)) dif theta \
    &wide""+ sum_(k=1)^(n(r,0,f)) Re log ((r(z - a_k)) / (r^2 - overline(a_k) z)).
  $
  For any holomorphic $g = u + ii v$, we have
  $
    (partial (Re g(z))) / (partial z) &= 1/2 ((partial u(z)) / (partial x) - ii (partial u(z)) / (partial y)) \ &= 1/2 ((partial u(z)) / (partial x) + ii (partial v) / (partial x)) = 1/2 (partial g(z)) / (partial x) = (g'(z)) / 2.
  $<eq:wirtinger_derivative_of_real_part_of_holomorphic_function>
  Therefore, by differentiation under the integral sign,
  $
    (f'(z)) / f(z)
    &= 1 / uppi integral_0^(2 uppi) log abs(f (r ee^(ii theta))) (r ee^(ii theta) dif theta) / (r ee^(ii theta) - z)^2 + sum_(k=1)^(n(r,0,f)) (r^2 - abs(a_k)^2) / ((r^2 - overline(a_k) z)(z - a_k)) \
    &= 1 / uppi integral_0^(2 uppi) log abs(f (r ee^(ii theta))) (r ee^(ii theta) dif theta) / (r ee^(ii theta) - z)^2 + sum_(k=1)^(n(r,0,f)) overline(a_k) / (r^2 - overline(a_k) z) + sum_(k=1)^(n(r,0,f)) 1 / (z - a_k).
  $
  Differentiating $p$ times from here gives
  $
    dif^p / (dif z^p) ((f'(z)) / f(z))
    &= 1 / uppi integral_0^(2 uppi) log abs(f (r ee^(ii theta))) (r ee^(ii theta) (p+1)! dif theta) / (r ee^(ii theta) - z)^(p+2) \
    &quad + sum_(k=1)^(n(r,0,f)) (overline(a_k)^(p+1) p!) / (r^2 - overline(a_k) z)^(p+1) - sum_(k=1)^(n(r,0,f)) (p!) / (a_k - z)^(p+1).
  $
  The first two terms vanish as $r -> infinity$ by @thm:poissonjensenlogdiffintegralterm and @lem:entirefunctionfiniteorderserieslimitzero.
]

#lemma("Logarithmic Factorization")[
  Let $f$ be entire, non-constant, and of finite order $rho$ such that $f(0) = 1$. Let
  $ P(z) = product_(k=1)^infinity E_(op("rank") f) (z / a_k) $
  be the associated product. If $p > rho(f) - 1$ is an integer, then
  $ dif^p / (dif z^p) ((P'(z)) / P(z)) equiv -sum_(k=1)^infinity (p!) / (a_k - z)^(p+1) $
  for all $z in CC$.
]<lem:entirefunctionweierstrassproductfiniteorderlogdiffderivatives>

#proof[
  Let $P_n$ be the $n$-th partial product of $P$. Then
  $
    (P'_n (z)) / (P_n (z)) = sum_(k=1)^n (dif / (dif z) E_(op("rank") f) (z / a_k)) / (E_(op("rank") f) (z / a_k)) = sum_(k=1)^n [1 / (z - a_k) + sum_(j=1)^(op("rank") f) z^(j-1) / a_k^j],
  $
  implying that
  $
    dif^p / (dif z^p) ((P'_n (z)) / (P_n (z))) = -sum_(k=1)^n (p!) / (a_k - z)^(p+1) + dif^p / (dif z^p) sum_(j=1)^(op("rank") f) sum_(k=1)^n z^(j-1) / a_k^j.
  $
  Since the polynomial in the rightmost term has degree at most $max j - 1 = op("rank") f - 1$, and because $p > floor(rho) - 1 gt.eq op("rank") f - 1$, after $p$ derivatives each term of the expression vanishes. For an arbitrarily chosen compact $K subset CC$ avoiding $a_k$, some $N in NN$ such that $abs(a_k) gt.eq max_(z in K) abs(z)$ for all $k > N$, we have $forall z in K$, $abs(a_k - z) <= abs(a_k) + abs(z) <= 2 abs(a_k)$. Then the convergence of
  $ sum_(k=1)^infinity 1 / (2 abs(a_k)^(p+1)) $
  from @thm:entirefunctionfiniteorderzerossummationconvergence implies the absolute convergence of
  $ sum_(k=1)^infinity 1 / (a_k - z)^(p+1) $
  in $K$. Moreover, it can be shown that the uniform convergence of $P_n -> P$ (from the Weierstrass factorization) and $P'_n -> P'_n$ (by the Weierstrass Convergence Theorem, @thm:weierstrass_convergence) in $K$ implies that of $(P'(z)) / P(z)$. Hence, the Weierstrass Convergence Theorem implies that
  $
    lim_(n -> infinity) dif^p / (dif z^p) ((P'_n (z)) / (P_n (z))) &= (P'(z)) / P(z) = -lim_(n -> infinity) sum_(k=1)^n (p!) / (a_k - z)^(p+1) \
    &= -sum_(k=1)^infinity (p!) / (a_k - z)^(p+1). #qedhere
  $
]

The two preceding results are similar in conclusion, but @lem:entirefunctionweierstrassproductfiniteorderlogdiffderivatives is not a special case of @prop:entirefunctionfiniteorderlogdiffderivatives since we have not asserted that the canonical product is of finite order.
