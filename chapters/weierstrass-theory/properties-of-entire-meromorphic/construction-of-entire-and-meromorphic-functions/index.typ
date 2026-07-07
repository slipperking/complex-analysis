#import "/lib.typ": *
#show: docs-subsubchapter.with(
  title: [The Construction of Entire and Meromorphic Functions],
  route: "construction-of-entire-and-meromorphic-functions",
  label: <sec:construction-of-entire-and-meromorphic-functions>,
)
It is common knowledge in algebra that any polynomial can be factored into linear factors. When can this factorization be extended to transcendental entire functions?

We will start by introducing the concept of _infinite products_. Let
$
  product_(k = 1)^n (1 + u_k)
$
be an infinite product. If the limit
$
  lim_(n -> oo) product_(k = 1)^n (1 + u_k)
$
exists and is finite, then the infinite product is said to be _convergent_.

For $x in RR_(>= 0)$, since $ee^x >= x$ and $ee^0 = 1$, we can integrate over $[0, x]$ to get that $ee^x >= x + 1$. Therefore,
$
  exp(sum_(k = 1)^n abs(u_k)) &>= product_(k = 1)^n (1 + abs(u_k)) = 1 + sum_(k = 1)^n abs(u_k) \
  & quad + sum_(j, k in {1, dots, n} \ j < k) abs(u_j u_k) + dots.c + product_(k = 1)^n abs(u_k) > sum_(k = 1)^n abs(u_k).
$
Since the convergence of $sum_(k = 1)^oo abs(u_k)$ is the same as that of $exp(sum_(k = 1)^oo abs(u_k))$, it follows that the convergence of $sum_(k = 1)^oo abs(u_k)$ is equivalent to that of $product_(k = 1)^oo (1 + abs(u_k))$. If $sum_(k = 1)^oo abs(u_k)$ is convergent, then $product_(k = 1)^oo (1 + u_k)$ is _absolutely convergent_. As with the order of summing an absolutely convergent series is unimportant, we may also rearrange terms in an absolutely convergent infinite product.

Similar to series, absolute convergence is a stronger condition than convergence:

#lemma[
  An absolutely convergent infinite product is convergent.
]

#proof[
  Let ${u_k}_(k in NN)$ be a complex sequence such that $sum_(k = 1)^oo abs(u_k)$ is convergent. Then $product_(k = 1)^oo (1 + u_k)$ is absolutely convergent. Let $Q_n$ denote the partial products of $product_(k = 1)^n (1 + abs(u_k))$ and let $P_n$ denote the partial products of $product_(k = 1)^n (1 + u_k)$. By the Cauchy Criterion (@thm:cauchy-criterion-sequence-convergence), we have that $forall epsilon > 0$, $exists N in NN$ such that $forall n > m > N$, $abs(Q_m - Q_n) < epsilon$. Let us now analyze the absolute difference between $P_n$ and $P_m$:
  $
    abs(P_n - P_m) & = abs(product_(k = 1)^n (1 + u_k) - product_(k = 1)^m (1 + u_k)) \
                   & = abs(product_(k = 1)^m (1 + u_k) product_(k = m + 1)^n (1 + u_k) - product_(k = 1)^m (1 + u_k)) \
                   & = product_(k = 1)^m abs(1 + u_k) dot abs(product_(k = m + 1)^n (1 + u_k) - 1) \
                   & <= product_(k = 1)^m (1 + abs(u_k)) dot abs(product_(k = m + 1)^n (1 + abs(u_k)) - 1) \
                   & = abs(Q_n - Q_m) < epsilon,
  $
  which therefore satisfies @thm:cauchy-criterion-sequence-convergence.
]

We will now provide the following assertions on the _locally uniform convergence_ of infinite products:

#lbl(
  lemma[
    Let $U subset.eq CC$ be open and connected. Suppose $sum_(k = 1)^oo f_k (z)$ uniformly converges on compact subsets of $U$ such that each $f_k$ is holomorphic on $U$. Then the infinite product
    $
      product_(k = 1)^oo exp(f_k (z))
    $
    is uniformly convergent on compact subsets of $U$.
  ],
  <lem:infinite-product-locally-uniform-convergence-criterion>,
)

#proof[
  Let $K$ be an arbitrary compact subset of $U$. Since $sum_(k = 1)^oo f_k (z)$ converges uniformly on $K$, it follows that $forall epsilon > 0$, $exists N in NN$ such that $forall n > m > N$, $abs(sum_(k = m + 1)^n f_k (z)) < epsilon$ for all $z in K$. Additionally, we have
  $
    abs(product_(k = 1)^n exp(f_k (z)) - product_(k = 1)^m exp(f_k (z))) = abs(exp(sum_(k = 1)^n f_k (z)) - exp(sum_(k = 1)^m f_k (z))).
  $
  By @thm:weierstrass-convergence, the uniform limit $sum_(k = 1)^oo f_k (z)$ is holomorphic on $U$. By continuity and @thm:continuous-function-bounded-on-compact, this limit is bounded on $K$. It follows that each partial sum is uniformly bounded on $K$. Since the exponential function is Lipschitz continuous on compact subsets of $CC$, there exists a finite constant $M > 0$ such that
  $
    abs(exp(sum_(k = 1)^n f_k (z)) - exp(sum_(k = 1)^m f_k (z))) <= M abs(sum_(k = m + 1)^n f_k (z)) < M epsilon. #qedhere
  $
]

