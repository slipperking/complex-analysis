#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Harnack's Principle],
  route: "harnacks-principle",
)
Due to the perceived similarity between properties of holomorphic functions and those of harmonic functions, we now provide an analogous statement to Montel's Theorem (@thm:montel) which is commonly known _Harnack's Principle_, which will be useful for the proceeding sections in solving the Dirichlet Problem for more general domains.

First we provide a result that in many ways resembles @thm:weierstrass-convergence.
#lbl(
  theorem[
    Let ${u_n}_(n in NN)$ be a sequence of real-valued harmonic functions on an open set $U subset.eq CC$. If ${u_n}$ locally uniformly converges to $u$ on $U$, then $u$ is harmonic on $U$.
  ],
  <thm:weierstrass-convergence-harmonic>,
)
#proof[
  For any closed disk $overline(D(a,r)) subset.double U$ and any $epsilon > 0$, there exists $N in NN$ such that $forall n > N$, $forall z in partial D(a,r)$, $ abs(u(z) - u_n (z)) < epsilon, $
  implying that
  $ abs(1 / (2 uppi) integral_0^(2 uppi) (u - u_n) (a + r ee^(ii theta)) dtheta) <= epsilon, $
  which is equivalent to saying
  $
    lim_(n -> oo) 1 / (2 uppi) integral_0^(2 uppi) u_n (a + r ee^(ii theta)) dtheta = 1 / (2 uppi) integral_0^(2 uppi) u (a + r ee^(ii theta)) dtheta
  $
  By the mean-value property,
  $
    1 / (2 uppi) integral_0^(2 uppi) u_n (a + r ee^(ii theta)) dtheta = u_n (a) ==> 1 / (2 uppi) integral_0^(2 uppi) u(a + r ee^(ii theta)) dtheta = u(a).
  $
  Thus, $u$ is harmonic as it satisfies the mean-value property on all disks in $U$.
]
#remark[
  We note here that the statement can be considerably relaxed by replacing locally uniform convergence with locally uniform boundedness and pointwise convergence. In this case, the exchange between the limit and integral is directly justifiable through Lebesgue's Dominated Convergence Theorem.
]
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
    Let ${u_n}_(n in NN)$ be a pointwise monotonically non-decreasing sequence of harmonic functions on an open region $U subset.eq CC$. Then either $u_n -> oo$ locally uniformly:
    $ forall M > 0, forall K subset.double U "compact", exists N in NN : forall n > N, forall z in K, u_n (z) > M, $
    or instead, $u_n arrows u$ locally uniformly, where $u$ is harmonic on $U$.
  ],
  <thm:harnacks-principle>,
)
#proof[
  First assume that there exists a point $p in U$ such that $u_n (p) -> oo$. Then $exists n in NN$ such that $u_n (p) > 0$ (and by the increasing nature of the sequence, for any $n' > n$, $u_(n') (p) > 0$ is also necessarily true).

  By the harmonicity of $u_(n')$, there exists some closed disk $overline(D(p, r))$ in $U$ on which $u_(n')$ is positive. Then for any $z$ within the smaller disk $D(p,r/2)$ and any $n>n'$, we have that
  $ (r - r/2) / (r + r/2) u_j (p) <= u_j (z) ==> u_j (z) >= 1/3 u_j(p) -> oo $
  by @thm:harnack-inequality.

  Contrarily, if the sequence converges to a finite limit at a point $p' in U$ (so $u_n (p') -> L$), let $r'>0$ be chosen such that $overline(D(p',r')) subset.double U$. Then for any $z in D(p',r'/2)$
  $
    lim_(N -> oo) sup_(n>m >N) u_n (z) - u_m (z) &<= lim_(N -> oo) sup_(n>m >N) (r + abs(z - p')) / (r - abs(z - p')) (u_n (p') - u_m (p')) \
    &<=lim_(N -> oo) sup_(n>m >N) 3 (u_n (p') - u_m (p')) = 0,
  $
  where @thm:harnack-inequality gives the harmonicity of $u_n - u_m$ and the final limit is obtained from the Cauchy Criterion (@thm:cauchy-criterion-sequence-convergence). Therefore, ${u_n}$ uniformly converges (to a harmonic function by @thm:weierstrass-convergence-harmonic) on $D(p',r'/2)$ by the Cauchy Criterion for functions (@thm:cauchy-criterion-uniform-convergence).
]
