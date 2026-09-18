#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Geometry of a Hilbert Space],
  route: "geometry-of-a-hilbert-space",
)

The concept of a _vector space_ is an important one in linear algebra. However, its definition itself does not actually imply that the "vectors" are tuples of values of finite dimension. As a matter of fact the term "vector" is a very general one. Developments in the 20th century have rigorously defined vectors with infinite dimensions.

#definition[Inner Product][
  Let $V$ be a vector space over $CC$. Then a function $ chev(dot, dot) : V^2 -> CC $
  is said to be a _positive-definite nondegenerate Hermitian inner product_ iff
  + For any $v_1, v_2, w in V$, $chev(v_1 + v_2, w) = chev(v_1, w) + chev(w_2, w)$ (additivity in the first argument). #enum-lbl(<itm:inner-product-left-additivity>)
  + For any $alpha in CC$, $v, w in V$, $chev(alpha v, w) = alpha chev(v, w)$ (linearity in the first argument). #enum-lbl(<itm:inner-product-left-linearity>)
  + For any $v, w in V$, $chev(v, w) = overline(chev(w, v))$ (conjugate-symmetry). #enum-lbl(<itm:inner-product-conjugate-symmetry>)
  + For any $v in V$, $chev(v, v) >= 0$. (semi-positive-definiteness) #enum-lbl(<itm:inner-product-semi-positive-definiteness>)
  + For $v in V$, $chev(v, v) = 0$ iff $v = 0$ (nondegeneracy). #enum-lbl(<itm:inner-product-nondegeneracy>)
  Then the space $V$ together with the inner product is known as an _inner product space_.
] <def:inner-product>
Note that @itm:inner-product-nondegeneracy and @itm:inner-product-semi-positive-definiteness, imply positive-definitness: for $v != 0$, $chev(v, v) > 0$.
#proposition[
  Let $V$ be a vector space over $CC$ and let $chev(dot, dot)$ be a positive-definite nondegenerate Hermetian inner product. Then for $v, v, w, w_1, w_2 in V$ and $alpha in CC$,
  + $chev(v, w_1 + w_2) = chev(v, w_1) + chev(v, w_2)$ (additivity in the second argument). #enum-lbl(<itm:inner-product-right-additivity>)
  + $chev(v, alpha w) = overline(alpha) chev(v, w)$ (conjugate-linearity in the second argument). #enum-lbl(<itm:inner-product-right-conjugate-linearity>)
  + $chev(v, 0) = chev(0, v) = 0$. #enum-lbl(<itm:inner-product-linearity-with-zero-vector>)
  + $chev(v + w, v + w) = chev(v, v) + chev(w, w) + 2 Re chev(v, w)$. #enum-lbl(<itm:inner-product-distributivity>)
] <prop:inner-product-properties>
#proof[
  Observe that @itm:inner-product-right-additivity holds since
  $
    chev(v, w_1 + w_2) & = overline(chev(w_1 + w_2, v)) \
                       & = overline(chev(w_1, v)) + overline(chev(w_2, v)) = chev(v, w_1) + chev(v, w_2)
  $
  and conjugate-linearity (@itm:inner-product-right-conjugate-linearity) holds in the second argument since
  $
    chev(v, alpha w) & = overline(chev(alpha w, v)) = overline(alpha chev(w, v)) = overline(alpha) chev(v, w).
  $
  Letting $alpha = 0$ on $chev(alpha v, v)$ gives @itm:inner-product-linearity-with-zero-vector, while @itm:inner-product-distributivity is a consequence of additivity.
]
We provide examples of vector spaces and their corresponding nondegenerate Hermetian inner products:
#example[
  Let $V = C^n$ ($n in NN$) be a vector space under the usual operations, and define $ chev(vb(v), vb(w)) = sum_(k=1)^n v_k overline(w_k), $
  where $vb(v) = (v_1, dots, v_n)$ and $vb(w) = (w_1, dots, w_n)$ are vectors in $V$. Then $chev(dot, dot)$ is a nondegenerate Hermetian inner product (the verification of the properties are trivial).
]
The verification of the necessary properties is trivial.
#example[
  Let $V = C([0,1], CC)$, with addition and multiplication defined as in the usual sense. Then if $f, g in V$, define
  $ chev(f, g) = integral_0^1 f(x) overline(g(x)) dx. $
] <ex:inner-product-C-0-1-CC>
#proof[
  The verification of properties @itm:inner-product-left-additivity, @itm:inner-product-left-linearity, @itm:inner-product-conjugate-symmetry, @itm:inner-product-semi-positive-definiteness (in @def:inner-product) are somewhat trivial. The reverse implication of @itm:inner-product-distributivity is obvious. For $f in V$ such that
  $ chev(f, f) = 0 ==> integral_0^1 abs(f(x))^2 dx = 0, $
  if $abs(f(x'))^2 > 0$ at some $x' in (0,1)$, then for $x$ in some $delta$-neighborhood of $x'$, $abs(f(x))^2 > 1 / 2 abs(f(x'))^2$ by continuity, implying that
  $ integral_0^1 abs(f(x))^2 dx >= integral_(x'-delta)^(x'+delta) abs(f(x))^2 dx > delta abs(f(x'))^2 > 0, $
  which is impossible; thus $f equiv 0$ forcibly.
]
#definition[Associated Norm][
  If $V$ is a vector space and $chev(dot, dot)$ is a nondegenerate positive-definite Hermitian inner product on $V$, then the _associated norm_ of some $v in V$ is given by $ norm(v) = sqrt(chev(v, v)). $
]
#theorem[Cauchy--Schwarz Inequality][
  If $V$ is a vector space and $chev(dot, dot)$ is a nondegenerate positive-definite Hermitian inner product on $V$, then for $v, w in V$,
  $
    abs(chev(v, w)) <= norm(v) dot norm(w).
  $
] <thm:inner-product-cauchy-schwarz>
#proof[
  We only need to consider cases when $v != 0$ and $w != 0$ (as these cases are already satisfied by @itm:inner-product-linearity-with-zero-vector of @prop:inner-product-properties).

  By the positive-definiteness of the product,
  $
    0 & <= chev(v - chev(v, w) / norm(w)^2 w, v - chev(v, w) / norm(w)^2 w) \
      & = chev(v, v)+ chev(chev(v, w) / norm(w)^2 w, chev(v, w) / norm(w)^2 w) + 2 Re chev(v, - chev(v, w) / norm(w)^2 w) \
      & = norm(v)^2 + abs(chev(v, w) / norm(w)^2)^2 norm(w)^2 - 2 Re overline(chev(v, w)) / norm(w)^2 chev(v, w) \
      & = norm(v)^2 - abs(chev(v, w))^2 / norm(w)^2,
  $
  implying that $ norm(v)^2 norm(w)^2 >= abs(chev(v, w))^2 ==> abs(chev(v, w)) <= norm(v) dot norm(w). qedhere $
]
Then @thm:inner-product-cauchy-schwarz and @itm:inner-product-distributivity of @prop:inner-product-properties are sufficient to imply the triangle inequality of the associated norm:
#theorem[Triangle Inequality of the Associated Norm][
  If $V$ is a vector space and $chev(dot, dot)$ is a nondegenerate positive-definite Hermitian inner product on $V$, then for $v, w in V$,
  $ norm(v) + norm(w) >= norm(v + w). $
]
#proof[
  By @itm:inner-product-distributivity of @prop:inner-product-properties and the Cauchy--Schwarz Inequality (@thm:inner-product-cauchy-schwarz),
  $
    norm(v + w)^2 & = norm(v)^2 + norm(w)^2 + 2 Re chev(v, w) \
                  & <= norm(v)^2 + norm(w)^2 + 2 abs(chev(v, w)) \
                  & <= norm(v)^2 + norm(w)^2 + 2 norm(v) dot norm(w) #tag[(by Cauchy--Schwarz)] \
                  & = (norm(v) + norm(w))^2.
  $
  Then taking the square root of both sides completes the proof.
]
Then it follows that $d(v,w) = norm(v - w)$ can be used to define a metric as it satisfies all the properties of @def:metric. Along with $V$, the associated norm then defines a metric space. Then we can define the notion of convergence of sequences in the vector space.

