#import "/lib.typ": *

== Topological Equivalence and Biholomorphic Equivalence

#lemma[
  If $bold(P)$ is a permutation matrix, and $bold(D)$ is a diagonal matrix, then there exists a diagonal matrix $bold(D)'$ such that $bold(P) bold(D) = bold(D)' bold(P)$. Similarly, there exists a diagonal matrix $bold(D)''$ such that $bold(D) bold(P) = bold(P) bold(D)''$.
] <lem:monomial_matrix_diagonal_multiplication_commute>
#proof[
  Let $bold(D) = diag(d_1, dots, d_n)$ and let $sigma$ be the permutation corresponding to $bold(P)$, $bold(P) bold(e)_i = bold(e)_(sigma(i))$ for each standard basis vector $bold(e)_i$. Define $ bold(D)' = diag(d_(sigma^(-1)(1)), dots, d_(sigma^(-1)(n))). $
  Then for every $i$,
  $ bold(P) bold(D) bold(e)_i = bold(P)(d_i bold(e)_i) = d_i bold(e)_(sigma(i)), $
  while
  $ bold(D)' bold(P) bold(e)_i = bold(D)' bold(e)_(sigma(i)) = d_i bold(e)_(sigma(i)). $
  Hence
  $ bold(P) bold(D) bold(e)_i = bold(D)' bold(P) bold(e)_i $
  for all $i$, so
  $ bold(P) bold(D) = bold(D)' bold(P). $
  Now apply this result to $bold(P)^top$, and thus, $(bold(P)^top bold(D))^top = (bold(D)'' bold(P)^top)^top <==> bold(D)^top bold(P) = bold(P) bold(D)''^top <==> bold(D P) = bold(P D)''$ since diagonal matrices are invariant under transposition.
]

#theorem("Poincaré")[
  For any $n gt.eq 2$, the $n$-dimensional unit ball $B^n$ and the $n$-dimensional polydisk $DD^n$ are not biholomorphically equivalent.
] <thm:poincarepolydiskandunitball>

#proof[
  Suppose, for the sake of contradiction, that there exists a biholomorphism $bold(phi) : DD^n -> B^n$. Let $bold(alpha) = bold(phi)(bold(0)) in B^n$, and define $bold(Phi) = bold(phi)_(norm(bold(alpha))) compose bold(U) compose bold(phi)$, where $bold(U)$ is a unitary matrix such that $bold(U) bold(alpha) = (norm(bold(alpha)), 0, dots, 0)$ and $bold(phi)_(norm(bold(alpha)))$ is as in @prop:unitballsimpleautomorphism.

  The definition of $bold(Phi)$ ensures that $bold(Phi) : DD^n -> B^n$ and $bold(Phi)(bold(0)) = bold(0)$. Then $bold(Phi)^(-1) compose Aut(B^n) compose bold(Phi)$ consists of functions mapping $DD^n$ to $DD^n$, or that
  $
    bold(Phi)^(-1) compose Aut(B^n) compose bold(Phi) subset.eq Aut(DD^n) ==> Aut(B^n) subset.eq bold(Phi) compose Aut(DD^n) compose bold(Phi)^(-1).
  $
  Similarly, $bold(Phi) compose Aut(DD^n) compose bold(Phi)^(-1) subset.eq Aut(B^n)$. Therefore, $Aut(B^n) = bold(Phi) compose Aut(DD^n) compose bold(Phi)^(-1)$, and
  $
    bold(psi) |-> bold(Phi) compose bold(psi) compose bold(Phi)^(-1)
  $ <eq:poincarepolydiskandunitball_isomorphism>
  defines a group isomorphism between $Aut(DD^n)$ and $Aut(B^n)$. Let $Aut'(DD^n) < Aut(DD^n)$ and $Aut'(B^n) < Aut(B^n)$ be subgroups fixing $bold(0)$. Therefore, @eq:poincarepolydiskandunitball_isomorphism induces a group isomorphism between $Aut'(DD^n)$ and $Aut'(B^n)$ as well.

  By @thm:holomorphicautomorphismgrouponpolydisk, every element of $Aut'(DD^n)$ may be uniquely identified with a matrix in the form of
  $
    bold(P) op("diag")(ee^(ii theta_1), dots, ee^(ii theta_n)),
  $
  where $bold(P)$ is a permutation matrix and $(theta_1, dots, theta_n) in [0, 2 uppi)^n$. Hence $Aut'(DD^n)$ is isomorphic to the group of unitary monomial matrices. The structure of $Aut'(B^n)$ is given by @prop:unitballautomorphismfixedpointatzero, and each element corresponds uniquely to a unitary matrix. Thus there is a natural isomorphism $Aut'(B^n) tilde.equiv upright("U")(n)$, the $n times n$ _unitary group_.

  For $bold(U) in upright("U")(n)$, the spectral theorem allows it to be expressed in the form of $bold(V) op("diag")(ee^(ii theta_1), dots, ee^(ii theta_n)) bold(V)^dagger$. Hence, for any positive integer $m$, we have
  $
    bold(V) op("diag")(ee^(ii (theta_1) / (m)), dots, ee^(ii (theta_n) / (m))) bold(V)^dagger in upright("U")(n)
  $
  and
  $
    (bold(V) op("diag")(ee^(ii (theta_1) / (m)), dots, ee^(ii (theta_n) / (m))) bold(V)^dagger)^m \
    ""= bold(V) op("diag")(ee^(ii (theta_1) / (m)), dots, ee^(ii (theta_n) / (m))) bold(V)^dagger dots.c bold(V) op("diag")(ee^(ii (theta_1) / (m)), dots, ee^(ii (theta_n) / (m))) bold(V)^dagger.
  $
  The adjacent products of $bold(V)^dagger bold(V)$ simplify to the identity and the entire expression then simplifies to $bold(U)$. Hence the unitary group is divisible.

  Consider the unitary monomial matrix
  $
    bold(P)_tau = mat(
      0, 1, 0, 0, dots, 0;
      1, 0, 0, 0, dots, 0;
      0, 0, 1, 0, dots, 0;
      0, 0, 0, 1, dots, 0;
      dots.v, dots.v, dots.v, dots.v, dots.down, dots.v;
      0, 0, 0, 0, dots, 1
    ).
  $
  inducing the permutation $tau$, swapping the first and second entries. Assume that there exists some unitary monomial matrix $bold(Q) = bold(P)_sigma bold(D)$ (where $bold(D)$ is diagonal and $bold(P)_sigma$ is a permutation matrix corresponding to the permutation $sigma$) such that $bold(Q)^2 = bold(P)_tau$. This is equivalent to
  $
    bold(P)_sigma bold(D) bold(P)_sigma bold(D) = bold(P)_tau ==> bold(P)_sigma bold(P)_sigma bold(D)'bold(D) = bold(P)_tau ==> bold(P)_sigma^2 bold(D)'' = bold(P)_tau,
  $
  where $bold(D)'$ and $bold(D)''$ are diagonal matrices, where the former existence are given by @lem:monomial_matrix_diagonal_multiplication_commute. Thus, $bold(P)_sigma^2 = bold(P)_tau$ (and $bold(D)'' = bold(I)$) since their permutation parts must match. This is an impossibility since $bold(P)_sigma^2$ corresponds to an even permutation, while $bold(P)_tau$ corresponds to an odd permutation. Thus, the unitary monomial group is not divisible.

  By @prop:groupdivisibilitypreservedunderisomorphisms, the two groups cannot be isomorphic to each other.

  This contradicts the existence of @eq:poincarepolydiskandunitball_isomorphism, and therefore, no such biholomorphism $bold(phi)$ exists.
]

