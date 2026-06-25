#import "/lib.typ": *
#show: docs-subsubchapter.with(
  title: [The Group of Meromorphic Automorphisms on $extcomplex$],
  route: "extended-plane-holomorphic-automorphisms",
)
It is generally common to consider a meromorphic function as a function in the form of $f: U -> extcomplex$. Let $Aut(extcomplex)$ denote the group of meromorphic automorphisms on $extcomplex$.

To make more profound conclusions on the structure of $Aut(extcomplex)$, we will introduce certain concepts from group theory.

#lbl(
  definition[Coset][
    Let $G$ be a group, and let $H <= G$ be a subgroup (operation denoted by juxtaposition). Then the _left coset_ of $H$ in $G$ with respect to $g in G$ is defined as
    $
      g H = { g h : h in H }.
    $
    The _right coset_ is defined as
    $
      H g = { h g : h in H }.
    $
    The subgroup $H$ is _normal_ iff the left and right cosets are equal. The notation $H lt.closed.eq G$ is used to represent a normal subgroup. Cosets, like groups and sets, are unordered.
  ],
  <def:coset>,
)

#theorem[
  Let $G$ be a group and $N <= G$ a subgroup. The set of left cosets
  $
    G \/ N = { g N : g in G }
  $
  admits a group structure with operation
  $
    (g N) (h N) = (g h) N
  $
  if and only if $N$ is a normal subgroup of $G$ (i.e. $N lt.closed.eq G$).
]

#proof[
  We prove the two implications separately.

  + _If $N lt.closed.eq G$ then $G \/ N$ is a group._

    Assume $N$ is normal, $N lt.closed.eq G$, so $g N g^(-1) = N$ for every $g in G$ (equivalently $g^(-1) N g = N$). Define a product on $G \/ N$ by
    $
      (g N) (h N) = (g h) N.
    $
    We now verify that this product is well-defined: if $g N = g' N$ and $h N = h' N$ then we need $(g h) N = (g' h') N$. Since $g N = g' N$, there exists $n_1 in N$ with $g' = g n_1$, and since $h N = h' N$ there exists $n_2 in N$ with $h' = h n_2$. Then
    $
      g' h'
      = (g n_1) (h n_2)
      = g (n_1 h) n_2
      = g h (h^(-1) n_1 h) n_2.
    $
    Because $N$ is normal we have $h^(-1) n_1 h in N$, and $n_2 in N$, so $(h^(-1) n_1 h) n_2 in N$. Hence $g' h' in (g h) N$, meaning that $(g' h') N = (g h) N$. Thus the product is well-defined.

    Associativity follows from associativity in $G$:
    $
      ((g N) (h N)) (k N) = (g h k) N = (g N) ((h N) (k N)).
    $
    The identity is $e N = N$, since $(e N) (g N) = (e g) N = g N$ and similarly on the other side. The inverse of $g N$ is $g^(-1) N$, because $(g N) (g^(-1) N) = (g g^(-1)) N = N$. Thus $G \/ N$ is a group.

  + _If $G \/ N$ can be given a group structure via the coset multiplication, then $N lt.closed.eq G$._

    Fix $g in G$ and $n in N$ arbitrarily. By assumption, we have
    $
      (g N) (n N) (g^(-1) N) = (g n g^(-1)) N.
    $
    Because $n N = e N$, we also have
    $
      (g N) (n N) (g^(-1) N)
      = (g N) (e N) (g^(-1) N)
      = (g g^(-1)) N
      = N,
    $
    implying that $(g n g^(-1)) N = N$, and hence $g n g^(-1) in N$ for any $g in G$, $n in N$. Hence, $g N g^(-1) subset.eq N$. Now replacing $g$ with $g^(-1)$ and rearranging yields $n in g N g^(-1)$, or that $N subset.eq g N g^(-1)$. Therefore, $N$ is normal.
]

Under the normality of $N$, the group $G \/ N$ is known as the _quotient group_ of $G$ by $N$.

#remark[
  Every subgroup of an abelian group is normal.
]

#definition[Group Homomorphism][
  Let $(G, dot)$ and $(H, *)$ be groups. A function $phi: G -> H$ is said to be a _group homomorphism_ if
  $
    phi(g_1 dot g_2) = phi(g_1) * phi(g_2) quad forall g_1, g_2 in G.
  $
]