#remark[
  Uniform convergence on compact subsets is also known as _compact convergence_. In the case of $CC$ (or in any topological space such that every point has a compact neighborhood), compact convergence is equivalent to _locally uniform convergence_.
]

We also have:

#lbl(
  lemma[
    Let $U subset.eq CC$ be open and connected. Suppose $sum_(k = 1)^oo abs(f_k (z))$ is uniformly convergent on compact subsets of $U$ such that each $f_k$ is holomorphic on $U$. Then the infinite product
    $
      product_(k = 1)^oo (1 + f_k (z))
    $
    is uniformly convergent on compact subsets of $U$ to a holomorphic function, which vanishes only at a point $z$ if and only if $f_k (z) = -1$ for some $k in NN$. The multiplicity at each such zero $z$ is the sum of the multiplicities of $1 + f_k$ at $z$ for all $k$ satisfying $f_k (z) = -1$.
  ],
  <lem:infinite-product-locally-uniform-convergence-criterion-2>,
)

#proof[
  Let $K subset U$ be an arbitrary compact set. By the uniform convergence of $sum_(k = 1)^oo abs(f_k (z))$ on $K$, it follows that the uniform limit is continuous by the Uniform Limit Theorem (@thm:uniform-limit). By continuity on a compact set, it follows that the limit is bounded by some constant $M'$. Additionally, $forall epsilon > 0$, $exists N in NN$ such that $forall n > N$, $sum_(k = 1)^n abs(f_k (z)) < M' + epsilon$. It follows that the partial sums are uniformly bounded on $K$ by
  $
    M = max{ max_(1 <= k <= N) max_(z in K) abs(f_k (z)), M' + epsilon }.
  $
  Similarly, by earlier discussion of infinite products, we have
  $
    F_n (z) = product_(k = 1)^n (1 + abs(f_k (z))) <= exp(sum_(k = 1)^n abs(f_k (z))) <= ee^M,
  $
  or in other words, the partial products are uniformly bounded on $K$. Let $0 < epsilon < 1$ be arbitrary. By definition, there exists $N in NN$ such that $forall n > m > N$, $abs(sum_(k = m + 1)^n f_k (z)) < epsilon$ for all $z in K$. The difference between the non-absolute partial products satisfies
  $
    abs(product_(k = 1)^n (1 + f_k (z)) - product_(k = 1)^m (1 + f_k (z))) &<= abs(product_(k = 1)^m (1 + f_k (z))) abs(product_(k = m + 1)^n (1 + f_k (z)) - 1) \
    &<= abs(F_m (z)) abs(exp(sum_(k = m + 1)^n abs(f_k (z))) - 1) \
    &<= ee^M (ee^epsilon - 1),
  $
  where the second inequality can be easily verified by expanding the product $product_(k = m + 1)^n (1 + f_k (z)) - 1$ and the triangle inequality.

  Since $ee^epsilon - 1 -> 0^+$, it follows that
  $
    F(z) = product_(k = 1)^oo (1 + f_k (z))
  $
  is uniformly convergent on $K$. Let $xi in U$ be a point satisfying $F(xi) = 0$. Since there exists an $m in NN$ such that
  $
    product_(k = m + 1)^oo (1 + f_k (z))
  $
  is non-vanishing at $z = xi$, and from the fact that
  $
    F(z) = product_(k = 1)^m (1 + f_k (z)) dot product_(k = m + 1)^oo (1 + f_k (z)),
  $
  we can analyze the zeros of the finite product to obtain the conclusion.
]

We will now study the construction of an entire function $f(z)$ via its zeros. We have the following cases:

