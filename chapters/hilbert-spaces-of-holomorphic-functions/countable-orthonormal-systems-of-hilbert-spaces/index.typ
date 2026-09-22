#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Countable Orthonormal Systems of a Hilbert Space],
  route: "countable-orthonormal-systems-of-a-hilbert-space",
)
We first aim to provide a generalization of bases which will serve useful in generalizing vector spaces to infinite dimensions.
#definition[Orthonormal System][
  Let $H$ be a Hilbert space. Let $I$ be any (countable) set. A set ${u_n}_(n in I) subset.eq H$ is an _orthonormal system_ iff $forall n, m in I$,
  $ chev(u_n, u_m) = delta_(n m) = cases(1 quad & "if" quad n = m, 0 quad & "if" quad n != m). $
  We will consider only the cases where $I$ is finite or when $I$ is countably infinite ($I = NN$), although the generalization to uncountable sets follows in the same way.
]
