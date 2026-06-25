#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [The $Gamma$-Function],
  route: "gamma-function",
  label: <sec:gamma-function>,
)
#let upgamma = $gamma$

#lbl(
  definition[
    The Gamma function is defined by
    #lbl(
      $
        Gamma(z) = integral_0^oo ee^(-t) t^(z-1) dt,
      $,
      <eq:gamma-function>,
    )
    where $z in CC$.
  ],
  <def:gamma-function>,
)

By letting $z = x + ii y$ where $x, y in RR$, we have $abs(ee^(-t) t^(z-1)) = ee^(-t) t^(x-1)$. Notice that for $x > 0$,
$
  abs(Gamma(x)) & = integral_0^1 ee^(-t) t^(x-1) dt + integral_1^oo ee^(-t) t^(x-1) dt \
                & <= integral_0^1 t^(x-1) dt + integral_1^oo ee^(-t) t^(x-1) dt = 1/x + integral_1^oo ee^(-t) t^(x-1) dt.
$

Since $integral_1^oo dt / t^2$ is convergent and $lim_(t -> oo) (ee^(-t) t^(z-1)) / (t^(-2)) = 0$, then by comparison, the second integral is convergent.

Therefore, $Gamma(x)$ is convergent on $RR_(> 0)$. It follows that $Gamma(z)$ is absolutely convergent on the right half-plane ${ z in CC : Re(z) > 0 }$.

#theorem[
  The $Gamma$-function is holomorphic on ${ z in CC : Re(z) > 0 }$.
]

#proof[
  Let $gamma subset { z in CC : Re(z) > 0 }$ be an arbitrary simple, closed, rectifiable curve. By Morera's Theorem (@thm:morera), it suffices to show that $integral.cont_gamma Gamma(z) dz = 0$. We have
  $
    integral.cont_gamma Gamma(z) dz & = integral.cont_gamma (integral_0^oo ee^(-t) t^(z-1) dt) dz \
                                    & = integral_0^oo ee^(-t) (integral.cont_gamma t^(z-1) dz) dt = 0,
  $
  where the integral exchange is justified by uniform convergence of $Gamma$ on compact subsets of ${ z in CC : Re(z) > 0 }$ (by the Weierstrass $M$--Test, @thm:weierstrass-m-test).
]

From integration by parts, we obtain
$
  Gamma(z+1) = integral_0^oo ee^(-t) t^z dt = -evaluated(ee^(-t) t^z)_0^oo + z integral_0^oo ee^(-t) t^(z-1) dt = z Gamma(z).
$
Additionally,
$ Gamma(1) = integral_0^oo ee^(-t) dt = -evaluated(ee^(-t))_0^oo = 1. $

Hence, we have $Gamma(z+1) = z!$ for nonnegative integers, and the $Gamma$-function generalizes the factorial. We also have
$
  Gamma(z+n) = Gamma(z) product_(k=0)^(n-1) (z+k), quad Re(z) > 0, n in NN.
$
Therefore, can derive its analytic continuation via
$
  Gamma(z) = Gamma(z+n) / (product_(k=0)^(n-1) (z+k)), quad Re(z) > -n.
$
Since the numerator is holomorphic on $Re(z) > -n$ and $n$ was arbitrary, the analytic continuation of $Gamma$ has simple poles at each of $ZZ_(<= 0)$. Hence, $Gamma(z)$ is meromorphic on $CC$.

By @eq:residue-at-pole, the residue at each pole is equal to
$
  Res_(z = -n) Gamma(z) = lim_(z -> -n) Gamma(z+n+1) / (product_(k=0)^(n-1) (z+k)) = 1 / (product_(k=1)^n (-k)) = ((-1)^n) / (n!).
$
We will now study two representations for the Gamma function.

#lbl(
  theorem[Gauss][
    The Gamma function satisfies
    #lbl(
      $
        Gamma(z) = lim_(n -> oo) (n^z n!) / (product_(k=0)^n (z+k)), quad Re z > 0.
      $,
      <eq:gamma-functiongaussformula>,
    )
  ],
  <thm:gamma-functiongaussformula>,
)

