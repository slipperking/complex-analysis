#import "/lib.typ": *
#show: docs-subsubchapter.with(
  title: [The Factorization of Transcendental Meromorphic Functions],
  route: "factorization-of-transcendental-meromorphic-functions",
)
We now give a meromorphic analog of the Hadamard Factorization Theorem:

#theorem[
  Let $f : CC -> extcomplex$ be non-constant and meromorphic of finite order $rho$ such that $f(0) != 0, oo$. If ${a_n}_(n=1)^oo$ and ${b_n}_(n=1)^oo$ are its zeros and poles in $CC^*$ listed in order of nondecreasing moduli, counting multiplicities and zeros, then the products
  $
    P_1 (z) = product_(n=1)^oo E_p (z / a_n), quad P_2 (z) = product_(n=1)^oo E_q (z / b_n)
  $
  locally uniformly converge in $CC$ for some $p, q <= floor(rho)$. Then $f(z) = ee^(phi(z)) frac(P_1 (z), P_2 (z), style: "horizontal")$, where $phi$ is a polynomial of degree $<= rho$.
]

#proof[
  By @thm:meromorphicfunctionfiniteorderestimatessum, letting $q = floor(rho)$ gives that the two given products converge locally uniformly and the corresponding summation of exponent $q + 1$ converge. Define $g$ to be the analytic continuation across all removable singularities of $f dot P_2$ such that $g$ is entire and vanishes at each ${a_n}$. Observe that
  $ T(r, g) <= T(r, f) + T(r, P_2), quad T(r, f) = Order(r^(rho + epsilon)) $
  by @prop:nevanlinna_characteristic_properties and @prop:meromorphicfunctionfiniteorderestimates. For sufficiently large $r$,
  $ T(r, P_2) = m(r, P_2) <= log M(r, P_2). $
  Define
  $
    P_2 (z) = product_(abs(b_n) <= 2 abs(z)) E_q (z / b_n) dot product_(abs(b_n) > 2 abs(z)) E_q (z / b_n) = P_2^(<= ) (z) dot P_2^(>) (z).
  $
  Since $abs(z \/ b_n) < 1\/2$ for $P_2^>$,
  $
    abs(Log E_q (z / b_n)) <= sum_(k > q)^oo 1/k abs(z / b_n)^(q+1) <= abs(z / b_n)^(q+1) sum_(k > q)^oo 1/k abs(1/2)^(k-q-1) <= c r^(q+1) abs(b_n)^(-q-1),
  $
  where $c$ is a constant dependent only on $q$ and $r = abs(z)$ (see @eq:infiniteproductweierstrassfactorizationuniformbound). Since for sufficiently small $epsilon > 0$, $q + 1 > rho + epsilon$,
  $
    log abs(P_2^> (z)) &<= abs(Log P_2^> (z)) <= sum_(abs(b_n) > 2r) abs(Log E_q (z / b_n)) <= c r^(q+1) sum_(abs(b_n) > 2r) 1 / abs(b_n)^(q+1) \
    &<= c r^(rho + epsilon) sum_(abs(b_n) > 2r) (r^(q+1-(rho+epsilon))) / (abs(b_n)^(rho+epsilon) abs(b_n)^(q+1-(rho+epsilon))) <= 2^(rho+epsilon-q-1) c r^(rho+epsilon) sum_(abs(b_n) > 2r) abs(b_n)^(-rho-epsilon) \
    &= Order(r^(rho + epsilon)) // double check this later since it seems just a bit scuffed
  $
  (the summation of converges by @thm:meromorphicfunctionfiniteorderestimatessum). Assume now that $abs(b_n) <= 2r$, or $2 abs(z \/ b_n) >= 1$. Then,
  $
    log abs(E_q (z / b_n)) = log abs(1 - z / b_n) + Re(sum_(k=1)^q 1/k z^k / b_n^k) <= log(1 + abs(z / b_n)) + c abs(z / b_n)^q
  $
  for some $c$ such that $Re(sum_(k=1)^q 1/k w^k) <= c abs(w)^q$ for all $abs(w) >= 1\/2$, which depends only on $q$. First assume that $q >= 1$, and it then follows that
  $
    log abs(P_2^<= (z)) &<= sum_(abs(b_n) <= 2r) [c abs(r / b_n)^q + log(1 + abs(r / b_n))] <= sum_(abs(b_n) <= 2r) [c abs(r / b_n)^q + abs(r / b_n)] \
    &<= sum_(abs(b_n) <= 2r) (c + 2^(q-1)) abs(z / b_n)^q = sum_(abs(b_n) <= 2r) c' (r^(rho+epsilon)) / abs(b_n)^(rho+epsilon) (abs(b_n) / r)^(rho+epsilon-q) \
    &<= sum_(abs(b_n) <= 2r) 2^(rho+epsilon-q) c' (r^(rho+epsilon)) / abs(b_n)^(rho+epsilon) = Order(r^(rho+epsilon)).
  $
  It follows that
  $ T(r, g) <= log abs(P_2 (z)) = Order(r^(rho + epsilon)), $
  and thus $g$ is of order $rho' <= rho$. For any $epsilon$, there is some $c$ such that $log(1 + abs(w)) <= c abs(w)^epsilon$; thus for $q = 0$, the assertion is direct from @prop:meromorphicfunctionfiniteorderestimates:
  $
    log abs(E_q (z / b_n)) <= log(1 + abs(z / b_n)) <= c r^epsilon / abs(b_n)^epsilon <= c r^epsilon / abs(b_1)^epsilon \
    log abs(P_2^<=) <= n(2r, 0, f) r^epsilon / abs(b_1)^epsilon = Order(r^(rho + 2 epsilon)).
  $
  Similar logic then derives that $g$ is of order $<= rho$. There then exists an integer $p <= rho'$ such that $P_1$ converges and $g(z) = ee^(phi(z)) P_1 (z)$ has the property that $phi$ is a polynomial of degree $g <= rho'$ by the Hadamard Factorization Theorem (@thm:hadamardfactorization) for entire functions. Writing $f = frac(g, P_2, style: "horizontal")$ then yields the desired representation.
]