1. If $f$ has no zeros in $CC$, then the function defined by $z mapsto (f'(z)) / f(z)$ is entire, so it is the derivative of an entire function $phi(z)$. Therefore, the function defined by $z mapsto f(z) ee^(-phi(z))$ has the vanishing derivative
  $
    dv(f(z) ee^(-phi(z)), z) = f'(z) ee^(-phi(z)) - phi'(z) f(z) ee^(-phi(z)) = 0.
  $
  It follows that $f(z) ee^(-phi(z))$ is constant, and therefore $f(z) = c exp(phi(z))$ for some constant $c in CC$. Since $phi(z)$ is entire, it follows that $f(z)$ is also entire. Absorb the constant $c$ into $phi(z)$, and $f(z) = exp(phi(z))$.

2. If $f$ is entire and has finitely many zeros in $CC$, namely $a_0 = 0, a_1, a_2, dots, a_n$ with respective multiplicities $m_0, m_1, dots, m_n$ (if $0$ is not a zero, treat $m_0 = 0$), then at each zero $a_k$, it has the local Taylor expansion
  $
    f(z) = sum_(j = m_k)^oo c_j (z - a_k)^j,
  $
  where $c_(m_k) != 0$. Therefore, we can divide $f(z)$ by $(z - a_k)^j$ to obtain a new entire function with no additional zeros and no zero at $a_k$. Repeating this for every zero, we can define
  $
    psi(z) = f(z) / p(z),
  $
  which is entire and has no zeros, where
  $
    p(z) = z^(m_0) (1 - z / a_1)^(m_1) dots (1 - z / a_n)^(m_n).
  $
  We write $p(z)$ in the above form rather than that of $z^(m_0) product_(k = 1)^n (z - a_k)^(m_k)$ as we aim to generalize the construction to infinite products to study convergence. By the non-vanishing case above, $psi(z) = exp(phi(z))$ for some entire function $phi(z)$. Therefore, we can write
  #lbl(
    $
      f(z) = p(z) exp(phi(z)),
    $,
    <eq:weierstrass-factorization-finite-zeros>,
  )
  where $p(z)$ is a polynomial with zeros at $a_k$ with respective multiplicities $m_k$. The entire functions $p(z)$ and $f(z)$ both have the same zeros with matching multiplicities.

