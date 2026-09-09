#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Hardy Spaces],
  route: "hardy-spaces",
)
(The knowledge of measure spaces or measure theory will not be required for the understanding of this section, but rather for purely motivational purposes.)
The definition of a Lebesgue space or $L^p$ space in real analysis approximately defines the $L^p (S, mu)$ space for a given set (a measure space) $(S, Sigma, mu)$ (for $1<=p<oo$), by $ L^p (S, mu) = {f : S -> CC "measurable" : norm(f)_(L^p (S, mu)) < oo}, $
where the $L^p$ norm of $f$ is given by
$ norm(f)_(L^p (S, mu)) = (integral_S abs(f)^p dd(mu))^(1 / p). $
Moreover, $ norm(f)_(L^oo (S, mu)) = cases(op("ess. sup") abs(f) quad &"if" quad mu(S) = 0, 0 quad & "otherwise") $ (where $op("ess. sup")$ is the essential supremum, or the infimum of supremums over subsets of $S$ omitting a set of measure $0$).
In $DD$, we provide the following analogous formulation:
#lbl(
  definition[Hardy Space][
    For a holomorphic function $f : DD -> CC$, define the $H^p$ norm (for $0 < p < oo$) to be
    $ norm(f)_(H^p) = sup_(r in (0, 1)) (integral_0^(2 uppi) abs(f(r ee^(ii theta)))^p dtheta)^(1 / p), $
    and
    $ norm(f)_(H^oo) = sup_(r in (0, 1)) sup_(theta in [0, 2uppi]) abs(f(r ee^(ii theta))) = sup_(z in DD) abs(f(z)). $
    Then the space $H^p$ is simply the set of such functions with a finite Hardy $p$-norm.
  ],
  <def:hardy-space>,
)
The $H^oo$ class is simply the space of bounded holomorphic functions on $DD$. Immediately, we have
#lbl(
  theorem[
    Any $f in H^oo$ can be factorized by
    $ f(z) = F(z) B(z), $
    where $B$ is a Blaschke Product (@thm:blaschke-product with an additional $z^m$ factor) constructed on the zeros of $f$; and $F$ is a bounded, non-vanishing holomorphic function on $DD$ such that $norm(f)_(H^oo) = norm(F)_(H^oo)$.
  ],
  <thm:blaschke-factorization-of-H-oo>,
)
#proof[
  The assertions follow immediately from an application of @lem:hardy-function-blaschke-condition and @cor:blaschke-product-factorization.
]
In a series of papers published by Godfrey H. Hardy and F. Riesz, it was found that many of the properties of $H^oo$ functions apply to the weaker ($H^oo subset.eq H^p$) class of $H^p$ for finite $p$, including that of @thm:blaschke-factorization-of-H-oo.
#todo()
#lbl(
  proposition[
    For $p in RR_(> 0)$ and $f in H^p$, $abs(f)^p$ is subharmonic.
  ],
  <prop:hardy-modulus-power-is-subharmonic>,
)
#proof[
  For each point $z in DD without {z in DD: f(z) = 0}$, $log abs(f(z))$ is locally harmonic as it is the real part of a locally holomorphic function. Therefore, $z |-> exp[p log abs(f(z))]$, the composition between a convex function and a continuous function, is subharmonic on $DD without {z in DD: f(z) = 0}$ by @thm:composition-of-non-decreasing-convex-and-subharmonic-is-subharmonic. Then at each point at which $abs(f)^p$ does not vanish, $abs(f)^p$ satisfies the local sub-mean-value property.

  Since $abs(f)^p$ vanishes at each point of ${z in DD: f(z) = 0}$, it satisfies the local sub-mean-value property at such points (since $abs(f)^p >= 0$ everywhere).

  By @thm:subharmonic-function-sub-mean-value-property, $abs(f)^p$ is subharmonic on $DD$.
]
#lbl(
  lemma[Hardy][
    For any $f in H^p$, where $p in RR_(> 0)$, for any two $0 < r_1 < r_2 < 1$,
    $
      integral_0^(2 uppi) abs(f(r_1 ee^(ii theta)))^p dtheta <= integral_0^(2 uppi) abs(f(r_2 ee^(ii theta)))^p dtheta.
    $
  ],
  <lem:hardy-integral-increasing-in-radius>,
)
#proof[
  By @thm:solution-to-the-dirichlet-problem, $exists! u in C(partial D(0, r_2))$ such that $u$ is harmonic in $D(0,r_2)$ and that $u equiv abs(f)^p$ on $partial D(0,r_2)$. By the subharmonicity of $abs(f)^p$, $u >= f$ on $overline(D(0,r_2))$ and $overline(D(0,r_1))$.

  Therefore,
  $
    integral_0^(2 uppi) abs(f(r_2 ee^(ii theta)))^p dtheta &= integral_0^(2 uppi) u(r_2 ee^(ii theta)) dtheta \
    &= 2 uppi u(0) = integral_0^(2 uppi) u(r_1 ee^(ii theta)) dtheta #tag[(mean-value property)]\
    & >= integral_0^(2 uppi) abs(f(r_1 ee^(ii theta)))^p dtheta. qedhere
  $
]
#theorem[
  For $0 < p_1 < p_2 <= oo$, $H^(p_2)$ is a proper subclass of $H^(p_1)$, $H^(p_2) subset.neq H^(p_2)$.
]

// lemma, hardy, integral is increasing in r < 1,
// proper subclass 1/(1-z)^(1/p), p branch
//
