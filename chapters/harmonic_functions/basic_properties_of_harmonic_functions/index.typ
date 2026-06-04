#import "/lib.typ": *
== Basic Properties of Harmonic Functions

The first question we answer here is the cases when a harmonic function can be represented as the real part of a holomorphic function. We will see that this is always the case locally, and thus harmonic functions are locally the real parts of holomorphic functions. However, this is not always the case globally, and we will see examples of this later.
#theorem[
  Let $D(a,r)$ be a disk in $CC$ and $u : D(a,r) -> RR$ be a harmonic function. Then there exists a holomorphic function $f:D(a,r) -> CC$ such that $u equiv Re(f)$.
]
#proof[
  Letting $f = u + ii v$, where $v$ is given in @eq:conjugate_poisson_integral_formula suffices.
]
#theorem[
  Let $U subset.eq CC$ be a region. Then a harmonic function $u in C^2(U)$ is infinitely differentiable.
]
#definition[
  For each point $a in U$, there is a disk $D(a, r_a) subset U$ and a holomorphic function $f_a : D(a, r_a) -> CC$ such that $u equiv Re(f_a)$ on $D(a, r_a)$. Since $f_a$ is holomorphic, it is infinitely differentiable, and thus $u$ is infinitely differentiable on $D(a, r_a)$. Since $a in U$ was arbitrary, $u$ is infinitely differentiable on $U$.
]