#proof[
  Define the sequence of functions
  $
    f_n (z) = integral_0^n (1 - t/n)^n t^(z-1) dt = n^z integral_0^1 (1-t)^n t^(z-1) dt, quad Re(z) > 0.
  $
  By integration by parts, we have
  #lbl(
    $
      f_n (z) & = n^z [evaluated((t^z)/z (1-t)^n)_0^1 + n/z integral_0^1 (1-t)^(n-1) t^z dt] \
              & = (n / (n-1))^(z+1) f_(n-1) (z+1) / z = [n^(z+1) (n-1) / ((n-2)^(z+2))] f_(n-2) (z+2) / (z(z+1)) \
              & = n^(z+1) (n-1)! f_1 (z+n-1) / (product_(k=0)^(n-2) (z+k)) \
              & = (n^z n!) / (product_(k=0)^n (z+k)).
    $,
    <eq:gamma-functiongaussformulaprelimit>,
  )
  Let us now analyze the difference
  #lbl(
    $
      lim_(n -> oo) [integral_0^n ee^(-t) t^(z-1) dt - f_n (z)] = lim_(n -> oo) integral_0^n ee^(-t) t^(z-1) [1 - ee^t (1 - t/n)^n] dt.
    $,
    <eq:gamma-function_gaussformulaintermediate1>,
  )
  Since
  $
    dv(ee^t (1 - t/n)^n, t) = ee^t (1 - t/n)^n - ee^t (1 - t/n)^(n-1) = -ee^t t/n (1 - t/n)^(n-1),
  $
  we have
  #lbl(
    $
      1 - ee^t (1 - t/n)^n = 1/n integral_0^t u ee^u (1 - u/n)^(n-1) dif u.
    $,
    <eq:gamma-function_gaussformulaintermediate2>,
  )
  Additionally, since
  $
    dv(ee^u (1 - u/n)^(n-1), u) & = ee^u (1 - u/n)^(n-1) - (n-1)/n ee^u (1 - u/n)^(n-2) \
                                & = (ee^u)/n (1 - u/n)^(n-2) (1-u)
  $
  has zeros at $u = 1$ and at $u = n$, and
  $
    dv(ee^u (1 - u/n)^(n-1), u, 2) = (ee^u)/(n^2) (1 - u/n)^(n-3) (u^2 - 2u - n + 2),
  $
  evaluates to $-(ee (n-1)^(n-2)) / (n^(n-1)) < 0$ at $u = 1$ and evaluates to
  $
    (ee^n)/(n^(n-1)) (n-u)^(n-3) (n-2) (n-1) -> 0^+
  $
  as $u -> n^-$, $ee^u (1 - u/n)^(n-1)$ attains its maximum of $ee ((n-1)/n)^(n-1)$ at $u = 1$. For $n > 1$, $ee ((n-1)/n)^(n-1) <= ee$. From @eq:gamma-function_gaussformulaintermediate2, we have
  $
    1 - ee^t (1 - t/n)^n <= (ee t^2)/(2n).
  $
  Moreover, since for $0 <= u <= t <= n$,
  $
    u ee^u (1 - u/n)^(n-1) > 0,
  $
  it follows that $1 - ee^t (1 - t/n)^n$ is positive. By @eq:gamma-function_gaussformulaintermediate1, we have
  $
    abs(integral_0^n ee^(-t) t^(z-1) [1 - ee^t (1 - t/n)^n] dt) <= ee/(2n) abs(integral_0^n ee^(-t) t^(z+1) dt) < 1/(2n) abs(Gamma(z+2)) -> 0
  $
  as $n -> oo$. From @eq:gamma-functiongaussformulaprelimit, we have $Gamma(z) = lim_(n -> oo) (n^z n!) / (product_(k=0)^n (z+k))$, or @eq:gamma-functiongaussformula
]

The _Weierstrass formula_ is a direct consequence of the Gauss formula.

#lbl(
  theorem[Weierstrass][
    The reciprocal $Gamma$-function has the entire Weierstrass factorization of
    #lbl(
      $
        1 / Gamma(z) = z product_(k=1)^oo [(1 + z/k) ee^(-z/k)] ee^(z upgamma),
      $,
      <eq:gamma-function_weierstrassformula>,
    )
    where $upgamma = integral_1^oo (1 / floor(x) - 1 / x) dx$.
  ],
  <thm:gamma-function_weierstrassformula>,
)

