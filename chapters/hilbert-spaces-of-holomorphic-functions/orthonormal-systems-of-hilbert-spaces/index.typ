#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Orthonormal Systems of a Hilbert Space],
  route: "orthonormal-systems-of-a-hilbert-space",
)
We first aim to provide a generalization of bases which will serve useful in generalizing vector spaces to infinite dimensions.
#definition[Orthonormal System][
  Let $H$ be a Hilbert space. Let $I$ be any set. A set ${e_i}_(i in I) subset.eq H$ is an _orthonormal system_ iff $forall i, j in I$,
  $ chev(e_i, e_j) = delta_(i j) = cases(1 quad & "if" quad i = j, 0 quad & "if" quad i != j). $
  Generally one is concerned only with the cases where $I$ is finite or when $I$ is countably infinite ($I = NN$), although here we will consider the generalization to uncountable sets as it follows in the same way.
]
#definition[Completeness of an Orthonormal System][
  An orthonormal system in a Hilbert space is _complete_ iff there exists no nonzero vector orthogonal to all vectors in the system.
]
The definition of completeness is intuitive: it means that there is no other nonzero vector that can be appended to the system while maintaining the orthogonality condition.

The orthonormal then generalizes the concept of a "basis" for finite-dimensional vector spaces. This will be made explicit in @cor:hilbert-space-complete-orthonormal-system-dense-in-space.
#theorem[
  Let ${e_k}_(k=1)^n$ be a finite orthonormal system in a Hilbert space $H$. Let $U$ be the span of the system. The distance between a vector $x in H$ and $U$, $inf_(v in U) norm(x - v)$, is given by
  $ norm(x - u) = sqrt(norm(x)^2 - sum_(k=1)^n abs(chev(x, e_k))^2) $
  where $u in U$ is the unique value that attains this minimal distance.
] <thm:norm-of-orthogonal-component-in-terms-of-vector-norm-and-product>
#proof[
  Let
  $
    u = sum_(k = 1)^n chev(x, e_k) e_k in U.
  $
  We aim to show this choice of $u$ is optimized. Firstly, we show $x - u$ is orthogonal to $U$. For any $j in NN_(<= n)$,
  $
    chev(x - u, e_j) & = chev(x, e_j) - chev(sum_(k = 1)^n chev(x, e_k) e_k, e_j) \
                     & = chev(x, e_j) - sum_(k = 1)^n chev(x, e_k) chev(e_k, e_j) \
                     & = chev(x, e_j) - sum_(k = 1)^n chev(x, e_k) delta_(k j) = 0.
  $
  Moreover, for any $v in U$, by @thm:orthogonal-decomposition, since $x - v - (x - u) in U$, the orthogonal decomposition of $x - v = a + b$ (where $a in U, b in U^perp$) is uniquely determined by $a = u - v$, $b = x - u$.

  By @thm:orthogonality-pythagorean,
  $
    norm(x - v)^2 = norm(u - v)^2 + norm(x - u)^2 >= norm(x - u)^2,
  $
  proving the minimality of $u$. Moreover, the point $u$ is unique as equality is attained iff $norm(u - v) = 0 ==> u = v$.

  Then
  $
    norm(x - u) & = sqrt(norm(x)^2 + norm(u)^2 - 2 Re chev(x, u)) \
                & = sqrt(
                    norm(x)^2 + sum_((j, k) in NN_(<= n)^2) chev(chev(x, e_j) e_j, chev(x, e_k) e_k) \
                    - 2 sum_(k = 1)^n Re chev(x, chev(x, e_k) e_k)
                  ) \
                & = sqrt(
                    norm(x)^2 + sum_((j, k) in NN_(<= n)^2) chev(x, e_j)overline(chev(x, e_k)) delta_(j k) - 2 sum_(k = 1)^n abs(chev(x, e_k))^2
                  ) \
                & = sqrt(norm(x)^2 - sum_(k=1)^n abs(chev(x, e_k))^2). qedhere
  $
]
Therefore, one then derives
#corollary[Bessel's Inequality][
  Let $H$ be a Hilbert space and let ${e_i}_(i in I)$ be an orthonormal system. Then for $x in H$,
  $ sum_(i in I) abs(chev(x, e_i))^2 <= norm(x)^2, $
  where the left-hand side converges _unconditionally_: $exists S <= norm(x)^2$ such that for any $epsilon > 0$, $exists I' subset.eq I$ countable such that for all $(I supset.eq )I'' supset.eq I'$ countable,
  $ abs(sum_(i in I'') abs(chev(x, e_i))^2 - S) < epsilon. $
  Moreover, $x$ is orthogonal to all but countably many vectors in ${e_i}$.
] <cor:bessels-inequality>
#proof[
  For each $m in NN$, let
  $
    A_m = {e in {e_i}_i : abs(chev(x, e))^2 > 1 / m}.
  $
  Then $A_m$ is a finite set, as otherwise
  $ sum_(e in A_m) abs(chev(x, e))^2 = oo, $
  contradicting @thm:norm-of-orthogonal-component-in-terms-of-vector-norm-and-product.
  Let $A = union.big_(m in NN) A_m$, which is a countable set. Moreover, for any ${e_i} in.rev e in.not A$, $abs(chev(x, e))^2 <= inf_(m in NN) 1 / m = 0$.

  Therefore only a countable number of vectors in ${e_i}_(i in I)$ are not orthogonal to $x$. Let $A$ be indexed by a sequence ${v_n}_(n in NN) = {e_i_n}_(n in NN)$. By @thm:norm-of-orthogonal-component-in-terms-of-vector-norm-and-product,
  $ sum_(n = 1)^oo abs(chev(x, v_n))^2 $
  has all partial sums bounded by $norm(x)^2$; therefore the series converges to a limit $S <= norm(x)^2$ by the Monotone Convergence Theorem.

  Since $sum_(n = 1)^oo abs(chev(x, v_n))^2 = S$, for any $epsilon > 0$, $exists N in NN$ such that for all $k >= N$, $abs(sum_(n = 1)^k abs(chev(x, v_n))^2 - S) < epsilon$. Then let $I' = {i_n}_(n=1)^N$. Then for any $I'' supset.eq I'$ countable,
  $ sum_(i in I') abs(chev(x, e_i))^2 <= sum_(i in I'') abs(chev(x, e_i))^2 <= S, $
  which implies
  $ epsilon > abs(S - sum_(i in I')^k abs(chev(x, e_i))^2) >= abs(S - sum_(i in I'') abs(chev(x, e_i))^2) >= 0 $
  and the assertion follows.
]
Then we may provide the following generalization of the Parseval's Theorem from Fourier analysis:
#theorem[Riesz--Fischer][
  Let $H$ be a Hilbert space and let ${e_i}_(i in I)$ be a complete orthonormal system. Then:
  1. For any $x in H$, #enum-lbl(<itm:riesz-fischer-parseval>)
    $ norm(x)^2 = sum_(i in I) abs(chev(x, e_i))^2, $
    and $ x = sum_(i in I) chev(x, e_i) e_i. $
  + Conversely, for any complex collection ${beta_i}_(i in I)$ such that $ sum_(i in I) abs(beta_i)^2 < oo, $
    then $exists! x in H$ such that $forall i in I$, $chev(x, e_i) = beta_i$. Then #enum-lbl(<itm:riesz-fischer-converse>)
    $ norm(x)^2 = sum_(i in I) abs(beta_i)^2, quad x = sum_(i in I) beta_i e_i $
] <thm:riesz-fischer>
It is actually simpler to first prove @itm:riesz-fischer-converse.
#proof[of @itm:riesz-fischer-converse of @thm:riesz-fischer][
  #claim[
    At most a countable number of ${beta_i}_(i in I)$ are nonzero.
  ]
  #proof[of the claim][
    This is essentially the same argument as used before with @cor:bessels-inequality. For each $m in NN$, let
    $ A_m = {beta in {beta_i}_(i in I) : abs(beta_i) > 1 / m}. $
    Then $A_m$ is finite; otherwise $sum_(i in I) abs(beta_i)^2 lt.not oo$. Moreover the union of all $A_m$ for $m in NN$ is a countable set and contains all nonzero $beta_dot$'s.
  ]
  If $union.big_(m in NN) A_m$ is finite ${beta_i_j}_j$, then letting
  $ x = sum_j beta_i_j e_i_j, $
  we see that $chev(x, e_i_j) = beta_i_j$ and for all other $beta_i$'s, $beta_i = 0$, which proves $chev(x, e_i) = beta_i$ from orthogonality. Then in this case, the assertion $norm(x)^2 = sum_(i in I) abs(beta_i)^2$ follows from @thm:orthogonality-pythagorean.

  If $union.big_m A_m$ is countable and indexed by ${beta_i_j}_(j in NN)$, then for any $K in NN$, let
  $ x_K = sum_(j = 1)^K beta_i_j e_i_j. $
  Then for $N >= M$,
  $
    norm(x_N - x_M)^2 = norm(sum_(M + 1)^N beta_i_j e_i_j)^2 = sum_(M + 1)^N abs(beta_i_j)^2 -> 0. #tag[(by @thm:orthogonality-pythagorean)]
  $
  Then ${x_K}_K$ is a Cauchy sequence and hence converges to some $x in H$:
  $ x = sum_(j = 1)^oo beta_i_j e_i_j. $
  Since $abs(norm(x) - norm(x_N)) <= norm(x - x_N) -> 0$, $norm(x_N)^2 -> norm(x)^2$. Moreover, by @thm:orthogonality-pythagorean,
  $ norm(x_N)^2 = sum_(j = 1)^N abs(beta_i_j)^2 ==> norm(x)^2 = sum_(j = 1)^oo abs(beta_i_j)^2 $
  by letting $N -> oo$.

  If there exists some other $tilde(x)$ satisfying $chev(tilde(x), e_i) = beta_i$, then $chev(x - tilde(x), e_i) = 0$ for each $i in I$. By the completeness of ${e_i}_(i in I)$, the only vector orthogonal to all vectors in the system is the zero vector, therefore $x - tilde(x) = 0 ==> x = tilde(x)$.
]
#proof[of @itm:riesz-fischer-parseval of @thm:riesz-fischer][
  By Bessel's Inequality, we have
  $ sum_(i in I) abs(chev(x, e_i))^2 <= norm(x)^2. $
  By @itm:riesz-fischer-converse applied to $beta_i = chev(x, e_i)$, $exists! tilde(x)$ such that $forall i in I$,
  $ chev(tilde(x), e_i) = chev(x, e_i), $ <eq:riesz-fischer-parseval-product-equivalences>
  given by $tilde(x) = sum_(i = I) chev(x, e_i) e_i$. Then for this $tilde(x)$,
  $ norm(tilde(x))^2 = sum_(i in I) abs(chev(x, e_i))^2. $ <eq:riesz-fischer-parseval-tilde-x>
  @eq:riesz-fischer-parseval-product-equivalences gives that for each $i in I$, $chev(x - tilde(x), e_i) = 0$. Then $x - tilde(x)$ is orthogonal to all vectors in a complete orthonormal system, and is therefore zero by definition. Thus $x = tilde(x)$, and by @eq:riesz-fischer-parseval-tilde-x, we have
  $ norm(x)^2 = sum_(i in I) abs(chev(x, e_i))^2. qedhere $
]
#corollary[
  Let $H$ be a Hilbert space such that there exists a complete orthonormal system ${e_i}_(i in I)$. Then $span{e_i}_(i in I)$ is dense in $H$, or in other words:
  $ overline(span{e_i}_i) = H. $
] <cor:hilbert-space-complete-orthonormal-system-dense-in-space>
#proof[
  By Riesz--Fischer (@thm:riesz-fischer), any $x in H$,
  $ x = sum_i chev(x, e_i) e_i, $
  implying that for any $forall epsilon > 0$, $exists I' subset.eq I$ countable such that $forall I'' supset.eq I'$ countable,
  $ norm(sum_(i in I'') chev(x, e_i) e_i - x) < epsilon / 2. $
  Moreover, $exists I''' subset.eq I'$ finite such that
  $ norm(sum_(i in I''') chev(x, e_i) e_i - sum_(i in I'') chev(x, e_i) e_i) < epsilon / 2, $
  implying that
  $ norm(sum_(i in I''') chev(x, e_i) e_i - x) < epsilon. $
  Therefore, there exists a (finite) linear combination of orthonormal vectors in ${e_i}$ lying in any open ball centered at $x$ (by the arbitrariness of $epsilon$).
]
#remark[
  The necessity of using closure or density comes from the observation that $span$ appertains only to finite linear combinations, whereas in most cases we need a complete description of "countably infinite linear combinations."
]
#example[
  Let $ell^2 = {{alpha_j}_(j in NN) L : sum_(j = 1)^oo abs(alpha_j)^2 < oo}$ denote the set of all square-summable complex sequences. Then for $alpha = {alpha_j}_j$, $beta = {beta_j}_j$, define
  $ chev(alpha, beta) = sum_(j = 1)^oo alpha_j overline(beta_j). $
  Then $ell^2$ is a vector space and a Hilbert space with the inner product $chev(alpha, beta)_(ell^2) = sum_(j=1)^oo alpha_j overline(beta_j)$ and associated norm $norm(dot)_(ell^2)$.
] <ex:l2-space-is-hilbert>
We will not immediately state a full proof. In proving completeness, one could obviously write out the Cauchy sequences and prove that they converge. However, there is indeed an elegant method that uses the Riesz--Fischer Theorem (@thm:riesz-fischer), under the assumption that there exists any Hilbert space $H$ with an infinite countable complete orthonormal system, which we will first assume and justify later (in fact, there are many such spaces, such as the Bergman space $A^2 (DD)$ and the Hardy space $H^2$).
#proof[of @ex:l2-space-is-hilbert (with assumptions)][
  The space $ell^2$ is trivially closed under scalar multiplication. To show additivity, or that
  $ {alpha_j}_j + {beta_j}_j = {alpha_j + beta_j}_j in ell^2 $
  holds, notice that
  $
    sum_(j = 1)^oo abs(alpha_j + beta_j)^2 <= 2 sum_(j = 1)^oo [abs(alpha_j)^2 + abs(beta_j)^2] #tag[(by @thm:parallelogram-law)]
  $
  Observe that the product is well defined by the Cauchy--Schwarz Inequality:
  $
    limsup_(N -> oo) abs(sum_(j=1)^N alpha_j overline(beta_j)) &<= limsup_(N -> oo) sum_(j=1)^N abs(alpha_j overline(beta_j)) \
    &<= limsup_(N -> oo) sqrt(sum_(j=1)^N abs(alpha_j)^2) sqrt(sum_(j = 1)^N abs(beta_j)^2) = norm(alpha) norm(beta),
  $
  and convergence follows from the Monotone Convergence Theorem. The verification of the other properties is rather simple. Observe that the associated norm is
  $ norm(alpha)_(ell^2) = sqrt(sum_(j = 1)^oo abs(alpha_j)^2). $
  Let (using the assumption) $H$ be a Hilbert space (with $chev(dot, dot)_H$, $norm(dot)_H$) with an infinite countable complete orthonormal system ${e_j}_(j in NN)$. For any $alpha = {alpha_j}_(j in NN) in ell^2$, by the Riesz--Fischer Theorem (@thm:riesz-fischer), there is a single $x in H$ such that
  $ x = sum_j alpha_j e_j, quad "and" quad chev(x, e_j)_H = alpha_j quad forall j in NN. $
  Then the map
  $ phi : ell^2 -> H quad "given by" quad phi: alpha |-> sum_j alpha_j e_j $
  is a bijection: the inverse is given by
  $ phi^(-1): x |-> {chev(x, e_j)_H}_(j in NN). $
  The vector structure of $H$ is preserved under $phi$. Moreover, $phi$ is trivially additive and homogeneous, thus linear.

  Therefore, it remains to show that the space $ell^2$ is complete under the associated norm. Observe that $phi$ preserves norms, since
  $ norm(x)^2 = sum_(j = 1)^oo abs(chev(x, e_j)_H)^2 = norm({chev(x, e_j)_H}_(j in NN))^2 $
  by Riesz--Fischer (@thm:riesz-fischer).

  Therefore, since any Cauchy sequence ${alpha_n}_n$ in $ell^2$ gives a Cauchy sequence ${phi(alpha_n)}_n subset.eq H$ with a single accumulation point $x in H$; from $norm(phi(alpha_n) - x)_H < epsilon$ ($n > N$ for some $N$), we obtain $norm(phi^(-1)(phi(alpha_n) - x)) = norm(alpha_n - phi^(-1)(x)) < epsilon$. Therefore, ${alpha_n}_n$ converges to $phi^(-1)(x)$, and thus $ell^2$ is complete.
]
#[
  #let berg = $A^2 (DD)$
  #example[
    Let $berg$ be the Bergman space on $DD$. With
    $ chev(f, g) = integral.double_DD f(z) overline(g(z)) dx dy, $
    $berg$ is a Hilbert space by @ex:hilbert-space-bergman-space. Then show that
    ${z |-> sqrt(j + 1) / sqrt(uppi) z^j}_(j in 0)^oo$ is a countable complete orthonormal system for $berg$.
  ] <ex:bergman-space-orthonormal-system>
  #solution[to @ex:bergman-space-orthonormal-system][
    For any $j$, $z mapsto z^j in berg$, so
    $
      oo > norm(z mapsto z^j) & = sqrt(integral.double_DD abs(z)^(2 j) dx dy) = sqrt(integral_0^1 integral_(-uppi)^uppi r^(2 j) r dtheta dr) \
      & = sqrt(2 uppi evaluated(r^(2 j + 2) / (2 j + 2))_0^1) = sqrt(uppi / (j + 1)).
    $
    Moreover, for $j != k$,
    $
      chev(z mapsto z^j, z mapsto z^k) &= integral.double_DD z^j overline(z)^k dx dy = integral_0^1 integral_(-uppi)^uppi r^j ee^(ii j theta) r^k ee^(-ii k theta) r dtheta dr \
      & = integral_0^1 r^(j + k + 1) dr integral_(-uppi)^uppi ee^(ii theta (j - k)) dtheta = 0.
    $
    Therefore, the set ${z |-> sqrt(j + 1) / sqrt(uppi) z^j}_(j in 0)^oo$ satisfies the orthogonality condition, and $ chev(z |-> sqrt(j + 1) / sqrt(uppi) z^j, z |-> sqrt(j + 1) / sqrt(uppi) z^j) = 1 quad forall j in ZZ_(>= 0). $
    Therefore it is an orthonormal system. Moreover, completeness follows naturally, because if there exists $f in A^2 (DD)$ such that $f perp z |-> sqrt(j + 1) / sqrt(uppi) z^j$ for each $j$, then writing $f(z) = sum_(n = 0)^oo a_n z^n$, we get
    $
      chev(f, z |-> sqrt(j + 1) / sqrt(uppi) z^j) &= 0 = integral.double_DD (sum_(n = 0)^oo a_n z^n) overline((sqrt(j + 1) / sqrt(uppi) z^j)) dx dy \
      & = sqrt(j + 1) / sqrt(uppi) integral_0^1 integral_(-uppi)^uppi sum_(n = 0)^oo a_n r^(n + j + 1) ee^(ii (n - j) theta) dtheta dr \
      & wide #[(uniform convergence in $theta$)] \
      & = sqrt(j + 1) / sqrt(uppi) integral_0^1 sum_(n = 0)^oo integral_(-uppi)^uppi a_n r^(n + j + 1) ee^(ii (n - j) theta) dtheta dr \
      &= sqrt(j + 1) / sqrt(uppi) integral_0^1 sum_(n = 0)^oo a_n r^(n + j + 1) cases(evaluated(ee^(ii (n - j) theta) / (ii (n - j)))_(-uppi)^uppi & "if" n != j, 2 uppi & "if" n = j) dr \
      &= 2 sqrt(uppi(j + 1)) integral_0^1 a_j r^(2j + 1) dr = a_j sqrt(uppi / (j + 1)),
    $
    meaning that for each $j in ZZ_(>= 0)$, $a_j = 0$; then the only function orthogonal to every function in the system is the zero function.
  ]
]
(Then one could use this space in @ex:l2-space-is-hilbert.)
#definition[Separability][
  A metric space $(X, d)$ is said to be _separable_ iff it has a countable dense subset.
]
#proposition[
  A Hilbert space $H$ is separable iff it has a complete countable orthonormal system.
] <prop:hilbert-space-separable-equiv-having-complete-countable-orthonormal-system>
#proof[
  1. (Forward implication)

    Let $S subset.eq H$ be a countable dense subset. Then describing $S$ with a sequence ${s_j}$, we may then construct another sequence ${u_j}_j$ recursively:

    - Let $u_1$ be the first nonzero element $s_k_1$ in ${s_j}$.
    - Assuming a linearly independent set ${u_j}_(j<k)$, choose $u_k$ to be the first nonzero element in ${s_j}$ not in $span{u_j}_(j<k)$.
    - If such a $u_k$ ever does not exist, then end the process thereat. In this case $span{u_j}_(j < k)$ already densely spans $H$, is complete by @prop:completeness-of-finite-dim-vector-space, and consequently hence spans $H$.

    Then ${u_j}_j$ densely spans $H$. Applying the Gram--Schmidt process then gives an orthonormal system which also densely spans $H$, namely ${e_j}_j$.

    Suppose, for contradiction, that there exists a nonzero $x in H$ such
    that $x perp e_j$ for every $j$. Then $x perp span{e_j}_j$.

    Since $span{e_j}_j$ is dense in $H$, there exists a sequence
    ${y_n} subset.eq span{e_j}_j$ such that $y_n -> x$. By continuity of
    the inner product (@thm:inner-product-continuity),
    $
      norm(x)^2 = chev(x, x) = lim_(n -> oo) chev(x, y_n) = 0,
    $
    because $chev(x, y_n) = 0$ for every $n$. Hence $x = 0$, contradicting
    our choice of $x$. Therefore ${e_j}_j$ is complete.
  + (Converse)

    Letting ${e_j}_(j in NN_(< K))$ ($K in NN union {oo}$) be the complete orthonormal system, the subset
    $ {sum_(j = 1)^k alpha_j e_j : j in NN_(<= k), alpha_j in QQ, k in NN_(< K)}, $
    whose cardinality does not exceed that of $NN^2 times QQ$, is a countable set.

    Moreover, we can show that it is dense in $H$: $forall x in H$, we know from the proof Riesz--Fischer (@thm:riesz-fischer) that it can be written as
    $ x = sum_(j in NN_(< K)) beta_j e_j, wide (beta_j = chev(x, e_j)), $
    which may be approximated with an error under $epsilon / 2$ by
    $sum_(j = 1)^k beta_j e_j$. By the density of rationals, each $beta_j$ may be approximated by some $alpha_j$, such that $Re alpha_j, Im alpha_j in QQ$, such that $abs(alpha_j - beta_j) < epsilon / (2 k).$ Then
    $
      norm(x - sum_(j=1)^k alpha_j e_j) <= norm(x - sum_(j=1)^k beta_j e_j) + norm(sum_(j=1)^k (beta_j - alpha_j) e_j) < epsilon.
    $
    Since $sum_(j=1)^k alpha_j e_j$ lies in the relevant subset, the density follows from the arbitrariness of $epsilon$. #qedhere
]
We then conclude with the following technical result. /* The proof does use Zorn's lemma to obtain a maximal orthonormal set, so its format requires standard axiomatic set-theoretic concepts. However, due to countability, we do not require the Axiom of Choice; a fully constructive proof can be given using only countable methods. */
#theorem[
  Let $H$ be a separable Hilbert space and let $K subset.eq H$ be a Hilbert subspace. Then $K$ is separable.
] <thm:hilbert-subspace-of-space-with-countable-complete-orthonormal-system>
#proof[
  By @prop:hilbert-space-separable-equiv-having-complete-countable-orthonormal-system, $H$ has a complete countable orthonormal basis ${e_j}_j$. Projecting each $e_j$ onto $K$ by using the orthogonal decomposition (@thm:orthogonal-decomposition) gives a set ${u_j}$ in $K$.

  In fact, the span of ${u_j}$ is dense in $K$: for any $epsilon > 0, x in K$, there exists $y in span{e_j}_j$ such that $norm(y - x) < epsilon$. Projecting $y - x$ onto $K$ gives a vector $v$ satisfying $norm(v) <= norm(y - x)$ (by @thm:orthogonality-pythagorean, the Pythagorean theorem); and moreover, $v = y_p - x$ (where $y_p$ is the projection of $y$ onto $K$). Moreover, $y_p$ is a linear combination of elements in ${u_j}$, and is within $epsilon$ from $x$. Then the density follows from arbitrariness.

  Then $K$ is separable.
]
