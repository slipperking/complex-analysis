#import "/lib.typ": *

== Calculus

Since traditional complex analysis is the theory of calculus on complex functions, it is only natural that generalizations are made on classical formulas in calculus for complex functions.

It is well known that a function $f : (a, b) -> RR$ is differentiable at a point $x in (a, b)$ if the limit
$ lim_(Delta x -> 0) (f(x + Delta x) - f(x)) / (Delta x) $
exists, and the value of this limit is the derivative of $f(x)$, denoted by $f'(x)$ or $dv(f, x)$. The value $dif f = f'(x) dx$ is the differential of $f(x)$. Partition $[a, b]$ into $a = x_0 < x_1 < x_2 < dots.c < x_n = b$ such that the length of the intervals $[x_i, x_(i-1)]$ vanishes (we let the norm of the partition, or the size of the largest interval, tend to zero) as $n -> oo$. If for any such partition, the sum
$ sum_(i=1)^n f(xi_i)(x_i - x_(i-1)) $
tends to the same value $forall xi_i in [x_(i-1), x_i]$ (as the length of the largest partition approaches 0), then the function can be roughly said to be integrable over $[a, b]$. The full details of Riemann integrability are simplified by the use of Darboux sums and will not be discussed here. The value of this sum is denoted by
$ integral_a^b f(x) dx. $

We will attempt to avoid notions involving Lebesgue integration. However, it is important to note that every Riemann integrable function is also Lebesgue integrable, and the two integrals are equal. Therefore, we will use Lebesgue integral theorems (where the resultant integral is Riemann integrable) when necessary without further mention of the Lebesgue integral itself.

The following theorems are the fundamental results of classical calculus:

#theorem("Fundamental Theorem of Calculus, Differential Form")[
  Let $f(x)$ be a function continuous over $[a, b]$. For $x in [a, b]$, define
  $ Phi(x) = integral_a^x f(t) dif t. $
  Then $Phi(x)$ is differentiable over $[a, b]$, $Phi'(x) = f(x)$, and $dif Phi(x) = f(x) dx$.
]

#theorem("Fundamental Theorem of Calculus, Integral Form")[
  Let $Phi(x)$ be a function differentiable over $[a, b]$. Let $f(x) = Phi'(x)$ over $[a, b]$. Then,
  $ integral_a^x f(t) dif t = Phi(x) - Phi(a). $
]

The two forms of the theorem show that differentiation and integration are inverse operations to each other. Operations performed for differentiating oftentimes have a corresponding inverse operation that can be done for integrating. For instance,
$ dv(, x)(f(x) plus.minus g(x)) = f'(x) plus.minus g'(x) $
corresponds to
$ integral (f(x) plus.minus g(x)) dx = integral f(x) dx plus.minus integral g(x) dx, $
and
$ dv(, x) (f(x) g(x)) = f'(x) g(x) + f(x) g'(x) $
corresponds to
$ integral f(x) g'(x) dx = f(x) g(x) - integral f'(x) g(x) dx, $
and
$ dv(f(g(x)), x) = dv(f(g), g) dot dv(g, x) $
corresponds to
$ integral_a^b f(g(x)) g'(x) dx = integral_(g(a))^(g(b)) f(u) dif u. $
Another correspondence is the Mean Value Theorem:

#theorem[Mean Value Theorem, Differential Form][
  If $f(x)$ is differentiable over $[a, b]$, then $exists c in [a, b]$ such that
  $ f(b) - f(a) = f'(c)(b - a). $
]

#theorem[Mean Value Theorem, Integral Form][
  If $f(x)$ is continuous over $[a, b]$, then $exists xi in [a, b]$ such that
  $ integral_a^b f(x) dx = f(xi)(b - a). $
]

A curve is a one-dimensional manifold embedded within a higher dimensional space. They can be parameterized with a vector $vb(F)(t) = (P(t), Q(t), R(t))$ of one parameter. In the complex plane, a curve is a complex-valued function $gamma(t)$ for a real parameter $alpha <= t <= beta$. A curve is _closed_ if $gamma(alpha) = gamma(beta)$. It is _smooth_ if it is continuously differentiable, and its direction is defined to be the direction as $t$ increases. If it is smooth everywhere except at a finite number of points, it is _piecewise smooth_. If it is of finite length, then the curve is said to be _rectifiable_. Piecewise smooth curves are rectifiable. A curve is _simple_ if it is simple (non-self-intersecting), or if $gamma(t_1) = gamma(t_2)$ implies that $t_1 = t_2$. A simple closed curve is also called a _Jordan curve_.

