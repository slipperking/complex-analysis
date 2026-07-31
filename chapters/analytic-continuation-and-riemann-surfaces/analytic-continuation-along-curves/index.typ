#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Analytic Continuation Along a Curve],
  route: "analytic-continuation-along-curves",
  label: <sec:analytic-continuation-along-curves>,
)

#lbl(
  definition[
    Let $gamma : [0, 1] -> CC$ be a (non-constant) curve. Let $U$ be a disk centered at $gamma(0)$ and suppose $f : U -> CC$ is holomorphic. An _analytic continuation of_ $(f, U)$ _along_ $gamma$ is defined to be a collection of analytic functions elements ${(f_t, U_t)}_(0 <= t <= 1)$ where

    1. We define $U_0 = U$ and $f_0 = f$.
    2. Each $U_t$ ($0 <= t <= 1$) is a disk centered at $gamma(t)$.
    3. For each $t_0 in [0, 1]$, $exists delta > 0$ such that $forall t in [0, 1]$ satisfying $abs(t - t_0) < delta$, $gamma(t) in U_(t_0)$ and $f_t equiv f_(t_0)$ on $U_t inter U_(t_0) != emptyset$. #enum-lbl(<itm:analytic-continuation-along-curve-pointwise-equivalence>)
  ],
  <def:analytic-continuation-along-curve>,
)

For a fixed curve, such analytic continuations are unique in the following sense:

#lbl(
  lemma[
    For a fixed curve $gamma : [0, 1] -> CC$, let $f$ be holomorphic on $U$ (a disk centered at $gamma(0)$). Then any two analytic continuations ${(f_t, U_t)}_(0 <= t <= 1)$ and ${(tilde(f)_t, tilde(U)_t)}_(0 <= t <= 1)$ along $gamma$ satisfy $f_1 equiv tilde(f)_1$ on $U_1 inter tilde(U)_1$ (where $(f_1, U_1)$ and $(tilde(f)_t, tilde(U)_t)$ are the respective terminal analytic function elements).
  ],
  <lem:analytic-continuation-along-curve-uniqueness>,
)