3. If $f(z)$ is entire and has infinitely many zeros such that $f$ is not identically zero, then it follows that $f$ has countably many zeros (since the zeros are isolated). Let the zeros be indexed by $NN$, namely $a_1, a_2, dots$. Without loss of generality, assume that $forall n in NN$, $0 < abs(a_n) <= abs(a_(n + 1))$ (repeated elements representing multiplicities), and $lim_(n -> oo) a_n = oo$. The case for a zero at $0$ will be treated differently.

  There exists a positive integer sequence $p_1, p_2, dots$ such that for every positive and finite $R$, $sum_(n = 1)^oo abs(R / a_n)^(p_n + 1)$ converges. For example, let $p_n = n$, and for sufficiently large $n$, $R / abs(a_n) < 1$ and the series is convergent. Consider the infinite product
  #lbl(
    $
      product_(n = 1)^oo (1 - z / a_n) exp(z / a_n + 1 / 2 (z / a_n)^2 + dots.c + 1 / p_n (z / a_n)^(p_n)).
    $,
    <eq:infinite-product-weierstrass-factorization-intermediate>,
  )
  Let
  #lbl(
    $
      P_p (z) = z + 1 / 2 z^2 + dots.c + 1 / p z^p \
      Q_p (z) = log(1 - z) + P_p (z) \
      E_p (z) = exp(Q_p (z)) = (1 - z) exp(P_p (z)).
    $,
    <eq:weierstrass-elementary-factor>,
  )
  Therefore, we can rewrite @eq:infinite-product-weierstrass-factorization-intermediate as
  $
    product_(n = 1)^oo E_(p_n) (z / a_n).
  $
  The expression in @eq:weierstrass-elementary-factor is known as the $p$-th _Weierstrass elementary factor_.

  By $epsilon--N$, for a fixed $R > 0$, $exists N in NN$ such that $forall n >= N$, $abs(a_n) > 2 R$. Consider the product $product_(n = N)^oo E_(p_n) (z / a_n)$. For $z in overline(D(0, R))$ and $n >= N$, we have $abs(z / a_n) <= 1 / 2$. The Taylor expansion
  $
    log(1 - w) = -sum_(k = 1)^oo w^k / k
  $
  has a convergence disk of $D(0, 1)$. Then,
  #lbl(
    $
      abs(Q_(p_n) (z / a_n)) & = abs(-sum_(k = 1)^oo 1 / k (z / a_n)^k + sum_(j = 1)^(p_n) 1 / j (z / a_n)^j) \
                             & <= sum_(k = p_n + 1)^oo 1 / k abs(z / a_n)^k \
                             & <= sum_(k = p_n + 1)^oo abs(z / a_n)^k = abs(z / a_n)^(p_n + 1) 1 / (1 - abs(z / a_n)) \
                             & <= 2 abs(R / a_n)^(p_n + 1).
    $,
    <eq:infinite-product-weierstrass-factorization-uniform-bound>,
  )
  By the definition of ${p_n}_(n in NN)$, the series $2 sum_(n = 1)^oo abs(R / a_n)^(p_n + 1)$ converges. Therefore, $sum_(n = 1)^oo Q_(p_n) (z / a_n)$ is uniformly and absolutely convergent on $overline(D(0, R))$ by the Weierstrass $M$-Test (@thm:weierstrass-m-test). We then get that
  $
    product_(n = N)^oo E_(p_n) (z / a_n) = exp(sum_(n = N)^oo Q_(p_n) (z / a_n)),
  $
  and it uniformly converges on $overline(D(0, R))$ to a nonzero holomorphic function $f(z)$ on $D(0, R)$ by @lem:infinite-product-locally-uniform-convergence-criterion, @thm:weierstrass-convergence, and @thm:hurwitz-simple-case.

  The zeros of
  $
    product_(n = 1)^(N - 1) E_(p_n) (z / a_n)
  $
  are $a_1, dots, a_(N - 1)$ and lie in $overline(D(0, 2 R))$. To prove the absolute convergence of $product_(n = N)^oo E_(p_n) (z / a_n)$ on $overline(D(0, R))$, we will show that $sum_(n = N)^oo abs(E_(p_n) (z / a_n) - 1)$ is convergent. Trivially, when $zeta in overline(DD)$, we have
  $
    abs(exp(zeta) - 1) <= exp(abs(zeta)) - 1 <= (ee - 1) abs(zeta).
  $
  By @eq:infinite-product-weierstrass-factorization-uniform-bound above, we get that $abs(Q_(p_n) (z / a_n)) <= 1$ when $n >= N$.

  Therefore, we have
  $
    abs(E_(p_n) (z / a_n) - 1) & = abs(exp(Q_(p_n) (z / a_n)) - 1) \
                               & <= (ee - 1) abs(Q_(p_n) (z / a_n)) <= 2 (ee - 1) abs(R / a_n)^(p_n + 1),
  $
  which has a convergent series by definition. Therefore, $product_(n = N)^oo E_(p_n) (z / a_n)$ is absolutely convergent on $overline(D(0, R))$. Letting $R -> oo$, we obtain the following result:

  #lbl(
    theorem[Weierstrass Product Theorem][
      Let ${a_n}_(n in NN)$ be a sequence of nonzero complex numbers satisfying $a_n -> oo$ as $n -> oo$ and $0 < abs(a_n) <= abs(a_(n + 1))$ (equality of $a_n$ and $a_(n + 1)$ treated as multiplicities) for all $n$. Then there exists a sequence ${p_n}_(n in NN)$ of nonnegative integers such that $forall R > 0$, $sum_(n = 1)^oo abs(R / a_n)^(p_n + 1)$ converges. For such a prescribed sequence, the function
      #lbl(
        $
          f(z) = product_(n = 1)^oo E_(p_n) (z / a_n)
        $,
        <eq:entire-function-constructed-from-infinitely-many-zeros>,
      )
      defines an entire function with zeros at each element of the sequence of multiplicities matching the number of times an element is repeated. Moreover, the product converges uniformly on any compact disk $overline(D(0, R))$.
    ],
    <thm:weierstrass-product>,
  )

  The following result is then apparent:

  #lbl(
    theorem[Weierstrass Factorization Theorem][
      Suppose $f(z)$ is an entire function. Let ${a_n}_(n in NN)$ be the sequence of all nonzero zeros of $f$ satisfying $a_n -> oo$ as $n -> oo$ and $0 < abs(a_n) <= abs(a_(n + 1))$ (equality of $a_n$ and $a_(n + 1)$ treated as multiplicities) for all $n$. Let $m$ be the multiplicity of $f(z)$ at $z = 0$ (let $m = 0$ if there is no zero at $0$). Then there exists a sequence ${p_n}_(n in NN)$ of nonnegative integers such that $forall R > 0$, $sum_(n = 1)^oo abs(R / a_n)^(p_n + 1)$ converges. Then, we can write
      #lbl(
        $
          f(z) = z^m ee^(phi(z)) product_(n = 1)^oo E_(p_n) (z / a_n)
        $,
        <eq:weierstrass-factorization-statement>,
      )
      on $D(0, R)$, where $E_p (z)$ is the $p$-th Weierstrass elementary factor defined in @eq:weierstrass-elementary-factor and $phi(z)$ is an entire function. The infinite product converges uniformly on $overline(D(0, R))$ and converges absolutely on $CC$. If we let $p_n = n$, we can write
      $
        f(z) = z^m ee^(phi(z)) product_(n = 1)^oo (1 - z / a_n) exp(z / a_n + 1 / 2 (z / a_n)^2 + dots.c + 1 / n (z / a_n)^n).
      $
    ],
    <thm:weierstrass-factorization>,
  )

  #proof[
    By the Weierstrass Product Theorem, construct $psi(z)$ to be entire and have zeros at ${a_n}_(n in NN)$. Thus, $z^m psi(z)$ and $f(z)$ have the same zeros and corresponding multiplicities. Then the function
    $
      z^m psi(z) / f(z)
    $
    has removable singularities on all of ${a_n}_(n in NN) union {0}$ and has an analytic continuation (@thm:riemann-removable-singularities) to an entire and non-vanishing function. Therefore, it can be written as
    $
      z^m psi(z) / f(z) = ee^(phi.alt(z)),
    $
    where $phi.alt$ is entire. Let $phi = -phi.alt$, and from rearrangement, we obtain @eq:weierstrass-factorization-statement.
  ]

