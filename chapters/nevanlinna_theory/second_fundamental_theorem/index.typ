#import "/lib.typ": *

== The Second Fundamental Theorem

Whereas the First Fundamental Theorem gives the relation between the general size of $T$ relative to $m$ and $N$, efforts have been made to quantify the relative size of $m$ and $N$. This question was answered by R. Nevanlinna in July 1924 with considerable accuracy via the inequality
$
  T(r, f) <= N(r, a, f) + N(r, b, f) + N(r, c, f) + S(r, f),
$
where $a, b, c in extcomplex$ are distinct and $S(r, f)$ is a term that is generally small relative to $T(r, f)$ (is $o(T(r, f))$ for most $r$). It also implies that in most cases, $N(r, a, f)$ will be much larger than $m(r, a, f)$. For example, assume $f$'s meromorphy is on all of $CC$. Then if there are two values $a, b$ where the proximity dwarfs the counting function, such as when
$
  liminf_(r -> oo) (m(r, a, f)) / (T(r, f)) = 1,
  quad
  liminf_(r -> oo) (m(r, b, f)) / (T(r, f)) = 1,
$
then for all other values $c$ on the Riemann sphere,
$
  1 & <= limsup_(r_n -> oo) (N(r_n, a, f)) / (T(r_n, f))
      + limsup_(r_n -> oo) (N(r_n, b, f)) / (T(r_n, f)) \
    & quad ""
      + limsup_(r_n -> oo) (N(r_n, c, f)) / (T(r_n, f))
      + limsup_(r_n -> oo) (S(r_n, f)) / (T(r_n, f)) \
    & <= limsup_(r -> oo) (N(r, a, f)) / (T(r, f))
      + limsup_(r -> oo) (N(r, b, f)) / (T(r, f)) \
    & quad ""
      + limsup_(r -> oo) (N(r, c, f)) / (T(r, f))
      + limsup_(r_n -> oo) (S(r_n, f)) / (T(r_n, f)) \
    & = limsup_(r -> oo) (N(r, c, f)) / (T(r, f)),
$
where the precise formulation allows for a sequence ${r_n}$ diverging to $oo$ to be chosen so that $S(r, f) = o(T(r, f))$ for $r -> oo$ in this sequence. This implies $limsup_(r -> oo) (N(r, c, f)) / (T(r, f)) = 1$. This in turn then proves Picard's theorems (see @ sec:deficiencyrelation). As we shall later see, the conclusions of the theorem have even further extensibility.

Regarding Nevanlinna's original paper containing the result, mathematician Hermann Weyl has stated in 1943 that "the appearance of this paper has been one of the few great mathematical events of our century."

#theorem[Second Fundamental Theorem of Nevanlinna Theory, Part 1][
  Let $f: D(0, R) -> extcomplex$ be meromorphic and non-constant ($0 < R <= oo$). Suppose that $a_1, dots, a_q$ are $q >= 2$ distinct finite complex numbers. Then for any positive $delta <= min{a_mu - a_nu : 1 <= mu < nu <= q}$,
  $
    m(r, f) + sum_(nu = 1)^q m(r, a_nu, f) <= 2 T(r, f) - N_1(r, f) + S(r, f),
  $
  where $N_1(r) = N(r, 0, f') + 2 N(r, f) - N(r, f')$ and
  $
    S(r, f) & = m(r, f' / f) + m(r, sum_(nu = 1)^q f' / (f - a_nu)) \
            & quad""+ q logp ((3q) / delta) + log 2 - log abs(c'),
  $ <eq:nevanlinnasecondfundamentaltheorempart1_smallerrorterm>
  where $c'$ is the first nonzero coefficient of the Laurent expansion of $f'$ (at the origin).
] <thm:nevanlinnasecondfundamentaltheorempart1>

#remark[
  For interpretive purposes, $S(r, f)$ will serve the purpose of a generally unimportant small error term. The utility of this theorem is not realized until more useful conclusions are drawn on its estimation, which will be denoted by the second part of the theorem.
]