#proof[
  Since the Gauss formula agrees with @eq:gamma-function on the right half-plane, the analytic continuation of $Gamma(z)$ is unique on the entire complex plane except for the poles at $ZZ_(<= 0)$ by the Identity Theorem (@thm:identity). Since
  $
    (n^z n!) / (product_(k=0)^n (z+k)) & = exp(z log(n)) / (z product_(k=1)^n (1 + z/k)) \
    & = exp(z integral_1^n dx / x) / (z product_(k=1)^n (1 + z/k)) (exp(-z sum_(k=1)^n 1/k)) / (product_(k=1)^n exp(-z/k)) \
    & = 1 / (z product_(k=1)^n [(1 + z/k) ee^(-z/k)]) exp(-z (integral_1^n (1 / floor(x) - 1 / x) dx)).
  $
  Therefore,
  $
    1 / Gamma(z) & = lim_(n -> oo) (product_(k=0)^n (z+k)) / (n^z n!) \
                 & = z product_(k=1)^n [(1 + z/k) ee^(-z/k)] lim_(n -> oo) exp(z (integral_1^n (1 / floor(x) - 1 / x) dx)) \
                 & = z product_(k=1)^n [(1 + z/k) ee^(-z/k)] exp(z upgamma).
  $
  The constant $upgamma = integral_1^oo (1 / floor(x) - 1 / x) dx$ is known as the _Euler--Mascheroni constant_. For each $x$, $0 <= 1 / floor(x) - 1 / x < 1 / floor(x) - 1 / (floor(x)+1)$, and the integral is bounded by $sum_(n=1)^oo (1/n - 1/(n+1)) < 1$, and hence the integral is convergent. The properties of $upgamma$ still largely remain unknown.

  By the Weierstrass Factorization Theorem (@thm:weierstrass-factorization), if we let $a_n = -n$ and $p_n = 1$, it follows that
  $
    sum_(n=1)^oo abs(R / a_n)^(p_n+1) = R^2 sum_(n=1)^oo 1/n^2 = (R^2 uppi^2) / 6
  $
  is convergent. Thus, the Weierstrass formula defines an entire function with zeros at each of $ZZ_(<= 0)$.
]

We have two famous identities on the $Gamma$-function:

#lbl(
  theorem[Euler's Reflection Formula][
    The $Gamma$-function can be analytically continued to the left half-plane with the functional equation of
    #lbl(
      $
        Gamma(z) Gamma(1-z) = uppi csc(uppi z)
      $,
      <eq:gamma-function_eulerreflection>,
    )
    for $z in CC without ZZ$.
  ],
  <thm:gamma-function_eulerreflection>,
)

#proof[
  By the Weierstrass Formula (@thm:gamma-function_weierstrassformula), we have
  $
    1 / Gamma(z) = z product_(k=1)^n [(1 + z/k) ee^(-z/k)] ee^(z upgamma), quad 1 / Gamma(-z) = -z product_(k=1)^n [(1 - z/k) ee^(z/k)] ee^(-z upgamma).
  $
  Since the Weierstrass elementary factors form an absolutely convergent infinite product, we may rearrange its terms. Hence, by @thm:sin-product-formula, we have
  $
    1 / (Gamma(z) Gamma(1-z)) = -1 / (z Gamma(z) Gamma(-z)) = z product_(k=1)^n (1 - z^2 / k^2) = sin(uppi z) / uppi,
  $
  which confirms @eq:gamma-function_eulerreflection.
]

#lbl(
  example[
    Evaluate $Gamma(1/2)$.
  ],
  <ex:gamma-function_one_half>,
)

#solution[to @ex:gamma-function_one_half][
  By the Reflection Formula (@thm:gamma-function_eulerreflection), we have that
  $
    Gamma(1/2)^2 = uppi csc(uppi / 2) = uppi,
  $
  and it follows that $Gamma(1/2) = sqrt(uppi)$ as it is positive.
]

#lbl(
  theorem[Legendre's Duplication Formula][
    For any $z in CC without (-NN / 2)$, we have
    #lbl(
      $
        Gamma(z) Gamma(z+1/2) = 2^(1-2z) sqrt(uppi) Gamma(2z).
      $,
      <eq:gamma-function_legendreduplication>,
    )
  ],
  <thm:gamma-function_legendreduplication>,
)

