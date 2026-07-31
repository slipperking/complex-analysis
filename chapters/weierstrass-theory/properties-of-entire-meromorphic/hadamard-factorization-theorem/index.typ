#import "/lib.typ": *
#show: docs-subsubchapter.with(
  title: [Hadamard Factorization Theorem],
  route: "hadamard-factorization-theorem",
)
#lbl(
  theorem[
    Let $f(z) = ee^(phi(z)) P(z)$ be the Weierstrass canonical factorization of $f$, where $f$ is entire with finite order $rho = rho(f)$ and $rho(0) = 1$. Then $phi$ is a polynomial of degree $<= rho$.
  ],
  <thm:entire-function-finite-order-canonical-weierstrass-factorization-polynomial-degree>,
)

#proof[
  By logarithmic differentiation and by taking $p > rho - 1$ subsequent derivatives, we have
  $
    (f'(z)) / f(z) = phi'(z) + (P'(z)) / P(z) ==> dif^p / (dif z^p) ((f'(z)) / f(z)) = phi^((p+1)) (z) + dif^p / (dif z^p) ((P'(z)) / P(z)).
  $
  By applying @prop:entire-function-finite-order-log-diff-derivatives and @lem:entire-function-weierstrass-product-finite-order-log-diff-derivatives, we have
  $
    -sum_(k=1)^infinity (p!) / (a_k - z)^(p+1) = phi^((p+1)) (z) - sum_(k=1)^infinity (p!) / (a_k - z)^(p+1) ==> phi^((p+1)) equiv 0.
  $
  Hence, $phi$ is a polynomial of degree $<= p$. Choosing $p = 1 + floor(rho - 1) > rho - 1$ so that $p <= rho$, the assertion follows.
]

#lbl(
  corollary[
    Let $f(z) = z^m ee^(phi(z)) P(z)$ be the Weierstrass canonical factorization of $f$, where $f$ is entire with finite order $rho = rho(f)$. Then $phi$ is a polynomial of degree $<= rho$.
  ],
  <cor:hadamard-factorization-polynomial>,
)

#proof[
  Let $f(z) = z^m g(z)$, where $f$ and $g$ are entire, $g(0) != 0$, and $f$ has finite order $rho(f)$ and $M(r, f) = r^m M(r, g)$ for $r > 0$. For $epsilon > 0$, $exists r' > 0$ such that $r > r'$ implies
  $ M(r, f) = r^m M(r, g) <= ee^(r^(rho(f) + epsilon)) ==> M(r, g) <= ee^(r^(rho(f) + epsilon)). $
  Thus, $rho(g) <= rho(f)$ by letting $epsilon -> 0^+$. Additionally, for any $epsilon > 0$, $forall r' > 0$, $exists r > r'$ such that
  $
    M(r, f) >= ee^(r^(rho(f) - epsilon)) ==> M(r, g) >= exp(r^(rho(f) - 2 epsilon) (r^epsilon - (m log r) / r^(rho(f) - 2 epsilon))) >= ee^(r^(rho(f) - 2 epsilon))
  $
  because for sufficiently large $r$,
  $ r^epsilon - (m log r) / r^(rho(f) - 2 epsilon) > 1. $
  Hence, $rho(g) >= rho(f) - 2 epsilon$. Letting $epsilon -> 0^+$ implies $rho(f) = rho(g)$. Let $g(z) = c h(z)$ where $c$ is a constant, so that $h(0) = 1$. It is also trivial that $rho(g) = rho(h)$. Explicitly, we have $h(z) = ee^(phi - Log c) P(z)$.

  By @thm:entire-function-finite-order-canonical-weierstrass-factorization-polynomial-degree on $h$, $phi - Log c$ is a polynomial of degree $<= rho$, and so is $phi$.
]

#todo[Figure out whether or not this approach is valid, and do the upper bound.]
Then the results of @cor:hadamard-factorization-polynomial and @thm:entire-function-finite-order-zeros-summation-convergence may be consolidated into a single statement:

#lbl(
  theorem[Hadamard Factorization Theorem][
    Let $mu$ be the genus of $f$ and let $rho$ be the order of $f$, where $f$ is entire with finite order. Then $mu <= rho$.
  ],
  <thm:hadamard-factorization>,
)

#lbl(
  theorem[
    The factorization
    $ sin z = z product_(k=1)^infinity (1 - z^2 / (uppi^2 k^2)) $
    defines an entire function and uniformly converges on any compact disk $overline(D(0,r))$.
  ],
  <thm:sin-product-formula>,
)

#proof[
  The zeros of $sin$ are simple at each of $ZZ$. Aside from the simple zero at $z = 0$, let
  $
    a_k = cases(
      -uppi k \/ 2 & quad "if" k in 2 NN\,,
      uppi (k+1) \/ 2 & quad "if" k in NN without 2 NN,
    )
  $
  enumerate the zeros of $sin$. By @ex:entire-function-finite-order-sin-exp-exp, and the Hadamard Factorization Theorem (@thm:hadamard-factorization), the order of $sin$ is 1, the genus does not exceed 1, and
  $
    sin z = z ee^(phi(z)) product_(k=1)^infinity E_1 (z / a_k) = z ee^(phi(z)) product_(k=1)^infinity (1 - z / a_k) exp(z / a_k),
  $
  where $phi(z) = a z + b$ is a polynomial (and where the product locally uniformly converges in $CC$). Since the partial products ${P_n}_(n in NN)$, where
  $ P_n = product_(k=1)^n (1 - z / a_k) exp(z / a_k), $
  have a single accumulation point, the subsequence ${P_(2n)}_(n in NN)$ converges to the same point. Since
  $
    P_(2n) & = product_(k=1)^(2n) (1 - z / a_k) exp(z / a_k) \
           & = product_(k=1)^n [(1 - z / (uppi k)) exp(z / (uppi k)) (1 + z / (uppi k)) exp(-z / (uppi k))],
  $
  we have
  $ sin z = z ee^(a z + b) product_(k=1)^infinity (1 - z^2 / (uppi^2 k^2)). $
  Then from $sin z = -sin(-z)$ we have
  $
    z ee^(a z + b) product_(k=1)^infinity (1 - z^2 / (uppi^2 k^2)) equiv z ee^(-a z + b) product_(k=1)^infinity (1 - z^2 / (uppi^2 k^2)) ==> ee^(2 a z) equiv 1 ==> a = 0.
  $
  Since $lim_(zeta -> 0) (sin zeta) / zeta = 1$, we have
  $ lim_(z -> 0) ee^b product_(k=1)^infinity (1 - z^2 / (uppi^2 k^2)) = 1 ==> b = 0. #qedhere $
]
