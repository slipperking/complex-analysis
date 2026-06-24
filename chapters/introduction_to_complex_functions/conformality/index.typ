#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [The Conformality of Holomorphic Mappings],
  route: "conformality",
  label: <sec:conformality_introduction>,
)
Let $f: U -> CC$ be a holomorphic function defined on an open and connected subset $U subset.eq CC$, and let $z_0 in U$ be a point such that $f' (z_0) != 0$. Consider a differentiable curve $gamma in C^1([0, 1])$ with $gamma(0) = z_0$. The direction of the curve at $z_0$ is given by the argument of its derivative, namely $Arg(gamma'(0))$.

The image of $gamma$ under $f$, defined by $sigma(t) = f(gamma(t))$, is also a smooth curve passing through $w_0 = f(z_0)$. By the chain rule, the derivative of $sigma$ at $t = 0$ is given by
$ sigma'(0) = f' (gamma(0)) gamma'(0) = f' (z_0) gamma'(0), $
and hence
$ Arg(sigma'(0)) = Arg(f' (z_0) gamma'(0)) = Arg(f' (z_0)) + Arg(gamma'(0)). $
It follows that
$ Arg(sigma'(0)) - Arg(gamma'(0)) = Arg(f' (z_0)). $
This shows that the change in direction between a curve and its image under $f$ is independent of the curve itself, depending only on the value of $f' (z_0)$.

Now consider two smooth curves $gamma_1, gamma_2 in C^1([0, 1])$ such that $gamma_1 (0) = gamma_2 (0) = z_0$, with respective images $sigma_1 (t) = f(gamma_1 (t))$ and $sigma_2 (t) = f(gamma_2 (t))$. Then
$
  Arg(sigma'_1(0)) - Arg(gamma'_1(0)) = Arg(f' (z_0)) = Arg(sigma'_2(0)) - Arg(gamma'_2(0)),
$
and by rearrangement,
$ Arg(sigma'_1(0)) - Arg(sigma'_2(0)) = Arg(gamma'_1(0)) - Arg(gamma'_2(0)). $
This equality demonstrates that the angle between two smooth curves at $z_0$ is preserved under $f$, provided $f' (z_0) != 0$. In other words, holomorphic functions with non-vanishing derivatives preserve angles and orientation locally, a property known as _conformality_.

Furthermore, for any smooth curve $gamma in C^1([0, 1])$ passing through $z_0$, the limit
$ lim_(z -> z_0 \ z in gamma) abs(f(z) - f(z_0)) / abs(z - z_0) = abs(f' (z_0)) $
shows that infinitesimal lengths are locally scaled by a factor of $abs(f' (z_0))$ under the mapping $f$.

Therefore, at points where $abs(f' (z)) != 0$, the function $f$ is conformal; it preserves angles but not necessarily lengths.