#theorem[Jordan Curve Theorem][
  Let $gamma$ be a Jordan curve in $RR^2$. Then the set $RR^2 without gamma$ consists of exactly two connected subsets. One of them is the interior, denoted by $op("int")(gamma)$, and is a bounded set, while the other is the exterior, denoted by $op("ext")(gamma)$, which is unbounded. Both of the two sets share the common boundary $gamma$.
] <thm:jordan_curve>

The theorem above seems trivial, but its rigorous proof in topology is extremely complex. The theorem itself can also be stated on $CC$ instead of $RR^2$. For a region $U$, the boundary is denoted $partial U$. If the region bounded by any closed curve in $U$ also lies in $U$, then it is a _simply connected_ region. A connected region that is not simply connected is multiply connected. A region bound by 2 non-intersecting Jordan curves is doubly connected, and a region bound by $n$ non-intersecting Jordan curves is traditionally known as $n$-connected. Lastly, any closed curve can degenerate to a single point or slit.

Generalizations of the differential and integral exist for multivariate functions. The partial differentials of $f(x, y, z)$, $pdv(f, x) dx$, $pdv(f, y) dy$, and $pdv(f, z) dz$ sum up to form the total differential, denoted by $dif f$.

#definition[
  Let $U subset RR^n$ be open and let $f : U -> RR^m$. More generally, for $k in NN$, we write $f in C^k (U)$ iff all partial derivatives of $f$ of order $k$ exist and are continuous on $U$. If $K subset RR^n$ is compact, then $f in C^k (K)$ means that $f$ is $C^k$ on some open neighborhood of $K$. We write $f in C^oo (U)$ means that $f$ has derivatives of all orders and that every derivative is continuous. Equivalently, $f$ is infinitely differentiable; that is, infinitely continuously differentiable.
]

There is a difference between differentiability and continuous differentiability:

#example[
  The one-variable function $f(x) = x^2 sin(1/x)$ for $x != 0$, with $f(0) = 0$, is differentiable everywhere but not continuously differentiable, since its derivative oscillates near $x = 0$.
]

An important result in multivariable calculus allows the calculation of the derivatives of a definite integral with respect to its parameter.

#theorem[Leibniz Integral Rule][
  Let $f(x, u)$ be continuous on $a <= x <= b$, $c <= u <= d$, and suppose $a <= alpha(u), beta(u) <= b$ are differentiable functions of $c <= u <= d$. If $f$ is continuously differentiable with respect to $u$, then
  $
    dv(, u) (integral_(alpha(u))^(beta(u)) f(x, u) dx) & = integral_(alpha(u))^(beta(u)) pdv(f, u) (x, u) dx \
                                                       & quad ""+ dv(beta, u) f(beta(u), u) - dv(alpha, u) f(alpha(u), u).
  $
] <thm:leibnizintegralrule>

Four main classical theorems exist, relating a function and its line integral in 2 and 3 dimensions, line and surface (or area) integrals in 2 and 3 dimensions, and the surface and volume integrals in 3 dimensions:

#theorem("Gradient Theorem")[
  Let $gamma$ be an oriented smooth curve in $RR^3$ with boundary points $a$ and $b$. Then if $f in C^1 (gamma)$
  $ evaluated(f)_(partial gamma)= f(b) - f(a) = integral_gamma pdv(f, x) dx + pdv(f, y) dy + pdv(f, z) dz. $
] <thm:gradient>

#theorem("Green's Theorem")[
  Let $U$ be a positively oriented, multiply connected subset of $RR^2$ with a piecewise smooth oriented boundary $partial U$. Suppose that $P(x, y), Q(x, y) in C^1(overline(U))$. Then,
  $ integral.cont_(partial U) P dx + Q dy = integral.double_U (pdv(Q, x) - pdv(P, y)) dd(x, y). $
] <thm:real_green>

#theorem("Stokes' Theorem")[
  Suppose that $S subset RR^3$ is a positively oriented surface with a positively oriented, piecewise smooth boundary curve $partial S$. Suppose that $P(x, y, z), Q(x, y, z), R(x, y, z) in C^1(overline(S))$. Then,
  $
    integral.cont_(partial S) P dx + Q dy + R dz \
    = integral.double_S (pdv(R, y) - pdv(Q, z)) dy dz + (pdv(P, z) - pdv(R, x)) dz dx + (pdv(Q, x) - pdv(P, y)) dd(x, y).
  $
] <thm:kelvinstokes>