#proof[
  From @thm:gamma-functiongaussformula, we have
  $
    Gamma(z) Gamma(z+1/2) = lim_(n -> oo) (n^(2z+1/2) n!^2) / (product_(k=0)^n (z+k) (z+k+1/2)) = lim_(n -> oo) (2^(2n+2) n^(2z+1/2) n!^2) / (product_(k=0)^(2n+1) (2z+k))
  $
  where the left-hand side is defined since $z in CC without (-NN / 2)$. By expansion of the value, we have
  $
    Gamma(z) Gamma(z+1/2) & = lim_(n -> oo) ((2n)^(2z) (2n)!) / (product_(k=0)^(2n) (2z+k)) dot (n^(1/2) n!^2 2^(2n+2-2z)) / ((2z+2n+1) (2n)!) \
    & = Gamma(2z) lim_(n -> oo) (n^(1/2) n!^2 2^(2-2z)) / ((2z+2n+1) product_(k=0)^(n-1) (k+1/2) product_(k=1)^n k) \
    & = 2^(2-2z) Gamma(2z) lim_(n -> oo) (n^(1/2) n!) / (product_(k=0)^n (k+1/2)) dot (n+1/2) / (2z+2n+1) \
    & = 2^(1-2z) Gamma(2z) Gamma(1/2) \
    & = 2^(1-2z) Gamma(2z) sqrt(uppi),
  $
  where the last step is derived from @ex:gamma-function_one_half.
]

The identity above is a special case of the following result:

#theorem[Gauss Multiplication Theorem][
  Suppose $m in NN_(>= 2)$. Let $z in CC without (-NN / m)$. Then we have
  #lbl(
    $
      Gamma(z) Gamma(z+1/m) dots.c Gamma(z+(m-1)/m) = (2 uppi)^((m-1)/2) m^(1/2-m z) Gamma(m z).
    $,
    <eq:gamma-function_gaussmultiplication>,
  )
]

The Gamma function as in @eq:gamma-function is commonly referred to as the _Euler Integral of the Second Kind_. The _Euler Integral of the First Kind_ is also known as the _Beta function_, and is defined by
$
  Beta(z_1, z_2) = integral_0^1 t^(z_1-1) (1-t)^(z_2-1) dt.
$
By a change of variables (by letting $tau = 1 - t$), we derive the symmetry of the Beta function:
$
  Beta(z_1, z_2) = integral_0^1 tau^(z_2-1) (1-tau)^(z_1-1) dif tau = Beta(z_2, z_1).
$
The Beta function is commonly treated as an auxiliary function in many cases of integral evaluation due to its connection with the Gamma function:

#lbl(
  theorem[
    For any $Re(z_1), Re(z_2) > 0$, we have
    $
      Beta(z_1, z_2) = (Gamma(z_1) Gamma(z_2)) / Gamma(z_1+z_2).
    $
  ],
  <thm:betagamma-functionrelationship>,
)

#proof[
  Consider the product $Gamma(z_1) Gamma(z_2)$. By letting $s = u t$ and $v = t(u+1)$, we have
  #lbl(
    $
      Gamma(z_1) Gamma(z_2) & = integral_0^oo ee^(-s) s^(z_2-1) [integral_0^oo ee^(-t) t^(z_1-1) dt] dif s \
      & = integral_0^oo u^(z_2-1) [integral_0^oo ee^(-v) (v/(u+1))^(z_1+z_2-1) dif(v/(u+1))] dif u \
      & = integral_0^oo (u^(z_2-1)) / ((u+1)^(z_1+z_2)) [integral_0^oo ee^(-v) v^(z_1+z_2-1) dif v] dif u.
    $,
    <eq:betagamma-functionrelationship_intermediate>,
  )
  Let $r = u / (u+1)$, $u = r / (1-r)$, and $dif u = 1 / (1-r)^2 dif r$. Then we have
  $
    Gamma(z_1) Gamma(z_2) = Gamma(z_1+z_2) integral_0^1 r^(z_2-1) (1-r)^(z_1-1) dif r = Gamma(z_1+z_2) Beta(z_1, z_2). #qedhere
  $
]

