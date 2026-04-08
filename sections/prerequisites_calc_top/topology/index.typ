#import "/lib.typ": *

== Topological Preliminaries

The following definitions are subject to the assumption where the topological space is defined to be $X = CC^n$. This is satisfactory to the main purpose of our proceeding passage, but it is noteworthy that it can be generalized to more abstract sets.

#definition("Accumulation Point")[
  A point $z in CC^n$ is an _accumulation point_ of $X$ if for any open set $U$ containing $z$, $lr((U without {z})) inter X eq.not emptyset$
] <def:accumulationpoint>

#definition("Closure")[
  For a set $X in CC^n$, define the _closure_ of $X$, or $overline(X)$ to be the intersection of all closed sets containing $X$. In other words, it is the union of $X$ and its accumulation points.
] <def:closure>

#definition("Interior")[
  For a set $X in CC^n$, the _interior_ of $X$, denoted $interior(X)$, is the union of all open sets contained in $X$, or the set of points $z in CC^n$ such that there exists an open neighborhood of $z$ that is fully contained in $X$.
] <def:interior>

#definition("Compact Set")[
  A set $X in CC^n$ is compact iff $X$ is closed and bounded.
] <def:compactsets>

#definition("Set Covering")[
  A cover $cal(C)$ of a set $X$ is a collection of sets ${U_n}$ such that
  $ union.big_(n in NN) U_n subset.eq X. $
  A cover is _open_ if every set in the collection is open.
]

#theorem("Bolzano–Weierstrass")[
  Every infinite subset $A$ of a compact set $X subset CC^n$ has an accumulation point in $X$.
] <thm:bolzanoweierstrass>

#proof[
  Since $X$ is bounded, there exists a closed cube $Q subset CC^n$ such that $A subset.eq X subset Q$.

  Bisect $Q_0 = Q$ into $2^(2n)$ congruent sub-cubes. Since $A$ is infinite and the sub-cubes are finite in number, at least one of the sub-cubes contains infinitely many points of $A$, and choose one to be $Q_1$.

  Bisect $Q_1$ into $2^(2n)$ sub-cubes, and choose a sub-cube $Q_2 subset Q_1$ that contains infinitely many points of $A$. We then obtain the recursive sequence
  $ Q_0 supset Q_1 supset Q_2 supset dots.c $

  Because the side lengths shrink to zero and the cubes are nested, the intersection
  $ inter.big_(k=0)^(infinity) Q_k $
  consists of exactly one point. Call this point $z_infinity in CC^n$.

  For each $k$, $Q_k$ contains infinitely many points of $A$. Because the side length of $Q_k$ tends to zero, for any $epsilon > 0$, $exists N in NN$ such that $forall k >= N$, $Q_k subset B^n (z_infinity, epsilon)$ where $B^n (a, r) subset CC^n$ is the $n$-dimensional _ball_ with radius $r$ centered at $a = (a_1, a_2, dots, a_n) in CC^n$, or
  $ B^n (a, r) = {(z_1, z_2, dots, z_n) in CC^n | sum_(j=1)^n abs(z_j - a_j)^2 < r^2}. $
  Then, $B^n (z_infinity, epsilon)$ also contains infinitely many points of $A$. Therefore, $z_infinity$ is an accumulation point of $A$.

  We now show that $z_infinity in X$. Suppose for contradiction that $z_infinity in.not X$. Since $X$ is closed, $CC^n without X$ is open, and $exists delta > 0$ such that
  $ B^n (z_infinity, delta) subset CC^n without X. $
  But then, for sufficiently large $k$, we have $Q_k subset B^n (z_infinity, delta)$, and hence $Q_k inter X = emptyset$. This contradicts the construction of $Q_k$, which ensures that $Q_k$ contains infinitely many points of $A subset X$.
]

#theorem("Heine–Borel")[
  A set $X in CC^n$ is compact iff every open cover has a finite subcover.
] <thm:heineborel>