#corollary[
  Let $f$ be meromorphic on $CC$. Then $f$ can be written as the quotient of two entire functions.
]

#proof[
  Let $phi(z)$ be any entire function with zeros only at each pole of $f$ (with multiplicities matching the order of each pole). If there are infinitely many poles, we can explicitly construct such a $phi$ by the Weierstrass Product Theorem (@thm:weierstrass-product). If there are finitely many poles, construct $phi$ using @eq:weierstrass-factorization-finite-zeros. It follows that $phi f$ can be analytically continued on its removable singularities to an entire function $phi.alt(z)$ with the same zeros as $f(z)$. Hence,
  $
    f(z) phi(z) = phi.alt(z) <==> f(z) = phi.alt(z) / phi(z),
  $
  which is an explicit construction.
]

Therefore, any meromorphic function on $CC$ can be expressed as the quotient of two infinite products. Hence, any meromorphic function on $CC$ can be explicitly written in terms of its zeros and poles.

We will now study the construction of meromorphic functions from their poles and the principal parts of their Laurent expansions at each pole.

Suppose $n in NN$ and ${a_k}_(k = 1)^n subset CC$ is a sequence of distinct values. Let ${psi_k (z)}_(k = 1)^n$ be a collection of functions in the form
#lbl(
  $
    psi_k (z) = sum_(j = m_k)^(p_k) c_(k, j) / (z - a_k)^j,
  $,
  <eq:meromorphic-function-construction-principal-parts>,
)
where $p_k >= m_k$ are finite integer constants and ${c_(k, j)}$ are complex constants.

Suppose that $f(z)$ is meromorphic on $CC$ such that $f$ has finitely many poles. Therefore, $f$ has an isolated singularity at $oo$. We have two cases:

1. If $z = oo$ is a removable singularity or a pole, by the given proof of @thm:rational-meromorphic-functions, we may construct $f(z)$ to have poles at each of ${a_k}_(k = 1)^n$ such that the principal parts of $f$ at each of ${a_k}_(k = 1)^n$ are ${psi_k (z)}_(k = 1)^n$. It can be explicitly written as
  $
    f(z) = p(z) + sum_(k = 1)^n psi_k (z)
  $
  (we can absorb the constant $c$ into the polynomial $psi_infinity$ as used in the proof).

2. In the case that $f(z)$ is a transcendental meromorphic function with an isolated essential singularity at $z = oo$, notice that the function defined by
  $
    phi(z) = f(z) - sum_(k = 1)^n psi_k (z)
  $
  has removable singularities at each of ${a_k}_(k = 1)^n$. Indeed, since the singularities are isolated, for a fixed $k$, $exists epsilon_k > 0$ such that for any $j != k$, $a_j in.not D(a_k, epsilon_k)$. It follows that $psi_j$ is holomorphic on $D(a_k, epsilon_k)$. Notice that $f(z) - psi_k$ is the holomorphic part of the Laurent expansion at $a_k$ and is also holomorphic on the disk. Suppose $f$ has $psi_k$ as the principal part of its Laurent expansion at $a_k$. Then $phi(z)$ is holomorphic on $D(a_k, epsilon_k)$. Since $k$ was arbitrarily chosen, $phi$ is entire and transcendental.

  Therefore, $f$ can be constructed by
  $
    f(z) = phi(z) + sum_(k = 1)^oo psi_k (z),
  $
  for a transcendental entire function $phi(z)$.