For a general metric space $(X,d)$, if for a sequence ${x_n}_(n in NN) subset.eq X$ such that $forall epsilon > 0$, $exists N in NN : forall m,n > N$, $d(x_n, x_m) < epsilon$; then ${x_n}$ is known as a _Cauchy sequence_.

If the metric space is $RR$ under the standard Euclidean metric, then any Cauchy sequence is convergent. However, note that on other sets this is not necessarily true; if we consider the set of rationals $QQ$, we may choose a sequence ${x_n}$ where the $n$-th element is the first $n$ digits of the decimal expansion of $uppi$: $3, 3.1, 3.14, 3.141,...$; it follows trivially that ${x_n}$ is a Cauchy sequence, although it is not convergent in $QQ$ as the accumulation point $uppi in RR$ is not in $QQ$.

A metric space is said to be _complete_ iff all Cauchy sequences are complete. Intuitively, the set of rationals cannot be complete as there are accumulation points in $RR without QQ$ to which Cauchy sequences tend, so it is incomplete in the sense that potential accumulation points are not included. In most analytical settings, we are concerned only with vector space over complete scalar fields such as $RR$ or $CC$.
#proposition[
  Any finite-dimensional (in terms of linear independence) vector space $V$ over a complete scalar field $FF$ is complete with respect the metric space derived from _any_ (nondegenerate positive-definite Hermitian) inner-product norm.
]
#proof[
  #todo[Finish this, and figure out how to do Gram--Schmidt (maybe an appendix for this)]
  #claim[

  ]
]
It is often convenient in analysis to take limits, and thus in most cases we are concerned only with complete spaces. However, infinite-dimensional vector spaces do not need to be complete under any inner-product norm, and thus completeness must be then stated as a precursory condition before further analysis can be done. These conditions now motivate for the following definition.
#definition[Hilbert Space][
  A complex vector space $V$ with a (nondegenerate) positive-definite Hermetian inner product $chev(dot, dot)$ is said to be a _Hilbert space_ iff it is complete under the associated norm $norm(dot)$.
]
#example[
  The vector space $CC^n$ with the inner product $ chev(vb(v), vb(w)) = sum_(k=1)^n v_k overline(w_k) $
  is a Hilbert space, and the metric derived from the associated norm provides the standard sense of Euclidean distance:
  $ norm(vb(v) - vb(w)) = sqrt(sum_(k=1)^n abs(v_k - w_k)^2). $
]
#example[Bergman Space][
  Let $Omega subset.eq CC$ be an open region. Let $ A^2 (Omega) = {f "holomorphic on" Omega : integral.double_Omega abs(f(z))^2 dx dy < oo}. $
  Then $A^2(Omega)$ is a vector space over $CC$ with the standard definition of addition and scalar multiplication. Then the inner product defined by
  $
    chev(f, g) = integral.double_Omega f(z) overline(g(z)) dx dy quad "where" quad z = x + ii y
  $ <eq:hilbert-space-bergman-space-inner-product>
  for any two $f, g in A^2(Omega)$ defines a Hilbert space with $A^2 (Omega)$.
] <ex:hilbert-space-bergman-space>
#proof[
  Firstly, the inner product is well-defined as
  $
    abs(f(z) overline(g(z))) & <= 2 abs(f(z)) abs(g(z)) \
                             & = abs(f(z))^2 + abs(g(z))^2 - (abs(f(z)) - abs(g(z)))^2 \
                             & <= abs(f(z))^2 + abs(g(z))^2,
  $
  which provides the absolute convergence of @eq:hilbert-space-bergman-space-inner-product, and @itm:inner-product-nondegeneracy of @def:inner-product follows from the same logic as in @ex:inner-product-C-0-1-CC.
  #claim[
    For any $h in A^2(Omega)$, $w in Omega$, $exists r > 0$ such that $overline(D(z, r)) subset.double Omega$. For $0 < rho < r$, $ abs(h(z)) <= 1 / (r sqrt(uppi)) norm(h). $
  ]
  #proof[of the claim][
    By the mean-value property,
    $ h(z) & = 1 / (2 uppi) integral_0^(2 uppi) h(z + rho ee^(ii theta)) dtheta. $
    Therefore,
    $
      1 / r^2 integral_0^r 2 rho h(z) dif rho &= 1 / r^2 integral_0^r 2 rho [1 / (2 uppi) integral_0^(2 uppi) h(z + rho ee^(ii theta)) dtheta] dif rho \
      h(z) &= 1 / (uppi r^2) integral_0^r integral_0^(2 uppi) h(z + rho ee^(ii theta)) rho dtheta dif rho \
      &= 1 / (uppi r^2) integral_D(z, r) h(zeta) dif xi and dif eta. #tag[(where $zeta = xi + ii eta$)]
    $
    Thus,
    $ abs(h(z)) <= 1 / (uppi r^2) integral_D(z, r) abs(h(zeta)) dot 1 dif xi and dif eta. $
    By the Cauchy--Schwarz Inequality ($integral abs(f g) <= sqrt(integral abs(f)^2)sqrt(integral abs(g)^2)$), we have
    $
      abs(h(z)) & <= 1 / (uppi r^2) sqrt(integral_D(z, r) abs(h(zeta))^2 dif xi and dif eta) sqrt(integral_D(z, r) dif xi and dif eta) \
      & = 1 / (r sqrt(uppi)) norm(h). qedhere
    $
  ]
  With the claim in mind, we now proceed to prove the completeness of the metric space.

  Let $K subset.double Omega$ be arbitrary and let ${f_n}_(n in NN) subset.eq A^2 (Omega)$ be any Cauchy sequence in the inner product space. Then there is a $r > 0$ such that $forall z in K$, $overline(D(z, r)) subset.double Omega$. Then $forall epsilon >0$, $exists N > 0$ such that $forall m, n > N$, $norm(f_n - f_m) < epsilon / (sqrt(uppi) r)$. By the claim applied to $h equiv f_n - f_m in A^2 (Omega)$,
  $ sup_(z in K) abs(f_n (z) - f_m (z)) <= 1 / (r sqrt(uppi)) norm(f_n - f_m) < epsilon, $
  hence giving that ${f_n}$ uniformly converges in $K$. Since $K$ was arbitrary, ${f_n}$ locally uniformly converges in $Omega$, and converges by the Weierstrass Convergence Theorem (@thm:weierstrass-convergence) to a holomorphic function $f$ on $Omega$. It remains to show that $f in A^2 (Omega)$.

  Observe that by uniform convergence of ${abs(f_n)^2}$ on any compact $K subset.double Omega$,
  $
    integral.double_K abs(f(z))^2 dif A = integral.double_K lim_(n -> oo) abs(f_n (z))^2 dif A = lim_(n -> oo) integral.double_K abs(f_n (z))^2 dif A
  $
  by uniform convergence on a compact set. Note that any Cauchy sequence is bounded: fixing $n$, then for all $m > N$
  $ norm(f_n - f_m) < epsilon ==> norm(f_m) < norm(f_n) + epsilon $
  by the reverse triangle inequality for metric spaces. Let
  $ M = max({norm(f_n) + epsilon} union {norm(f_m) : m <= N}) $ Therefore,
  $
    integral.double_K abs(f(z))^2 dif A <= lim_(n -> oo) integral.double_Omega abs(f_n (z))^2 dif A = lim_(n -> oo) norm(f_n) <= M.
  $
  Therefore, $f in A^2 (Omega)$, proving completeness as any Cauchy sequence converges.
]
The study of the Bergman space $A^2 (Omega)$ will become important later on as we aim to prove the following:
#quote(block: true)[
  If $partial Omega_1$ and $Omega_2$ are $C^oo$ Jordan curves, then $phi$ extends continuously and injectively to $partial Omega_1$ and is $C^oo$ on $overline(Omega_1)$.
]
(Recall that this was briefly mentioned in @sec:boundary-continuity-of-biholomorphisms; we have already proven the two other main cases, namely when the boundaries are merely Jordan and when the boundaries are real-analytic.)

