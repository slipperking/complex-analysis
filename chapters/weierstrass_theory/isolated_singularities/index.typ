#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Isolated Singularities],
  route: "isolated_singularities",
  children: [
    #include "at_infinity/index.typ"

  ],
)
An _isolated singularity_ of a complex function is a point $a in CC$ where a function $f$ is holomorphic on some open punctured neighborhood of $a$ (namely, for some $r > 0$, the punctured disk $D^*(a, r)$), but not necessarily defined or holomorphic at $a$ itself. The nature of this isolated singularity is characterized by the principal part $psi(z)$ (let $phi(z)$ be the holomorphic part) of the Laurent series of $f$ at the point $a$. Specifically, we can analyze the behavior of $f(z)$ as $z -> a$.

+ If $lim_(z -> a) f(z)$ exists and is finite, then $z = a$ is a removable singularity and can be analytically continued to $D(a, r)$ by @thm:riemannremovablesingularities. Consequently, $f(z)$ has a convergent Taylor expansion and the principal part of its Laurent expansion vanishes, and $f(z) = phi(z)$. #enum-lbl(<itm:isolatedsingularities_removable>)
+ If $lim_(z -> a) f(z) = oo$, then $z = a$ is a _pole_ of $f$ (from the stereographic projection and the Riemann sphere, the $oo$ is a single point in $extcomplex$, and approaching $oo$ does not distinguish between different directions, unlike the use of $+oo$ and $-oo$). #enum-lbl(<itm:isolatedsingularities_pole>)

  #lbl(
    theorem[
      The condition $lim_(z -> a) f(z) = oo$ is equivalent to there being a finite number of nonzero $c_(-n)$'s, where $n in NN$.
    ],
    <thm:isolatedsingularities_pole_laurentexpansion>,
  )

  In other words the principal part of $f$ is equal to
  $ psi(z) = c_(-1) / (z - a) + dots.c + c_(-m) / (z - a)^m, quad c_(-m) eq.not 0 $
  for some $m in NN$. Therefore,
  $ f(z) = phi(z) + psi(z) = sum_(n = -m)^oo c_n (z - a)^n = g(z) / (z - a)^m $
  on the punctured disk $D^*(a, r)$, where
  $ g(z) = sum_(n = 0)^oo c_(n - m) (z - a)^n $
  is holomorphic on $D(a, r)$ and does not attain a zero at $z = a$. Then $f(z)$ has a pole at $z = a$ with order $m$. If $m = 1$, the pole is also called a _simple pole_.

  #proof[
    Obviously, under the assumption of a finite, nonempty number of nonzero terms in the principal part of the Laurent expansion coefficients, $lim_(z -> a) f(z) = oo$. Now we will prove the converse. Let
    $ g(z) = 1 / f(z). $
    Then $lim_(z -> a) g(z) = 0$. There exists a $delta > 0$ such that $f$ is nonzero on $D^*(a, delta)$. Then $g(z)$ is holomorphic on $D^*(a, delta)$ and has a removable singularity at $z = a$. By @thm:riemannremovablesingularities, $g$ can be analytically continued to $D(a, delta)$. Let the multiplicity of the zero at $z = a$ be $m$. Then
    $ g(z) = phi(z) (z - a)^m, $
    where $phi(z)$ is holomorphic and nonzero at $z = a$. Then there exists a $delta' > 0$ such that $phi$ is nonzero on $D(a, delta')$. It follows that $1 / (phi)$ is holomorphic and nonzero on $D(a, delta')$. We can then write its Taylor expansion as
    $ 1 / (phi(z)) = c_(-m) + c_(1 - m) (z - a) + dots.c, $
    where $c_(-m) eq.not 0$. It follows that
    $
      f(z) = 1 / (g(z)) = (z - a)^(-m) / (phi(z)) = c_(-m) (z - a)^(-m) + dots.c + c_0 + dots.c.
    $
    By the uniqueness of the Laurent series, the conclusion follows.
  ]
