#import "/lib.typ": *
#show: docs-subsubchapter.with(
  title: [Deficiency Relation],
  route: "deficiency_relation",
  label: <sec:deficiency-relation>,
)
One of the reformulations of the Second Fundamental Theorem is characterized in a way so that it comprises the statements of Picard-like theorems in a compact manner (of course, the conclusions are substantially more far-reaching than just the Picard theorems themselves). We first introduce the relevant terminology.

#definition[
  Let $a in extcomplex$, $f: D(0, R) -> extcomplex$ be meromorphic. For $k in NN$, $r < R$, define $n^((k)) (r, a, f)$ be the number of zeros of $f - a$ or $1 \/ f$ (if $a = oo$) within $D(0, r)$, where a repeated zero is counted at most $k$ times.

  Then define the _truncated_ Nevanlinna counting function (of order $k$) by
  $ N^((k)) (r, a, f) = integral_0^r (n^((k)) (x, a, f) - n^((k)) (0, a, f)) / x dx + n^((k)) (0, a, f) log r. $
  Denote the functions for when $k = 1$ by $overline(N) (r, a, f) = N^((1)) (r, a, f)$ and $overline(n) (r, a, f) = n^((1)) (r, a, f)$.
]

#definition[
  For any $a in extcomplex$ and a meromorphic function $f: D(0, R) -> extcomplex$, define the _deficiency_ (or _defect_) $a$ in $f$ by
  $ delta(a, f) = liminf_(r -> R^-) m(r, a, f) / T(r, f) = 1 - limsup_(r -> R^-) N(r, a, f) / T(r, f). $
  Then $a$ is said to be a deficient value of $f$ if its deficiency is nonzero.
]

#remark[
  Because $N(r, a, f) <= T(r, f) + Order(1)$ holds by the First Fundamental Theorem, the deficiency will always be a nonnegative real value.
]

The deficiency is the primary value we are interested in. We also observe the use of the _Verzweigungsindex_ (ramification index) $theta$ and the truncated deficiency $Theta$ (of order 1):
$
  theta(a, f) = liminf_(r -> R^-) (N(r, a, f) - overline(N) (r, a, f)) / T(r, f), quad Theta(a, f) = 1 - limsup_(r -> R^-) (overline(N) (r, a, f)) / T(r, f).
$

Using these formulations, we now have

#theorem[Deficiency Relation][
  Suppose $f: D(0, R_0) -> extcomplex$ ($0 < R_0 <= oo$) is meromorphic and admissible. Then $S = {a in extcomplex : Theta(a, f) > 0}$ is a countable set and
  $ sum_(a in S) [delta(a, f) + theta(a, f)] <= sum_(a in S) Theta(a, f) <= 2. $
] <thm:deficiency-relation>

