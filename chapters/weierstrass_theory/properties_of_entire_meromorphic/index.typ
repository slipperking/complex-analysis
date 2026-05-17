#import "/lib.typ": *

== Further Properties of Meromorphic and Entire Functions

#theorem[
  Let $U subset.eq CC$ be a region and $f:U -> CC$ be meromorphic. Let $gamma subset U$ be a positively oriented Jordan curve that is null-homotopic in $U$. If $f$ has no zeros on $gamma$, then $f$ has finitely many zeros and poles in the region bounded by $gamma$. Denote the zeros of $f$ in the bounded region by $a_1, dots, a_k$ with respective multiplicities $alpha_1, dots, alpha_k$, and the poles by $b_1, dots, b_m$ with respective orders $beta_1, dots, beta_m$. Let $psi$ be any function holomorphic on a neighborhood of the closure of the bounded region. Then
  $
    1 / (2 uppi ii) integral.cont_gamma (psi(z) f'(z)) / (f(z)) dz = sum_(i = 1)^k alpha_i psi(a_i) - sum_(j = 1)^m beta_j psi(b_j).
  $
] <thm:generalizedargumentprinciple>

#proof[
  Choose disks $D(a_i, epsilon_i)$ with pairwise disjoint closures around each zero $a_i$ and $D(b_j, epsilon'_j)$ around each pole $b_j$, with $epsilon_i, epsilon'_j > 0$ sufficiently small so that these disks are contained in $jinterior(gamma)$, disjoint from $gamma$, and contained in the neighborhood where $psi$ is holomorphic. The function
  $
    g(z) = (psi(z) f'(z)) / (f(z))
  $
  is holomorphic on
  $
    jinterior(gamma) without (union.big_(i = 1)^k D(a_i, epsilon_i) union union.big_(j = 1)^m D(b_j, epsilon'_j)),
  $
  since $psi$ is holomorphic there, $f$ is meromorphic with no other singularities, and $f != 0$ on $gamma$. The oriented boundary of this punctured domain is $gamma^+ union union.big_(i = 1)^k partial D(a_i, epsilon_i)^- union union.big_(j = 1)^m partial D(b_j, epsilon'_j)^-$. By Cauchy--Goursat (@thm:cauchygoursattheorem),
  $
    integral.cont_(gamma^+) g(z) dz + sum_(i = 1)^k integral.cont_(partial D(a_i, epsilon_i)^-) g(z) dz + sum_(j = 1)^m integral.cont_(partial D(b_j, epsilon'_j)^-) g(z) dz = 0.
  $
  Thus,
  $
    - integral.cont_gamma g(z) dz = sum_(i = 1)^k integral.cont_(partial D(a_i, epsilon_i)^+) g(z) dz + sum_(j = 1)^m integral.cont_(partial D(b_j, epsilon'_j)^+) g(z) dz.
  $

  Near each zero $a_i$, write $f(z) = (z - a_i)^(alpha_i) h(z)$ where $h$ is holomorphic at $a_i$ with $h(a_i) != 0$. Then
  $
    (f'(z)) / (f(z)) = (alpha_i) / (z - a_i) + (h'(z)) / (h(z)),
  $
  so
  $
    g(z) = psi(z) ((alpha_i) / (z - a_i) + (h'(z)) / (h(z))).
  $
  Then,
  $
    integral.cont_(partial D(a_i, epsilon_i)) g(z) dz = integral.cont_(partial D(a_i, epsilon_i)) psi(z) ((alpha_i) / (z - a_i) + (h'(z)) / (h(z))) dz = 2 uppi ii alpha_i psi(a_i),
  $
  where the first term has been reduced by the Cauchy--Goursat Formula (@thm:cauchygoursatformula) and the second integral vanishes by the Cauchy--Goursat Theorem (@thm:cauchygoursattheorem).

  Near a pole $b_j$, write $f(z) = (z - b_j)^(-beta_j) k(z)$ where $k$ is holomorphic at $b_j$ with $k(b_j) != 0$. Then
  $
    (f'(z)) / (f(z)) = - (beta_j) / (z - b_j) + (k'(z)) / (k(z)),
  $
  so
  $
    g(z) = psi(z) (- (beta_j) / (z - b_j) + (k'(z)) / (k(z))).
  $
  A similar calculation yields that
  $
    integral.cont_(partial D(b_j, epsilon'_j)) g(z) dz = -2 uppi ii beta_j psi(b_j).
  $
  Combining these,
  $
    integral.cont_gamma (psi(z) f'(z)) / (f(z)) dz
    &= sum_(i = 1)^k 2 uppi ii alpha_i psi(a_i) - sum_(j = 1)^m 2 uppi ii beta_j psi(b_j)
    \ &= 2 uppi ii (sum_(i = 1)^k alpha_i psi(a_i) - sum_(j = 1)^m beta_j psi(b_j)). #qedhere
  $
]

#theorem("Argument Principle")[
  Let $U subset.eq CC$ be a region and $f:U -> CC$ be meromorphic. Let $gamma subset U$ be a simple, closed, positively oriented curve that is null-homotopic in $U$. If $f$ has no zeros or poles on $gamma$, then $f$ has finitely many zeros and poles in the region bounded by $gamma$, and the number of zeros, $k$, minus the number of poles, $k'$, counting multiplicities and orders, is given by
  $
    k - k' = 1 / (2 uppi ii) integral.cont_gamma (f'(z)) / (f(z)) dz.
  $
  Let $Gamma$ be the image of $gamma$ under the map $w = f(z)$. Then $k - k' = Ind_Gamma (0)$.
] <thm:argumentprinciplemeromorphic>

#proof[
  By @thm:generalizedargumentprinciple for $psi equiv 1$,
  $
    1 / (2 uppi ii) integral.cont_gamma (f'(z)) / (f(z)) dz = k - k'.
  $

  Parametrize $Gamma$ by $w = f(z)$. Then $dif w = f'(z) dz$, and
  $
    k - k' = 1 / (2 uppi ii) integral.cont_Gamma (dif w) / w = Ind_Gamma (0). #qedhere
  $
]

#chapter-section("complex_plane_holomorphic_automorphisms")[
  #include "complex_plane_holomorphic_automorphisms/index.typ"
]

#chapter-section("extended_plane_holomorphic_automorphisms")[
  #include "extended_plane_holomorphic_automorphisms/index.typ"
]

#chapter-section("construction_of_entire_and_meromorphic")[
  #include "construction_of_entire_and_meromorphic/index.typ"
]

#chapter-section("growth_of_entire_functions")[
  #include "growth_of_entire_functions/index.typ"
]

#chapter-section("hadamard_factorization_theorem")[
  #include "hadamard_factorization_theorem/index.typ"
]

