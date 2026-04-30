#import "/lib.typ": *

== The Group of Holomorphic Automorphisms on the Unit Disk
The following important result can be directly obtained from the Maximum Modulus Principle.

#lemma("Schwarz")[If $f:bb(D)-> bb(D)$ is holomorphic and $f(0)=0$, then 
$ |f(z)|lt.eq |z|, |f'(0)|lt.eq 1. $

    Any one of the inequalities becomes equalities iff $f(z)$ is in the form of $z ee^{ii tau}$, where $tau in RR$. In other words, $f$ is a pure rotation.] <lem:schwarz>

#proof[Define the auxiliary function 
$ g(z)= cases((f(z))/(z) & \qif* z eq.not0, ,
 f'(0) & \qif* z=0.) $

    Because $\lim_{z ->0}(f(z))/(z)=f'(0)$, $g(z)$ is holomorphic on $bb(D)$. Since $f$ is an automorphism on the open disk, $forall |z|<1$, $|f(z)|<1$. By the Maximum Modulus Principle @thm:maximummodulus, $forall0<epsilon<1$, $forall z in D(0,epsilon)$, 
$ |g(z)|lt.eq max_{z_epsilon.alt in partial D(0,epsilon)}\frac{|f (z_epsilon.alt)|}{epsilon}<(1)/(epsilon). $
 As $epsilon -> 1^-$, we obtain that $forall z in bb(D)$, $|g(z)|lt.eq 1$, or that $|f(z)|lt.eq |z|$. Let $z=0$. Then we get $|g(0)|=f'(0)lt.eq 1$.

    For the sake of the equality condition, assume $|f(z)|=|z|$. Then $|g(z)|equiv 1$ on the unit open disk. By @thm:maximummodulus, $g(z)=exp(ii tau)$ where $tau in RR$ and $f(z)=z exp(ii tau)$ on $bb(D)$.

    Next, assume only that $|f'(0)|=1$. It follows that $|g(0)|=1$. Since $|g(z)|lt.eq 1$ for all $z in bb(D)$, it follows from @thm:maximummodulus that $g$ is constant with magnitude 1, or in the form of $exp(ii tau)$, where $tau in RR$ is a constant. Consequently, $f(z)=z exp(ii tau)$.]

To discuss the main topic of this section, we will first introduce the concept of a _group_.

#definition("Group")[A group is a nonempty set $G$ and a binary operation (we will denote this as $*$) satisfying the four _group axioms_:
    
+ Closure: $forall a,b in G$, $a*b in G$.
+ Associativity: $forall a,b,c in G$, $(a*b)*c=a*(b*c)$.
+ Identity Element: $exists e in G$ such that $forall a in G$, $a*e=e*a=a$. Note that $e$ is unique; if $e,f in G$ were both identity elements, then $e*f=f*e=e=f$, and are equal.
+ Inverse Element: $forall a in G$, $exists a^{-1}in G$ such that $a*a^{-1}=e=a^{-1}*a$, where $e$ is the identity element. Note that $a^{-1}$ is unique. Assume $b,c$ were both inverses of $a$. Then, $b=b*e=b*(a*c)=(b*a)*c=c$, and are equal.

    A _subgroup_ $H$ of $G$ is a subset of $G$ that is also a group under the same operation as $G$. This relationship is denoted by $H lt.eq G$ or $H<G$ for _proper subgroups_.] <def:group>

Group operations are not necessarily commutative. In the case that they are, (specifically if $a,b in G => a*b=b*a$), then $G$ is an _abelian group_.

If $U subset.eq CC$ is connected and $f:U -> U$ is holomorphic on $U$ and bijective, $f$ is a _holomorphic automorphism_ on $U$. The _group of holomorphic automorphisms_ on $U$ is denoted by $Aut(U)$, which is the set of all holomorphic automorphisms such as $f$, with the operation of composition ($f compose g$).

First we will show that $forall a in bb(D)$,

$ phi.alt_a(z)=(z-a)/(1-overline(a)z)in Aut(bb(D)). $ <eq:mobiustransformationgroupofholomorphicautomorphismsunitdisk_statement>

