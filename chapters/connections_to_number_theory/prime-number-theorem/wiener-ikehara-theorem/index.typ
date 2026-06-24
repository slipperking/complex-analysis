#import "/lib.typ": *
#show: docs-subsubchapter.with(
  title: [The Wiener--Ikehara Theorem],
  route: "wiener-ikehara-theorem",
)

Previously we have seen the subtle relation between $zeta$ and $psi$. Given the properties of the Laplace transform of $psi compose exp$ and certain conditions established above, we apply now prove what is known as a _Tauberian_ theorem to extract sufficient information (such as convergence) of the function itself.

For arbitrary $x in RR$ and $lambda > 0$, define a triangular kernel cutoff by
$
  K_(lambda) (x) = cases(
    1 - abs(x) / (2 lambda) quad & abs(x) < 2 lambda,
    0 quad & "otherwise",
  ), wide supp K_(lambda) = [-2 lambda, 2 lambda],
$
and a normalized Fejér kernel by
$
  k_(lambda) (x) = cases(
    (2 lambda) / sqrt(2 uppi) ((sin(lambda x)) / (lambda x))^2 quad & x != 0,
    (2 lambda) / sqrt(2 uppi) quad & x = 0,
  ).
$
The two kernels are related by a angular unitary Fourier transform:

#lbl(
  lemma[
    For every $lambda > 0$, we have that
    $
      cal(F){K_(lambda)}(x) = cal(F)^(-1){K_(lambda)} (x) = k_(lambda) (x), quad cal(F) {k_(lambda)} (x) = cal(F)^(-1) {k_(lambda)} (x) = K_(lambda) (x),
    $
    where we define
    $
      cal(F){f}(x) = 1 / sqrt(2 uppi) integral_(-oo)^oo f(t) ee^(-ii x t) dt, quad cal(F)^(-1){f} (x) = 1 / sqrt(2 uppi) integral_(-oo)^oo f(t) ee^(ii x t) dt.
    $
  ],
  <lem:wiener-ikehara-kernels-fourier-transform>,
)

