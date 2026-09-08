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
    For a holomorphic function $f:DD -> CC$, define the $H^p$ norm (for $1 <= p < oo$) to be
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
    For $p in (1, oo)$ and $f in H^p$, $abs(f)^p$ is subharmonic.
  ],
  <prop:hardy-modulus-power-is-subharmonic>,
)
#proof[
  // @thm:jensens-inequality-convexity
  For each point $z in DD without {z in DD: f(z) = 0}$, $log abs(f(z))$ is locally harmonic as it is the real part of a locally holomorphic function. Therefore, $z |-> exp[p log abs(f(z))]$

  // Then on
  // Observe that $exp$ is
]
#lbl(
  lemma[Hardy][
    For any $f in H^p$, where $p in RR_(>= 1) union {oo}$, for any two $0 < r_1 < r_2 < 1$,
    $
      integral_0^(2 uppi) abs(f(r_1 ee^(ii theta)))^p dtheta <= integral_0^(2 uppi) abs(f(r_2 ee^(ii theta)))^p dtheta.
    $
  ],
  <lem:hardy-integral-increasing-in-radius>,
)
#proof[

]
// lemma, hardy, integral is increasing in r < 1,
// proper subclass 1/(1-z)^(1/p), p branch
//