Firstly, the function is holomorphic on $bb(D)$ as $|z|lt.eq1$, $|overline(a)|<1$, the denominator never vanishes. Additionally, $phi.alt_a(a)=0$.

First, we will observe the image of $partial bb(D)$. Let $|z|=1$. Then,

$ |phi.alt_a(z)|=|(1)/(z)||(z-a)/((1)/(z)-overline(a))|=|(z-a)/(overline(z)-overline(a))|=1. $

Therefore, the image of $partial bb(D)$ lies on $partial bb(D)$, and since $f$ is holomorphic and non-constant, by the Maximum Modulus Principle (@thm:maximummodulus), for any $|z|<1$, $|phi.alt_a(z)|<1$. Therefore, $f$ maps $bb(D)$ to $bb(D)$. We next aim to show that $f:bb(D)-> bb(D)$ is bijective.

Let us first confirm injectivity.\ $forall z_1,z_2 in bb(D)$, we will observe when 
$ (z_1-a)/(1-overline(a)z_1)=(z_2-a)/(1-overline(a)z_2) $
 is satisfied. It follows that

$
(z_1-a)(1-overline(a)z_2)=(z_2-a)(1-overline(a)z_1),\\ z_1-a-overline(a)z_1z_2+|a|^2z_2=z_2-a-overline(a)z_1z_2+|a|^2z_1.
$

Then, 
$ |a|^2 (z_2-z_1)=z_2-z_1.<==> (|a|^2-1)(z_2-z_1)=0. $
 Since $|a|<1$, then $|a|^2-1 eq.not0$, and we get $z_2-z_2=0$. This proves the univalence of $phi.alt_a(z)$.

Next, we will solve for the inverse of $phi.alt_a$. Let $z=phi.alt_a(w)=(w-a)/(1-overline(a)w)$. Then,

$ z-overline(a)zw=w-a <==> w=(z+a)/(1+overline(a)z). $ <eq:inversemobiustransformation>

It follows that $phi.alt_{-a}=(phi.alt_a)^{-1}$. Thus $phi.alt_a$ is surjective and a bijective automorphism. It follows that @eq:mobiustransformationgroupofholomorphicautomorphismsunitdisk_statement is true. Functions in the form of $phi.alt_a$ (where $a in bb(D)$) are known as _Möbius transformations_, and the group of all such transformations is known as the _Möbius transformation group on the unit disk_, which is a subgroup of $Aut(bb(D))$. Functions in the form of $rho_tau(z)=z exp(ii tau)$, where $tau in RR$ is constant, form a group known as the _rotation group_, which is also a subgroup of $Aut(bb(D))$.

#theorem("The Holomorphic Automorphism Group on $bb(D)$")[$forall f in Aut(bb(D))$, $f$ is a composition between a Möbius transformation and a rotation. In other words, $exists |a|<1$ and $exists tau in RR$ such that 
$ f(z)=phi.alt_a compose rho_tau(z). $
 Moreover, all such functions are in $Aut(bb(D))$.] <thm:holomorphicautomorphismgrouponunitdisk>

#proof[Define the auxiliary function $psi(z)=phi.alt_{f(0)}compose f(z)$. It follows that $psi in Aut(bb(D))$. Furthermore, $psi(0)=phi.alt_{f(0)}compose f(0)=0$.

    By the Schwarz Lemma (@lem:schwarz), $\qty|psi'(0)|lt.eq1$. Since $psi^{-1}in Aut(bb(D))$ with $psi^{-1}(0)=0$, $|(psi^{-1})'(0)|lt.eq1$. Then, 
