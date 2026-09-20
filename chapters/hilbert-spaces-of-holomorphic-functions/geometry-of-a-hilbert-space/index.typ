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
  + For any $alpha in CC$, $v, w in V$, $chev(alpha v, w) = alpha chev(v, w)$ (homogeneity in the first argument). #enum-lbl(<itm:inner-product-left-homogeneity>)
  + For any $v, w in V$, $chev(v, w) = overline(chev(w, v))$ (conjugate-symmetry/Hermetian). #enum-lbl(<itm:inner-product-conjugate-symmetry>)
  + For any $v in V$, $chev(v, v) >= 0$. (positive semi-definiteness) #enum-lbl(<itm:inner-product-positive-semi-definiteness>)
  + For $v in V$, $chev(v, v) = 0$ iff $v = 0$ (nondegeneracy). #enum-lbl(<itm:inner-product-nondegeneracy>)
  Then the space $V$ together with the inner product is known as an _inner product space_.
] <def:inner-product>
Note that @itm:inner-product-nondegeneracy and @itm:inner-product-positive-semi-definiteness, imply positive-definitness: for $v != 0$, $chev(v, v) > 0$.

To avoid pedantry, for the proceeding passages, the use of "inner product" will assume positive-definiteness, nondegeneracy, and conjugate-symmetry.
#proposition[
  Let $V$ be a vector space over $CC$ and let $chev(dot, dot)$ be a positive-definite nondegenerate Hermetian inner product. Then for $v, w, w_1, w_2 in V$ and $alpha in CC$,
  + $chev(v, w_1 + w_2) = chev(v, w_1) + chev(v, w_2)$ (additivity in the second argument). #enum-lbl(<itm:inner-product-right-additivity>)
  + $chev(v, alpha w) = overline(alpha) chev(v, w)$ (conjugate-homogeneity in the second argument). #enum-lbl(<itm:inner-product-right-conjugate-homogeneity>)
  + $chev(v, 0) = chev(0, v) = 0$. #enum-lbl(<itm:inner-product-linearity-with-zero-vector>)
  + $chev(v + w, v + w) = chev(v, v) + chev(w, w) + 2 Re chev(v, w)$. #enum-lbl(<itm:inner-product-distributivity>)
] <prop:inner-product-properties>
#proof[
  Observe that @itm:inner-product-right-additivity holds since
  $
    chev(v, w_1 + w_2) & = overline(chev(w_1 + w_2, v)) \
                       & = overline(chev(w_1, v)) + overline(chev(w_2, v)) = chev(v, w_1) + chev(v, w_2)
  $
  and conjugate-homogeneity (@itm:inner-product-right-conjugate-homogeneity) holds in the second argument since
  $
    chev(v, alpha w) & = overline(chev(alpha w, v)) = overline(alpha chev(w, v)) = overline(alpha) chev(v, w).
  $
  Letting $alpha = 0$ on $chev(alpha v, v)$ gives @itm:inner-product-linearity-with-zero-vector, while @itm:inner-product-distributivity is a consequence of additivity.
]
We provide examples of vector spaces and their corresponding nondegenerate Hermetian inner products:
#example[
  Let $V = C^n$ ($n in NN$) be a vector space under the usual operations, and define $ chev(vb(v), vb(w)) = sum_(k=1)^n v_k overline(w_k), $
  where $vb(v) = (v_1, dots, v_n)$ and $vb(w) = (w_1, dots, w_n)$ are vectors in $V$. Then $chev(dot, dot)$ is a nondegenerate Hermetian inner product.
]
The verification of the necessary properties is trivial.
#example[
  Let $V = C([0,1], CC)$, with addition and multiplication defined as in the usual sense. Then if $f, g in V$, define
  $ chev(f, g) = integral_0^1 f(x) overline(g(x)) dx. $
] <ex:inner-product-C-0-1-CC>
#proof[
  The verification of properties @itm:inner-product-left-additivity, @itm:inner-product-left-homogeneity, @itm:inner-product-conjugate-symmetry, @itm:inner-product-positive-semi-definiteness (in @def:inner-product) are somewhat trivial. The reverse implication of @itm:inner-product-distributivity is obvious. For $f in V$ such that
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
  Show that there exists a Hilbert space $H$ such that there is a closed, bounded#footnote[With respect to the induced topology from the metric space and the associated norm.] set $S subset.eq H$ that is not compact.
] <ex:hilbert-space-closed-bounded-but-not-compact>
#solution[to @ex:hilbert-space-closed-bounded-but-not-compact][
  Let $H = DD$ with the inner product
  $ chev(z_1, z_2) = sqrt([Re(z_1) Re(z_2)]^2 + [Im(z_1)Im(z_2)]^2). $
  Then the associated norm $norm(dot)$ is simply the Euclidean distance. Then under the induced metric topology, $H subset.eq H$ is closed and bounded, but not compact, as it can be covered by the open cover ${D(0, 1 - 1 / n)}_(n = 2)^oo$, which does not admit a finite subcover.
]
The following properties we define will be useful in serving as a replacement for compactness:
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
  Let $H$ be an inner product space (or a Hilbert space). Then for any $x, y in H$, $ 2 norm(x)^2 + 2 norm(y)^2 = norm(x+y)^2 + norm(x-y)^2. $
  (More generally, the sum of the squares of the sides of a parallelogram is equal to the sum of the squares of the diagonals; see @fig:parallelogram-law)
] <thm:parallelogram-law>
#proof[
  By @itm:inner-product-distributivity of @prop:inner-product-properties,
  $
    norm(x + y)^2 = norm(x)^2 + norm(y)^2 + 2 Re chev(x, y)
  $
  and
  $
    norm(x - y)^2 = norm(x)^2 + norm(y)^2 - 2 Re chev(x, y).
  $
  Adding the two equations gives the desired result.
]
#figure-wrapper[
  #figure(
    canvas(
      {
        import cetz.draw: *
        catmull(
          (-3, 1),
          (2, 3),
          (1, -3),
          (-2, -1.5),
          close: true,
        )
        circle((1.6, 2.7), radius: 2pt, fill: black, name: "a")
        circle((-1.7, -1), radius: 2pt, fill: black, name: "b")
        line("a", "b")
        translate(x: 5.5)
        catmull(
          (-2, 1),
          (2, 3),
          (0.5, 0),
          (2, -3),
          (-1.5, -1.5),
          close: true,
          name: "non-convex-reg",
        )
        circle((1.3, 2.3), radius: 2pt, fill: black, name: "c")
        circle((1.7, -2.7), radius: 2pt, fill: black, name: "d")
        hide(line("c", "d", name: "cd"))
        intersections("non-convex-bounds", "cd", "non-convex-reg")
        let max = (..args) => args.pos().fold((-10000, -10000, 0), (a, b) => if a.at(1) > b.at(1) { a } else { b })
        let min = (..args) => args.pos().fold((10000, 10000, 0), (a, b) => if a.at(1) < b.at(1) { a } else { b })
        line((max, "c", "d"), (max, "non-convex-bounds.0", "non-convex-bounds.1"))
        line((min, "c", "d"), (min, "non-convex-bounds.0", "non-convex-bounds.1"))
        line("non-convex-bounds.0", "non-convex-bounds.1", stroke: (dash: "dashed"))
      },
      // debug-show: true,
    ),
    caption: [A set which is convex (left) and one which is not (right).],
  ) <fig:convex-set>
]
#definition[Convexity][
  A set $F$ in a Hilbert space $H$ is said to be _convex_ iff $forall x, y in F$ and $forall t in (0, 1)$, $x + t (y - x) in F$. In other words, convexity means that the straight line segment between any two points lies in the set (see @fig:convex-set).
]
Note that if $F subset.eq H$ is a vector space, then $F$ is trivially convex by the definition of a vector space.
#definition[Orthogonality][
  Two vectors $x,y$ in a Hilbert space $H$ are said to be _orthogonal_ ($x perp y$) iff their inner product is $0$.
]
#definition[
  Let $H$ be a Hilbert space. A subspace $S subset.eq H$ is said to be orthogonal to a vector $x in H$ ($x perp S$) iff $forall y in S$, $x perp y$.
]
#definition[Orthogonal Complement][
  Let $x in H$, where $H$ is a Hilbert space, then for $x in H$, define the _orthogonal component_ of $x$ to be $x^perp = {y in H : x perp y}$. Let $V subset.eq H$ be a subset (not necessarily a vector space). Then the _orthogonal complement_ of $V$, given by $ V^perp = {x in H : forall y in H, x perp y}, $ is the space of vectors orthogonal to every vector in $V$.
]
It is simple to verify that the orthogonal complement of a vector or set is always a vector space.
#definition[Vector Projection][
  Let $y in H without {0}$, where $H$ is a Hilbert space. For any $x in H$, the projection of $x$ onto $y$ is the unique vector $lambda y$ (where $lambda$ is a scalar) such that $chev(x - lambda y, y) = 0$, which is given by
  $ lambda y = chev(x, y) / norm(y)^2 y $
  (immediate from additivity).
]
We can make geometric sense of this definition in the case where $chev(dot, dot)$ is the Euclidean dot product.
#proposition[
  Let $H$ be a Hilbert space and let $F subset.eq H$ be a convex set. Let $m = inf_(x in F) norm(x)$. Then
  $ norm(x - y)^2 <= norm(x)^2 + norm(y)^2 - 4 m^2. #tag[(where $x,y in F$)] $
] <prop:hilbert-space-convex-set-difference-norm-inequality>
#proof[
  By the Parallelogram Law (@thm:parallelogram-law),
  $ norm(x - y)^2 = norm(x)^2 + norm(y)^2 - norm(x + y)^2 $
  for any $x,y in F$. By convexity, the midpoint $(x + y) / 2 in F$, giving
  $ norm((x + y) / 2)^2 >= m^2 ==> norm(x + y)^2 >= 4 m^2. $
  Then $ norm(x - y)^2 <= norm(x)^2 + norm(y)^2 - 4 m^2. qedhere $
]
The following result shows how the convexity can be used in place of traditional compactness arguments:
#proposition[
  Let $F subset.eq H$ be a closed, convex set in a Hilbert space $H$ and let $m = inf_(x in F) norm(x)$. Then $exists! x' in F$ such that $norm(x') = m$.
]
#proof[
  By the definition of infimum, either the infimum is attained (in which case we are done), or the infimum is an accumulation point in $RR_(>= 0)$ of norms of vectors in $F$. Assume the latter case. Then there is a sequence ${x_n}_(n in NN)$ such that $norm(x_n) -> m$. Then for all $epsilon > 0$, $exists N in NN$ such that $sup_(n > N) abs(norm(x_n)^2 - m^2) < epsilon / 4$. Then by @prop:hilbert-space-convex-set-difference-norm-inequality,
  $ sup_(n, m > N) norm(x_n - x_m)^2 <= sup_(n, M > N) 2 norm(x_n)^2 + 2 norm(x_m)^2 - 4 m^2 < epsilon. $
  Therefore, $x_n$ is a Cauchy sequence, and converges to some $x' in H$. Since $F$ is closed in $H$, $x' in F$. Moreover, by the reverse triangle inequality,
  $ abs(norm(x') - norm(x_n)) <= norm(x' - x_n) -> 0 $
  by convergence. Then $norm(x_n) -> norm(x')$, giving $norm(x') = m$.

  To show that $x'$ is the unique element of least norm, assume $x'' in H$ is another vector with norm $m$. Then once again applying @prop:hilbert-space-convex-set-difference-norm-inequality,
  $ norm(x' - x'') <= norm(x')^2 + norm(x'')^2 - 4 m^2 = 0 ==> x' = x''. qedhere $
]
#remark[
  To make sense of uniqueness from a geometric viewpoint, we consider a closed convex set $F subset.eq H = CC$ with $m = min{abs(z) : z in F} > 0$. Then $D(0, m) inter F = emptyset$.

  Then $m ee^(ii theta_1) in F$ for some $theta_1$. If there is another point $m ee^(ii theta_2) in F$, then the straight segment between them lies in $F$ by convexity. This straight line must intersect $D(0, m)$, which is a contradiction.
]
#proposition[
  The intersection between any vector subspace $V$ of a Hilbert space $H$ and its orthogonal complement $V^perp$ is ${0}$.
] <prop:V-V-perp-intersection-is-trivial>
#proof[
  For $x in V$ and $x in V^perp$ to be simultaneously true, we must have $chev(x, x) = norm(x)^2 = 0$, implying $x = 0$.
]
#theorem[Orthogonal Decomposition][
  Let $K subset.eq H$ be a closed vector subspace. Then $forall x_0 in H$, $exists! x_1 in K : exists! x_2 in K^perp : x_0 = x_1 + x_2$. Moreover, $x_2 in x_0 + K = {x_0 + k : k in K}$ and is the unique element satisfying $norm(x_2) = inf_(x in x_0 + K) norm(x)$.
] <thm:orthogonal-decomposition>
#proof[
  Observe that $x_0 + K$ is convex as $K$ is convex; then $exists! x_2 in x_0 + K$ attaining the least norm $m >= 0$ (by @prop:V-V-perp-intersection-is-trivial). Let $k_2 = x_2 - x_0 in K$ and let $x_1 = x_0 - x_2 = -k_2$. We claim that these are the desired values for $x_1, x_2$.

  We obtain immediately that $x_1 in K$ since $k_2 in K$. For any $y in K$, projecting $x_2$ onto $y$ gives
  $ op("proj")_y x_2 = chev(x_2, y) / norm(y)^2 y in K. $
  #todo[Add potential figure]
  Let $p = x_2 - op("proj")_y x_2 = x_0 + k_2 - op("proj")_y x_2 in x_0 + K$. By the minimality of $m$,
  $
    norm(x_2)^2 & <= norm(p)^2 = norm(x_2 - op("proj")_y x_2)^2 \
                & = norm(x_2)^2 + norm(chev(x_2, y) / norm(y)^2 y)^2 - 2 Re chev(x_2, chev(x_2, y) / norm(y)^2 y) \
                & = norm(x_2)^2 + abs(chev(x_2, y) / norm(y)^2)^2 norm(y)^2 - 2 abs(chev(x_2, y))^2 / norm(y)^2 \
                & = norm(x_2)^2 - abs(chev(x_2, y))^2 / norm(y)^2 \
                & <= norm(x_2)^2,
  $
  which means all inequalities are equalities, giving that $chev(x_2, y) = 0$. Since $y in K$ was arbitrary, $x_2$ is orthogonal to the entire vector space $K$, hence $x_2 in K^perp$.

  If $x = x'_1 + x'_2$ is another decomposition, then
  $
    K in.rev x'_1 - x_1 = x_2 - x'_2 in K^perp.
  $
  Since $K inter K^perp = {0}$, the uniqueness follows.
]
#corollary[
  The orthogonal complement of any closed proper subspace of a Hilbert space contains a nonzero element.
]
#proof[
  Let the Hilbert space be $H$, let the subspace be $K$. Choose $x in H without K$. Then $x = x_1 + x_2$, where $x_1 in K$, $x_2 in K^perp$ (by @thm:orthogonal-decomposition). Then $x_2 != 0$ as otherwise $x = x_1 in K$.
]
#definition[Linear Functional][
  Let $V$ be a vector space over a field $FF$. Then a _linear functional_ is a mapping
  $ phi.alt : V -> FF $
  that is linear: for $x, y in H$, $phi.alt(alpha x) = alpha phi.alt(x)$ (homogeneous) for $alpha in FF$ and $phi.alt(x + y) = phi(x) + phi(y)$ (additive).
]
(We will only consider the case if $V = H$ is a Hilbert space. Then linear functionals map to $CC$.)
#definition[
  Let $H$ be a Hilbert space. Then a linear functional $phi.alt$ on $H$ is _bounded_ iff $exists C > 0$ such that $ abs(phi.alt(x)) <= C norm(x). #tag[($forall x in H$)] $
]
#definition[
  Let $H$ be a Hilbert space. Then a linear functional $phi.alt$ on $H$ is _continuous_ iff for any convergent sequence ${x_n} subset.eq H$ ($x_n -> x_oo in H$), $phi.alt(x_n) -> phi.alt(x_oo)$.
]
In mathematical literature, "continuous" and "bounded" are often interchangeably used:
#theorem[
  A linear functional on a Hilbert space is bounded iff it is continuous.
]
#proof[
  (Denote the functional by $phi.alt$, the Hilbert space by $H$.)

  1. Continuity implies boundedness (assume continuity).

    Assume the boundedness does not hold. Then for any $n > 0$ there exists $x in H$ such that
    $
      abs(phi(x)) > n norm(x) ==> abs(phi(x / (n norm(x)))) > 1. #tag[(by homogeneity)]
    $
    Therefore, $forall n in NN$, $exists x_n in H$ with $norm(x_n) = 1 / n$ such that $abs(phi(x_n)) > 1$; then $x_n -> x_oo = 0$. By continuity, $norm(phi.alt(x_n) - phi.alt(x_oo)) = norm(phi.alt(x_n)) -> 0$, is an impossibility, since $norm(phi.alt(x_n) - phi.alt(x_oo)) > 1$ for each $n in NN$.

    Then by contradiction, boundedness must hold.
  + Boundedness implies continuity.

    For any sequence ${x_n}_n subset.eq H$ converging to $x_oo in H$,
    $ abs(phi(x_n) - phi(x_oo)) = abs(phi(x_n - x_oo)) <= C norm(x_n - x_oo) -> oo. qedhere $
]
