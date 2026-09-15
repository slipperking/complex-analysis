#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Geometry of a Hilbert Space],
  route: "geometry-of-a-hilbert-space",
)

The concept of a _vector space_ is an important one in linear algebra. However, its definition itself does not actually imply that the "vectors" are tuples of values of finite dimension. As a matter of fact the term "vector" is a very general one. Developments in the 20th century have rigorously defined vectors with infinite dimensions.

#definition[Inner Product][
  Let $V$ be a vector space. Then a function $ chev(dot, dot) : V^2 -> CC $
  is said to be a _positive-definite nondegenerate Hermitian inner product_ iff
  + For any $v_1, v_2, w in V$, $chev(v_1 + v_2, w) = chev(v_1, w) + chev(w_2, w)$ (left additivity).
  + For any $alpha in CC$, $v, w in V$, $chev(alpha)$
]
