#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Nevanlinna's Counting, Proximity, and Characteristic Functions],
  route: "nevanlinna-counting-proximity-characteristic-functions",
)
Let $f: D(0, R) -> extcomplex$ be meromorphic with a Laurent expansion
$ f(z) = sum_(j = k)^oo c_j z^j $
where $c = c_k$ and $c != 0$, such that the annulus of convergence has an inner radius of $0$ (we effectively take the innermost expansion). Then $z mapsto frac(f(z), z^k, style: "horizontal")$ is holomorphic on a neighborhood of $0$ and is nonzero at $0$. By Jensen's formula (@thm:jensens-formula) on $frac(f(z), z^k, style: "horizontal")$,

#lbl(
  $
    & log abs(r^(m - n) (b_1 b_2 dots.c b_n) / (a_1 a_2 dots.c a_m)) + k log r \
    & wide wide ""= 1 / (2 uppi) integral_0^(2 uppi) log abs(f(r ee^(ii theta))) dtheta - log abs(c),
  $,
  <eq:nevanlinna-counting-jensens-formula-exposition-1>,
)
where $a_1, dots, a_m$ and $b_1, dots, b_n$ are the zeros and poles of $f$ in $overline(D(0, r)) subset D(0, R)$ excluding those at $0$, ordered in non-decreasing moduli. Observe that

$
  log abs(r^m / (a_1 a_2 dots.c a_m))
  & = log abs(a_2 / a_1 (a_3 / a_2)^2 dots.c (a_m / a_(m - 1))^(m - 1) (r / a_m)^m) \
  &= (sum_(j = 1)^(m - 1) j integral_(abs(a_j))^(abs(a_(j + 1))) + m integral_(abs(a_m))^r) dx / x.
$

For any $j in NN$ and $x$ such that $abs(a_j) <= x < abs(a_(j + 1))$, the number of zeros (multiplicities counted) of $f$ within $overline(D(0, x))$, denoted $n(x, 0, f)$, is trivially equal to $n(x, 0, f) = j + k$ if $k > 0$, since the zero at $0$ has multiplicity $k$ and the other zeros in $overline(D(0, x))$ are $a_1, dots, a_j$; thus,

$
  log abs(r^m / (a_1 a_2 dots.c a_m)) =
  cases(
    integral_0^r (n(x, 0, f) - k) / x dx quad & "if" k > 0,
    integral_0^r n(x, 0, f) / x dx quad & "otherwise",
  )
$

In either case, this quantity is given by

$
  log abs(r^m / (a_1 a_2 dots.c a_m)) = integral_0^r (n(x, 0, f) - n(0, 0, f)) / x dx.
$

Letting $n(x, oo, f)$ denote the number of poles, counting orders, in $overline(D(0, x))$, we obtain similarly

$
  log abs(r^n / (b_1 b_2 dots.c b_n)) = integral_0^r (n(x, oo, f) - n(0, oo, f)) / x dx.
$

#definition[
  For $a in extcomplex$, define the _Nevanlinna counting function_ by

  $ N(r, a, f) = integral_0^r (n(x, a, f) - n(0, a, f)) / x dx + n(0, a, f) log r, $

  where $n(x, a, f)$ counts the number of times $f$ attains $a$ in $overline(D(0, x))$, counting orders (multiplicities of zeros of $f - a$, or poles of $f$ if $a = oo$). In the event that $a$ is elided, assume $a = oo$.
]

Then @eq:nevanlinna-counting-jensens-formula-exposition-1 is simply

#lbl(
  $
    N(r, 0, f) - N(r, oo, f) = 1 / (2 uppi) integral_0^(2 uppi) log abs(f(r ee^(ii theta))) dtheta - log abs(c). quad
  $,
  <eq:nevanlinna-counting-jensens-formula-exposition-2>,
)

Define the _nonnegative part of the logarithm_, denoted $logp (x)$, to be

$ logp (x) = max { log(x), 0 }. $

#lbl(
  proposition[Properties of $logp$][
    The following properties hold:
    1. $logp x >= log x$ for $x > 0$. #enum-lbl(<itm:log-nonnegative-part-properties-first-property>)
    2. $logp x <= logp y$ for $x <= y$ (non-decreasing). #enum-lbl(<itm:log-nonnegative-part-properties-non-decreasing>)
    3. $log x = logp x - logp (1 / x)$ for $x > 0$. #enum-lbl(<itm:log-nonnegative-part-properties-difference-of-reciprocal-logs>)
    4. $abs(log x) = logp x + logp (1 / x)$ for $x > 0$. #enum-lbl(<itm:log-nonnegative-part-properties-sum-of-reciprocal-logs>)
    5. $logp product_k x_k <= sum_k logp x_k$ for (finitely many) positive $x_k$. #enum-lbl(<itm:log-nonnegative-part-properties-multiplicative-subadditivity>)
    6. $logp sum_(k = 1)^n x_k <= log n + sum_(k = 1)^n logp x_k$ for (finitely many) positive $x_k$. #enum-lbl(<itm:log-nonnegative-part-properties-weak-subadditivity>)
  ],
  <prop:log-nonnegative-part-properties>,
)

#proof[
  The first five properties are trivial. We now prove @itm:log-nonnegative-part-properties-weak-subadditivity. Observing that $x_k <= ee^(logp x_k)$, it follows that

  $
    logp sum_(k = 1)^n x_k & <= logp sum_(k = 1)^n ee^(logp x_k)
                             <= logp n + logp(ee^(max_k logp x_k)) \
                           & = log n + max_k logp x_k.
  $

  The last step uses the fact that $logp$ is simply $log$ when the argument $>= 1$.
]

#definition[
  For $r > 0$, $a in CC$, define the _Nevanlinna proximity function_ by

  $ m(r, a, f) = 1 / (2 uppi) integral_0^(2 uppi) logp abs(1 / (f(r ee^(ii theta)) - a)) dtheta $

  and

  $ m(r, f) = m(r, oo, f) = 1 / (2 uppi) integral_0^(2 uppi) logp abs(f(r ee^(ii theta))) dtheta $

  in the infinite case. Observe that $m(r, a, f) = m(r, 1 / (f - a))$.
]

Since

$ logp abs(f(r ee^(ii theta))) - logp abs(1 / (f(r ee^(ii theta)))) = log abs(f(r ee^(ii theta))). $

this implies

$ m(r, oo, f) - m(r, 0, f) = 1 / (2 uppi) integral_0^(2 uppi) log abs(f(r ee^(ii theta))) dtheta. $

Then @eq:nevanlinna-counting-jensens-formula-exposition-2 can be written as:

#lbl(
  $
    N(r, 0, f) + m(r, 0, f) = N(r, oo, f) + m(r, oo, f) - log abs(c). wide
  $,
  <eq:nevanlinna-first-theorem-at-zero>,
)

#definition[
  This motivates the sum $T(r, f)$, known as the _Nevanlinna characteristic_, defined by $T(r, f) = m(r, f) + N(r, f)$ (we will also use the notation $T(r, a, f) = m(r, a, f) + N(r, a, f)$).
]

Then @eq:nevanlinna-first-theorem-at-zero can be rewritten as:

#lbl(
  proposition[
    For any (non-constant) meromorphic $f$ on $D(0, R)$ with the innermost Laurent series $f(z) = sum_(j = k)^oo c_j z^j$ and any $0 < r < R$,
    $ T(r, 0, f) = T(r, oo, f) - log abs(c_k). $
  ],
  <prop:nevanlinna-first-theorem-at-zero>,
)