#theorem("Gauss' Theorem")[
  Suppose that $V subset RR^3$ is a positively oriented region with a positively oriented, piecewise smooth boundary surface $partial V$. Suppose that $P(x, y, z), Q(x, y, z), R(x, y, z) in C^1(overline(V))$. Then,
  $
    integral.surf_(partial V) P dy dz + Q dz dx + R dx dy = integral.triple_V (pdv(P, x) + pdv(Q, y) + pdv(R, z)) dd(x, y, z).
  $
] <thm:divergencegauss>

In 3-dimensional $RR^3$ space, define a scalar valued function to be a $0$-form, a linear combination of $dx$, $dy$, and $dz$ to be a $1$-form, and a linear combination of $dy and dz$, $dz and dx$, and $dx and dy$ to be a $2$-form, and $dx and dy and dz$ to be a $3$-form, where $and$ denotes an anti-commutative and associative product, where for any two differential forms $omega_1$ and $omega_2$
$ omega_1 and omega_2 = - omega_2 and omega_1. $
Then consequently, for any differential form $omega$,
$ omega and omega = 0. $

We can generalize the operator $dif$ to increase the degree of a differential form. For instance,
$ dif f = pdv(f, x) dx + pdv(f, y) dy + pdv(f, z) dz, $
which is the definition of the total differential. For a $1$-form in 3-dimensional space, $omega_1 = P dx + Q dy + R dz$, we can define the exterior derivative in a similar way:
$
  dif omega_1 & = dif P and dx + dif Q and dy + dif R and dz \
              & = (pdv(P, x) dx + pdv(P, y) dy + pdv(P, z) dz) and dx \
              & quad + (pdv(Q, x) dx + pdv(Q, y) dy + pdv(Q, z) dz) and dy \
              & wide + (pdv(R, x) dx + pdv(R, y) dy + pdv(R, z) dz) and dz \
              & = (pdv(R, y) - pdv(Q, z)) dd(y, z, prod: and) + (pdv(P, z) - pdv(R, x)) dd(z, x, prod: and) \
              & quad ""+ (pdv(Q, x) - pdv(P, y)) dd(x, y, prod: and).
$

Similarly, we can differentiate a $2$-form $omega = P dd(y, z, prod: and) + Q dd(z, x, prod: and) + R dd(x, y, prod: and)$ to get:
$ (pdv(P, x) + pdv(Q, y) + pdv(R, z)) dd(x, y, z, prod: and). $
The two results above resemble the curl and divergence of $(P, Q, R)$. A differential form $omega$ is _closed_ if $dif omega = 0$, and is _exact_ if there exists $eta$ such that $omega = dif eta$.

#lemma("Poincaré")[
  For any differential form $omega$ on an open, contractible set $U subset.eq RR^n$, if $omega$ is closed, then it is also exact.
] <lem:poincare>

It is true that for any set $U subset.eq RR^n$, regardless of contractibility, that for a differential form $omega$ defined on $U$, $dif(dif omega) = 0$. In other words, all exact differential forms are closed. (For a region $U$, we have $partial partial U = nothing$. This is one of many reasons for which the boundary operator is denoted by $partial$, in analogy to $dif$.)

The implications of this are important: if $omega$ is a $0$-form, then $curl(grad omega) = 0$, and if $omega$ is a $1$-form, $div(curl vb(v)) = 0$, where $vb(v)$ is the vector of the coefficients of the basis differential forms of $omega$ (there are no correlations for higher degree forms since in 3-dimensional space, the highest degree possible for any differential form is 3).

Then, the Fundamental Theorem of Calculus, the Gradient Theorem, Green's, Stokes', and Gauss' Theorems can be generalized into:

#theorem[Stokes--Cartan][
  For an oriented smooth $n$-dimensional compact manifold $M$ with boundary $partial M$, for a smooth differential $(n-1)$-form $omega$ over $overline(M)$,
  $ integral_M dif omega = integral_(partial M) omega. $
] <thm:stokescartan>

Real analysis is the subject dedicated to rigorously defining concepts such as limits, continuity, integrability, convergence, etc. The most widely used definition of a finite limit of a function is the language of $epsilon$--$delta$, which states:

