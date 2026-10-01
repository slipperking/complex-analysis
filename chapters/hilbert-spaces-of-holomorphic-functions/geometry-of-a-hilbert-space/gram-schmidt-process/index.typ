#import "/lib.typ": *
#show: docs-subsubchapter.with(
  title: [The Gram--Schmidt Process],
  route: "gram-schmidt-process",
  label: <sec:gram-schmidt-process>,
)

The Gram--Schmidt process replaces a finite linearly independent set with an orthonormal set having the same span. This makes it possible to choose coordinates that respect the geometry induced by an inner product.

#definition[Basis and Dimension][
  Let $V$ be a vector space. A _basis_ of $V$ is a linearly independent set that spans $V$.
  The vector space $V$ is _finite-dimensional_ iff it is spanned by a finite set. If a basis of $V$ contains $n$ vectors, then $V$ is said to be $n$-dimensional and we write $dim V = n$.
] <def:vector-space-basis>
We can verify that the dimensionality is unique to a vector space and independent of basis:
#proposition[
  Every finite-dimensional vector space has a finite basis. Moreover, any two bases of a finite-dimensional vector space contain the same number of vectors, and so $dim V$ is well-defined.
] <prop:finite-dimensional-vector-space-basis-existence>
#proof[
  Let $S = {v_k}_(k = 1)^m$ span $V$. If $S$ is linearly independent, then it is already a basis. Otherwise, one of its vectors is a linear combination of the others; removing that vector does not change the span. If the remaining set is still linearly dependent, repeat the same step. Since $S$ is finite, the process will end with a linearly independent set that still spans $V$, a basis.

  Now let $S_m = {v_j}_(j=1)^m$ and $S_n = {w_k}_(k=1)^n$ be two bases such that $m <= n$. Let $v_1 = sum_(k = 1)^n c_k w_k$. Then at least one of these terms is nonzero, namely $c_k_1 w_k_1$. Moreover, since
  $
    w_k_1 = 1 / c_k_1 (v_1 - sum_(k != k_1) c_k w_k),
  $ <eq:finite-dimensional-vector-space-basis-existence-substitution>
  we obtain a new basis ${w_k}_(k = 1 \ k != k_1)^n union {v_1}$. It is a basis because any vector in $V$ can be written as a linear combination of these vectors by @eq:finite-dimensional-vector-space-basis-existence-substitution; and linear independence is satisfied, because if $d_1 v_1 + sum_(k != k_1) d_k w_k = 0$, then a substitution for $v_1$ forces all coefficients to $0$.

  Now inductively assume that for a $j in NN_(< m)$, the set ${w_k}_(k in NN_(<= n) without {k_i}_(i <= j)) union {v_k}_(k = 1)^j$ is a basis for $V$. Let $v_(j + 1) = sum_(k = 1)^j c_k v_k + sum_(k in.not {k_i}_(i = 1)^j) c_k w_k$. Then at least one of these terms, excluding all the multiples of ${v_k}$, is nonzero, namely $c_k_(j + 1) w_k_(j + 1)$ (as otherwise, $v_(j + 1)$ is a linear combination of ${v_k}$, contradicting independence of $S_m$).

  Therefore, replacing $w_k_(j + 1)$ with $v_(j + 1)$ in ${w_k}_(k in NN_(<= n) without {k_i}_(i <= j)) union {v_k}_(k = 1)^j$, giving ${w_k}_(k in NN_(<= n) without {k_i}_(i <= j + 1)) union {v_k}_(k = 1)^(j + 1)$, is a basis (by the exact same argument as in the base case).

  By mathematical induction, we can then transform $S_n$ into a basis of $n$ elements, including all elements of $S_m$. Continue to denote the transformed basis by $S_n$. Then any nonzero vector $v$ in $S_n without S_m$ can be written as a linear combination of elements in $S_m$, which violates the linear independence of vectors in $S_n$, thus no vector exists in $S_n without S_m$, and $n = m$. The case $n <= m$ follows symmetrically.
]

#remark[
  More generally, every vector space has a basis, including infinite-dimensional vector spaces. The general statement for more general vector spaces is equivalent to the Axiom of Choice and equivalent to Zorn's lemma. Only the elementary finite-dimensional result above is needed for our purposes here.
]

