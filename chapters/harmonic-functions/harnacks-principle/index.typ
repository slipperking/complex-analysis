#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Harnack's Principle],
  route: "harnacks-principle",
)
Due to the perceived similarity between properties of holomorphic functions and those of harmonic functions, we now provide an analogous statement to Montel's Theorem (@thm:montel) which is commonly known _Harnack's Principle_, which will be useful for the proceeding sections in solving the Dirichlet Problem for more general domains.
#lbl(
  theorem[Harnack Inequality][
    Let $u:U -> RR$ be nonnegative and harmonic on some neighborhood $U supset overline(D(p,R))$ for $r in RR_(>0)$, $p in CC$. Then for any $z in D(p,R)$,
    #lbl(
      $
        (R - abs(z - p)) / (R + abs(z - p)) u(p) <= u(z) <= (R + abs(z - p)) / (R - abs(z - p)) u(p)
      $,
      <eq:harnack-inequality-statement>,
    )
  ],
  <thm:harnack-inequality>,
)
#proof[
  First assume $p = 0$.

  By the Poisson Integral Formula (@eq:poisson-integral-formula), we have that
  $
    u(z) &= 1 / (2 uppi) integral_0^(2 uppi) u(R ee^(ii t)) (R^2 - abs(z)^2) / abs(R ee^(ii t) - z)^2 dt \
    &<= 1 / (2 uppi) integral_0^(2 uppi) u(R ee^(ii t)) ((R + abs(z)) (R - abs(z))) / abs(R - abs(z))^2 dt #tag[(reverse triangle inequality)] \
    &<= (R + abs(z)) / (R - abs(z)) 1 / (2 uppi) integral_0^(2 uppi) u(R ee^(ii t)) dt \
    &= (R + abs(z)) / (R - abs(z)) u(0). #tag[(mean-value property)]
  $
  Similarly,
  $ (R^2 - abs(z)^2) / abs(R ee^(ii t) - z)^2 >= ((R + abs(z)) (R - abs(z))) / (R + abs(z))^2 = (R - abs(z)) / (R + abs(z)) $ by the triangle inequality, so therefore
  $
    u(z) >= (R - abs(z)) / (R + abs(z)) 1 / (2 uppi) integral_0^(2 uppi) u(R ee^(ii t)) dt = (R - abs(z)) / (R + abs(z)) u(0)
  $
  by the mean-value property once more.

  Lastly, for nonzero $p$, a translation suffices to obtain @eq:harnack-inequality-statement from the $p=0$ case.
]
#lbl(
  theorem[Harnack's Principle][
    Let ${u_n}_(n in NN)$ be a pointwise-increasing sequence of harmonic functions on an open region $U subset.eq CC$. Then either $u_n -> oo$ locally uniformly:
    $ forall M > 0, forall K subset.double U "compact", exists N in NN : forall n > N, forall z in K, u_n (z) > M, $
    or instead, $u_n arrows u$ locally uniformly, where $u$ is harmonic on $U$.
  ],
  <thm:harnacks-principle>,
)
#proof[
  First assume that there exists a point $p in U$ such that $u_n (p) -> oo$. Then $exists n in NN$ such that $u_n (p) > 0$ (and by the increasing nature of the sequence, for any $n' > n$, $u_(n') (p) > 0$ is also necessarily true).


]