#proof[
  The equivalence between the Fourier and inverse Fourier transforms follows from the evenness of both kernels. We hence prove only the forward transform equivalences.

  Since $supp K_(lambda) = [-2 lambda, 2 lambda]$, we have that
  $
    cal(F){K_(lambda)}(x) &= 1 / sqrt(2 uppi) integral_(-2 lambda)^(2 lambda) (1 - abs(t) / (2 lambda)) ee^(-ii x t) dt \
    &= 1 / sqrt(2 uppi) integral_0^(2 lambda) (1 - t / (2 lambda)) (ee^(-ii x t) + ee^(ii x t)) dt \
    &= sqrt(2) / sqrt(uppi) integral_0^(2 lambda) (1 - t / (2 lambda)) cos(x t) dt \
    &= sqrt(2) / sqrt(uppi) [evaluated(sin(x t) / x)_0^(2 lambda) - evaluated((t sin(x t)) / (2 lambda x))_0^(2 lambda) + integral_0^(2 lambda) (sin(x t)) / (2 lambda x) dt] \
    &= sqrt(2) / sqrt(uppi) [sin(2 lambda x) / x - sin(2 lambda x) / x - evaluated(cos(x t) / (2 lambda x^2))_0^(2 lambda)] \
    &= sqrt(2) / sqrt(uppi) [1 - cos(2 lambda x)] / (2 lambda x^2) = (2 lambda) / sqrt(2 uppi) ((sin(lambda x)) / (lambda x))^2 = k_(lambda) (x).
  $
  On the other hand,
  $
    cal(F){k_(lambda)} (x) &= (2 lambda) / (2 uppi) integral_(-oo)^oo ((sin(lambda t)) / (lambda t))^2 ee^(-ii x t) dt = 2 / (uppi lambda) integral_0^oo (sin^2(lambda t)) / t^2 cos(x t) dt \
    &= 1 / (uppi lambda) integral_0^oo (1 - cos(2 lambda t)) / t^2 cos(x t) dt.
  $
  Let $I(x) = integral_0^oo (1 - cos(2 lambda t)) / t^2 cos(x t) dt$. Differentiation under the integral sign yields
  $
    dv(I, x) = integral_0^oo pdv(((1 - cos(2 lambda t)) / t^2 cos(x t)), x, style: "large") dt = integral_0^oo ((cos(2 lambda t) - 1) / t) sin(x t) dt.
  $
  By the product-to-sum formulas, this can be rewritten as
  $
    dv(I, x) &= integral_0^oo sin((x + 2 lambda) t) / (2 t) dt + integral_0^oo sin((x - 2 lambda) t) / (2 t) dt - integral_0^oo sin(x t) / t dt \ &= #I-num quad + quad #II-num quad - quad #III-num.
  $
  By substituting $u = t (x + 2 lambda)$, we have that
  $
    #I-num = integral_0^(plus.minus oo) (sin u) / (2 u) dif u, quad "where" quad plus.minus oo = cases(
      +oo quad & x + 2 lambda > 0,
      -oo quad & x + 2 lambda < 0,
    )
  $
  and substituting $u = t (x - 2 lambda)$ gives
  $
    #II-num = integral_0^(plus.minus oo) (sin u) / (2 u) dif u, quad "where" quad plus.minus oo = cases(
      +oo quad & x - 2 lambda > 0,
      -oo quad & x - 2 lambda < 0,
    ).
  $
  By the Dirichlet integral $integral_0^oo (sin u) / u dif u = uppi / 2$, we have that
  $ #I-num = uppi / 4 sgn(x + 2 lambda), quad #II-num = uppi / 4 sgn(x - 2 lambda). $
  Similarly, $#III-num = uppi / 2 sgn(x)$. Hence,
  $
    dv(I, x) = uppi / 4 [sgn(x + 2 lambda) + sgn(x - 2 lambda) - 2 sgn(x)] = uppi / 4 cases(
      0 quad & abs(x) > 2 lambda,
      1 quad & -2 lambda < x < 0,
      -1 quad & 0 < x < 2 lambda,
    ),
  $
  and
  $
    I(0) + integral_0^x dv(I, t) dt = I(0) +
    cases(
      integral_0^(-2 lambda) dv(I, t) dt + integral_(-2 lambda)^x dv(I, t) dt quad & x < -2 lambda,
      integral_0^x dv(I, t) dt quad & -2 lambda < x < 0,
      integral_0^x dv(I, t) dt quad & 0 < x < 2 lambda,
      integral_0^(2 lambda) dv(I, t) dt + integral_(2 lambda)^x dv(I, t) dt quad & x > 2 lambda,
    )
  $
  which after simplification, becomes
  $
    I(x) = I(0) + uppi cases(
      -lambda quad & x < -2 lambda,
      x / 2 quad & -2 lambda < x < 0,
      -x / 2 quad & 0 < x < 2 lambda,
      lambda quad & x > 2 lambda,
    ).
  $
  Since
  $
    I(0) &= integral_0^oo (1 - cos(2 lambda t)) / t^2 dt = evaluated((cos(2 lambda t) - 1) / t)_0^oo + integral_0^oo 2 lambda (sin(2 lambda t)) / t dt \
    &= lim_(t -> 0) (1 - cos(2 lambda t)) / t + 2 lambda uppi / 2 = uppi lambda,
  $
  we obtain
  $
    I = cases(
      0 quad & x < -2 lambda,
      uppi (lambda + x / 2) quad & -2 lambda < x < 0,
      uppi (lambda - x / 2) quad & 0 < x < 2 lambda,
      0 quad & x > 2 lambda,
    ) ==> cal(F){k_(lambda)} (x) = cases(
      0 quad & x < -2 lambda,
      1 + x / (2 lambda) quad & -2 lambda < x < 0,
      1 - x / (2 lambda) quad & 0 < x < 2 lambda,
      0 quad & x > 2 lambda,
    ),
  $
  which confirms the second equivalence.
]

