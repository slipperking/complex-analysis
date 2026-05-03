#import "/lib.typ": *
== Complex Power Series

Power series in real analysis can be generalized into complex series. Particularly, concepts such as uniform convergence are the same in complex analysis:

#definition("Uniform Convergence")[
  For a set $U subset.eq CC$, a function sequence ${f_n (z)}$ _uniformly converges_ to a function $f(z)$ on $U$ iff $forall epsilon > 0$, $exists N in NN$ such that $forall n > N$, $forall z in U$, $abs(f_n (z) - f(z)) < epsilon$.
]

#remark[
  The definition above is equivalent to the following definition.

  For a set $U subset.eq CC$, a function sequence ${f_n (z)}$ uniformly converges to $f(z)$ iff
  $ lim_(n -> infinity) sup_(z in U) abs(f_n (z) - f(z)) = 0. $

  Informally, we will use the notation $f_n (z) arrows.rr f(z)$ to represent uniform convergence.
]

#theorem("Cauchy Criterion")[
  For a set $U subset.eq CC$, a function sequence ${f_n (z)}$ uniformly converges to a function $f(z)$ iff $forall epsilon > 0$, $exists N in NN$ such that $forall n, m > N$, $forall z in U$, $abs(f_n (z) - f_m (z)) < epsilon$.
] <thm:cauchycriterionuniformconvergence>

#proof[
  If $f_n (z)$ uniformly converges to $f(z)$, then for $forall epsilon > 0$, $exists N in NN$ such that $forall n, m > N$ and $forall z in U$,
  $ abs(f_m (z) - f(z)) < epsilon / 2, quad abs(f_n (z) - f(z)) < epsilon / 2. $

  Then,
  $ abs(f_m (z) - f_n (z)) <= abs(f_n (z) - f(z)) + abs(f_m (z) - f(z)) < epsilon. $

  For the converse, refer to the analogous proof in @thm:cauchycriterionsequenceconvergence.
]

Function series are defined to be a sequence formed by the partial sums of function sequences. There are many ways to verify the uniform convergence of a function series. Perhaps the most widely known is the Weierstrass $M$-Test.

#theorem("Weierstrass " + $M$ + "-Test")[
  Let $U subset.eq CC$ be a region and ${f_n}$ be a function sequence on $U$.

  If $exists {M_n} subset RR_(>= 0)$ such that $forall n in NN$, $forall z in U$, $abs(f_n (z)) <= M_n$ and the series $sum_(n = 1)^infinity M_n$ converges, then the series $sum_(n = 1)^infinity f_n (z)$ converges uniformly and absolutely on $U$.
] <thm:weierstrassmtest>

#proof[
  By the convergence of $sum_(n = 1)^infinity M_n$, $forall epsilon > 0$, $exists N in NN$ such that $forall m >= n > N$,
  $ abs(M_m + M_(m - 1) + dots + M_(n + 1)) < epsilon. $

  Since $M_j$ bounds $f_j(z)$, it follows that
  $
    abs(f_m (z) + f_(m - 1)(z) + dots + f_(n + 1)(z)) <= abs(M_m + M_(m - 1) + dots + M_(n + 1)) < epsilon,
  $
  and the result follows from @thm:cauchycriterionuniformconvergence.
]

The concept of uniform convergence is generalized to improper integrals with parameters, and the same theorems from series have a corresponding counterpart.

In both complex and real analysis, the concept of _power series_, a unique type of function series, is of trivial importance. Similar to real power series, complex series have the form
$ sum_(n = 0)^oo a_n z^n, $
where ${a_n}$ are constants.

Let $D(a, r) = B^1(a, r) = {z in CC | abs(z - a) < r}$ denote the _open disk_ centered at $a$ with radius $r$. For simplicity, from now on we will have $DD$ denote the unit open disk, or $D(0, 1)$. We will now observe the convergence of power series.

#theorem("Abel's Theorem")[
  For a power series $f(z) = sum_(n = 0)^infinity a_n z^n$, there exists a constant $R in RR_(>= 0) union {infinity}$, known as the _radius of convergence_ such that:

  1. $f$ absolutely converges on $D(0, R)$, and $forall 0 <= rho < R$, uniformly converges on $overline(D(0, rho))$.
  2. $f(z)$ diverges when $abs(z) > R$.
  3. $f$ is holomorphic over $D(0, R)$ and $f'(z)$ can be obtained by termwise differentiation, or $f'(z) = sum_(n = 1)^infinity n a_n z^(n - 1)$, which also has a convergence radius of $R$.
] <thm:abelradius>

