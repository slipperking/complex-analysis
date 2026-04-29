#import "/lib.typ": *

= Harmonic Functions
== Subharmonic Functions

#definition[Let $U subset.eq CC$ be open. A function $u:U ->[-infinity,infinity)$ is _subharmonic_ if it is upper semi-continuous and satisfies the _sub-mean-value property_: for every $z_0 in U$ and every $r>0$ with $overline(D(z_0,r))subset.eq U$,
    
$ u(z_0)lt.eq (1)/(2 pi)integral_0^{2 pi}u (z_0+r ee^{ii theta})dif theta. $

    A function $v$ is _superharmonic_ if $-v$ is subharmonic.] <def:subharmonic>

#remark[If $u in C^2(U)$, then $u$ is subharmonic iff $Delta u gt.eq0$ on $U$, where $Delta=(partial^2)/(partial x^2)+(partial^2)/(partial y^2)$ is the Laplacian. This follows from the mean-value characterisation: expanding $u$ in a Taylor series around $z_0$ and integrating over $partial D(z_0,r)$ shows that the difference $(1)/(2 pi)integral_0^{2 pi}u(z_0+r ee^{ii theta})dif theta-u(z_0)$ equals $(r^2)/(4)Delta u(z_0)+cal(O)(r^4)$ as $r ->0$.]

#proposition[Let $U subset.eq CC$ be open. The following hold.
    
+ If $u,v:U ->[-infinity,infinity)$ are subharmonic, then so are $u+v$ and $max{u,v}$.
+ If $f:U -> CC$ is holomorphic and non-constant, then $log |f|:U without f^{-1}(0)-> RR$ is subharmonic, and so is $|f|^p$ for any $p>0$.
+ If $phi:RR-> RR$ is convex and non-decreasing and $u$ is subharmonic, then $phi compose u$ is subharmonic.] <prop:subharmonicproperties>

#proof[The first assertion follows directly from linearity of the integral and the definition of the maximum. For the second, note that $log |f|$ is harmonic away from the zeros of $f$, and hence subharmonic. Near a zero $z_0$ of order $m$, $log |f(z)|=m log |z-z_0|+Re log h(z)$ where $h$ is holomorphic and non-vanishing; since $log |z-z_0|$ is subharmonic (it is harmonic away from $z_0$ with $-infinity$ at $z_0$, and upper semi-continuity is satisfied), the sum is subharmonic. The assertion about $|f|^p=ee^{p log |f|}$ follows from the convexity of $ee^{pt}$. The third assertion follows from Jensen's inequality applied to the sub-mean-value property.]

#theorem("Maximum Principle for Subharmonic Functions")[Let $U subset.eq CC$ be open and connected, and let $u:U ->[-infinity,infinity)$ be subharmonic. If $u$ attains its supremum at some point $z_0 in U$, then $u$ is constant on $U$.] <thm:maximumprinciplesubharmonic>

#proof[Let $M=u(z_0)=sup_U u$. The set $S={z in U | u(z)=M}$ is closed in $U$ by upper semi-continuity of $u$. We show $S$ is open. For any $z in S$ and $r>0$ with $overline(D(z,r))subset.eq U$, the sub-mean-value property gives
    
$ M=u(z)lt.eq (1)/(2 pi)integral_0^{2 pi}u (z+r ee^{ii theta})dif thetalt.eq M. $

    Hence equality holds throughout, and $integral_0^{2 pi}(M-u(z+r ee^{ii theta}))dif theta=0$. Since the integrand is non-negative and upper semi-continuous, it must vanish identically, so $u equiv M$ on $partial D(z,r)$. As $r>0$ was arbitrary, $D(z,r)subset.eq S$, and $S$ is open. Since $S$ is non-empty, open, and closed in the connected set $U$, we conclude $S=U$.]

== Harnack's Inequality and Principle

#theorem("Harnack's Inequality")[Let $u:D(z_0,R)-> RR$ be harmonic and non-negative. Then for all $z in D(z_0,R)$, writing $r=|z-z_0|$,
    
$ (R-r)/(R+r)\,u(z_0)lt.eq u(z)lt.eq (R+r)/(R-r)\,u(z_0). $] <thm:harnack>

#proof[By the Poisson integral formula (@eq:poissonintegralformula2),
    
