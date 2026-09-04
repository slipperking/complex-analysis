#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Hardy Spaces],
  route: "hardy-spaces",
)
(The knowledge of measure spaces or measure theory will not be required for the understanding of this section, but rather for purely motivational purposes.)
The definition of a Lebesgue space or $L^p$ space in real analysis approximately defines the $L_p (S, mu)$ space for a given set (a measure space) $(S, Sigma, mu)$ (for $1<=p<oo$), by $ L_p (S, mu) = {f : S -> CC "measurable" : norm(f)_(L^p (S, mu)) < oo}, $
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
