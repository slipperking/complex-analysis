#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Basic Properties of Harmonic Functions],
  route: "properties-of-harmonic-functions",
)
The first question we answer here is the cases when a harmonic function can be represented as the real part of a holomorphic function. We will see that this is always the case locally, and thus harmonic functions are locally the real parts of holomorphic functions. However, this is not always the case globally, and we will see examples of this later.

As a refresher, we restate @thm:harmonic-conjugate-existence-on-a-disk:
#lbl(
  theorem[
    Let $D(a,r)$ be a disk in $CC$ and $u : D(a,r) -> RR$ be a harmonic function. Then there exists a holomorphic function $f:D(a,r) -> CC$ such that $u equiv Re(f)$.
  ],
  <thm:harmonic-conjugate-existence-on-a-disk-restate>,
)
#proof[
  Letting $f = u + ii v$, where $v$ is given in @eq:conjugate-poisson-integral-formula suffices.
]

#theorem[Elliptic Regularity][
  Let $U subset.eq CC$ be a region. Then a harmonic function $u in C^2(U)$ is infinitely differentiable.
]
#proof[
  For each point $a in U$, there is a disk $D(a, r_a) subset U$ and a holomorphic function $f_a : D(a, r_a) -> CC$ such that $u equiv Re(f_a)$ on $D(a, r_a)$. Since $f_a$ is holomorphic, it is infinitely differentiable, and thus $u$ is infinitely differentiable on $D(a, r_a)$. Since $a in U$ was arbitrary, $u$ is infinitely differentiable on $U$.
]

In @sec:poisson-integral-formula-in-harmonic-analysis and @sec:further-properties-of-holomorphic-functions, we proved the equivalence between $laplacian u equiv 0$ and the mean-value property on small circles. Moreover, the statement of the maximum principle (@thm:maximum-principle-for-real-harmonic-functions) can be extended to:
#lbl(
  theorem[Minimum Principle for Harmonic Functions][
    Let $U subset.eq CC$ be open and connected and let $u:U -> RR$ be harmonic. Suppose that $exists z_0 in U$ and a neighborhood $V subset.eq U$ of $z_0$ such that either
    $ u(z_0) >= u(z) quad forall z in V. $
    Then $u$ is constant on $U$.
  ],
  <thm:minimum-principle-for-real-harmonic-functions>,
)
This can be obtained by applying @thm:maximum-principle-for-real-harmonic-functions to $-u$. Then it follows that
$
  max_(z in overline(U)) u(z) = max_(z in partial U) u(z) quad "and" quad min_(z in overline(U)) u(z) = min_(z in partial U) u(z),
$
as otherwise, the maximum (or minimum) would be attained within $U$ itself, which implies constancy.

We have seen that many holomorphic properties have harmonic analogs. This is also the case for the Schwarz Reflection Principle (@thm:schwarz-reflection-principle), for which we now provide an approach that yields an alternative proof.
#lbl(
  theorem[Schwarz Reflection Principle for Harmonic Functions][
    Let $U subset.eq CC$ be a connected region on one side of the real axis such that there exists a non-degenerate curve $gamma subset.eq partial U$ such that $gamma subset.eq RR$. Let $u:U -> RR$ be harmonic with continuity up to $U union gamma$ such that $u$ vanishes on $gamma$, and let $tilde(U) = { overline(z) : z in U }$ be the reflection of $U$ across the real axis. Then there exists a unique harmonic function
    $
      tilde(u)(z) = cases(
        u(z) quad & "if" z in U,
        -u(overline(z)) quad & "if" z in tilde(U),
        0 quad & "if" z in gamma
      ).
    $
    on $U union tilde(U) union gamma$.
  ],
  <thm:schwarz-reflection-principle-harmonic>,
)
#proof[
  Because satisfying the Laplace equation is equivalent to satisfying the mean-value property on small circles, it suffices to show that $tilde(u)$ satisfies the mean-value property on small circles.

]
