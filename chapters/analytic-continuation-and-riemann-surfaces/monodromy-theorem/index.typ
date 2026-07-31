#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [The Monodromy Theorem],
  route: "monodromy-theorem",
  label: <sec:monodromy-theorem>,
)

Before we address our main issue, we will first formalize the concept of homotopy. Informally, it is a continuous deformation or "smooth interpolation" between two curves (that lies entirely within a provided set).

#lbl(
  definition[
    Let $U subset.eq CC$ be an open set. Two curves $gamma_1, gamma_2 : [0, 1] -> U$ are said to be _homotopic_ if there exists a continuous function $H : [0, 1] times [0, 1] -> U$ such that:

    + $H(0, t) = gamma_1 (t)$ for all $t in [0, 1]$,
    + $H(1, t) = gamma_2 (t)$ for all $t in [0, 1]$.

    The function $H$ is known as a _homotopy_ between $gamma_1$ and $gamma_2$.
  ],
  <def:homotopy>,
)

We are primarily concerned with homotopies with _fixed endpoints_ (under the pretense that $gamma_1 (0) = gamma_2 (0)$ and $gamma_1 (1) = gamma_2 (1)$), or that the homotopy $H$ satisfies $H(s, 0) = gamma_1 (0) = gamma_2 (0)$ and $H(s, 1) = gamma_1 (1) = gamma_2 (1)$ for any $s in [0, 1]$.

#lbl(
  definition[
    Let $Omega subset.eq CC$ be a region and let $U subset.eq Omega$ be an open disk centered at $P in Omega$. Suppose $(f, U)$ is an analytic function element. If there is an analytic continuation of $(f, U)$ along any curve $gamma subset Omega$ from $P$, then $(f, U)$ has _unrestricted continuation_ in $Omega$.
  ],
  <def:unrestricted-continuation>,
)

As for our question in interest:

#quote(block: true)[
  Let $gamma_1 : [0, 1] -> CC$ and $gamma_2 -> CC$ be two curves with the same endpoints ($gamma_1 (0) = gamma_2 (0)$ and $gamma_1 (1) = gamma_2 (1)$), and let ${(f_t, U_t)}_(0 <= t <= 1)$ and ${(tilde(f)_t, tilde(U)_t)}_(0 <= t <= 1)$ be the unique analytic continuations along $gamma_1$ and $gamma_2$ respectively. Under what conditions will the terminal analytic function elements be equivalent (when will it be satisfied that $f_1 equiv tilde(f)_1$ on $U_1 inter tilde(U)_1$)?
]

This question is not necessarily an affirmative. The principal branch logarithm on $D(1, 1)$, when analytically continued on the unit upper semicircle ${ee^(uppi ii theta)}_(0 <= t <= 1)$ and unit lower semicircle ${ee^(-uppi ii theta)}_(0 <= t <= 1)$, yields inequivalent terminal analytic function elements (differing by $2 uppi ii$). The general answer to the question is given below:

#lbl(
  theorem[
    Let $Omega subset.eq CC$ be a region, and suppose $U subset.eq Omega$ is a disk centered at $P$, and let $gamma_1$ and $gamma_2$ be two curves in $Omega$ with the same endpoints ($P = gamma_1 (0) = gamma_2 (0)$ and $Q = gamma_1 (1) = gamma_2 (1)$). Let ${(f_t, U_t)}_(0 <= t <= 1)$ and ${(tilde(f)_t, tilde(U)_t)}_(0 <= t <= 1)$ be the unique analytic continuations along $gamma_1$ and $gamma_2$ respectively. If $gamma_1$ and $gamma_2$ are homotopic in $Omega$ and $(f, U)$ has unrestricted continuation in $Omega$, then $f_1 equiv tilde(f)_1$ on $U_1 inter tilde(U)_1$.
  ],
  <thm:monodromy>,
)