#proof[
  For any $q$ numbers ${a_nu}_(nu = 1)^q subset CC$,
  $ m(r, f) / T(r, f) + sum_(nu = 1)^q m(r, a_nu, f) / T(r, f) + (N_1 (r, f)) / T(r, f) <= 2 + S(r, f) / T(r, f) $
  as $r -> R_0^-$ by the Second Fundamental Theorem of Nevanlinna Theory (@thm:nevanlinnasecondfundamentaltheorempart1). Then,
  $
    q - 1 - S(r, f) / T(r, f) & <= (N(r, f') - N(r, 1 / f') - 2 N(r, f)) / T(r, f) \
                              & quad""+ N(r, f) / T(r, f) + sum_(nu = 1)^q N(r, a_nu, f) / T(r, f).
  $

  At each pole of $f$ with multiplicity $p$, $f'$ will have a pole of multiplicity $p + 1$. Then distinct poles can be counted as $N(r, f') - N(r, f) = overline(N) (r, f)$. Then
  $
    q - 1 - S(r, f) / T(r, f) <= (overline(N) (r, f) - N(r, 0, f')) / T(r, f) + sum_(nu = 1)^q N(r, a_nu, f) / T(r, f).
  $

  Each zero $z$ of multiplicity $m$ of $f - a_nu$ gives rise to a zero of multiplicity $m - 1$ of $f'$. Then $overline(n) (r, a_nu, f) = n(r, a_nu, f) - n_(a_nu) (r, 0, f')$ where $n_(a_nu) (r, 0, f')$ is the zero discrete counting function of $f'$ with the proviso that points are counted at points where $f = a_nu$. In effect, $N_(a_nu)(r, 0, f')$ counts the solutions to $f=a_nu$, where each solution is under-counted once. Hence, this difference counts these under-counts, or effectively, the number of solutions without consideration of multiplicity.

  Then $ sum_nu overline(N) (r, a_nu, f) = sum_nu N(r, a_nu, f) - N_({a_nu}_nu) (r, 0, f') $ (where $N_({a_nu}_nu) (r,0,f')$ is the zero counting function of $f'$ with the condition that the points $z$ satisfy $f(z) in {a_nu}_nu$), and letting $N_0 (r, 0, f')$ count the critical points of $f$ that satisfy $f in.not {a_nu}_nu$,
  $ N_({a_nu}_nu)(r,0,f') + N_0 (r,0,f') = N(r,0,f'). $
  Hence,
  #lbl(
    $
      q - 1 - S(r, f) / T(r, f) <= (overline(N) (r, f)) / T(r, f) - (N_0 (r, 0, f')) / T(r, f) + sum_(nu = 1)^q (overline(N) (r, a_nu, f)) / T(r, f).
    $,
    <eq:deficiency-relation_fundamentalinequality>,
  )
  Then taking the superior limits on both side through a sequence ${r_n}$ such that $lim_(n -> oo) S(r_n, f) / T(r_n, f) = 0$ (whose existence is given by @thm:nevanlinnaadmissibilityerrortermgrowth) and loosening the inequality by removing the $N_0$ term,
  $
    q - 1 <= limsup_(n -> oo) (overline(N) (r_n, oo, f)) / T(r_n, f) + sum_(nu = 1)^q limsup_(n -> oo) (overline(N) (r_n, a_nu, f)) / T(r_n, f) \
    <= limsup_(r -> R_0^-) (overline(N) (r, oo, f)) / T(r, f) + sum_(nu = 1)^q limsup_(r -> R_0^-) (overline(N) (r, a_nu, f)) / T(r, f) \
    = 1 - Theta(oo, f) + sum_(nu = 1)^q [1 - Theta(a_nu, f)].
  $
  Therefore, $sum_(nu = 1)^q Theta(a_nu, f) + Theta(oo, f) <= 2$. The $Theta(oo, f)$ term may or may not be truncated. Without loss of generality, we allow the arbitrary distinct ${a_nu}_nu^q$ to comprise $oo$, to obtain a more uniformized expression.

  Assume some arbitrary $N in NN$. If $2 N + 1$ values in the Riemann sphere have truncated deficiencies each exceeding $1 \/ N$, then applying the previous to result to these $2 N + 1$ values, their truncated deficiency sum exceeds 2, which is a contradiction. Thus, $forall N in NN$, at most $2 N$ values have truncated deficiencies exceeding $1 \/ N$. Let these exceeding values form the finite set $S_N$. Then
  $ S = union.big_(N = 1)^oo S_N = {a in extcomplex : Theta(a, f) > 0} $
  is a countable set, and hence can be described with a sequence ${a_nu}_(nu = 1)^q$. Then by the inequality,
  $ sum_(nu = 1)^q Theta(a_nu, f) <= 2 ==> sum_(nu = 1)^oo Theta(a_nu, f) <= 2. #qedhere $
]

#remark[
  Ahlfors' geometric formulation of the second fundamental theorem suggests that the value 2 in the inequality is connected to the Euler characteristic of the Riemann sphere via triangulation.
]

Therefore, we have

#lbl(
  corollary[
    A non-constant meromorphic function omits at most two values on the Riemann sphere.
  ],
  <cor:picardtranscendentalmeromorphic>,
)

#proof[
  Assume there exists three values $a$, $b$, $c in extcomplex$ that meromorphic function $f$ does not ever attain. Then $N(r, a, f)$, $N(r, b, f)$, $N(r, c, f)$ all vanish identically with respect to radius while $T > 0$.

  Then $delta(a, f)$, $delta(b, f)$, $delta(c, f) = 1$. By the deficiency relation (@thm:deficiency-relation),
  $ 2 >= sum_(z in S) [delta(z) + theta(z)] >= delta(a, f) + delta(b, f) + delta(c, f) = 3, $
  which is an impossibility.
]

#lbl(
  corollary[Picard's Little Theorem][
    Any non-constant entire function omits at most one value.
  ],
  <cor:picard-little-theorem>,
)

#proof[
  Any such function can be regarded as a meromorphic function on the plane that omits $oo$. Then the conclusion follows from @cor:picardtranscendentalmeromorphic.
]

The use of spherically normal families in the proof of the Great Picard Theorem for more general domains is unavoidable. For further treatment, refer to @hayman1964meromorphic.