#definition[Epsilon--Delta][
  Let $f : U -> RR$ be a function defined over an open set $U subset.eq RR$ such that $a$ is an accumulation point of $U$. We say that $lim_(x -> a) f(x) = L$ if $forall epsilon > 0$, $exists delta > 0$ such that for all $x in U$ with $0 < abs(x - a) < delta$, we have $abs(f(x) - L) < epsilon$.

  Similarly, we define the _right-handed limit_ $lim_(x -> a^+) f(x) = L$ if for every $epsilon > 0$, there exists $delta > 0$ such that for all $x in U$ with $0 < x - a < delta$, we have $abs(f(x) - L) < epsilon$.

  Likewise, the _left-hand limit_ $lim_(x -> a^-) f(x) = L$ exists if for every $epsilon > 0$, there exists $delta > 0$ such that for all $x in U$ with $-delta < x - a < 0$, we have $abs(f(x) - L) < epsilon$.
] <def:epsilondelta>

We also have the definition of the limit of a sequence:

#definition[Epsilon--N][
  Let ${a_n}_(n in NN) subset RR$ be a sequence. If $exists a_infinity in RR$ such that $forall epsilon > 0$, $exists N in NN$ such that $forall n > N$, $abs(a_n - a_infinity) < epsilon$, then ${a_n}$ _converges_ to $a_infinity$.
] <def:epsilonn>

#theorem("Cauchy Criterion")[
  Let ${a_n}_(n in NN) subset RR$ be a sequence. Then ${a_n}$ is convergent iff $forall epsilon > 0$, $exists N in NN$ such that $forall n, m > N$, $abs(a_n - a_m) < epsilon$.
] <thm:cauchycriterionsequenceconvergence>

#proof[
  Assume ${a_n}$ is convergent. Then $forall epsilon > 0$, $exists N in NN$ such that $forall n, m > N$, $abs(a_n - a_infinity) < epsilon / 2$ and $abs(a_m - a_infinity) < epsilon / 2$ for some $a_infinity in RR$. It follows that
  $ abs(a_n - a_m) <= abs(a_n - a_infinity) + abs(a_m - a_infinity) = epsilon. $

  Conversely, ${a_n}$ is bounded (fixing $N$, $forall n > N$, $abs(a_n - a_(N+1)) < epsilon$). By the Bolzano--Weierstrass Theorem (@thm:bolzanoweierstrass), ${a_n}_(n in NN)$ has a subsequence ${a_(n_k)}_(k in NN)$ that converges to $a_infinity$. Therefore, $forall epsilon > 0$, $exists N in NN$ and $exists M in NN$ such that $forall k > M$, $n_k > N$, and $forall n > N$, $abs(a_n - a_(n_k)) < epsilon / 2$ and $abs(a_(n_k) - a_infinity) < epsilon / 2$. Then
  $ abs(a_n - a_infinity) <= abs(a_n - a_(n_k)) + abs(a_(n_k) - a_infinity) < epsilon. $
  Hence, ${a_n}$ converges to $a_infinity$.
]

#definition("Limit Superior")[
  For a number sequence ${a_n} subset RR$, if $exists a in RR$ such that:
  + $forall epsilon > 0$, $exists N in NN$ such that $forall n > N$, $a_n < a + epsilon$,
  + $forall epsilon > 0$, $forall N in NN$, $exists n > N$ such that $a_n > a - epsilon$,

  then the _superior limit_ of ${a_n}$ is $a$, denoted by $limsup_(n -> oo) a_n = a$.
] <def:limsup>

#definition("Limit Inferior")[
  For a number sequence ${a_n} subset RR$, if $exists a in RR$ such that:
  + $forall epsilon > 0$, $exists N in NN$ such that $forall n > N$, $a_n > a - epsilon$,
  + $forall epsilon > 0$, $forall N in NN$, $exists n > N$ such that $a_n < a + epsilon$,

  then the _inferior limit_ of ${a_n}$ is $a$, denoted by $liminf_(n -> oo) a_n = a$.
] <def:liminf>

#lemma[
  A number sequence ${a_n}$ is convergent iff $limsup_(n -> oo) a_n = liminf_(n -> oo) a_n$.
]