3. The existence of a transcendental meromorphic function $f$ whose poles have an accumulation point at $z = oo$ is the concern of the following theorem:

  #lbl(
    theorem[Mittag--Leffler][
      Let ${a_n}_(n in NN) subset CC$ be a sequence of distinct complex numbers such that $forall n in NN$, $abs(a_n) <= abs(a_(n + 1))$ and $lim_(n -> oo) a_n = oo$. Let ${psi_n}_(n in NN)$ be a function sequence, each in the form of @eq:meromorphic-function-construction-principal-parts. Then the following hold.

      First, a meromorphic function $f(z)$ on $CC$ can be constructed such that $forall n in NN$, $f$ has a pole at $a_n$ with principal part $psi_n$ at $a_n$.

      Second, the function $f(z)$ satisfying the criteria above can be explicitly represented as
      #lbl(
        $
          f(z) = phi(z) + sum_(n = 1)^oo (psi_n (z) - p_n (z))
        $,
        <eq:mittag-leffler-construction-statement>,
      )
      for some sequence of polynomials ${p_n (z)}$ and an arbitrary entire function $phi(z)$.
    ],
    <thm:mittag-leffler>,
  )

  #proof[
    The classical proof for this theorem allows for a more explicit construction, as in @eq:mittag-leffler-construction-statement. As for the existence statement, we can prove the first assertion by use of the $overline(partial)$-problem.

    Fix $n in NN$, and let $U_n$ be an open neighborhood of $a_n$ such that $forall i, j in NN$ where $i != j$, $overline(U_i) inter overline(U_j) = emptyset$. Let $V_n$ be a neighborhood of $a_n$ that is relatively compact in $U_n$. By @thm:bump-function-existence, for each $n$, there is a $C^oo$ function $phi_n$ satisfying
    $
      phi_n (z) = cases(
        1 & quad "if" z in overline(V_n)\,,
        0 & quad "if" z in CC without U_n.
      )
    $
    Let
    $
      u(z) = sum_(k = 1)^oo phi_k (z) psi_k (z),
    $
    which is an element of $C^oo (CC without {a_k}_(k in NN))$. For a fixed $n in NN$, it is true that $u equiv psi_n$ on $overline(V_n) without {a_n}$. Hence, although $u$ is not meromorphic, it does have the required principal part near each $a_k$. Let
    $
      phi.alt(z) = cases(
        pdv(u, overline(z)) & quad "if" z in CC without {a_k}_(k in NN)\,,
        0 & quad "if" z in {a_k}_(k in NN).
      )
    $
    Since $pdv(u, overline(z), style: "horizontal") equiv pdv(psi_n, overline(z), style: "horizontal") equiv 0$ and is $C^oo$ on $overline(V_n) without {a_n}$ and $phi.alt$ vanishes on ${a_k}_(k in NN)$, $phi.alt in C^oo (CC)$. By the discussion preceding @thm:one-dimensional-partial-conjugate-solution, there exists a $C^oo$ function $v(z)$ such that $pdv(v, overline(z)) = phi.alt(z)$ on $CC$. Since $phi.alt$ is $C^oo$, it follows that $v$ is also $C^oo$. Define $f(z) = u(z) - v(z)$. Then
    $
      pdv(f, overline(z)) = pdv(u, overline(z)) - pdv(v, overline(z)) = phi.alt(z) - phi.alt(z) = 0,
    $
    which implies that $f$ is holomorphic on $CC without {a_k}_(k in NN)$. Since $u$ has the desired principal part $psi_n$ at each $a_n$ and $v$ is $C^oo$ (and hence removable at each singularity), it follows that $f$ is meromorphic on $CC$ with principal parts $psi_n$ at each $a_n$, as desired.

    Let ${epsilon_n}_(n in NN)$ be a positive sequence such that $sum_(n = 1)^oo epsilon_n$ is convergent. Without loss of generality, let $a_1 = 0$ (if $a_1$ is not a pole, set $psi_1 = 0$). Choose $p_1 (z) = 0$ (this can actually be any arbitrary polynomial). Fix $n >= 2$. Since $psi_n$ is a polynomial in terms of $1 / (z - a_n)$ and has its only pole at $z = a_n$, $psi_n (z)$ is holomorphic on $D(0, abs(a_n))$ and can be written as
    $
      psi_n (z) = sum_(k = 0)^oo (psi_n^((k))(0)) / (k!) z^k.
    $

    By @thm:abels-theorem-radius, this series is uniformly convergent on $D(0, abs(a_n / 2))$. Hence, $exists lambda_n in NN$ such that
    $
      abs(psi_n (z) - sum_(k = 0)^(lambda_n) (psi_n^((k))(0)) / (k!) z^k) < epsilon_n.
    $
    Let
    $
      p_n (z) = sum_(k = 0)^(lambda_n) (psi_n^((k))(0)) / (k!) z^k.
    $
    Fix $R > 0$ and let $N in NN$ depend on $R$ such that $abs(a_n) > 2 R$ for all $n > N$ and $abs(a_n) <= 2 R$ for all $n <= N$. Therefore, $forall n > N$, $R < abs(a_n / 2)$. Then $forall z in D(0, R)$, we have
    $
      abs(psi_n (z) - p_n (z)) < epsilon_n.
    $

    By the convergence of $sum_(n = N + 1)^oo epsilon_n$, by the Weierstrass $M$-Test (@thm:weierstrass-m-test), the series
    #lbl(
      $
        Phi_N (z) = sum_(n = N + 1)^oo (psi_n (z) - p_n (z))
      $,
      <eq:mittag-leffler-construction-uniformly-convergent-series>,
    )
    converges uniformly on $D(0, R)$. Since $z < R < abs(a_n / 2) < abs(a_n)$ when $n > N$, the pole of $psi_n (z)$, namely $z = a_n$, is not in $D(0, R)$ when $n > N$. By @thm:weierstrass-convergence, @eq:mittag-leffler-construction-uniformly-convergent-series is holomorphic on $D(0, R)$. Let
    $
      Psi(z) = sum_(n = 1)^N (psi_n (z) - p_n (z)) + Phi_N (z).
    $
    The poles of $Psi(z)$ in $D(0, R)$ are all of the $a_n$ with corresponding principal parts $psi_n (z)$, where $n in NN$ and $a_n in D(0, R)$. Since $R$ was arbitrarily chosen, $Psi$ has poles at each $a_n$ with the corresponding principal part $psi_n (z)$ on $CC$. Let $phi(z) = f(z) - Psi(z)$ be analytically continued onto each of ${a_n}_(n in NN)$. Then $phi(z)$ is an entire function (since the Laurent expansions of $phi$ at each of ${a_n}_(n in NN)$ vanish). By rearrangement, we obtain our desired result. #qedhere
  ]