$ |(psi^{-1})'(0)|=(1)/(psi'(psi^{-1}(0)))=(1)/(psi'(0))lt.eq 1. $

    Then, $|psi'(0)|=1$, and by the equality statement of @lem:schwarz, $psi(z)=z ee^{ii tau}=rho_tau(z)$ for some constant $tau in RR$, and $f(z)=phi.alt_{f(0)}^{-1}compose rho_tau(z)$. By @eq:inversemobiustransformation, it follows that $f(z)=phi.alt_{-f(0)}compose rho_tau(z)$.]

As a direct consequence of @thm:holomorphicautomorphismgrouponunitdisk, we have the following result:

#lemma("#smallcaps[Schwarz--Pick]")[Let $f:bb(D)-> bb(D)$ be holomorphic.\ $forall z_1,z_2 in bb(D)$, let $w_1=f (z_1)$ and $w_2=f (z_2)$. Then,
    
$ |(w_1-w_2)/(1-w_1 overline(w_2))|lt.eq |(z_1-z_2)/(1-z_1 overline(z_2))|, $ <eq:schwarzpick_statement1>
 and
    
$ \frac{|dif w|}{1-\qty|w|^2}lt.eq (|ddz|)/(1-|z|^2). $ <eq:schwarzpick_statement2>

    The equalities hold iff $f in Aut(bb(D))$.] <lem:schwarzpick>

#proof[Let 
$ phi.alt_{-z_1}(z)=(z+z_1)/(1+overline(z_1)z)in Aut(bb(D)), phi.alt_{w_1}(z)=(z-w_1)/(1-overline(w_1)z)in Aut(bb(D)). $

    It follows that $phi.alt_{w_1}compose f compose phi.alt_{-z_1}(0)=phi.alt_{w_1}(w_1)=0$. Then by the Schwarz Lemma (@lem:schwarz), for $z in bb(D)$, 
$ |phi.alt_{w_1}compose f compose phi.alt_{-z_1}(z)|lt.eq |z|. $
 Let $z_2=phi.alt_{-z_1}(z)$. Then, $|phi.alt_{w_1}compose f (z_2)|lt.eq |phi.alt_{z_1}(z_2)|<==> |phi.alt_{w_1}(w_2)|lt.eq |phi.alt_{z_1}(z_2)|$, confirming @eq:schwarzpick_statement1. By the second statement of the Schwarz Lemma (@lem:schwarz), $|(phi.alt_{w_1}compose f compose phi.alt_{-z_1})'(0)|lt.eq1$.

    By the chain rule, $|phi.alt_{w_1}'(w_1)f'(z_1)phi.alt_{-z_1}'(0)|lt.eq1$. Let us now calculate the derivatives of $phi.alt_{w_1}$ and $phi.alt_{-z_1}$. By the quotient rule, 
$ phi.alt'_{w_1}(z)=\frac{1-overline(w_1)w_1}{(1-overline(w_1)z)^2}, phi.alt'_{w_1}(w_1)=(1)/(1-overline(w_1)w_1), $

    and
    
$ phi.alt'_{-z_1}(z)=(1-overline(z_1)z_1)/((1+overline(z_1)z)^2), phi.alt'_{-z_1}(0)=1-overline(z_1)z_1. $

    Since both derivatives are positive, $|f'(z_1)|lt.eq (1-overline(w_1)w_1)/(1-overline(z_1)z_1)$. Since $z_1 in bb(D)$ is arbitrary, it follows that
    
$ |dv(w, z)|lt.eq (1-overline(w)w)/(1-overline(z)z)<==> \frac{|dif w|}{1-overline(w)w}lt.eq (|ddz|)/(1-overline(z)z). $ <eq:schwarzpick_nonincreasingmetric>

    By the Schwarz Lemma (@lem:schwarz), under the equality condition that 
$ |phi.alt_{w_1}'(w_1)f'(z_1)phi.alt_{-z_1}'(0)|=1, $
 we have that $phi.alt_{w_1}compose f compose phi.alt_{-z_1}=ee^{ii tau}$, where $tau in RR$ is constant. It follows that 
$ f=phi.alt_{-w_1}compose ee^{ii tau}compose phi.alt_{z_1}in Aut(bb(D)). $]

#remark[In @sec:differentialgeometry, we will introduce the _hyperbolic metric_ on $bb(D)$, defined as 
$ dif s^2=(4 |ddz|^2)/((1-|z|^2)^2). $

    From @eq:schwarzpick_nonincreasingmetric, we get that the hyperbolic metric does not increase under a holomorphic mapping of $bb(D)$ to itself. This metric is invariant (the equality condition) under all functions in $Aut(bb(D))$. This gives a geometric explanation for @lem:schwarz.]
