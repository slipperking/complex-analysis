#import "/lib.typ": *
#show: docs-subsubchapter.with(
  title: [The Group of Holomorphic Automorphisms on $CC$],
  route: "complex_plane_holomorphic_automorphisms",
)
In complex analysis, three main sets of interest are $DD$, $CC$, and $extcomplex$. We will now find $Aut(CC)$.

#theorem[The Holomorphic Automorphism Group on $CC$][
  $forall f in Aut(CC)$, $f$ is linear and non-constant. In other words, $exists a in CC without {0}$ and $exists b in CC$ such that
  $
    f(z) = a z + b.
  $
] <thm:holomorphicautomorphismgrouponcomplexplane>

#proof[
  First, assume that $oo$ is not an essential singularity of $f(z)$, which we will prove later. Then $oo$ must be a pole by trichotomy, as a removable singularity implies boundedness (@prop:removablesingularityatinftyentireconstant). Therefore, $f(z)$ is a polynomial of degree $m$, where $m in NN$.

  Since $f^(-1) in Aut(CC)$, it is true that $(f^(-1))'$ is entire. Since
  $
    (f^(-1))' = 1 / (f'(f^(-1))),
  $
  it follows that $f'$ has no zeros in $CC$. By the Fundamental Theorem of Algebra (@thm:fundamental-theorem-of-algebra), if $m > 1$, then $f'$ has a complex zero, which is a contradiction. Hence, $f$ must be linear, and all functions in $Aut(CC)$ are in the form of $a z + b$, where $a in CC without {0}$ and $b in CC$ are constants. In other words, any holomorphic automorphism on $CC$ is a composition of a rotation, a dilation, and a translation.

  We will now prove the primary assumption; the singularity at $z = oo$ cannot be an essential singularity of $f(z)$. Let $w in CC$ be arbitrary. Then by the Casorati--Weierstrass Theorem (@thm:casoratiweierstrass), $forall epsilon > 0$ and $forall R > 0$, $exists abs(z) > R$ such that $abs(f(z) - w) < epsilon$. Equivalently, $forall R > 0$, $exists zeta in D(w, epsilon)$ such that $abs(f^(-1) (zeta)) > R$. Since $f^(-1)$ is continuous on $overline(D(w, epsilon))$ by holomorphy, by @thm:continuous_function_bounded_on_compact, it is bounded, which is a contradiction.
]
