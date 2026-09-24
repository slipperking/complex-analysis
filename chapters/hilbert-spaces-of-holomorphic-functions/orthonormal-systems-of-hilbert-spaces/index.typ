#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Orthonormal Systems of a Hilbert Space],
  route: "orthonormal-systems-of-a-hilbert-space",
)
We first aim to provide a generalization of bases which will serve useful in generalizing vector spaces to infinite dimensions.
#definition[Orthonormal System][
  Let $H$ be a Hilbert space. Let $I$ be any set. A set ${u_i}_(i in I) subset.eq H$ is an _orthonormal system_ iff $forall i, j in I$,
  $ chev(u_i, u_j) = delta_(i j) = cases(1 quad & "if" quad i = j, 0 quad & "if" quad i != j). $
  Generally one is concerned only with the cases where $I$ is finite or when $I$ is countably infinite ($I = NN$), although here we will consider the generalization to uncountable sets as it follows in the same way.
]
#definition[Completeness of an Orthonormal System][
  An orthonormal system in a Hilbert space is _complete_ iff there exists no nonzero vector orthogonal to all vectors in the system.
]
The definition of completeness is intuitive: it means that there is no other nonzero vector that can be appended to the system while maintaining the orthogonality condition.

The orthonormal then generalizes the concept of a "basis" for finite-dimensional vector spaces. Firstly, we give the following result:
#theorem[
  Let ${u_k}_(k=1)^n$ be a finite orthonormal system in a Hilbert space $H$. Let $U$ be the span of the system. The distance between a vector $x in H$ and $U$, $inf_(v in U) norm(x - v)$, is given by
  $ norm(x - u) = sqrt(norm(x)^2 - sum_(k=1)^n abs(chev(x, u_k))^2) $
  where $u in U$ is the unique value that attains this minimal distance.
] <thm:norm-of-orthogonal-component-in-terms-of-vector-norm-and-product>
#proof[
  Let
  $
    u = sum_(k = 1)^n chev(x, u_k) u_k in U.
  $
  We aim to show this choice of $u$ is optimized. Firstly, we show $x - u$ is orthogonal to $U$. For any $j in NN_(<= n)$,
  $
    chev(x - u, u_j) & = chev(x, u_j) - chev(sum_(k = 1)^n chev(x, u_k) u_k, u_j) \
                     & = chev(x, u_j) - sum_(k = 1)^n chev(x, u_k) chev(u_k, u_j) \
                     & = chev(x, u_j) - sum_(k = 1)^n chev(x, u_k) delta_(k j) = 0.
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
                    norm(x)^2 + sum_((j, k) in NN_(<= n)^2) chev(chev(x, u_j) u_j, chev(x, u_k) u_k) \
                    - 2 sum_(k = 1)^n Re chev(x, chev(x, u_k) u_k)
                  ) \
                & = sqrt(
                    norm(x)^2 + sum_((j, k) in NN_(<= n)^2) chev(x, u_j)overline(chev(x, u_k)) delta_(j k) - 2 sum_(k = 1)^n abs(chev(x, u_k))^2
                  ) \
                & = sqrt(norm(x)^2 - sum_(k=1)^n abs(chev(x, u_k))^2). qedhere
  $
]
Therefore, one then derives
#corollary[Bessel's Inequality][
  Let $H$ be a Hilbert space and let ${u_i}_(i in I)$ be an orthonormal system. Then for $x in H$,
  $ sum_(i in I) abs(chev(x, u_i))^2 <= norm(x)^2, $
  where the left-hand side converges _unconditionally_: $exists S <= norm(x)^2$ such that for any $epsilon > 0$, $exists I' subset.eq I$ countable such that for all $(I supset.eq )I'' supset.eq I'$ countable,
  $ abs(sum_(i in I'') abs(chev(x, u_i))^2 - S) < epsilon. $
  Moreover, $x$ is orthogonal to all but countably many vectors in ${u_i}$.
] <cor:bessels-inequality>
#proof[
  For each $m in NN$, let
  $
    A_m = {u in {u_i}_i : abs(chev(x, u))^2 > 1 / m}.
  $
  Then $A_m$ is a finite set, as otherwise
  $ sum_(u in A_m) abs(chev(x, u))^2 = oo, $
  contradicting @thm:norm-of-orthogonal-component-in-terms-of-vector-norm-and-product.
  Let $A = union.big_(m in NN) A_m$, which is a countable set. Moreover, for any ${u_i} in.rev u in.not A$, $abs(chev(x, u))^2 <= inf_(m in NN) 1 / m = 0$.

  Therefore only a countable number of vectors in ${u_i}_(i in I)$ are not orthogonal to $x$. Let $A$ be indexed by a sequence ${v_n}_(n in NN) = {u_i_n}_(n in NN)$. By @thm:norm-of-orthogonal-component-in-terms-of-vector-norm-and-product,
  $ sum_(n = 1)^oo abs(chev(x, v_n))^2 $
  has all partial sums bounded by $norm(x)^2$; therefore the series converges to a limit $S <= norm(x)^2$ by the Monotone Convergence Theorem.

  Since $sum_(n = 1)^oo abs(chev(x, v_n))^2 = S$, for any $epsilon > 0$, $exists N in NN$ such that for all $k >= N$, $abs(sum_(n = 1)^k abs(chev(x, v_n))^2 - S) < epsilon$. Then let $I' = {i_n}_(n=1)^N$. Then for any $I'' supset.eq I'$ countable,
  $ sum_(i in I') abs(chev(x, u_i))^2 <= sum_(i in I'') abs(chev(x, u_i))^2 <= S, $
  which implies
  $ epsilon > abs(S - sum_(i in I')^k abs(chev(x, u_i))^2) >= abs(S - sum_(i in I'') abs(chev(x, u_i))^2) >= 0 $
  and the assertion follows.
]
Then we may provide the following generalization of the Parseval's Theorem from Fourier analysis:
#theorem[Riesz--Fischer][
  Let $H$ be a Hilbert space and let ${u_i}_(i in I)$ be a complete orthonormal system. Then:
  1. For any $x in H$, #enum-lbl(<itm:riesz-fischer-parseval>)
    $ norm(x)^2 = sum_(i = I) abs(chev(x, u_i))^2. $
  + For any complex collection ${beta_i}_(i in I)$ such that $ sum_(i in I) abs(beta_i)^2 < oo, $
    then $exists! x in H$ such that $forall i in I$, $chev(x, u_i) = beta_i$. Then #enum-lbl(<itm:riesz-fischer-converse>)
    $ norm(x)^2 = sum_(i in I) abs(beta_i)^2, quad x = sum_(i in I) beta_i u_i $
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
  $ x = sum_j beta_i_j u_i_j, $
  we see that $chev(x, u_i_j) = beta_i_j$ and for all other $beta_i$'s, $beta_i = 0$, which proves $chev(x, u_i) = beta_i$ from orthogonality. Then in this case, the assertion $norm(x)^2 = sum_(i in I) abs(beta_i)^2$ follows from @thm:orthogonality-pythagorean.

  If $union.big_m A_m$ is countable and indexed by ${beta_i_j}_(j in NN)$, then for any $K in NN$, let
  $ x_K = sum_(j = 1)^K beta_i_j u_i_j. $
  Then for $N >= M$,
  $
    norm(x_N - x_M)^2 = norm(sum_(M + 1)^N beta_i_j u_i_j)^2 = sum_(M + 1)^N abs(beta_i_j)^2 -> 0. #tag[(by @thm:orthogonality-pythagorean)]
  $
  Then ${x_K}_K$ is a Cauchy sequence and hence converges to some $x in H$:
  $ x = sum_(j = 1)^oo beta_i_j u_i_j. $
  Since $abs(norm(x) - norm(x_N)) <= norm(x - x_N) -> 0$, $norm(x_N)^2 -> norm(x)^2$. Moreover, by @thm:orthogonality-pythagorean,
  $ norm(x_N)^2 = sum_(j = 1)^N abs(beta_i_j)^2 ==> norm(x)^2 = sum_(j = 1)^oo abs(beta_i_j)^2 $
  by letting $N -> oo$.

  If there exists some other $tilde(x)$ satisfying $chev(tilde(x), u_i) = beta_i$, then $chev(x - tilde(x), u_i) = 0$ for each $i in I$. By the completeness of ${u_i}_(i in I)$, the only vector orthogonal to all vectors in the system is the zero vector, therefore $x - tilde(x) = 0 ==> x = tilde(x)$.
]
#proof[of @itm:riesz-fischer-parseval of @thm:riesz-fischer][
  By Bessel's Inequality, we have
  $ sum_(i in I) abs(chev(x, u_i))^2 <= norm(x)^2. $
  By @itm:riesz-fischer-converse applied to $beta_i = chev(x, u_i)$, $exists! tilde(x)$ such that $forall i in I$,
  $ chev(tilde(x), u_i) = chev(x, u_i), $ <eq:riesz-fischer-parseval-product-equivalences>
  given by $tilde(x) = sum_(i = I) chev(x, u_i) u_i$. Then for this $tilde(x)$,
  $ norm(tilde(x))^2 = sum_(i in I) abs(chev(x, u_i))^2. $ <eq:riesz-fischer-parseval-tilde-x>
  @eq:riesz-fischer-parseval-product-equivalences gives that for each $i in I$, $chev(x - tilde(x), u_i) = 0$. Then $x - tilde(x)$ is orthogonal to all vectors in a complete orthonormal system, and is therefore zero by definition. Thus $x = tilde(x)$, and by @eq:riesz-fischer-parseval-tilde-x, we have
  $ norm(x)^2 = sum_(i in I) abs(chev(x, u_i))^2. qedhere $
]
#example[
  Let $ell^2 = {{a_j}_(j in NN) L : sum_(j = 1)^oo abs(a_j)^2 < oo}$ denote the set of all absolutely square-summable complex sequences. Then for $alpha = {a_j}_j$, $beta = {b_j}_j$, define
  $ chev(alpha, beta) = sum_(j = 1)^oo a_j overline(b_j). $
  Then $ell^2$ is a vector space and a Hilbert space with $chev(dot, dot)$.
] <ex:l2-space-is-hilbert>
We will not immediately state a full proof. There is indeed an elegant method that uses the Riesz--Fischer Theorem (@thm:riesz-fischer), under the assumption that there exists any Hilbert space $H$ with a countable complete orthonormal system, which we will first assume and justify later (in fact, there are many such spaces, such as the Bergman space $A^2 (Omega)$ and the Hardy space $H^2$).
#proof[of @ex:l2-space-is-hilbert (with assumptions)][
  Let $H$ be a Hilbert space with a countable complete orthonormal system. For any $alpha = {a_j}^(j in NN) in ell^2$,
]