#proof[
  We first prove that $a = lim_(n -> oo) a_n$ implies $limsup_(n -> oo) a_n = liminf_(n -> oo) a_n = a$.
  By @def:epsilonn, $forall epsilon > 0$, $exists N in NN$ such that $forall n > N$,
  $ abs(a_n - a) < epsilon <==> a - epsilon < a_n < a + epsilon. $
  Then from @def:limsup and @def:liminf, we have that $limsup_(n -> oo) a_n >= a$ and $liminf_(n -> oo) a_n <= a$. By the second conditions, we get $limsup_(n -> oo) a_n <= a$ and $liminf_(n -> oo) a_n >= a$. Therefore,
  $ limsup_(n -> oo) a_n = liminf_(n -> oo) a_n. $

  For the converse, assume $limsup_(n -> oo) a_n = liminf_(n -> oo) a_n$. Since $exists N_1 in NN$ such that $forall n > N_1$, $a_n < a + epsilon$. $exists N_2 in NN$ such that $forall n > N_2$, $a_n > a - epsilon$. Then $forall n > max {N_1, N_2}$, $abs(a_n - a) < epsilon$, as expected.
]

#definition("Continuity")[
  A function $f : U -> RR$, defined on an open set $U subset.eq RR$ containing a point $a in U$, is said to be continuous at $a$ iff
  $ lim_(x -> a) f(x) = f(a). $
] <def:continuity>

It is important to note that in the case of multiple _explicit_ variables, a distinction is made between (separate) continuity (where there are two $delta$'s on which variable varies, and does not guarantee a single $delta$ for when both variables vary simultaneously) and _joint_ continuity (where a single $delta$ controls both variables at once). To illustrate this, let $(x_0, y_0)$ be fixed. The former is commonly written as
$
  forall epsilon > 0, exists delta > 0 "such that" forall abs(x - x_0) < delta, abs(f(x, y_0) - f(x_0, y_0)) < epsilon
$
in conjunction with
$
  forall epsilon > 0, exists delta > 0 "such that" forall abs(y - y_0) < delta, abs(f(x_0, y) - f(x_0, y_0)) < epsilon,
$
whereas the latter is expressed as
$
  forall epsilon > 0, exists delta > 0 "such that" forall abs((x - x_0, y - y_0)) < delta, abs(f(x, y) - f(x_0, y_0)) < epsilon.
$

#theorem[
  Any continuous function on a compact set $K$ is bounded on $K$.
] <thm:continuous_function_bounded_on_compact>

#proof[
  Suppose for the sake of contradiction that $f : U -> RR$ is continuous and unbounded on compact $K$. Then for each $n in NN$, there exists $x_n in K$ such that $abs(f(x_n)) > n$. The sequence ${x_n}$ lies in $K$, which is compact, so by the Bolzano--Weierstrass Theorem (@thm:bolzanoweierstrass), ${x_n}$ has an accumulation point in $K$. In other words, there exists a convergent subsequence ${x_(n_k)}$ with $lim_(k -> oo) x_(n_k) in K$.

  Since $f$ is continuous, $lim_(k -> oo) f(x_(n_k)) = f(lim_(k -> oo) x_(n_k))$, which is well-defined because $lim_(k -> oo) x_(n_k) in K$. However, this contradicts $abs(f(x_(n_k))) > n_k -> oo$, hence $f$ must be bounded on $K$.
]

#theorem("Extreme Value")[
  A continuous function $f(x)$ defined on a compact set $K$ attains its infimum and supremum in $K$.
] <thm:extremevalue>

#proof[
  Assume that $f$ never attains its supremum $M$. Then, $f(x) < M$. Define the auxiliary function $psi(x) = 1 / (M - f(x))$, which is strictly positive and continuous as the denominator never reaches $0$. By @thm:continuous_function_bounded_on_compact, $psi(x)$ is bounded with some value of $mu > 0$ satisfying $psi(x) <= mu$. $f(x)$ also has the representation $M - 1 / (psi(x))$, and therefore,
  $ f(x) <= M - 1 / mu, $
  which means that $M$ is not the supremum. Similarly, assume that $f$ never attains its infimum $m$. Then $f(x) > m$. Let $psi(x) = 1 / (f(x) - m)$, which is strictly positive and continuous as the denominator never reaches $0$. By @thm:continuous_function_bounded_on_compact, $psi(x)$ is bounded with some value of $mu > 0$ satisfying $psi(x) <= mu$. $f(x)$ also has the representation $m + 1 / (psi(x))$, and therefore,
  $ f(x) >= m + 1 / mu, $
  which means that $m$ is not the infimum.
]

