#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Geometry of a Hilbert Space],
  route: "geometry-of-a-hilbert-space",
)

The concept of a _vector space_ is an important one in linear algebra. However, its definition itself does not actually imply that the "vectors" are tuples of values of finite dimension. As a matter of fact the term "vector" is a very general one. Developments in the 20th century have rigorously defined vectors with infinite dimensions.

#definition[Inner Product][
  Let $V$ be a vector space. Then a function $ chev(dot, dot) : V^2 -> CC $
  is said to be a _positive-definite nondegenerate Hermitian inner product_ iff
  + For any $v_1, v_2, w in V$, $chev(v_1 + v_2, w) = chev(v_1, w) + chev(w_2, w)$ (additivity in the first argument). #enum-lbl(<itm:inner-product-left-additivity>)
  + For any $alpha in CC$, $v, w in V$, $chev(alpha v, w) = alpha chev(v, w)$ (linearity in the first argument)
  + For any $v, w in V$, $chev(v, w) = overline(chev(w, v))$ (conjugate-symmetry)
  + For any $v in V$, $chev(v, v) >= 0$ (semi-positive-definiteness)
  + For $v in V$, $chev(v, v) = 0$ iff $v = 0$
] <def:inner-product>
Note that additivity holds in the second argument as well since
$
  chev(v, w_1 + w_2) & = overline(chev(w_1 + w_2, v)) \
                     & = overline(chev(w_1, v)) + overline(chev(w_2, v)) = chev(v, w_1) + chev(v, w_2)
$
and conjugate-linearity holds in the second argument since
$
  chev(v, alpha w) & = overline(chev(alpha w, v)) = overline(alpha chev(w, v)) = overline(alpha) chev(v, w).
$