#remark[
  A more succinct proof of the nonexistence of an isomorphism in the proof of @thm:poincarepolydiskandunitball can be briefly described by means of topology:

  #quote(block: true)[
    Let $M_n$ denote the subgroup of all monomial matrices in $upright("U")(n)$, or the subgroup of unitary matrices with exactly one nonzero entry in each row and each column, and those nonzero entries lying in $upright("U")(1)$.

    For each permutation $sigma in S_n$ (the _symmetric group_ of permutations) let $bold(P)_sigma$ be the corresponding permutation matrix and define
    $
      T_sigma = {bold(D) bold(P)_sigma : bold(D) = op("diag")(ee^(ii theta_1), dots, ee^(ii theta_n)) in upright("U")(1)^n}.
    $
    Each $T_sigma$ is homeomorphic to the torus $upright("U")(1)^n$, and every element of $M_n$ lies in exactly one $T_sigma$. Hence
    $
      M_n = union.big_(sigma in S_n) T_sigma,
    $
    a disjoint union of $abs(S_n) = n !$ copies of $upright("U")(1)^n$.

    Each $T_sigma$ is clopen in $M_n$ by their pairwise disjointness, the topology of the torus, and the fact that their union is $M_n$. Therefore each $T_sigma$ is a connected component of $M_n$. Because each $T_sigma$ is connected, $M_n$ has $n !$ connected components.

    The elements of $upright("U")(n)$ may be unitarily diagonalized (by the spectral theorem) into $bold(V) bold(D) bold(V)^dagger$, where
    $
      bold(D) = op("diag")(ee^(ii theta_1), dots, ee^(ii theta_n))
    $
    is a diagonal unitary matrix and $bold(V) in upright("U")(n)$. Then there exists a connected path connecting $(theta_1, dots, theta_n)$ to $(0, dots, 0)$, which corresponds to the matrix $bold(V) bold(I) bold(V)^dagger = bold(I)$. Because every matrix is path-connected to the identity, $upright("U")(n)$ is connected.

    Consequently for $n gt.eq 2$, the subgroup $M_n$ (which has more than one connected component) cannot be isomorphic to $upright("U")(n)$ as a topological group.
  ]
  Although we do not justify these topological claims in detail here, it is worth noting, heuristically, why such topological considerations naturally arise.

  A biholomorphism between two domains induces a homeomorphism with respect to their natural topologies (the _compact-open topology_) by $bold(psi) |-> bold(Phi) compose bold(psi) compose bold(Phi)^(-1)$. Hence any induced topological invariant of an automorphism group, such as connectivity, is to be preserved under this equivalence. Of course, we are yet to verify the rigor and intuition used within the topology, but the intuitive picture already hints to the validity of the connectivity argument.
]
