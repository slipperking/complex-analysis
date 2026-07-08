#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Analytic Function Elements],
  route: "analytic-function-elements",
)

#lbl(
  definition[
    An _(analytic) function element_ is a pair $(f, U)$, where $U subset.eq CC$ is an open region and $f$ is a holomorphic function on $U$.
  ],
  <def:analytic-function-element>,
)
Analytic elements serve as local representations of analytic functions. The process of extending these elements is formalized through _analytic continuation_. In the definition above for a function element, we let $U$ be an arbitrary region. However, it is often more practical to consider the explicit case where $U$ is a disk.

By the Identity Theorem (@thm:identity), such continuations are unique; if $(f_1, U_1)$ and $(f_2, U_2)$ are analytic elements with $U_1 inter U_2 != emptyset$, and $f_1 equiv f_2$ on $U_1 inter U_2$, then they are _direct analytic continuations_ of each other. The combined function:
$
  tilde(f) (z) = cases(
    f_1 (z) & quad "if" quad z in U_1\,,
    f_2 (z) & quad "if" quad z in U_2 without U_1\,
  )
$
is holomorphic on $U_1 union U_2$.

The most straightforward method of the derivation of analytic continuations uses power series. Let $f(z) = sum_(n=0)^oo c_n (z - z_0)^n$ have radius of convergence $R > 0$ (by @thm:abels-theorem-radius). For $z_1 in D(z_0, R)$, we can expand $f$ at $z_1$:
$ f(z) = sum_(k=0)^oo (f^((k)) (z_1)) / (k!) (z - z_1)^k. $
Let $rho$ be the radius of convergence of this series. Then:
$ rho >= R - abs(z_1 - z_0). $
If $rho > R - abs(z_1 - z_0)$, then $f$ extends analytically to $D(z_0, R) union D(z_1, rho)$. In the case that $rho = R - abs(z_1 - z_0)$, the disks $D(z_0, R)$ and $D(z_1, rho)$ are tangent at a point $zeta_0$. Here, $zeta_0$ is a _singularity_, and $f$ cannot be continued beyond $zeta_0$.

#lbl(
  theorem[
    Let $f(z) = sum_(n=0)^oo c_n (z - z_0)^n$ have radius of convergence $R > 0$. Then $partial D(z_0, R)$ contains at least one singularity of $f$.
  ],
  <thm:boundarysingularity>,
)
#proof[
  Assume $f$ can be analytically continued from every $zeta in partial D(z_0, R)$. Then for each $zeta$, there exists $r_zeta > 0$ and a holomorphic $f_zeta$ on $D(zeta, r_zeta)$ agreeing with $f$ on $D(zeta, r_zeta) inter D(z_0, R)$.

  The disks ${ D(zeta, r_zeta) }_(zeta in partial D(z_0, R))$ cover $partial D(z_0, R)$. Then from compactness and the Heine--Borel Theorem (@thm:heine-borel), the cover of disks admits a finite subcover ${ D(zeta_k, r_k) }_(k=1)^n$. Hence, $exists rho > 0$ such that $A = { z : R - rho <= abs(z - z_0) <= R + rho } subset V$, where we let $V = union.big_(k=1)^n D(zeta_k, r_k)$.

  Define $Phi: V -> CC$ by $Phi(z) = f_(zeta_k) (z)$ if $z in D(zeta_k, r_k)$. This is well-defined: If $z in D(zeta_i, r_i) inter D(zeta_j, r_j)$, then $D(zeta_i, r_i) inter D(zeta_j, r_j) inter D(z_0, R) != emptyset$, and $f_(zeta_i) equiv f_(zeta_j) equiv f$ there. By the Identity Theorem (@thm:identity), $f_(zeta_i) equiv f_(zeta_j)$ on $D(zeta_i, r_i) inter D(zeta_j, r_j)$.

  Since $Phi$ is holomorphic on $V$ and agrees with $f$ on $D(z_0, R) inter V$, the function:
  $
    tilde(f) (z) = cases(
      f(z) & quad "if" quad z in D(z_0, R)\,,
      Phi(z) & quad "if" quad z in V\,
    )
  $
  is holomorphic on $D(z_0, R) union V supset.eq D(z_0, R + rho)$,
  contradicting the maximality of $R$.
]

#lbl(
  definition[
    A _maximal analytic continuation_ ${ (f, U) }$ of an analytic function element $(tilde(f), tilde(U))$ is obtained by all possible succesive analytic continuations of $(tilde(f), tilde(U))$. The union of every $U$ is known as the _domain of holomorphy_ of $tilde(f)$. The boundary set $partial U$ is known as a _natural boundary_. The continuation defines a function $f$, known a _global analytic function_, which can be multi-valued.
  ],
  <def:maximalanalyticcontinuation>,
)