The disk $abs(z) < R$ is known as the _disk of convergence_, a direct generalization of the _interval of convergence_ for real series. There are many ways to determine the radius of convergence:

#theorem("Cauchy" + sym.dash.en + "Hadamard")[
  The radius of convergence of the power series in the form $sum_(n = 0)^infinity a_n z^n$ can be determined by
  $ R = 1 / op("lim sup")_(n -> infinity) root(n, abs(a_n)). $ <eq:cauchyhadamard>
] <thm:cauchyhadamard>

Of course, a convergence radius of $0$ implies that the series is divergent everywhere except for possibly at $0$, and a convergence radius of $infinity$ means that the series absolutely converges everywhere.

#proof[We will prove that the value in @eq:cauchyhadamard satisfies the criteria in @thm:abelradius.

  Assume $abs(z) < R$. Then $forall rho in (abs(z), R)$, and consequently, $1 / rho > 1 / R$. By @def:limsup and @eq:cauchyhadamard, $exists N in NN$ such that $forall n > N$, $root(n, abs(a_n)) < 1 / rho$ and $abs(a_n) < 1 / rho^n$. It follows that $abs(a_n z^n) < abs(z)^n / rho^n < 1$ for all $n > N$. Then $sum_(n = 0)^infinity abs(a_n z^n)$ converges.

  Let $rho' in (rho, R)$. Similarly, $exists N' in NN$ such that $forall n > N'$, $root(n, abs(a_n)) < 1 / rho'$, and $abs(a_n) < 1 / rho'^n$. Then $abs(a_n z^n) < abs(a_n rho^n) < rho^n / rho'^n$. By the Weierstrass $M$-Test (@thm:weierstrassmtest), $sum_(n = 0)^infinity abs(a_n z^n)$ is uniformly bounded for $n > N'$ by the convergent series $sum_(n = 0)^infinity a_n rho^n$, and thus uniformly converges on $abs(z) < rho$. This proves part 1.

  Assume that $abs(z) > R$. For all $rho in (R, abs(z))$, $1 / rho < 1 / R$. By @def:limsup, $forall N in NN$, $exists n_N > N$ such that $root(n_N, abs(a_(n_N))) > 1 / rho$. It follows that $abs(a_(n_N) z^(n_N)) > abs(z^(n_N)) / rho^(n_N) > 1$. Since $forall N in NN$,
  $ abs(sum_(k = 0)^(n_N) a_k z^k - sum_(k = 0)^(n_N - 1) a_k z^k) > 1, $
  by the Cauchy Criterion (@thm:cauchycriterionsequenceconvergence), $sum_(n = 0)^infinity a_n z^n$ is divergent. Thus, part 2 is satisfied.

  To prove part 3, first observe that $sum_(n = 1)^infinity n a_n z^n$ and $sum_(n = 1)^infinity a_n z^n$ have the same convergence radius since $op("lim sup")_(n -> infinity) root(n, n) = 1$. For $z in D(0, R)$, let $f(z) = S_n (z) + R_n (z)$, where
  $ S_n (z) = sum_(k = 0)^(n - 1) a_k z^k, quad R_n (z) = sum_(k = n)^infinity a_k z^k. $

  Let
  $ f_1(z) = lim_(n -> infinity) S'_n (z) = sum_(n = 1)^infinity n a_n z^(n - 1). $

  Let $rho < R$ be positive and $abs(z_0) < rho$. Then we aim to show that
  $ lim_(z -> z_0) ((f(z) - f(z_0)) / (z - z_0) - f_1(z)) = 0. $

  By analyzing the difference,
  $
    (f(z) - f(z_0)) / (z - z_0) - f_1(z) & = [(S_n (z) - S_n (z_0)) / (z - z_0) - S'_n (z)] \
                                         & + S'_n (z) - f_1(z) + (R_n (z) - R_n (z_0)) / (z - z_0). #<eq:abelradius_differentiationintermediate>
  $

  Since $S'_n (z) -> f_1(z)$ as $n -> infinity$, it follows that $forall epsilon > 0$, $exists N in NN$ such that $forall n > N$, $abs(S'_n (z) - f_1(z)) < epsilon / 3$. Since
  $
    (R_n (z) - R_n (z_0)) / (z - z_0) = sum_(k = n)^infinity a_k (z^(k - 1) + z^(k - 2) z_0 + dots + z_0^(k - 1))
  $
  for $z != z_0$, with $abs(z) < rho < R$,
  $
    abs(sum_(k = n)^infinity a_k (z^(k - 1) + dots + z_0^(k - 1))) <= sum_(k = n)^infinity abs(a_k) (abs(z^(k - 1)) + dots + abs(z_0^(k - 1))) < sum_(k = n)^infinity abs(a_k) k rho^(k - 1).
  $
  Since $sum_(k = 1)^infinity k abs(a_k) rho^(k - 1)$ is absolutely convergent, $sum_(k = n)^infinity abs(a_k) k rho^(k - 1)$ is the remainder term of a convergent series. Then, $exists N' in NN$ such that $forall n > N'$, $sum_(k = n)^infinity abs(a_k) k rho^(k - 1) < epsilon / 3$.

  Finally, for a fixed $n > max(N, N')$, $exists delta > 0$ such that $forall z in D(z_0, delta) without {z_0}$,
  $ abs((S_n (z) - S_n (z_0)) / (z - z_0) - S'_n (z)) < epsilon / 3. $

  From @eq:abelradius_differentiationintermediate, we get
  $ abs((f(z) - f(z_0)) / (z - z_0) - f_1(z)) < epsilon, $
  confirming part 3.
]

Obviously, a substitution of $z = zeta - a$ where $a in CC$ translates the disk of convergence to $D(a, R)$. The subsequent results on uniform convergence hold for complex functions:

#theorem("Uniform Limit")[
  Let ${f_n (z)}$ be continuous on $U subset.eq CC$ and uniformly convergent to $f(z)$. Then $f(z)$ is continuous on $U$.
] <thm:uniformlimit>

