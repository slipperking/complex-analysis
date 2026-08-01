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

In @sec:poisson-integral-formula-in-harmonic-analysis and @sec:further-properties-of-holomorphic-functions, we proved the equivalence between $laplacian u equiv 0$ and the mean-value property on small circles. However, it is extremely important to understand that, when deriving harmonicity from the mean-value property, for a fixed point $z_0$, we do not need to consider all $epsilon > 0$ such that $overline(D(z_0, epsilon)) subset.double U$, but rather, it suffices to show the mean-value property holds for all $0< epsilon < epsilon'$ for some $epsilon'> 0$ (although after doing so, the assertion will hold for all unrestricted $epsilon$). In other words, we only need to verify the property holds locally. See the statement of @thm:mean-value-property-solutions-are-harmonic.

Moreover, the statement of the maximum principle (@thm:maximum-principle-for-real-harmonic-functions) can be extended to:
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
  Because satisfying the Laplace equation is equivalent to satisfying the mean-value property on small circles, it suffices to show that $tilde(u)$ satisfies the mean-value property on small circles (@thm:mean-value-property-solutions-are-harmonic).

  + For all $z in U$, there exists $epsilon' > 0$ such that $overline(D(z, epsilon')) subset.double U$ (without crossing $RR$). Then for all $epsilon in (0,epsilon')$, $tilde(u)$ satisfies the mean-value property on $partial D(z,epsilon)$ since $u$ is harmonic.
  + For all $z in tilde(U)$, there exists $epsilon' > 0$ such that $overline(D(z, epsilon')) subset.double tilde(U)$ (without crossing $RR$). Then for all $epsilon in (0,epsilon')$, we get that
    $
      tilde(u)(z) & = -u(overline(z)) = - 1 / (2 uppi) integral_0^(2 uppi) u(overline(z) + epsilon ee^(ii theta)) dtheta \
                  & = - 1 / (2 uppi) integral_0^(2 uppi) u(overline(z) + epsilon ee^(ii theta)) dtheta \
                  & = 1 / (2 uppi) integral_0^(2 uppi) tilde(u)(z + epsilon ee^(-ii theta)) dtheta \
                  & = 1 / (2 uppi) integral_0^(2 uppi) tilde(u)(z + epsilon ee^(ii theta)) dtheta.
    $
    Therefore, for all $epsilon in (0,epsilon')$, $tilde(u)$ satisfies the mean-value property on $partial D(z,epsilon)$.
  + For all $z in gamma$ (so $z = overline(z)$), for any $epsilon > 0$ such that
    $ overline(D(z, epsilon)) subset.double U union tilde(U) union gamma, $
    $
      1 / (2 uppi) integral_0^(2 uppi) tilde(u)(z + epsilon ee^(ii theta)) dtheta =& 1 / (2 uppi) [integral_0^uppi u(z + epsilon ee^(ii theta)) dtheta - integral_uppi^(2 uppi) u(overline(z) + epsilon ee^(-ii theta)) dtheta] \
      &= 1 / (2 uppi) [integral_0^uppi u(z + epsilon ee^(ii theta)) dtheta - integral_uppi^(2 uppi) u(z + epsilon ee^(-ii theta)) dtheta] \
      &space#[(by substituting $theta -> 2 uppi - theta$)] \
      &= 1 / (2 uppi) [integral_0^uppi u(z + epsilon ee^(ii theta)) dtheta + integral_uppi^0 u(z + epsilon ee^(-ii (2 uppi - theta))) dtheta]\
      &= 1 / (2 uppi) [integral_0^uppi u(z + epsilon ee^(ii theta)) dtheta - integral_0^uppi u(z + epsilon ee^(ii theta)) dtheta] \
      &= 0 = tilde(u)(z).
    $
    Then $tilde(u)$ satisfies the mean-value property on $partial D(z,epsilon)$.
  Then by @thm:mean-value-property-solutions-are-harmonic, $tilde(u)$ is harmonic.
]