#lbl(
  example[
    The series $f(z) = sum_(n=0)^oo z^(n!)$ has $DD$ as its disk of convergence, and every point on $partial DD$ is a singularity.
  ],
  <ex:factorial-lacunary-series>,
)
#proof[
  By Cauchy--Hadamard (@thm:cauchy-hadamard), $limsup_(n->oo) root(n, abs(c_n)) = 1$ since $c_n = 1$ if $n = k!$ and $0$ otherwise. Thus, $R = 1$.

  Fix $zeta in partial DD$. Suppose $f$ extends analytically to a
  disk $D(zeta, delta)$. Since $exp(2 uppi ii QQ)$ is dense in
  $partial DD$, there exists $zeta' = exp(2 uppi ii p / q) in
  D(zeta, delta) inter partial DD$ for coprime integers $p, q$. The
  extension $g$ of $f$ to $D(zeta, delta)$ would satisfy:
  $ lim_(r->1^-) f(r zeta') = g(zeta'). $
  However, for $0 < r < 1$:
  $ f(r zeta') = sum_(k=0)^(q-1) (r zeta')^(k!) + sum_(k=q)^oo r^(k!) (zeta')^(k!). $
  The second summation is unbounded since
  $ sum_(k=q)^oo r^(k!) (zeta')^(k!) = sum_(k=q)^oo r^(k!) > sum_(k=q)^N r^(k!) > (N - q + 1) r^(N!) $
  for any integer with $N > q$. Hence, as $r->1^-$, $sum_(k=q)^oo
  r^(k!) -> oo$. Hence, $zeta$ is a singularity.
]

#example[
  Show that $f(z) = sum_(n=0)^oo z^(2^n)$ cannot be analytically continued to the outside of $DD$.
]
#proof[
  Trivially, at $z = 1$, the series diverges. Therefore, $DD$ is its convergence disk. Observe that $f(z) = sum_(n=0)^oo (z^2)^(2^(n-1)) = sum_(n=0)^oo (z^2)^(2^n) + z = f(z^2) + z$. Hence, we have
  $ f(z) = f(z^2) + z = f(z^4) + z^2 + z = f(z^8) + z^4 + z^2 + z dots.c, $
  which diverges at each $z^2, z^4, z^8, dots = 1$. The solutions form a dense set
  in $partial DD$. By the same reasoning as
  @ex:factorial-lacunary-series, $f$ cannot be analytically continued to
  the outside of $DD$.
]

#lbl(
  example[
    Let $Log(z)$ denote the principal branch of $log(z)$, with $-uppi < Arg(z) <= uppi$. The analytic function elements
    $ (Log, D(1, 1)) quad "and" quad (Log + 2 uppi ii, D(1, 1)) $
    are analytic continuations of each other.
  ],
  <ex:complex-logarithm-analytic-continuation>,
)

#example[
  Show that the analytic functions defined by the series $f(z) = sum_(n=0)^oo alpha^n z^n$ and $tilde(f) (z) = sum_(n=0)^oo ((alpha - 1)^n z^n) / ((1 - z)^(n+1))$ are analytic continuations of each other.
]
#proof[
  The analytic function element $(f, D(0, abs(1 / alpha)))$ can be directly continued to the analytic function element $(z |-> 1 / (1 - alpha z), CC without { 1 / alpha })$. The function element $(tilde(f), D(0, (1 - z) / (alpha - 1)))$ can be analytically continued to
  $
    (z |-> 1 / ((1 - z) (1 - (z alpha - z) / (1 - z))), CC without { 1, 1 / alpha }) = (z |-> 1 / (1 - alpha z), CC without { 1, 1 / alpha }),
  $
  which is a direction analytic continuation of $(z |-> 1 / (1 - alpha z), CC without { 1 / alpha })$. Therefore, $f$ and
  $tilde(f)$ are analytic continuations of each other.
]

In @ex:complex-logarithm-analytic-continuation, we showed that two analytic function elements can on the same domain can be analytic continuations even if they do not agree on the entire domain. In this case, the two elements are on different branches of the function. Hence, depending on the chain of function elements chosen, we may obtain two different analytic function elements that have the same domain.

This is a common issue when it comes to the problem of analytic continuation.
This question of non-ambiguity can be explained by planar topology;
specifically the concept of homotopy. We will now introduce the concept of
analytic continuation along a given curve.