#lbl(
  example[MIT Integration Bee 2023 Finals \#1][
    Evaluate
    $
      integral_0^(uppi / 2) (tan(x)^(1/3)) / (sin(x) + cos(x))^2 dx.
    $
  ],
  <ex:mit_integration_bee_2023_finals_1>,
)

#solution[to @ex:mit_integration_bee_2023_finals_1][
  By rewriting the integral, and letting $u = tan(x)$, we have
  $
    I = integral_0^(uppi / 2) (tan(x)^(1/3)) / (sin(x) + cos(x))^2 dx & = integral_0^oo (u^(1/3) sec^2(x) dx) / (u+1)^2 \
                                                                      & = integral_0^oo u^(1/3) dif u / (u+1)^2 \
                                                                      & = Beta(4/3, 2/3),
  $
  where the last step recognizes the form of @eq:betagamma-functionrelationship_intermediate. @thm:betagamma-functionrelationship then gives
  $
    I = (Gamma(2/3) Gamma(4/3)) / Gamma(2) = 1/3 Gamma(1/3) Gamma(2/3).
  $
  Lastly, the Reflection Formula (@thm:gamma-function_eulerreflection) gives that
  $
    I = uppi / (3 sin(uppi / 3)) = (2 uppi sqrt(3)) / 9. #qedhere
  $
]

#lbl(
  example[
    Evaluate
    $
      I = integral_0^(uppi / 2) x sqrt(tan x) dx.
    $
  ],
  <ex:integral_0_pi_2_x_sqrt_tan_x_dx>,
)

#proof[of @ex:integral_0_pi_2_x_sqrt_tan_x_dx][
  Apply the substitution $u = tan x$, $s = u^2$ and the integral representation $arctan u = integral_0^u (dif v) / (1+v^2) = integral_0^1 u (dif v) / (1+u^2 v^2)$ to get
  $
    I & = integral_0^oo arctan u (sqrt(u) dif u) / (1+u^2) = integral_0^oo (integral_0^1 u / (1+u^2 v^2) dif v) (sqrt(u) dif u) / (1+u^2) \
    & = integral_0^1 integral_0^oo u^(3/2) / ((1+u^2 v^2) (1+u^2)) dif u dif v = integral_0^1 integral_0^oo s^(1/4) / (2 (1+s v^2) (1+s)) dif s dif v.
  $
  The integral switch is justified since the integrand $>= 0$ throughout. Consider the integral for
  $
    integral_0^oo (s^(1/4) dif s) / ((1+s v^2) (s+1)) = 1 / (1-v^2) integral_0^oo s^beta (1/(1+s) - 1/(c+s)) dif s,
  $
  where $c = v^(-2)$ and $beta = 1/4$. Let the integral in the last expression be a complex function of $beta$, more explicitly $J(beta)$, defined for $-1 < Re beta < 1$.

  Notice that the integral maybe written as the difference of two convergent integrals for $-1 < Re beta < 0$:
  $
    J(beta) & = integral_0^oo s^beta (dif s) / (1+s) - integral_0^oo s^beta c^beta (dif s) / (1+s) \
            & = (1-c^beta) Beta(-beta, beta+1) = (c^beta-1) uppi csc(uppi beta)
  $
  by the reflection formula (@thm:gamma-function_eulerreflection), which derives an analytic continuation of $J|_(-1 < Re beta < 1)$ to everywhere in $CC without ZZ$.

  One can show by differentiation under the integral sign, that the integral $J(beta)$ is holomorphic for $-1 < Re beta < 1$. The identity theorem (@thm:identity) then allows the computed cosecant expression to be assigned to $J(beta)$:
  $
    I & = integral_0^1 ((v^(-1/2)-1) uppi csc(uppi / 4)) / (2-2v^2) dif v = (uppi sqrt(2))/2 integral_0^1 (v^(-1/2)-1) / (1-v^2) dif v = uppi sqrt(2) integral_0^1 (1-u) / (1-u^4) dif u \
    & = uppi sqrt(2) integral_0^1 (dif u) / ((1+u) (1+u^2)) = (uppi sqrt(2))/2 integral_0^1 (1/(1+u) + (1-u)/(1+u^2)) dif u \
    & = (uppi sqrt(2))/2 (log 2 + arctan 1 - 1/2 log 2) = (uppi^2 sqrt(2))/8 + (uppi sqrt(2))/4 log 2. #qedhere
  $
]
