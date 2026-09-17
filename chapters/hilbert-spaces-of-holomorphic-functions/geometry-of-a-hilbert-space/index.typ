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
  + For any $alpha in CC$, $v, w in V$, $chev(alpha v, w) = alpha chev(v, w)$ (linearity in the first argument) #enum-lbl(<itm:inner-product-left-linearity>)
  + For any $v, w in V$, $chev(v, w) = overline(chev(w, v))$ (conjugate-symmetry) #enum-lbl(<itm:inner-product-conjugate-symmetry>)
  + For any $v in V$, $chev(v, v) >= 0$ (semi-positive-definiteness) #enum-lbl(<itm:inner-product-semi-positive-definiteness>)
  + For $v in V$, $chev(v, v) = 0$ iff $v = 0$ (non-degeneracy) #enum-lbl(<itm:inner-product-non-degeneracy>)
] <def:inner-product>
Note that @itm:inner-product-non-degeneracy and @itm:inner-product-semi-positive-definiteness, imply positive-definitness: for $v != 0$, $chev(v, v) > 0$.
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
We provide examples of vector spaces and their corresponding non-degenerate Hermetian inner products:
#example[
  Let $V = C^n$ ($n in NN$) be a vector space under the usual operations, and define $ chev(vb(v), vb(w)) = sum_(k=1)^n v_k overline(w_k), $
  where $vb(v) = (v_1, dots, v_n)$ and $vb(w) = (w_1, dots, w_n)$ are vectors in $V$. Then $chev(dot, dot)$ is a non-degenerate Hermetian inner product (the verification of the properties are trivial).
]
The verification of the necessary properties is trivial.
#example[
  Let $V = C([0,1], CC)$, with addition and multiplication defined as in the usual sense. Then if $f, g in V$, define
  $ chev(f, g) = integral_0^1 f(x) overline(g(x)) dx. $
]
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
// comment abt metric definition needing this