The Mittag--Leffler Theorem (@thm:mittag-leffler) can also be generalized as follows:

#lbl(
  theorem[
    Let $U subset CC$ be an open set with a simple closed boundary $partial U$ and let $E = {a_n}_(n in NN) subset U$ be a sequence of distinct complex numbers whose accumulation points lie on $partial U$. Let ${psi_n}_(n in NN)$ be a sequence of functions in the form of @eq:meromorphic-function-construction-principal-parts. Then there exists a meromorphic function $f: U -> CC$ with poles at each $a_n$ with principal parts $psi_n$ at each $a_n$.
  ],
  <thm:mittag-leffler-boundary>,
)

Indeed, since $partial U inter U = emptyset$, each $a_n$ is not an accumulation point of $E$. In other words, for each $n in NN$, there exist neighborhoods $U_n$ of $a_n$ that are relatively compact in $U$ with disjoint closures. The proceeding proof is analogous to that of the existence part in @thm:mittag-leffler.

Finally, we will examine the construction of entire functions interpolating prescribed values and derivatives at given points.

Let ${z_j}_(j = 1)^n subset CC$ be a sequence of distinct complex numbers and let ${w_j}_(j = 1)^n subset CC$ be a sequence of complex numbers. We can then construct a polynomial $f(z)$ such that $forall j in {1, dots, n}$, $f(z_j) = w_j$. One such explicit formula is given by the _Lagrange interpolation formula_:
$
  f(z) = sum_(j = 1)^n [w_j product_(k = 1 \ k != j)^n (z - z_k) / (z_j - z_k)].
$
Then, following the assumption that ${z_j}_(j = 1)^n subset CC$ is a sequence of distinct complex numbers, let ${w_(j, k)}_(j in {1, dots, n}, k in {0, dots, n_j})$ be a sequence where ${n_j}_(j = 1)^n subset NN$. Then we can find a polynomial $f(z)$ such that $forall j in {1, dots, n}$, $forall k in {0, dots, n_j}$, $f^((k)) (z_j) = k! w_(j, k)$ (for clarity's sake, $j$ selects the pair and $k$ selects the order of the derivative, whose upper bound varies for each $j$). Oftentimes, the factorial coefficient is absorbed into ${w_(j, k)}$.

As it turns out, an entire function can in fact be constructed for infinitely many interpolation points, or when $n -> oo$.

#lbl(
  theorem[
    Let ${z_k}_(k in NN) subset CC$ be a discrete set and let ${w_(k, n)}_(k in NN, n in {0, dots, n_k})$ be a sequence where ${n_k}_(k in NN) subset NN$. Then there exists an entire function such that $forall k in NN$, $forall n in {0, dots, n_k}$,
    #lbl(
      $
        f^((n)) (z_k) = n! w_(k, n).
      $,
      <eq:general-interpolation-existence-statement>,
    )
    In other words, an entire function can be constructed by the given first $n_k$ coefficients of the Taylor expansion at each $z_k$.
  ],
  <thm:general-interpolation-existence>,
)