#definition[Group Isomorphism][
  A group homomorphism $phi: G -> H$ is called an _isomorphism_ if it is bijective.
]

If there exists an isomorphism between two groups $G$ and $H$, they are said to be _isomorphic_, denoted by $G tilde.equiv H$. The utility of groups allows us to classify them according to their structure: if two groups are isomorphic, they are essentially the same from a group-theoretic perspective. This viewpoint lets us replace complicated groups with simpler, isomorphic ones, and study their properties without loss of generality.

Let us now examine $Aut(extcomplex)$. Let $f(z) in Aut(extcomplex)$ such that $f(oo) = oo$. It follows that $f$ maps $CC$ to $CC$ bijectively and $f in Aut(CC) < Aut(extcomplex)$. Therefore, $f(z)$ has the form $a z + b$, where $a in CC^* = CC without {0}$ and $b in CC$ are constants.

Let $f(z) in Aut(extcomplex)$ such that $f(oo) != oo$. Then,
$
  g(z) = 1 / (f(z) - f(oo))
$
is in $Aut(extcomplex)$ and $g(oo) = oo$. By the property above, $g(z) = c z + d$ for some complex $d$ and nonzero $c$. Hence,
$
  f(z) = (f(oo) (c z + d) + 1) / (c z + d).
$
Let $a = c f(oo)$ and $b = d f(oo) + 1$. Then
$
  f(z) = (a z + b) / (c z + d).
$
In this specific construction, $a d - b c = -c != 0$. Let the matrix $mat(a, b; c, d)$ correspond to this transformation, where for any nonzero scalar $k$, $k mat(a, b; c, d)$ corresponds to $mat(a, b; c, d)$. Therefore, we can arbitrarily pick $a d - b c$ to be $1$.

Therefore, there exists a one-to-one correspondence between $Aut(extcomplex)$ and the group under matrix multiplication of
$
  frac({ mat(a, b; c, d) : det(mat(a, b; c, d)) = 1 }, { plus.minus vb(I) }, style: "horizontal").
$
The quotient group is taken because the matrix $mat(a, b; c, d)$ corresponds to the same transformation as $mat(-a, -b; -c, -d)$. This group, denoted by
$
  op("PSL")(2, CC) = op("SL")(2, CC) \/ { plus.minus vb(I) } tilde.equiv Aut(extcomplex),
$
is known as the _projective special linear group_ of order $2$, and is isomorphic to the _group of Möbius transformations_, consisting of all complex linear fractional transformations.

Therefore, any meromorphic automorphism on $extcomplex$ is a composition of rotations, dilations, translations, and inversions. We will now state this formally:

#lbl(
  theorem[The Meromorphic Automorphism Group on $extcomplex$][
    $forall f in Aut(extcomplex)$, $f$ is a Möbius transformation. In other words, $exists a, b, c, d in CC$ satisfying $a d - b c != 0$ such that
    $
      f(z) = (a z + b) / (c z + d).
    $
    Moreover, every such Möbius transformation is in $Aut(extcomplex)$.
  ],
  <thm:meromorphic-automorphism-group-on-extended-complex-plane>,
)

The group of holomorphic automorphisms on $DD$, or $Aut(DD)$, is also a subgroup of $Aut(extcomplex)$.

#lbl(
  proposition[
    Suppose we have two Möbius transformations represented by the matrices $mat(a, b; c, d)$ and $mat(e, f; g, h)$. Then their composition is a Möbius transformation represented by $mat(a, b; c, d) mat(e, f; g, h)$.
  ],
  <prop:mobius-transformation-composition-matrix-multiplication>,
)

#proof[
  From simple substitution, we have
  $
    (a (e z + f) / (g z + h) + b) / (c (e z + f) / (g z + h) + d)
    = (a e z + a f + b g z + b h) / (c e z + c f + d g z + d h)
    = ((a e + b g) z + (a f + b h)) / ((c e + d g) z + (c f + d h)),
  $
  which corresponds to the product $mat(a, b; c, d) mat(e, f; g, h)$.
]

We have now introduced three of the most important regions in complex analysis: $DD$, $CC$, and $extcomplex$. Their importance will be later explained by the Uniformization Theorem (@ thm:uniformization).
