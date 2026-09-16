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
]
Moreover,

We provide examples of vector spaces and their corresponding non-degenerate Hermetian inner products:
#example[
  Let $V = C^n$ ($n in NN$) be a vector space under the usual operations, and define $ chev(vb(v), vb(w)) = sum_(k=1)^n v_k overline(w_k), $
  where $vb(v) = (v_1, dots, v_n)$ and $vb(w) = (w_1, dots, w_n)$ are vectors in $V$. Then $chev(dot, dot)$ is a non-degenerate Hermetian inner product (the verification of the properties are trivial).
]
The verification of the necessary properties is trivial.
#example[
  Let $V = C([0,1], CC)$, with addition and multiplication defined as in the usual sense. Then if $f, g in V$, define
  $ f(x) overline(g(x)) dx. $
]
#proof[
  The verification of
]

#definition[

]