#proof[
  Let $S subset.eq [0, 1]$ be the set of all $t_0$ such that $forall 0 <= t <= t_0$, $f_t equiv tilde(f)_t$ on $U_t inter tilde(U)_t$ (this intersection is nonempty since $gamma(t) in U_t, tilde(U)_t$). Since $0 in S$, it follows that $S$ is nonempty.

  Obviously, $S$ is a connected set. Indeed, for any $t_0$ in $S$, any $0 <= t < t_0$ also lies in $S$ by definition.

  Let $t_infinity = sup(S)$, and choose an increasing sequence ${t_n}_(n in NN) subset.eq S$ that converges to $t_infinity$. By @itm:analytic-continuation-along-curve-pointwise-equivalence of @def:analytic-continuation-along-curve, $exists delta > 0$ such that $forall n in NN$ satisfying $abs(t_infinity - t_n) < delta$,
  $ f_(t_n) equiv f_(t_infinity) quad "on" quad U_(t_n) inter U_(t_infinity) in.rev gamma(t_n). $
  Similarly, $exists tilde(delta) > 0$ such that $forall n in NN$ satisfying $abs(t_infinity - t_n) < tilde(delta)$,
  $
    tilde(f)_(t_n) equiv tilde(f)_(t_infinity) quad "on" quad tilde(U)_(t_n) inter tilde(U)_(t_infinity) in.rev gamma(t_n).
  $
  Choose $n$ arbitrarily to satisfy $abs(t_infinity - t_n) < min(delta, tilde(delta))$. By the conditions on $delta,tilde(delta)$ set by @itm:analytic-continuation-along-curve-pointwise-equivalence of @def:analytic-continuation-along-curve,
  $ gamma(t_n) in U_(t_infinity) quad "and" quad gamma(t_n) in tilde(U)_(t_infinity). $
  Hence, $tilde(U)_(t_infinity) inter U_(t_infinity) inter tilde(U)_(t_n) inter U_(t_n) != emptyset$. Since $t_n in S$, it follows that $tilde(f)_(t_n) equiv f_(t_n)$ on $tilde(U)_(t_n) inter U_(t_n)$. Thus,
  $
    f_(t_infinity) equiv tilde(f)_(t_infinity) quad "on" quad tilde(U)_(t_infinity) inter U_(t_infinity) inter tilde(U)_(t_n) inter U_(t_n).
  $
  By the Identity Theorem (@thm:identity), this equality holds on the entire intersection $tilde(U)_(t_infinity) inter U_(t_infinity)$. It follows that $t_infinity in S$ and thus $S$ is closed.

  Let $tilde(S) = [0, 1] without S$, and assume that it is nonempty (if not, our result is proven). Suppose ${t_n}_(n in NN) subset tilde(S)$ is an arbitrary sequence that converges to $t_infinity$. For each $n in NN$, since $t_n in.not S$, by definition, there exists $0 <= s_n <= t_n$ such that $f_(s_n) equiv.not tilde(f)_(s_n)$ on $U_(s_n) inter tilde(U)_(s_n)$ (otherwise $t_n in S$ would be satisfied).

  By the Bolzano--Weierstrass Theorem (@thm:bolzano-weierstrass), the sequence ${s_n}_(n in NN)$ has a convergent subsequence ${s_(n_k)}_(k in NN)$ that converges to $s_infinity$. Since $t_(n_k) -> t_infinity$ and $s_(n_k) <= t_(n_k)$ for all $k$, it follows that $s_infinity <= t_infinity$. By definition, there exists $delta > 0$ (choose it to be the minimum of the two $delta$ values, similar to in the previous section) such that $forall t in [0, 1]$ satisfying $abs(t - s_infinity) < delta$, $f_t equiv f_(s_infinity)$ and $tilde(f)_t equiv tilde(f)_(s_infinity)$ on $U_t inter U_(s_infinity)$ and on $tilde(U)_t inter tilde(U)_(s_infinity)$ respectively, and $gamma(t) in U_(s_infinity) inter tilde(U)_(s_infinity)$.

  Since $s_(n_k) -> s_infinity$, we have $abs(s_(n_k) - s_infinity) < delta$ for sufficiently large $k$. Thus, $f_(s_(n_k)) equiv f_(s_infinity)$ and $tilde(f)_(s_(n_k)) equiv tilde(f)_(s_infinity)$ on $U_(s_(n_k)) inter U_(s_infinity)$ and $tilde(U)_(s_(n_k)) inter tilde(U)_(s_infinity)$ respectively, and $gamma(s_(n_k)) in U_(s_infinity) inter tilde(U)_(s_infinity)$.

  For the sake of contradiction, assume that $s_infinity in S$, and it follows that $f_(s_infinity) equiv tilde(f)_(s_infinity)$ on $U_(s_infinity) inter tilde(U)_(s_infinity)$. Because
  $
    f_(s_(n_k)) equiv f_(s_infinity) equiv tilde(f)_(s_infinity) equiv tilde(f)_(s_(n_k)) quad "on" quad U_(s_infinity) inter tilde(U)_(s_infinity) inter U_(s_(n_k)) inter tilde(U)_(s_(n_k)) in.rev gamma(s_(n_k)),
  $
  by the Identity Theorem (@thm:identity), this implies that $f_(s_(n_k)) equiv tilde(f)_(s_(n_k))$ on $U_(s_(n_k)) inter tilde(U)_(s_(n_k))$. This contradicts the assumption that $f_(s_n) equiv.not tilde(f)_(s_n)$ on $U_(s_n) inter tilde(U)_(s_n)$ for all $n$, and hence, $s_infinity in tilde(S)$, implying that $t_infinity in tilde(S)$ (if not, then $s_infinity in.not tilde(S)$, which we derived was a contradiction). It follows that $tilde(S)$ is closed as it contains all of its accumulation points. By the connectivity argument (@thm:connected-topological-space-clopen-sets), we have $tilde(S)$ is either $[0, 1]$ or $emptyset$. Obviously, the former is an impossibility and thus $S = [0, 1]$. Therefore, $f_1 equiv tilde(f)_1$ on $U_1 inter tilde(U)_1$.
]

Provided by the trivial fact, under the assumption that an analytic continuation along a fixed curve exists, it is unique in the defined sense.

To avoid being pedantic, we will refer to two analytic continuations on a fixed curve as _equivalent_ if $f_t equiv tilde(f)_t$ on $U_t inter tilde(U)_t$ for all $0 <= t <= 1$.