#definition("Uniform Continuity")[
  A function $f : U -> RR$, defined on a set $U subset.eq RR$, is uniformly continuous iff $forall epsilon > 0$, $exists delta > 0$ such that $forall x, y in U$ where $abs(x - y) < delta$, $abs(f(x) - f(y)) < epsilon$.
] <def:uniformcontinuity>

#example[
  The function $f(x) = 1 / x$ is not uniformly continuous over $(0, 1)$.
]

#proof[
  If $exists epsilon > 0$ such that $forall delta > 0$, $exists x, y in (0, 1)$ satisfying both $abs(x - y) < delta$ and $abs(f(x) - f(y)) >= epsilon$, then $f$ is not uniformly continuous over $(0, 1)$.

  Let $epsilon = 1$ and
  $ x = 1 / n, quad y = 1 / (n + 1). $
  Then $forall delta > 0$, $exists n > 1$ where $abs(x - y) < delta$, since $lim_(n -> oo) abs(x - y) = 0$. Additionally, $abs(f(x) - f(y)) = 1 >= epsilon$. This satisfies the negation, and thus, $f(x) = 1 / x$ is not uniformly continuous over $(0, 1)$.
]

#theorem[Heine--Cantor][
  A continuous function on a compact set $K$ is uniformly continuous on $K$.
] <thm:heinecantor>

#proof[
  Fix $x in K$. Since $f$ is continuous at $x$, for every $epsilon > 0$ there exists $delta_x > 0$ such that for all $zeta in D(x, delta_x) inter K$,
  $ abs(f(zeta) - f(x)) < epsilon / 2. $ <eq:heine_cantor_pointwise>

  The collection of open balls ${D(x, delta_x / 2)}_(x in K)$ forms an open cover of the compact set $K$. By Heine--Borel (@thm:heine_borel), there is a finite subcover
  $ {D(x_k, delta_(x_k) / 2)}_(k=1)^n. $
  Set
  $ delta = min_(1 <= k <= n) delta_(x_k) / 2. $
  Now let $x, y in K$ satisfy $abs(x - y) < delta$. Then there exists an index $j in {1, dots.c, n}$ such that $x in D(x_j, delta_(x_j) / 2)$. Consequently,
  $ abs(x_j - y) <= abs(x_j - x) + abs(x - y) < delta_(x_j) / 2 + delta <= delta_(x_j). $
  Applying @eq:heine_cantor_pointwise to the points $x$ and $y$ through $x_j$, we obtain
  $ abs(f(x_j) - f(x)) < epsilon / 2, quad abs(f(x_j) - f(y)) < epsilon / 2. $
  Therefore,
  $ abs(f(x) - f(y)) <= abs(f(x) - f(x_j)) + abs(f(x_j) - f(y)) < epsilon. $
  Since $epsilon > 0$ was arbitrary, the uniform continuity of $f$ on $K$ follows.
]

#definition[
  A function $f$ is Lipschitz continuous over $U$ if $exists M in RR_(>=0)$ such that $forall x, y in U$, $abs(f(x) - f(y)) <= M abs(x - y)$. The smallest possible $M$ satisfying the above condition is known as the Lipschitz constant.
]

Lipschitz continuity is an important concept in real analysis and the theory of differential equations. It is a strong form of uniform continuity.

#proposition[
  All Lipschitz continuous functions on $U$ are uniformly continuous on $U$.
]

#proof[
  Let $M > 0$ be the Lipschitz constant. Then $forall epsilon > 0$, let $delta = epsilon / M$. It then follows that $forall x, y in U$ such that $abs(x - y) < delta$, $abs(f(x) - f(y)) <= M abs(x - y) < epsilon$.
]

#proposition[
  A $C^1$ function on a compact set $K$ is Lipschitz continuous on $K$.
] <prop:c1_lipschitz>

#proof[
  Let $f : K -> RR$ be $C^1$. By @thm:continuous_function_bounded_on_compact, since $K$ is compact and $f'$ is continuous, $exists M > 0$ such that $forall x in K$, $abs(f'(x)) <= M$.

  By the Mean Value Theorem, $forall x, y in K$, $exists c$ between $x$ and $y$ such that $f(x) - f(y) = f'(c)(x - y)$. Then, $abs(f(x) - f(y)) = abs(f'(c))abs(x - y) <= M abs(x - y)$, which means $f$ is Lipschitz continuous with Lipschitz constant less than or equal to $M$.
]