We note that, in a distribution-theoretic treatment, it would suffice to prove one of the above identities, the other then following immediately from Fourier inversion and the Dirac delta. Without the framework of distributions however, the use of the Dirac delta is generally unjustified. For completeness, we have instead given a direct classical proof.

#definition[
  A function $f:RR -> RR$ is said to be _slowly decreasing_ if
  $ liminf_(delta -> 0^+) liminf_(x -> oo) [f(x + delta) - f(x)] >= 0, $
  or equivalently, for every $epsilon > 0$, $exists x_0$, $exists delta > 0$ such that
  $ forall x, y > x_0, 0 < y - x < delta ==> f(y) - f(x) > -epsilon. $
]

#lbl(
  proposition[
    Let $f:RR -> RR$ be a slowly decreasing function bounded by $M > 0$. If the limit of the convolution $f * k_(lambda)$ given by
    $
      L equiv lim_(x -> oo) (f * k_(lambda)) (x) = lim_(x -> oo) 1 / sqrt(2 uppi) integral_(-oo)^oo f(t) k_(lambda) (x - t) dt
    $
    is independent of $lambda > 0$, then $lim_(x -> oo) f(x) = L$.
  ],
  <prop:wiener-ikehara-intermediate-tauberian-theorem>,
)

#proof[
  Let $epsilon > 0$ be arbitrary. Assume, for the sake of contradiction, that $f$ does not converge to $L$ as $x -> oo$. Then there exists some sequence ${x_n}_(n in NN)$ such that $abs(f(x_n) - L) > epsilon$ for all $n$. From here, we may extract an infinite subsequence (continued to be denoted by ${x_n}$) such that one of the two cases is assumed:
  + $f(x_n) - L > epsilon$ for all $n in NN$. By the slow decrease of $f$, there exist $delta > 0$ and $N in NN$ such that
    $ f(y) > f(x_n) - epsilon / 2 > L + epsilon / 2 $
    for any $n > N$ and $0 < y - x_n < 2 delta$. Then we have
    $
      (f * k_(lambda)) (x + delta) &= 1 / sqrt(2 uppi) integral_(-oo)^oo f(t) k_(lambda) (x + delta - t) dt \
      &= 1 / sqrt(2 uppi) (integral_x^(x + 2 delta) + integral_(-oo)^x + integral_(x + 2 delta)^oo) f(t) k_(lambda) (x + delta - t) dt \
      & > 1 / sqrt(2 uppi) integral_x^(x + 2 delta) (L + epsilon / 2) k_(lambda) (x + delta - t) dt \
      & quad"" - M / sqrt(2 uppi) (integral_(-oo)^x + integral_(x + 2 delta)^oo) k_(lambda) (x + delta - t) dt \
      & > (2 L + epsilon) / (2 sqrt(2 uppi)) integral_x^(x + 2 delta) k_(lambda) (x + delta - t) dt \
      &quad ""- M / sqrt(2 uppi) (integral_delta^oo + integral_(-oo)^(-delta)) k_(lambda) (u) dif u.
    $
    Because
    $
      1 / sqrt(2 uppi) integral_(-oo)^oo k_(lambda) (t) dt &= lambda / uppi integral_(-oo)^oo ((sin(lambda t)) / (lambda t))^2 dt = 1 / uppi integral_(-oo)^oo ((sin t) / t)^2 dt \
      &= -evaluated((sin^2 t) / (uppi t))_(-oo)^oo + integral_(-oo)^oo d(sin^2 t) / (uppi t) dt = integral_(-oo)^oo (sin(2 t)) / (uppi t) dt = 1,
    $
    we then have for any $n > N$, that
    $
      lim_(n -> oo) (f * k_(lambda)) (x_n + delta) &>= (2 L + epsilon) / (2 sqrt(2 uppi)) integral_(-delta)^delta (2 lambda) / sqrt(2 uppi) ((sin(lambda u)) / (lambda u))^2 dif u \ & wide ""- (2 M) / uppi integral_(delta lambda)^oo ((sin t) / t)^2 dt.
    $
    Letting $lambda -> oo$, we have
    $
      &(2 L + epsilon) / (2 uppi) integral_(-delta lambda)^(delta lambda) ((sin t) / t)^2 dt - (2 M) / uppi integral_(delta lambda)^oo ((sin t) / t)^2 dt \ & wide ""-> (2 L + epsilon) / (2 uppi) integral_(-oo)^oo ((sin t) / t)^2 dt = L + epsilon / 2.
    $
    Because $lim_(n -> oo) (f * k_(lambda)) (x_n + delta) = L >= L + epsilon / 2$, we reach a contradiction.
  + $f(x_n) - L < -epsilon$. Then there exist $delta > 0$, $N in NN$ such that
    $ f(x_n) - f(y) > -epsilon / 2 ==> f(y) < f(x_n) + epsilon / 2 < L - epsilon / 2 $
    for any $n > N$ and $0 < x_n - y < 2 delta$. Splitting the convolution integral into $integral_(-oo)^(x_n - 2 delta)$, $integral_(x_n - 2 delta)^(x_n)$, and $integral_(x_n)^oo$, we have
    $
      (f * k_(lambda)) (x_n - delta) &= 1 / sqrt(2 uppi) integral_(-oo)^oo f(t) k_(lambda) (x_n - delta - t) dt \
      &= 1 / sqrt(2 uppi) (integral_(-oo)^(x_n - 2 delta) + integral_(x_n - 2 delta)^(x_n) + integral_(x_n)^oo) f(t) k_(lambda) (x_n - delta - t) dt \
      & < M / sqrt(2 uppi) (integral_(-oo)^(x_n - 2 delta) + integral_(x_n)^oo) k_(lambda) (x_n - delta - t) dt \
      & quad + 1 / sqrt(2 uppi) integral_(x_n - 2 delta)^(x_n) (L - epsilon / 2) k_(lambda) (x_n - delta - t) dt \
      & < M / sqrt(2 uppi) (integral_(-oo)^(-delta) + integral_delta^oo) k_(lambda) (u) dif u + (2 L - epsilon) / (2 sqrt(2 uppi)) integral_(-delta)^delta k_(lambda) (u) dif u.
    $
    Letting $lambda -> oo$, we have similarly that $lim_(n -> oo) (f * k_(lambda)) (x_n - delta) <= L - epsilon / 2$, contradicting $lim_(n -> oo) (f * k_(lambda)) (x_n - delta) = L$. #qedhere
]