$ u(z)=(1)/(2 pi)integral_0^{2 pi}u (z_0+R ee^{ii theta})\frac{R^2-r^2}{|z_0+R ee^{ii theta}-z|^2}dif theta. $

    Since $|z_0+R ee^{ii theta}-z|lt.eq R+r$ and $|z_0+R ee^{ii theta}-z|gt.eq R-r$, the Poisson kernel $P=\frac{R^2-r^2}{|z_0+R ee^{ii theta}-z|^2}$ satisfies
    
$ (R-r)/(R+r)lt.eq P lt.eq (R+r)/(R-r). $

    Since $u gt.eq0$, integrating against $u (z_0+R ee^{ii theta})$ and applying the mean-value property $u(z_0)=(1)/(2 pi)integral_0^{2 pi}u(z_0+R ee^{ii theta})dif theta$ yields the result.]

#theorem("Harnack's Principle")[Let $U subset.eq CC$ be open and connected, and let ${u_n}_{n in NN}$ be a sequence of harmonic functions on $U$ that is monotonically non-decreasing: $u_1 lt.eq u_2 lt.eq dots.c$. Then either $u_n(z)->+infinity$ uniformly on every compact subset of $U$, or the sequence converges uniformly on every compact subset of $U$ to a harmonic limit $u$.] <thm:harnackprinciple>

#proof[Define $u=\lim_{n -> infinity}u_n:U ->(-infinity,+infinity]$, which exists as a monotone limit. Fix $z_0 in U$ and choose $R>0$ with $overline(D(z_0,R))subset.eq U$. Applying Harnack's inequality (@thm:harnack) to the non-negative harmonic function $u_n-u_m$ (for $n>m$) on $D(z_0,R)$, for any $z in D(z_0,r)$ with $r<R$,
    
$ 0 lt.eq u_n(z)-u_m(z)lt.eq (R+r)/(R-r)(u_n(z_0)-u_m(z_0)). $

    Suppose $u(z_0)<+infinity$. Then ${u_n(z_0)}$ is a Cauchy sequence, and the inequality above shows ${u_n}$ is uniformly Cauchy on $D(z_0,r)$, hence converges uniformly to a continuous limit. By Morera's theorem, the limit is harmonic. The set $S={z in U | u(z)<+infinity}$ is open by the above argument and closed (if $u(z_0)=+infinity$, the same estimate shows $u_n(z)->+infinity$ locally uniformly), hence $S=U$ or $S=emptyset$.]

== The Dirichlet Problem and Perron's Method

#definition[Let $U subset.eq CC$ be a bounded open set and $phi:partial U -> RR$ be a continuous function. The _Dirichlet problem_ for $(U,phi)$ asks for a harmonic function $u:U -> RR$ continuous on $overline(U)$ with $u=phi$ on $partial U$.] <def:dirichletproblem>

To solve the Dirichlet problem on a general domain, we use the Perron method of subharmonic functions.

#definition[Let $U subset.eq CC$ be a bounded open set and $phi:partial U -> RR$ be bounded. The _Perron family_ $cal(P)_phi$ associated to $phi$ is the set of all subharmonic functions $v:overline(U)->[-infinity,infinity)$ satisfying
    
$ \limsup_{z -> zeta}v(z)lt.eq phi(zeta) forall zeta in partial U. $

    The _Perron solution_ is defined by
    
$ u(z)=sup_{v in cal(P)_phi}v(z), z in U. $] <def:perronclass>

#theorem("Perron")[Let $U subset.eq CC$ be a bounded open set and $phi:partial U -> RR$ be continuous. Then the Perron solution $u$ is harmonic on $U$.] <thm:perron>

#proof[The class $cal(P)_phi$ is non-empty (the constant function $min_(partial U)phi$ belongs to it) and bounded above by $max_(partial U)phi$ by the maximum principle (@thm:maximumprinciplesubharmonic), so $u$ is well-defined and finite.

    Fix $z_0 in U$ and choose $r>0$ with $overline(D(z_0,r))subset.eq U$. There exists a sequence ${v_n}subset.eq cal(P)_phi$ with $v_n(z_0)eq.not arrow u(z_0)$. Replacing each $v_n$ by $max{v_1,dots,v_n}in cal(P)_phi$, we may assume ${v_n}$ is non-decreasing. Define the _Poisson modification_ of $v_n$ on $D(z_0,r)$: let $tilde(v)_n$ equal $v_n$ outside $D(z_0,r)$ and equal the Poisson integral of $v_n|_{partial D(z_0,r)}$ inside. Then $tilde(v)_n$ is subharmonic on $U$, agrees with $v_n$ on $partial D(z_0,r)$, and is harmonic on $D(z_0,r)$. In particular $tilde(v)_n in cal(P)_phi$ and $tilde(v)_n gt.eq v_n$.

    The sequence ${tilde(v)_n}$ is harmonic on $D(z_0,r)$, non-decreasing, and bounded above. By Harnack's principle (@thm:harnackprinciple), $tilde(v)_n -> h$ uniformly on compact subsets of $D(z_0,r)$ for some harmonic $h$. We have $h(z_0)=\lim_n tilde(v)_n(z_0)gt.eq u(z_0)$ and $h lt.eq u$ (since $h$ is a subharmonic function in $cal(P)_phi$). Hence $h=u$ on $D(z_0,r)$, and $u$ is harmonic there. Since $z_0$ was arbitrary, $u$ is harmonic on $U$.]