+ If $lim_(z -> a) f(z)$ does not exist, then $a$ is known as an _essential singularity_. #enum-lbl(<itm:isolatedsingularities_essential>)

  #lbl(
    example[
      Classify the singularity of the function $ee^(1 / z)$ on the punctured plane $CC^*=CC without {0}$ at $z = 0$.
    ],
    <ex:isolatedsingularities_essential_exp1z>,
  )

  #solution[to @ex:isolatedsingularities_essential_exp1z][
    Observe that $lim_(x -> 0^+) ee^(1 / (x)) = oo$. Similarly, $lim_(x -> 0^-) ee^(1 / (x)) = 0$, and for $z = ii y$ with $y -> 0^+$,
    $ ee^(1 / (z)) = ee^(-ii / y), $
    which is divergent. Hence, the limit does not exist, and thus $z=0$ is an essential singularity.
  ]

  The implication on its Laurent expansion at $a$ is:

  #theorem[
    The necessary and sufficient condition for $lim_(z -> a) f(z)$ to not exist is that infinitely many of $c_(-n)$ (where $n in NN$) are nonzero.
  ]

  This follows by elimination from the established trichotomy; if the limit as $z -> a$ does not exist, then the singularity is neither removable nor a pole (results from @itm:isolatedsingularities_removable and @itm:isolatedsingularities_pole). Similar logic can be applied to the coefficients of the Laurent expansion.

  Indeed, in @ex:isolatedsingularities_essential_exp1z, the Laurent expansion is equal to:
  $ ee^(1 / (z)) = sum_(n = 0)^oo z^(-n) / (n!), $
  which has infinitely many nonzero coefficients of negative powers.

A function with an essential singularity exhibits striking behavior. We will first introduce the following famous result.

#theorem([Casorati--Sokhotski--Weierstrass], restate: true, restate-keys: ("thm:casoratiweierstrass",))[
  Let $a in CC$ and $U subset.eq CC$ be an open region. Suppose $f:U without {a} -> CC$ is holomorphic with an essential singularity at $a$. Then the set of values that $f$ attains on any open punctured neighborhood of $a$ is dense. In other words, $forall epsilon, delta > 0$, $forall w in CC$, $exists z in D^*(a, delta)$ such that $abs(f(z) - w) < epsilon$.
] <thm:casoratiweierstrass>

#proof[
  Assume for the sake of contradiction that $exists epsilon, delta > 0$, and $exists w in CC$ such that $forall z in D^*(a, delta)$, $abs(f(z) - w) > epsilon$. Define the auxiliary function
  $ g(z) = (f(z) - w) / (z - a), $
  which is holomorphic and non-vanishing on the punctured neighborhood of $a$. Since as $z -> a$, $g(z) -> oo$, it follows that $g(z)$ has a pole at $a$. Let the order of the pole be $m in NN$. By @thm:isolatedsingularities_pole_laurentexpansion, $g(z)$ has the Laurent expansion
  $ c_(-m) / (z - a)^m + dots.c + c_0 + c_1 (z - a) + dots.c $
  for some $m in NN$. It follows that
  $ f(z) = c_(-m) / (z - a)^(m - 1) + dots.c + c_(-1) + w + c_0 (z - a) + dots.c. $
  If $m = 1$, then $f$ has a removable singularity at $a$. If $m gt.eq 2$, then $f$ has a pole at $a$. Hence, we have a contradiction.
]

An analogous proof yields the following result for entire functions.

#lbl(
  theorem[
    The set of values that a non-constant entire function $f$ assumes is dense in $CC$.
  ],
  <thm:casoratiweierstrassentire>,
)

#proof[
  For the sake of contradiction, assume there exists $w in CC$ and $epsilon > 0$ such that $D(w, epsilon) inter f(CC) = emptyset$. Define
  $ g(z) = 1 / (f(z) - w). $
  It follows that $abs(g) <= 1 / epsilon$ on $CC$. By Liouville's Theorem (@thm:liouville), $g$ is a constant function, and hence, $f$ is also constant, which is a contradiction of the statement.
]

In @sec:differential_geometry, we will prove a profound generalization of the two results (@thm:greatpicard and @thm:littlepicard), which was first proved by Emile Picard in 1879:
#thm-state.thm-restate("thm:littlepicard", final: true)
#thm-state.thm-restate("thm:greatpicard", final: true)