#lbl(
  theorem[Wiener--Ikehara][
    Let $f:RR_(>=0) -> RR$ be a nonnegative, monotonically non-decreasing function such that the Laplace transform
    #lbl(
      $
        cal(L){f} (s) = integral_0^oo f(x) ee^(-s x) dx
      $,
      <eq:wiener-ikehara-laplace-transform>,
    )
    converges for $Re s > 1$. Suppose that there exists some constant $c > 0$ such
    that
    #lbl(
      $
        g(t) = lim_(sigma -> 1^+) [cal(L){f} (s) - c / (s - 1)], quad s = sigma + ii t
      $,
      <eq:wiener-ikehara-g-function>,
    )
    converges locally uniformly with respect to $t$ in $RR$ and is continuously differentiable. Then
    #lbl(
      $
        lim_(x -> oo) f(x) / ee^x = c.
      $,
      <eq:wiener-ikehara-conclusion>,
    )
  ],
  <thm:wiener-ikehara>,
)

#proof[
  Let
  $
    a(t) = cases(
      f(t) ee^(-t) quad & t >= 0,
      0 quad & t < 0,
    ), quad A(t) = cases(
      c quad & t >= 0,
      0 quad & t < 0,
    ).
  $
  The convergence of @eq:wiener-ikehara-laplace-transform implies that for $epsilon, lambda > 0$, the convolution
  $
    I_(lambda, epsilon) (x) = 1 / sqrt(2 uppi) integral_(-oo)^oo k_(lambda) (x - t) ((a(t) - A(t)) / ee^(epsilon t)) dt
  $
  converges. Since
  $
    integral_(-oo)^oo ((a(t) - A(t)) / ee^((epsilon + ii y) t)) dt
  $
  converges uniformly for $abs(y) < 2 lambda$, we have by virtue of @lem:wiener-ikehara-kernels-fourier-transform, that
  $
    I_(lambda, epsilon) (x) &= 1 / (2 uppi) integral_(-oo)^oo ((a(t) - A(t)) / ee^(epsilon t)) integral_(-2 lambda)^(2 lambda) K_(lambda) (y) ee^(ii (x - t) y) dy dt \
    &= 1 / (2 uppi) integral_(-2 lambda)^(2 lambda) K_(lambda) (y) ee^(ii x y) integral_0^oo (a(t) - A(t)) / ee^((epsilon + ii y) t) dt dy \
    &= 1 / (2 uppi) integral_(-2 lambda)^(2 lambda) K_(lambda) (y) ee^(ii x y) [cal(L){f} (1 + epsilon + ii y) - c / (epsilon + ii y)] dy.
  $
  Now $forall epsilon' > 0$, by the local uniform convergence of $g$ in @eq:wiener-ikehara-g-function, there exists some $delta > 0$ such that
  $
    forall abs(y) < 2 lambda, abs(cal(L){f} (1 + epsilon + ii y) - c / (epsilon + ii y) - g(y)) < (uppi epsilon') / lambda.
  $
  Hence, we have that
  $
    abs(I_(lambda, epsilon) (x) - 1 / (2 uppi) integral_(-2 lambda)^(2 lambda) K_(lambda) (y) ee^(ii x y) g(y) dy) <= 1 / (2 uppi) integral_(-2 lambda)^(2 lambda) K_(lambda) (y) (uppi epsilon') / lambda dy = epsilon'.
  $
  Therefore,
  $
    lim_(epsilon -> 0^+) I_(lambda, epsilon) (x) = 1 / (2 uppi) integral_(-2 lambda)^(2 lambda) K_(lambda) (y) ee^(ii x y) g(y) dy,
  $
  or when the limit is exchanged with the integral. By parts, we have that
  $
    lim_(epsilon -> 0^+) I_(lambda, epsilon) (x) = 1 / (2 uppi) (evaluated(K_(lambda) (y) g(y) ee^(ii x y) / (ii x))_(-2 lambda)^(2 lambda) - 1 / (ii x) integral_(-2 lambda)^(2 lambda) (K_(lambda) g)'(y) ee^(ii x y) dy).
  $
  This implies that $lim_(x -> oo) lim_(epsilon -> 0^+) I_(lambda, epsilon) (x) equiv 0$. On the other hand, manual calculation yields
  $
    lim_(epsilon -> 0^+) I_(lambda, epsilon) (x) = lim_(epsilon -> 0^+) 1 / sqrt(2 uppi) (& integral_0^oo k_(lambda) (x - t) a(t) ee^(-epsilon t) dt \ & wide"" - integral_0^oo k_(lambda) (x - t) A(t) ee^(-epsilon t) dt).
  $
  The Lebesgue's Dominated Convergence Theorem then gives
  $
    lim_(epsilon -> 0^+) I_(lambda, epsilon) (x) & = 1 / sqrt(2 uppi) integral_0^oo k_(lambda) (x - t) (a(t) - A(t)) dt \
                                                 & = (a * k_(lambda) - A * k_(lambda)) (x) -> 0
  $
  as $x -> oo$. Since $(A * k_(lambda)) (x) = c$ for all $x$, we have that
  #lbl(
    $
      lim_(x -> oo) (a * k_(lambda)) (x) = c.
    $,
    <eq:wiener-ikehara-convolution-limit>,
  )
  Therefore, $exists x_0 > 0$ such that
  $ (a * k_(lambda)) (x) < c + 1 ==> 1 / uppi integral_(-oo)^oo ((sin t) / t)^2 a (x - t / lambda) dt < c + 1 $
  for all $x > x_0$. Substituting $x + 2 / sqrt(lambda)$ for $x$ in the integral, we have (after further restricting the integration bounds, which preserves the inequality)
  $
    integral_(-sqrt(lambda))^(sqrt(lambda)) ((sin t) / t)^2 a (x + (2 sqrt(lambda) - t) / lambda) dt < uppi (c + 1)
  $
  Since $ee^u a(u) = f(u)$ (for $u = x + (2 sqrt(lambda) - t) / lambda > 0$) is nondecreasing in $u$, it is bounded below by $f(x + sqrt(lambda) / lambda) > f(x)$. Thus, we have
  $
    integral_(-sqrt(lambda))^(sqrt(lambda)) ((sin t) / t)^2 exp((t - 2 sqrt(lambda)) / lambda - x) f(x) dt < uppi (c + 1),
  $
  implying that
  $ integral_(-sqrt(lambda))^(sqrt(lambda)) ((sin t) / t)^2 ee^((t - 2 sqrt(lambda)) / lambda) a(x) dt < uppi (c + 1) $ which gives $ a(x) ee^(-3 / sqrt(lambda)) integral_(-sqrt(lambda))^(sqrt(lambda)) ((sin t) / t)^2 dt < uppi (c + 1), $
  which is satisfied for all $lambda > 0$ and $x > x_0$. Letting $lambda -> oo$, we have that $a(x) < c + 1$. Compactness shows that $a$ is bounded on $[0, x_0]$ (@thm:continuous-function-bounded-on-compact). Hence, $a$ is bounded (above) on $RR$ by some $M > 0$.

  The final hypothesis required is the slow decrease of $a$: for any $epsilon > 0$, $exists delta > 0$ such that $forall x, y > 0$ with $0 < y - x < delta$, we have
  $
    a(y) - a(x) & = ee^(-x) (ee^(x - y) f(y) - f(x)) > ee^(-x) f(x) (ee^(-delta) - 1) \
                & = a(x) (ee^(-delta) - 1) > M (ee^(-delta) - 1).
  $
  If $delta$ is chosen so that $M (1 - ee^(-delta)) < epsilon$, namely $0 < delta < ln(M / (M - epsilon))$, then $a(y) - a(x) > -epsilon$,
  and $a$ then exhibits slow decrease.

  The slow decrease, boundedness, and the condition in @eq:wiener-ikehara-convolution-limit are sufficient by @prop:wiener-ikehara-intermediate-tauberian-theorem, to show that $lim_(x -> oo) a(x) = c$, or equivalently, $lim_(x -> oo) f(x) / ee^x = c$.
]

#lbl(
  theorem([Prime Number Theorem], restate-keys: ("thm:prime-number",), restate: true)[
    The prime counting function $pi(x)$ is asymptotically equal to $x / (log x)$, i.e., $lim_(x -> oo) (pi(x) log x) / x = 1$.
  ],
  <thm:prime-number>,
)

#proof[
  By @thm:chebyshevfunctions_limsup_inflim_equivalences, it suffices to show that $lim_(x -> oo) psi(x) / x = 1$. Consider the Laplace transform of $psi compose exp$ in @eq:primenumbertheorem_laplacetransformchebyshevfunction_statement. By @thm:prime-numbertheorem_laplacetransformchebyshevfunction, the function $g$ defined therein converges uniformly on compact subsets of $RR$ and is continuously differentiable. Hence, by the Wiener--Ikehara theorem (@thm:wiener-ikehara), we have that
  $ lim_(x -> oo) psi(ee^x) / ee^x = lim_(x -> oo) psi(x) / x = 1, $
  and the Prime Number Theorem follows.
]