#proof[
  Let $s$ be a fixed value in $[0, 1]$ and consider the curve defined by $t |-> H(s, t)$ from $P$ to $Q$. By the unrestricted continuation assumption, there exists an analytic continuation ${(f_(s, t), U_(s, t))}_(0 <= t <= 1)$ of $(f, U)$ along this curve. In this form, we aim to show that $f_(0, 1) equiv f_(1, 1)$ on $U_(0, 1) inter U_(1, 1)$ (we have taken the liberties to denote $f_1$ by $f_(0, 1)$ and $tilde(f)_1$ by $f_(1, 1)$, with similar notions for $U_1$ and $tilde(U)_1$).

  Let
  $
    S = {s in [0, 1] : forall 0 <= lambda <= s, f_(lambda, 1) equiv f_(0, 1) "on" U_(lambda, 1) inter U_(0, 1) in.rev Q}.
  $
  Let us fix $s in S$. The analytic continuation ${(f_(s, t), U_(s, t))}_(0 <= t <= 1)$ along the curve $t |-> H(s, t)$ generates the cover ${U_(s, t)}_(0 <= t <= 1)$ of the compact curve ${H(s, t)}_(0 <= t <= 1)$. By Heine--Borel (@thm:heine-borel), there exists a finite subcover ${U_(s, t_k)}_(k=1)^n$. Then $exists epsilon > 0$ such that each $D(H(s, t), epsilon) subset.eq union.big_(k=1)^n U_(s, t_k)$ for all $t in [0, 1]$. In fact, we can choose $epsilon$ to be
  $ epsilon = min_(k=1)^n [op("dist")(H(s, [0, 1]), diff U_(s, t_k) without union.big_(j=1)^n U_(s, t_j))]. $
  It can be verified that $op("dist")$ here is positive since $H(s, [0, 1]) subset union.big_(j=1)^n U_(s, t_j)$ (thus both sets are disjoint) and both are compact sets. By continuity, $forall t in [0, 1]$, $exists delta > 0$ such that $forall s' in [0, 1] inter (s - delta, s + delta)$, $abs(H(s, t) - h(s', t)) < epsilon$. By the Heine--Cantor Theorem (@thm:heine-cantor), $delta$ attains a positive infimum, and thus $exists delta > 0$ such that $forall s' in [0, 1] inter (s - delta, s + delta)$, $forall t in [0, 1]$, $abs(H(s, t) - H(s', t)) < epsilon$.

  Fix $s'$ and $t$. By the derived inequality, we have that $H(s', t) in U_(s, t)$ and therefore, $tilde(U)_(s', t) = D(H(s', t), epsilon - abs(H(s, t) - H(s', t))) subset.eq U_(s, t)$. Thus, the analytic function element $(f_(s, t), tilde(U)_(s', t))$ is a direct analytic continuation of $(f_(s, t), U_(s, t))$. By constructing analytic function elements similarly for all $t$, we obtain an analytic continuation of $(f_(s, 0), tilde(U)_(s', 0))$ along $H(s', [0, 1])$. Because $(f_(s, 0), U_(s, 0))$ and $(f_(s, 0), tilde(U)_(s', 0))$ are direct analytic continuations of each other, by @lem:analytic-continuation-along-curve-uniqueness, the continuations ${(f_(s, t), tilde(U)_(s', t))}_(0 <= t <= 1)$ and ${(f_(s', t), U_(s', t))}_(0 <= t <= 1)$ are equivalent. Thus, all elements of $(s - delta, s + delta) inter [0, 1]$ belong in $S$, and thus $S$ is relatively open in $[0, 1]$.

  Let ${s_n}_(n in NN) subset S$ be an arbitrarily chosen convergent sequence accumulating at $s_oo$. Since there exists an analytic continuation of $(f_(s_oo, 0), U_(s_oo, 0))$ along the curve $H(s_oo, [0, 1])$, we can use the same argument as before to construct $epsilon$ such that each $D(H(s_oo, t), epsilon) subset.eq U_(s_oo, t)$ and $delta$ such that $forall s in [0, 1] inter (s_oo - delta, s_oo + delta)$, $forall t in [0, 1]$, $abs(H(s, t) - H(s_oo, t)) < epsilon$. By convergence, for sufficiently large $n$, $abs(s_n - s_oo) < delta$. Hence, there is an analytic continuation // need to double check this
  $ {(f_(s_oo, t), D(H(s_n, t), epsilon - abs(H(s_n, t) - H(s_oo, t))))}_(0 <= t <= 1) $
  along $H(s_n, [0, 1])$, which is equivalent to ${(f_(s_n, t), U_(s_n, t))}_(0 <= t <= 1)$ by @lem:analytic-continuation-along-curve-uniqueness under the same preliminary assumptions as shown previously. By the following logic, $f_(s_oo, 1) equiv f_(s_n, 1)$ on the intersection, and $s_oo in S$ and $S$ is closed. Hence, by @thm:connected-topological-space-clopen-sets, $S = [0, 1]$. Thus, $forall 0 <= lambda <= 1$, $f_(lambda, 1) equiv f_(0, 1)$ on $U_(lambda, 1) inter U_(0, 1) in.rev Q$.
]

#lbl(
  corollary[
    Let $Omega subset.eq CC$ be simply connected, or that every closed curve in $Omega$ is null-homotopic (homotopic to a constant curve, or a point) in $Omega$. Let $U subset.eq Omega$ be a disk and suppose $(f, U)$ is an analytic function element with unrestricted continuation in $Omega$. Then $exists! tilde(f)$ that is holomorphic on $Omega$ such that $tilde(f) equiv f$ on $U$.
  ],
  <cor:monodromy-simply-connected>,
)

The problems arising from the complex logarithm are now understood specifically as the failure of the homotopy condition. In a set excluding albeit enclosing the origin, such as $CC without {0}$, curves enclosing the origin are not homotopic to the zero constant curve, and in the complex plane, the logarithm does not admit unrestricted continuation in $CC$ since it cannot be continued along any curve passing through the origin.