For the remainder of this section, we will develop general properties of Hilbert spaces. Note that in a Hilbert space closedness and boundedness do not necessarily imply compactness (recall that compactness is most generally defined by the notion of finite subcovers), although compactness will always imply closedness and boundedness.
#example[
  Show that there exists a Hilbert space $H$ such that there is a closed, bounded#footnote[With respect to the induced topology from the metric space and the associated norm.] set $X subset.eq H$ that is not compact.
] <ex:hilbert-space-closed-bounded-but-not-compact>
#solution[to @ex:hilbert-space-closed-bounded-but-not-compact][
  Let $H = DD$ with the inner product
  $ chev(z_1, z_2) = sqrt([Re(z_1) Re(z_2)]^2 + [Im(z_1)Im(z_2)]^2). $
  Then the associated norm $norm(dot)$ is simply the Euclidean distance. Then under the induced metric topology, $H subset.eq H$ is closed and bounded, but not compact, as it can be covered by the open cover ${D(0, 1 - 1 / n)}_(n = 2)^oo$, which does not admit a finite subcover.
]
#definition[

]
#figure-wrapper[
  #figure(
    canvas(
      {
        import cetz.draw: *
        set-style(mark: (fill: black))
        let y = (7, 0)
        let x = (2, 4)
        line((0, 0), x, mark: (end: ">>"), name: "x")
        line((0, 0), y, mark: (end: ">>"), name: "y")
        line(y, (rel: x, to: y), x)
        line((0, 0), (rel: x, to: y), mark: (end: ">>"), name: "x+y")
        line(y, x, mark: (end: ">>"), name: "x-y")
        content("x.75%", math-rect($ x $))
        content("y.75%", math-rect($ y $))
        content("x+y.75%", math-rect($ x + y $))
        content("x-y.75%", math-rect($ x - y $))
      },
      // debug-show: true,
    ),
    caption: [A geometric visualization of the Parallelogram Law.],
  ) <fig:parallelogram-law>
]
#theorem[Parallelogram Law][
  Let $H$ be a Hilbert space. Then for any $x, y in H$, $ 2 norm(x)^2 + 2 norm(y)^2 = norm(x+y)^2 + norm(x-y)^2. $
  (More generally, the sum of the squares of the sides of a parallelogram is equal to the sum of the squares of the diagonals; see @fig:parallelogram-law)
]