#definition[
  Let $V$ be an inner product space. A finite set ${e_k}_(k=1)^n subset.eq V$ is _orthogonal_ iff
  $ chev(e_j, e_k) = 0 quad "whenever" quad j != k. $
  It is _orthonormal_ iff
  $ chev(e_j, e_k) = delta_(j k) = cases(1 & quad"if"quad j = k, 0 & quad"if"quad j != k). $
  Equivalently, an orthonormal set is an orthogonal set in which $norm(e_k) = 1$ for every $k$.
] <def:finite-orthonormal-set>

#definition[Orthonormal Basis][
  An _orthonormal basis_ of a finite-dimensional inner product space $V$ is a basis of $V$ that is also an orthonormal set.
] <def:orthonormal-basis>

If ${e_k}_(k=1)^n$ is an orthonormal basis of $V$, then every $v in V$ has the coordinate representation
$
  v = sum_(k=1)^n chev(v, e_k) e_k.
$ <eq:orthonormal-basis-coordinate-representation>
Indeed, writing $v = sum_(k=1)^n a_k e_k$ and taking the inner product with $e_j$ gives
$ chev(v, e_j) = sum_(k=1)^n a_k chev(e_k, e_j) = a_j. $

#theorem[Gram--Schmidt Orthonormalization][
  Let ${v_k}_(k=1)^n$ be a linearly independent set in an inner product space $V$. Define recursively
  $
    u_1 & = v_1,                                           & e_1 & = u_1 / norm(u_1), \
    u_k & = v_k - sum_(j=1)^(k-1) chev(v_k, e_j) e_j, quad & e_k & = u_k / norm(u_k). #tag[$(2 <= k <= n)$]
  $
  Then every $u_k$ is nonzero, ${e_k}_(k=1)^n$ is orthonormal, and
  $ span{e_j}_(j = 1)^k = span{v_j}_(j = 1)^k wide forall 1 <= k <= n. $
] <thm:gram-schmidt-process>

#proof[
  We proceed by induction on $k$. Since $v_1 != 0$, $u_1 != 0$, $norm(e_1) = 1$, and $span{e_1} = span{v_1}$.

  Suppose that ${e_j}_(j=1)^(k-1)$ is orthonormal and that
  $ span{e_1, dots, e_(k-1)} = span{v_1, dots, v_(k-1)}. $
  If $u_k = 0$, then
  $ v_k = sum_(j=1)^(k-1) chev(v_k, e_j) e_j in span{v_1, dots, v_(k-1)}, $
  contradicting the linear independence of ${v_j}_(j=1)^k$. Hence $u_k != 0$, so $e_k$ is well-defined and $norm(e_k) = 1$.

  For every $ell < k$, orthonormality gives
  $
    chev(u_k, e_ell) & = chev(v_k, e_ell) - sum_(j=1)^(k-1) chev(v_k, e_j) chev(e_j, e_ell) \
                     & = chev(v_k, e_ell) - chev(v_k, e_ell) = 0.
  $
  Therefore $e_k$ is orthogonal to $e_1, dots, e_(k-1)$, and the enlarged set ${e_j}_(j=1)^k$ is orthonormal. Finally, $u_k$ is obtained from $v_k$ by subtracting an element of $span{e_1, dots, e_(k-1)}$, while
  $ v_k = u_k + sum_(j=1)^(k-1) chev(v_k, e_j) e_j. $
  Thus adjoining either $u_k$ or $v_k$ to the preceding span gives the same space, and
  $ span{e_j}_(j = 1)^k = span{v_j}_(j = 1)^k $
  by induction.
]

The recursive construction in @thm:gram-schmidt-process is called the _Gram--Schmidt process_. At each stage, the sum
$ sum_(j=1)^(k-1) chev(v_k, e_j)e_j $
is the component of $v_k$ in all the previously constructed directions; and subtracting it leaves the nonzero vector $u_k$ orthogonal to all preceding directions.
#corollary[
  Every finite-dimensional inner product space has an orthonormal basis.
] <cor:finite-dimensional-inner-product-space-has-orthonormal-basis>
#proof[
  Choose any basis ${v_k}_(k=1)^n$ and apply @thm:gram-schmidt-process. The resulting orthonormal set has the same span as the original basis.
]
(Note that when we begin considering countably infinite orthonormal systems in the proceeding section, the same process of Gram--Schmidt is still valid, the reader can independently verify this claim.)