The Perron solution is harmonic on $U$, but it need not extend continuously to the boundary. Whether it does depends on the geometry of $partial U$ at each boundary point.

#definition[A point $zeta in partial U$ is _regular_ if for every continuous $phi:partial U -> RR$, the Perron solution $u$ satisfies $\lim_{z -> zeta}u(z)=phi(zeta)$.] <def:regularpoint>

#theorem[A boundary point $zeta_0 in partial U$ is regular if and only if there exists a _barrier_ at $zeta_0$: a superharmonic function $w:U ->(0,infinity)$ satisfying $\lim_{z -> zeta_0}w(z)=0$.] <thm:barriercharacterisation>

#proof[The necessity is straightforward: set $w(z)=u(z)-phi(zeta_0)$ for an appropriate $phi$. For sufficiency, given $epsilon>0$, the barrier $w$ can be used to construct sub- and super-solutions squeezing $u$ between $phi(zeta_0)-epsilon$ and $phi(zeta_0)+epsilon$ near $zeta_0$, using the continuity of $phi$ and the properties of $w$. The details are a standard argument in potential theory.]

#remark[A sufficient condition for $zeta_0$ to be regular is that $zeta_0$ be accessible by an exterior cone: $exists r>0$ and a cone $C$ with vertex $zeta_0$ such that $C sect D(zeta_0,r)subset.eq CCwithout U$. In particular, every boundary point of a domain with $C^1$ boundary is regular.]

== Doubly Connected Domains
A _doubly connected_ (or _one-hole_) domain is a connected open set $U subset.eq CC$ whose complement $CCwithout U$ has exactly two connected components. By the Riemann Mapping Theorem and its extensions, such a domain is conformally equivalent to an annulus.

#theorem[Every doubly connected domain $U subset.neq CC$ is conformally equivalent to an annulus $A(r,R)={z in CC | r<|z|<R}$ for some $0 lt.eq r<R lt.eq infinity$. Moreover, two annuli $A(r_1,R_1)$ and $A(r_2,R_2)$ are conformally equivalent if and only if $(R_1)/(r_1)=(R_2)/(r_2)$. In particular, the conformal type of a doubly connected domain is determined by the single modular invariant $mu(U)=(R)/(r)in(1,infinity]$.] <thm:doublyconnectedtornulus>

#proof("Sketch of proof")[Let $K_0$ and $K_1$ be the two components of $hat(CC)without U$, where $hat(CC)=CCunion{infinity}$ is the Riemann sphere. By a preliminary Möbius transformation we may assume $0 in K_0$ and $infinity in K_1$.

    _Step 1: Reduce to a symmetric domain._ Consider the universal cover $tilde(U)$ of $U$. Since $pi_1(U)tilde.equiv ZZ$, the deck transformation group is generated by a single conformal automorphism $T:tilde(U)-> tilde(U)$. By the Riemann Mapping Theorem applied to the simply connected domain $tilde(U)tilde.equiv bb(D)$ or $HH^+$, one conjugates $T$ to a Möbius transformation of the half-plane, which must be a dilation $z |-> lambda z$ for some real $lambda>1$.

    _Step 2: Uniformisation._ The projection $tilde(U)-> U tilde.equiv tilde(U)/angle.l T angle.r$ then realises $U$ as the quotient of a half-plane by $z tilde.op lambda z$. The map $z |-> ee^{2 pi ii (log z)/(log lambda)}$ descends to a biholomorphism from $U$ to the annulus $A (1,lambda)$.

    _Uniqueness of the modulus._ If $f:A(1,lambda_1)-> A(1,lambda_2)$ is a biholomorphism, lifting to the universal covers and arguing by periodicity shows $lambda_1=lambda_2$.]