#proof[
  Define
  $
    F(z) = sum_(nu = 1)^q 1 / (f(z) - a_nu).
  $
  Fixing $z in D(0, R)$, we then assume two cases

  + $exists nu$ such that $abs(f(z) - a_nu) < delta / (3q)$. For any $mu != nu$, we have
    $
      abs(f(z) - a_mu)
      >= abs(abs(a_nu - a_mu) - abs(f(z) - a_nu))
      >= delta - delta / (3q) > (2 delta) / 3.
    $
    It follows that
    $
      1 / abs(f(z) - a_mu) < 3 / (2 delta) < 1 / (2 q abs(f(z) - a_nu)).
    $
    Then
    $
      abs(F(z)) & >= abs(1 / (f(z) - a_nu)) - abs(sum_(mu != nu)^q 1 / (f(z) - a_mu)) \
                & >= 1 / abs(f(z) - a_nu) - (q - 1) / (2 q abs(f(z) - a_nu))
                  >= 1 / (2 abs(f(z) - a_nu)).
    $
    Since
    $
      logp (1 / abs(f(z) - a_nu))
      = logp (2 dot 1 / (2 abs(f(z) - a_nu)))
      <= log 2 + log (1 / (2 abs(f(z) - a_nu)))
    $
    from @prop:lognonnegativepartproperties, it follows that
    $
      logp abs(F(z)) >= logp (1 / (2 abs(f(z) - a_nu))) >= logp (1 / abs(f(z) - a_nu)) - log 2.
    $
    Observe that for each $mu != nu$, $logp abs(f(z) - a_mu)^(-1) < logp (3 / (2 delta))$, and therefore
    $
      logp abs(F(z)) & >= sum_(mu = 1)^q logp (1 / abs(f(z) - a_mu)) - (q - 1) logp (3 / (2 delta)) - log 2 \
                     & >= sum_(mu = 1)^q logp (1 / abs(f(z) - a_mu)) - q logp ((3q) / delta) - log 2.
    $ <eq:nevanlinnasecondfundamentaltheorempart1_logpFlowerbound>

  + There exists no such $nu$. Then all $nu$ have the property that $abs(f(z) - a_nu) >= delta / (3q)$. It follows that
    $
      1 / abs(f(z) - a_nu) <= (3q) / delta
      ==>
      sum_(mu = 1)^q logp (1 / abs(f(z) - a_mu)) - q logp ((3q) / delta) & <= 0 \
                                                                         & <= logp abs(F(z)).
    $
    Then @eq:nevanlinnasecondfundamentaltheorempart1_logpFlowerbound holds for this case trivially.

  Integrating the relation @eq:nevanlinnasecondfundamentaltheorempart1_logpFlowerbound (which holds in all cases) gives that
  $
    m(r, F) >= sum_(nu = 1)^q m(r, a_nu, f) - q logp ((3q) / delta) - log 2.
  $ <eq:nevanlinnasecondfundamentaltheorempart1_proximityFlowerbound>
  Observe that
  $
    m(r, F) = m(r, 1 / f dot f / f' dot f' dot F)
    <= m(r, 1 / f) + m(r, f / f') + m(r, f' F).
  $
  Let $c = c_k$ be the first nonzero coefficient of the Laurent expansion for $f$. It follows that
  $
    f(z) = sum_(j = k)^oo c_j z^j = c z^k (1 + Order(z)),
    quad
    f'(z) = sum_(j = k)^oo j c_j z^(j - 1) = k c z^(k - 1) (1 + Order(z)),
  $
  so the first nonzero coefficient of the Laurent expansion of $f'$ is $c' = k c$ and that of $f / f'$ is $c'' = c \/ c' = 1 \/ k$. It follows from
  $
    T(r, f) = T(r, 1 / f) + log abs(c)
    ==>
    m(r, 1 / f) = T(r, f) - N(r, 1 / f) - log abs(c), \
    m(r, f / f') = T(r, f' / f) - N(r, f / f') + log abs(c'')
  $
  that
  $
    m(r, F) & <= T(r, f) - N(r, 1 / f) - log abs(c) \
            & quad""+ T(r, f' / f) - N(r, f / f') + log abs(c'') + m(r, f' F).
  $
  Combining this with @eq:nevanlinnasecondfundamentaltheorempart1_proximityFlowerbound gives
  $
    m(r, f) + sum_(nu = 1)^q m(r, a_nu, f) & <= m(r, f) + m(r, F) + q logp ((3q) / delta) + log 2 \
                                           & <= T(r, f) - N(r, f) + q logp ((3q) / delta) + log 2 \
                                           & quad "" + T(r, f) - N(r, 1 / f) - log abs(c) + m(r, f' / f) \
                                           & wide "" + N(r, f' / f) - N(r, f / f') + log abs(c'') + m(r, f' F)
  $
  Using @eq:nevanlinnacountingjensensformulaexposition2 three times gives that
  $
    N(r, f' / f) - N(r, f / f')
    &= 1 / (2 uppi) integral_0^(2 uppi)
    log abs(f(r ee^(ii theta)) / (f'(r ee^(ii theta)))) dtheta
    - log abs(c'') \
    &= 1 / (2 uppi) integral_0^(2 uppi) log abs(f(r ee^(ii theta))) dtheta - log abs(c) \
    &quad "" - (1 / (2 uppi) integral_0^(2 uppi) log abs(f'(r ee^(ii theta))) dtheta - log abs(c')) \
    &= N(r, 1 / f) - N(r, f) - N(r, 1 / f') + N(r, f').
  $
  Thus, we obtain
  $
    & m(r, f) + sum_(nu = 1)^q m(r, a_nu, f) <= 2 T(r, f) - 2 N(r, f) + q logp ((3q) / delta) \
    & wide quad ""+ log 2 + m(r, f' / f) - N(r, 1 / f') + N(r, f') - log abs(c') + m(r, f' F) \
    & wide = 2 T(r, f) - [N(r, 1 / f') + 2 N(r, f) - N(r, f')] + S(r, f),
  $
  where $S(r, f)$ is defined as in @eq:nevanlinnasecondfundamentaltheorempart1_smallerrorterm. This concludes the proof.
]

#chapter-section("estimation_of_small_error_term")[
  #include "estimation_of_small_error_term/index.typ"
]