#proof[
  We will first show that any set satisfying the condition is compact.

  First we will show that $X$ is bounded. Suppose that $forall R > 0$, $exists z in X$ where $norm(z) > R$. Consider the collection of open sets
  $ cal(U) = {B^n (0, k) | k in NN}. $
  $cal(U)$ forms an open cover of $X$. Then by the assumption, there exists a finite subcover in $cal(U)$, namely ${B^n (0, k_1), dots, B^n (0, k_m)}$ which covers $X$. Then,
  $ X subset.eq union.big_(i=1)^m B^n (0, k_i) = B^n (0, max{k_1, dots, k_m}). $
  By contradiction, $X$ must be bounded.

  $X$ must also be a closed set. For the sake of contradiction, assume that there exists a point $z_0 in overline(X) without X$. Since $z_0 in.not X$, the following open collection of sets covers $X$:
  $ cal(U) = {CC^n without overline(B^n (z_0, 1/k)) | forall k in NN}. $
  There then exists a finite subcover $cal(C) = {CC^n without overline(B^n (z_0, 1/k_j)) | j in NN_(<=m)}$. Then,
  $ X subset.eq CC^n without overline(B^n (z_0, 1 / max{k_1, dots, k_m})), $
  and that $X inter overline(B^n (z_0, 1 / max{k_1, dots, k_m})) = emptyset$. However, by the definition of the accumulation point, every open neighborhood of the accumulation point must intersect $X$. Therefore, by contradiction, $X$ is closed.

  We then prove the converse. By the assumption that $X$ is bounded, $exists R > 0$ such that $X$ is contained within the closed cube
  $ Q = {z in CC^n | max_(j in NN_(<=n)) abs(Re(z_j)) <= R and max_(j in NN_(<=n)) abs(Im(z_j)) <= R}. $

  Assume that there exists an infinite open cover $cal(U)$ of $X$ without finite subcovering. Bisect $Q_0 = Q$ into $2^(2n)$ sub-cubes (for real and complex parts). Choose $Q_1$ such that $Q_1 union X$ has no finite subcover of $cal(U)$. Under the previous assumptions, this is possible since if every $"sub-cube" inter X$ had finite subcovering, then $Q_0 inter X = X$ would have finite subcovering. Similarly, choose $Q_2$ by bisecting $Q_1$ similarly, and recursively obtain a sequence of cubes:
  $ Q_0 supset Q_1 supset Q_2 supset dots.c $
  Since the side length of each cube tends to 0, $inter.big_(j=0)^infinity Q_j$ consists of a single point $z_infinity in CC^n$. By the Bolzano–Weierstrass Theorem (@thm:bolzanoweierstrass), because $forall j in NN$, $Q_j inter X eq.not emptyset$, select a point $z_j in Q_j inter X$, forming a sequence ${z_k} in X$ convergent to $z_infinity in X$ as $X$ is closed. Therefore, $exists U in cal(U)$ where $z_infinity in U$. Since $U$ is open, $exists epsilon > 0$ such that $B^n (z_infinity, epsilon) subset.eq U$. $exists N in NN$ such that $forall k > N$, $Q_k subset B^n (z_infinity, epsilon)$. Then taking the intersection with $X$ on both sides,
  $ Q_k inter X subset.eq B^n (z_infinity, epsilon) inter X subset.eq U. $
  This contradicts the assumption that for every $k$, $Q_k inter X$ has no finite subcovering, since $U$ clearly covers $Q_k inter X$, which is a single open set that covers a nonempty subset. Therefore by contradiction, every open cover has finite subcovering.
]

#definition("Support of a Function")[
  For a set $X$ and a function $f : X -> CC$, the _support_, denoted by $supp (f) = overline(lr({z in X | f(z) eq.not 0}))$, is the closure of the set for which $f$ is nonzero.
] <def:support>

#remark[
  A notable classification of functions comes from the compactness of support---more specifically, its boundedness. Compactly supported functions in $C^infinity$ are commonly referred to as _bump functions_ (see \@sec:partitionsofunity).
]
