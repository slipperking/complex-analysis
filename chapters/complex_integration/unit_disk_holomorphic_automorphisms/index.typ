#import "/lib.typ": *
== The Group of Holomorphic Automorphisms on the Unit Disk

The following important result can be directly obtained from the Maximum Modulus Principle.

#lemma("Schwarz")[
  If $f:DD -> DD$ is holomorphic and $f(0) = 0$, then
  $ abs(f(z)) <= abs(z), quad abs(f'(0)) <= 1. $

  Any one of the inequalities becomes equalities iff $f(z)$ is in the form of $z ee^(ii tau)$, where $tau in RR$. In other words, $f$ is a pure rotation.
] <lem:schwarz>

#proof[
  Define the auxiliary function
  $ g(z) = cases((f(z)) / (z) & "if" z eq.not 0, f'(0) & "if" z = 0.) $

  Because $lim_(z -> 0) (f(z)) / (z) = f'(0)$, $g(z)$ is holomorphic on $DD$. Since $f$ is an automorphism on the open disk, $forall abs(z) < 1$, $abs(f(z)) < 1$. By the Maximum Modulus Principle (@thm:maximummodulus), $forall 0 < epsilon < 1$, $forall z in D(0, epsilon)$,
  $ abs(g(z)) <= max_(z_epsilon in partial D(0, epsilon)) abs(f(z_epsilon)) / (epsilon) < 1 / (epsilon). $
  As $epsilon -> 1^-$, we obtain that $forall z in DD$, $abs(g(z)) <= 1$, or that $abs(f(z)) <= abs(z)$. Let $z = 0$. Then we get $abs(g(0)) = abs(f'(0)) <= 1$.

  For the sake of the equality condition, assume $abs(f(z)) = abs(z)$. Then $abs(g(z)) equiv 1$ on the unit open disk. By @thm:maximummodulus, $g(z) = ee^(ii tau)$ where $tau in RR$ and $f(z) = z ee^(ii tau)$ on $DD$.

  Next, assume only that $abs(f'(0)) = 1$. It follows that $abs(g(0)) = 1$. Since $abs(g(z)) <= 1$ for all $z in DD$, it follows from @thm:maximummodulus that $g$ is constant with magnitude $1$, or in the form of $ee^(ii tau)$, where $tau in RR$ is a constant. Consequently, $f(z) = z ee^(ii tau)$.
]

To discuss the main topic of this section, we will first introduce the concept of a _group_.

#definition("Group")[
  A group is a nonempty set $G$ and a binary operation (we will denote this as $*$) satisfying the four _group axioms_:

  - _Closure_: $forall a, b in G$, $a * b in G$.
  - _Associativity_: $forall a, b, c in G$, $(a * b) * c = a * (b * c)$.
  - _Identity Element_: $exists e in G$ such that $forall a in G$, $a * e = e * a = a$. Note that $e$ is unique; if $e, f in G$ were both identity elements, then $e * f = f * e = e = f$, and are equal.
  - _Inverse Element_: $forall a in G$, $exists a^(-1) in G$ such that $a * a^(-1) = e = a^(-1) * a$, where $e$ is the identity element. Note that $a^(-1)$ is unique. Assume $b, c$ were both inverses of $a$. Then, $b = b * e = b * (a * c) = (b * a) * c = c$, and are equal.

  A _subgroup_ $H$ of $G$ is a subset of $G$ that is also a group under the same operation as $G$. This relationship is denoted by $H <= G$ or $H < G$ for _proper subgroups_.
] <def:group>

Group operations are not necessarily commutative. In the case that they are, (specifically if $a, b in G ==> a * b = b * a$), then $G$ is an _abelian group_.

If $U subset.eq CC$ is connected and $f:U -> U$ is holomorphic on $U$ and bijective, $f$ is a _holomorphic automorphism_ on $U$. The _group of holomorphic automorphisms_ on $U$ is denoted by $Aut(U)$, which is the set of all holomorphic automorphisms such as $f$, with the operation of composition $(f compose g)$.

First we will show that $forall a in DD$,

$
  phi_a (z) = (z - a) / (1 - overline(a) z) in Aut(DD).
$ <eq:mobiustransformationgroupofholomorphicautomorphismsunitdisk_statement>

Firstly, the function is holomorphic on $DD$ as $abs(z) <= 1$, $abs(overline(a)) < 1$, the denominator never vanishes. Additionally, $phi_a (a) = 0$.

First, we will observe the image of $partial DD$. Let $abs(z) = 1$. Then,
$
  abs(phi_a (z)) = abs(1 / (z)) abs((z - a) / (1 / (z) - overline(a))) = abs((z - a) / (overline(z) - overline(a))) = 1.
$
Therefore, the image of $partial DD$ lies on $partial DD$, and since $f$ is holomorphic and non-constant, by the Maximum Modulus Principle (@thm:maximummodulus), for any $abs(z) < 1$, $abs(phi_a (z)) < 1$. Therefore, $f$ maps $DD$ to $DD$. We next aim to show that $f:DD -> DD$ is bijective.

Let us first confirm injectivity. For all $z_1, z_2 in DD$, we will observe when
$ (z_1 - a) / (1 - overline(a) z_1) = (z_2 - a) / (1 - overline(a) z_2) $
is satisfied. It follows that
$
  (z_1 - a) (1 - overline(a) z_2) = (z_2 - a) (1 - overline(a) z_1), \
  z_1 - a - overline(a) z_1 z_2 + abs(a)^2 z_2 = z_2 - a - overline(a) z_1 z_2 + abs(a)^2 z_1.
$
Then,
$ abs(a)^2 (z_2 - z_1) = z_2 - z_1 <==> (abs(a)^2 - 1) (z_2 - z_1) = 0. $
Since $abs(a) < 1$, then $abs(a)^2 - 1 != 0$, and we get $z_2 - z_1 = 0$. This proves the univalence of $phi_a (z)$.

Next, we will solve for the inverse of $phi_a$. Let $z = phi_a (w) = (w - a) / (1 - overline(a) w)$. Then,
$ z - overline(a) z w = w - a <==> w = (z + a) / (1 + overline(a) z). $ <eq:inversemobiustransformation>

It follows that $phi_(-a) = (phi_a)^(-1)$. Thus $phi_a$ is surjective and a bijective automorphism. It follows that @eq:mobiustransformationgroupofholomorphicautomorphismsunitdisk_statement is true. Functions in the form of $phi_a$ (where $a in DD$) are known as _Möbius transformations_, and the group of all such transformations is known as the _Möbius transformation group on the unit disk_, which is a subgroup of $Aut(DD)$. Functions in the form of $rho_tau (z) = z ee^(ii tau)$, where $tau in RR$ is constant, form a group known as the _rotation group_, which is also a subgroup of $Aut(DD)$.

#theorem("The Holomorphic Automorphism Group on " + $DD$)[
  $forall f in Aut(DD)$, $f$ is a composition between a Möbius transformation and a rotation. In other words, $exists abs(a) < 1$ and $exists tau in RR$ such that
  $ f(z) = phi_a compose rho_tau (z). $
  Moreover, all such functions are in $Aut(DD)$.
] <thm:holomorphicautomorphismgrouponunitdisk>

