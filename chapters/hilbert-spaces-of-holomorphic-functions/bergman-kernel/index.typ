#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [The Bergman Kernel],
  route: "bergman-kernel",
)
#let berg = $A^2 (DD)$
Fix $Omega$ be an open region and let $z_0 in Omega$ be fixed. Then let $A^2 (Omega)$ be the Hilbert space of square integrable holomorphic functions on $Omega$. Recall @ex:hilbert-space-bergman-space:
#thm-state.thm-restate("bergman-space")
For each $f in Omega$, @prop:bergman-space-function-bounded-by-norm-in-compact-set gives:
$
  abs(f(z_0)) <= 1 / (r sqrt(uppi)) norm(f).
$
Moreover, the mapping $phi.alt$ between $berg$ and $CC$ given by
$ phi.alt : f (in berg) |-> f(z_0) (in CC) $
is a linear functional on $berg$: it very clearly satisfies linearity. Then by the Riesz Representation Theorem (@thm:riesz-representation), there as a unique $k_(z_0) in berg$, dependent on $z_0$ but not $f in berg$, such that
$ f(z_0) = phi.alt(f) = chev(f, k_(z_0)). #tag[(for all $f in berg$)] $
Then
#etarget(<eq:bergman-integral-formula>)[
  $
    f(z_0) = integral.double_Omega f(zeta) overline(k_(z_0)) (zeta) dif xi dif eta. #tag[(#sym.ast.op)]
  $
]
#let berg-t = eref(<eq:bergman-integral-formula>)[#math-markup[(#sym.ast.op)]]
#definition[Bergman Kernel][
  Let $Omega$ be an open region, define the _Bergman kernel_ to be a complex function $K_Omega (z, w)$ of two variables in $berg$, given by $K_Omega (z, w) = overline(k_z (w))$, where $k_z (w)$ is the unique Riesz representer for the linear functional $f mapsto f(z)$
]
#theorem[Conjugate-symmetry of the Bergman Kernel][
  For any $z, w in Omega$,
  $ K_Omega (z, w) = overline(K_Omega (w, z)). $
]
#proof[
  By the integral representation in #berg-t,
]