#proof[
  By continuity, $forall n in NN$, $forall z_0 in U$, $forall epsilon > 0$, $exists delta > 0$ such that $forall z in D(z_0, delta) subset.eq U$, $abs(f_n (z) - f_n (z_0)) < epsilon / 3$. Additionally, $exists N in NN$ such that $forall n > N$, $forall z in U$, $abs(f_n (z) - f(z)) < epsilon / 3$. It follows that $abs(f_n (z_0) - f(z_0)) < epsilon / 3$. By the triangle inequality,
  $
    abs(f(z) - f(z_0)) <= abs(f(z) - f_n (z)) + abs(f_n (z) - f_n (z_0)) + abs(f_n (z_0) - f(z_0)) < epsilon
  $
  for all $z in D(z_0, delta)$. Then the continuity of $f$ is satisfied.
]

Lastly, the sufficient criteria to pass a limit through an integral:

#theorem[
  Let $gamma$ be a rectifiable curve on which the function sequence ${f_n}_(n in NN)$ is continuous. If ${f_n (z)}$ uniformly converges to $f$, then
  $ lim_(n -> infinity) integral_gamma f_n (z) dz = integral_gamma f(z) dz. $
] <thm:limitintegralswitch>

#proof[
  Since ${f_n (z)}$ uniformly converges to $f(z)$ on $gamma$, $forall epsilon > 0$, there exists $N in NN$ such that for all $n > N$,
  $ abs(f_n (z) - f(z)) < epsilon / (length(gamma)), quad forall z in gamma. $

  Since each $f_n$ is continuous and $gamma$ is rectifiable, each integral $integral_gamma f_n (z) dz$ is convergent and well-defined.

  Then $forall n > N$,
  $
    abs(integral_gamma f_n (z) dz - integral_gamma f(z) dz) &= abs(integral_gamma (f_n (z) - f(z)) dz) \
    &<= integral_gamma abs(f_n (z) - f(z)) abs(dz) \
    &< integral_gamma epsilon / length(gamma) abs(dz) = epsilon.
  $
  Therefore,
  $ lim_(n -> infinity) integral_gamma f_n (z) dz = integral_gamma f(z) dz. qedhere $
]

#remark[
  For a uniformly convergent series $sum_(n = 1)^infinity f_n (z)$, the commutation between the limit and the integral becomes a summation-integral switch:
  $ sum_(n = 1)^infinity integral_gamma f_n (z) dz = integral_gamma sum_(n = 1)^infinity f_n (z) dz. $
]