#proof[
  Define the auxiliary function
  $ psi(z) = phi_(f(0)) compose f(z). $
  It follows that $psi in Aut(DD)$. Furthermore,
  $ psi(0) = phi_(f(0)) compose f(0) = 0. $

  By the Schwarz Lemma (@lem:schwarz), $abs(psi'(0)) <= 1$. Since $psi^(-1) in Aut(DD)$ with $psi^(-1)(0) = 0$, $abs((psi^(-1))'(0)) <= 1$. Then,
  $ abs((psi^(-1))'(0)) = abs(1 / (psi'(psi^(-1)(0)))) = abs(1 / (psi'(0))) <= 1. $
  Then, $abs(psi'(0)) = 1$, and by the equality statement of @lem:schwarz,
  $ psi(z) = z ee^(ii tau) = rho_tau (z) $
  for some constant $tau in RR$, and
  $ f(z) = phi_(f(0))^(-1) compose rho_tau (z). $
  By @eq:inversemobiustransformation, it follows that
  $ f(z) = phi_(-f(0)) compose rho_tau (z). $
]

As a direct consequence of @thm:holomorphicautomorphismgrouponunitdisk, we have the following result:

#lemma("Schwarz" + sym.dash.en + "Pick")[
  Let $f:DD -> DD$ be holomorphic. For all $z_1, z_2 in DD$, let $w_1 = f(z_1)$ and $w_2 = f(z_2)$. Then,

  $
    abs((w_1 - w_2) / (1 - w_1 overline(w_2))) <= abs((z_1 - z_2) / (1 - z_1 overline(z_2))).
  $ <eq:schwarzpick_statement1>

  and

  $ abs(dif w) / (1 - abs(w)^2) <= abs(dz) / (1 - abs(z)^2). $ <eq:schwarzpick_statement2>

  The equalities hold iff $f in Aut(DD)$.
] <lem:schwarzpick>

#proof[
  Let
  $
    phi_(-z_1)(z) = (z + z_1) / (1 + overline(z_1) z) in Aut(DD), quad phi_(w_1)(z) = (z - w_1) / (1 - overline(w_1) z) in Aut(DD).
  $
  It follows that
  $ phi_(w_1) compose f compose phi_(-z_1)(0) = phi_(w_1)(w_1) = 0. $
  Then by the Schwarz Lemma (@lem:schwarz), for $z in DD$,
  $ abs(phi_(w_1) compose f compose phi_(-z_1)(z)) <= abs(z). $
  Let $z_2 = phi_(-z_1)(z)$. Then,
  $ abs(phi_(w_1) compose f(z_2)) <= abs(phi_(z_1)(z_2)) <==> abs(phi_(w_1)(w_2)) <= abs(phi_(z_1)(z_2)), $
  confirming @eq:schwarzpick_statement1. By the second statement of the Schwarz Lemma (@lem:schwarz), $abs((phi_(w_1) compose f compose phi_(-z_1))'(0)) <= 1$.

  By the chain rule,
  $ abs(phi_(w_1)'(w_1) f'(z_1) phi_(-z_1)'(0)) <= 1. $
  Let us now calculate the derivatives of $phi_(w_1)$ and $phi_(-z_1)$. By the quotient rule,
  $
    phi'_(w_1)(z) = (1 - overline(w_1) w_1) / ((1 - overline(w_1) z)^2), quad phi'_(w_1)(w_1) = 1 / (1 - overline(w_1) w_1),
  $
  and
  $ phi'_(-z_1)(z) = (1 - overline(z_1) z_1) / ((1 + overline(z_1) z)^2), quad phi'_(-z_1)(0) = 1 - overline(z_1) z_1. $
  Since both derivatives are positive,
  $ abs(f'(z_1)) <= (1 - overline(w_1) w_1) / (1 - overline(z_1) z_1). $
  Since $z_1 in DD$ is arbitrary, it follows that
  $
    abs(dv(w, z)) <= (1 - overline(w) w) / (1 - overline(z) z) <==> abs(dif w) / (1 - overline(w) w) <= abs(dz) / (1 - overline(z) z).
  $ <eq:schwarzpick_nonincreasingmetric>
  By the Schwarz Lemma (@lem:schwarz), under the equality condition that
  $ abs(phi_(w_1)'(w_1) f'(z_1) phi_(-z_1)'(0)) = 1, $
  we have that
  $ phi_(w_1) compose f compose phi_(-z_1) = ee^(ii tau), $
  where $tau in RR$ is constant. It follows that
  $ f = phi_(-w_1) compose ee^(ii tau) compose phi_(z_1) in Aut(DD). #qedhere $
]

#remark[
  In @ sec:differentialgeometry, we will introduce the _hyperbolic metric_ on $DD$, defined as
  $ dif s^2 = (4 abs(dz)^2) / ((1 - abs(z)^2)^2). $
  From @eq:schwarzpick_nonincreasingmetric, we get that the hyperbolic metric does in.notcrease under a holomorphic mapping of $DD$ to itself. This metric is invariant (the equality condition) under all functions in $Aut(DD)$. This gives a geometric explanation for @lem:schwarz.
]