#proof[
  According to the Weierstrass Product Theorem (@thm:weierstrass-product), we can construct an entire function $Phi(z)$ with zeros at each of ${z_k}_(k in NN)$ with corresponding multiplicities ${n_k}_(k in NN)$. By the discreteness of ${z_k}_(k in NN)$, there exists a corresponding sequence of radii ${epsilon_k}_(k in NN)$ such that each $overline(D(z_k, 2 epsilon_k))$ is disjoint.

  Define a complex function sequence ${phi.alt_k (z)}_(k in NN)$ by
  $
    phi.alt_k (z) = sum_(n = 0)^(n_k - 1) w_(k, n) (z - z_k)^n,
  $
  where $k in NN$. By @thm:bump-function-existence, we can construct a $C^oo$ sequence of functions ${phi_k (z)}_(k in NN)$ such that $forall k in NN$, $supp(phi_k) subset D(z_k, 2 epsilon_k)$, $phi_k equiv 1$ on $overline(D(z_k, epsilon_k))$, and $0 <= phi_k <= 1$ on $CC$.

  Let $Psi in C^oo (CC)$, and construct
  #lbl(
    $
      f(z) = -Phi(z) Psi(z) + sum_(k = 1)^oo phi.alt_k (z) phi_k (z).
    $,
    <eq:general-interpolation-existence-construction-statement>,
  )
  Under what conditions on $Psi$ will $f$ be entire? Since the supports of each $phi_k$ are disjoint, the summation $sum_(k = 1)^oo phi.alt_k (z) phi_k (z)$ contains at most one nonzero term and is convergent and well-defined. To construct $f$ to be entire, we must have $pdv(f, overline(z)) = 0$. In other words, we want
  $
    pdv((sum_(k = 1)^oo phi.alt_k phi_k), overline(z), style: "large") = pdv(, overline(z))(Phi Psi) <==> sum_(k = 1)^oo phi.alt_k pdv(phi_k, overline(z)) = Phi pdv(Psi, overline(z))
  $
  on all of $CC$. Let
  $
    g(z) = sum_(k = 1)^oo phi.alt_k (z) pdv(phi_k (z), overline(z)).
  $
  Since $phi_k equiv 1$ on $overline(D(z_k, epsilon_k))$, $pdv(phi_k, overline(z)) equiv 0$ on $union.big_(k = 1)^oo overline(D(z_k, epsilon_k))$. Consequently, $g(z) equiv 0$ on $union.big_(k = 1)^oo overline(D(z_k, epsilon_k))$.

  From rearrangement, we have
  $
    g(z) / Phi(z) = pdv(Psi, overline(z)),
  $
  which has removable singularities at each $z_k$. Define $g(z) / Phi(z) = 0$ at $z = z_k$. Under this assertion, we have $g(z) / Phi(z) in C^oo (CC)$. Since the support of $g(z) / Phi(z)$ is the union of disjoint compact sets, by @thm:one-dimensional-partial-conjugate-solution, there exists a function $Psi in C^oo (CC)$ satisfying
  $
    g(z) / Phi(z) = pdv(Psi, overline(z)).
  $
  Since $g$ vanishes on $union.big_(k = 1)^oo overline(D(z_k, epsilon_k))$, it follows that $g / Phi$ vanishes on $union.big_(k = 1)^oo overline(D(z_k, epsilon_k))$, and $Psi$ is holomorphic on $union.big_(k = 1)^oo D(z_k, epsilon_k)$.

  Fix $k in NN$ and let $n in {0, dots, n_k - 1}$. For $z in D(z_k, epsilon_k)$, from @eq:general-interpolation-existence-construction-statement, we have
  $
    f(z) = -Phi(z) Psi(z) + phi.alt_k (z).
  $
  Since $Phi$ has a zero at $z_k$ with multiplicity $n_k$, $Phi(z) Psi(z)$ vanishes at $z_k$ with multiplicity at least $n_k$. Therefore, we have
  $
    f^((n)) (z_k) & = evaluated(dv(, z, n)(sum_(j = 0)^(n_k - 1) w_(k, j) (z - z_k)^j))_(z_k) - evaluated(dv(, z, n)(sum_(j = n_k)^oo w'_(k, j) (z - z_k)^j))_(z_k) \
    & = lim_(z -> z_k) sum_(j = n)^(n_k - 1) (w_(k, j) (z - z_k)^(j - n) product_(r = j - n + 1)^j r) \
    & quad - sum_(j = n_k)^oo (w'_(k, j) (z - z_k)^(j - n) product_(r = j - n + 1)^j r) \
    & = n! w_(k, n),
  $
  as desired.
]

#remark[
  For a general power series, there is no assurance that it corresponds to the Taylor expansion of an entire function. However, for any polynomial of degree $n$, there always exists an entire function whose Taylor expansion agrees with the polynomial up to the first $n + 1$ terms, which is the fundamental difference between a polynomial and a transcendental entire function.
]

#lbl(
  example[
    Prove the pole expansion formula
    $
      uppi csc(uppi z) = op("P.V.")(sum_(k = -oo)^oo ((-1)^k) / (z + k)) = 1 / z + sum_(k = 1)^oo (2 z (-1)^k) / (z^2 - k^2)
    $
    for $z in CC without ZZ$.
  ],
  <ex:csc-pole-expansion>,
)

#solution[to @ex:csc-pole-expansion][
  Let the simple poles of $uppi csc(uppi z)$ at each integer be enumerated by
  $
    a_n = cases(
      -n / 2 & quad "if" n in 2 NN\,,
      (n + 1) / 2 & quad "if" n in NN without 2 NN.
    )
  $
  // TBC
]
