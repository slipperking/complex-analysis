#import "/lib.typ": *

== A Spherical Generalization of Normal Families<sec:sphericalgeneralizationofnormalfamilies>
Picard's Great Theorem requires a more profound concept by generalizing normal families in the one-point compactification of $CC$.

#definition[Let $\cbraces{f_n(z)}$ be a (not necessarily analytic) complex function sequence on a connected set $Omega subset.eq CC$. If $forall K subset Omega$ compact, $forall R>0$, $exists N in NN$ such that $forall n>N$, $forall z in K$, $|f_n(z)|>R$, then _$f_n -> infinity$ locally uniformly spherically on $Omega$_.]

When the ``locally uniform limit'' is taken to be $infinity$, the condition of $epsilon$-closeness is instead replaced by the requirement that the values eventually leave every fixed compact subset of $CC$ (the given definition is equivalent to: $forall K subset Omega$ compact, $forall L subset CC$ compact, $exists N in NN$ such that $forall n>N$, $forall z in K$, $f_n(z)in.not L$). In this way, convergence to infinity is treated symmetrically with convergence to finite values by working in the Riemann sphere $hat(CC)$, where $infinity$ is simply another accumulation point.

By equipping the extended complex plane $hat(CC)$ with the spherical metric instead of the Euclidean metric, convergence to $infinity$ can be treated like convergence to any finite point. In this setting, $infinity$ is simply another accumulation point, so there is no need to handle it differently from other values.

Let $\cbraces{a_n}_{n in NN}subset hat(CC)$ be a sequence. Then we say $a_n -> a_infinity$ _spherically_ iff $forall epsilon>0$, $exists N in NN$ such that $forall n>N$, $d_sigma (a_n,a_infinity)<epsilon$, where $d_sigma$ is the spherical distance.

#definition[A family of meromorphic functions $cal(F)$ on some $Omega subset.eq CC$ is said to be _spherically normal_ iff every sequence has a locally uniformly spherically convergent subsequence on $Omega$.]

Montel's Theorem for holomorphically normal families in @thm:montel can be generalized via the spherical metric by the statement of Marty's Criterion (@thm:marty).

#definition("Spherical Derivative")[Let $Omega subset.eq CC$ be an open region or domain. Suppose $f:Omega -> hat(CC)$ is meromorphic. Then the _spherical derivative_ of $f$ is given by 
$ f^\sharp(z)=f^*sigma(z)=(2 |f'(z)|)/(1+|f(z)|^2) $
 for $f(z)eq.in.notfinity$ and 
$ f^\sharp(z)=\lim_{zeta -> z}f^\sharp(zeta) $
 otherwise.] <def:sphericalderivative>

#proposition[Any linear fractional transformation is spherically uniformly continuous on $CC$.] <prop:linearfractionaltransformationuniformlysphericallycontinuous>

#proof[Let $psi(z)=(az+b)/(cz+d)$, where $ad-bc eq.not 0$. Then, 
$ psi'(z)=(ad-bc)/((cz+d)^2). $

    The spherical distance between two points $w_1=psi (z_1),w_2=psi (z_2)$ is given by 
$ d_sigma (w_1,w_2)=inf_Gamma integral_gamma psi^\sharp(z)|ddz|=inf_Gamma integral_gamma (2 |(ad-bc)/((cz+d)^2)|)/(1+|(az+b)/(cz+d)|^2)|ddz| $
 where $gamma$ joins $z_1$ and $z_2$. The spherical distance is bounded by the integral over the Euclidean straight line $gamma'$ joining $z_1$ and $z_2$:
    
$ d_sigma (w_1,w_2)lt.eq integral_{gamma'}(2 |ad-bc|)/(|cz+d|^2+|az+b|^2)|ddz|. $
 Since $(2 |ad-bc|)/(|cz+d|^2+|az+b|^2)-> 0$ as $z -> infinity$ and $z |-> (2 |ad-bc|)/(|cz+d|^2+|az+b|^2)in C^0(CC)$, it is bounded by some constant $M$ on $CC$. Hence, we have 
$ d_sigma (w_1,w_2)lt.eq M |z_1-z_2|. $
 Hence, $forall epsilon>0$, $forall |z_1-z_2|<(epsilon)/(M)$, 
$ d_sigma (psi \qty(z_1),psi \qty(z_2))<epsilon. $]

#proposition[Let $\cbraces{f_n}_{n in NN}$ be a sequence of holomorphic functions on a domain $Omega subset.eq CC$. If $f_n -> f$ locally uniformly spherically, then $f$ is either holomorphic on $Omega$ or identically $infinity$.] <prop:locallyuniformlysphericallyconvergentholomorphicsequenceuniformlimit>

#proof[A result analogous to @thm:uniformlimit can be used to show that $f$ is spherically continuous. Let $z in Omega$ be arbitrary.
    
+ If $f(z)eq.in.notfinity$, then by spherical continuity, $exists delta>0$ such that $forall zeta in D(z,delta)$, 
$ d_sigma (f(zeta),f(z))<\frac12d_sigma (infinity, f(z)). $
 Similarly, $exists N in NN$ such that $forall n>N$, 
$ d_sigma (f(zeta),f_n (zeta))<\frac12d_sigma (infinity, f(z)). $

            Hence, we have 
$ d_sigma (infinity,f(z))-d_sigma (f(z),f_n (zeta))>0. $
 By the reverse triangle inequality, we have 
$ d_sigma (infinity,f_n (zeta))>0. $

            By Weierstrass (@thm:weierstrassconvergence), $f$ is holomorphic on $D(z,delta)$.
+ Consider $f(z)=infinity$. Assume, for the sake of contradiction, $z$ is an isolated pole of $f$. Hence, $exists delta$ such that $f$ is holomorphic on $D^*(z,delta)$.

            Because each $f_n$ is holomorphic on $D(z,delta)$, by the Maximum Modulus Principle (@thm:maximummodulus), $forall n in NN$, 
$ |f_n(zeta)|lt.eq sup_{xi in partial D(z,delta)}|f_n(xi)| forall zeta in D(z,delta). $

            By letting $n -> infinity$, we have 
$ |f(zeta)|lt.eq sup_{xi in partial D(z,delta)}|f(xi)|<infinity forall zeta in D(z,delta), $
 contradicting the assumption that $f(z)=infinity$ is an isolated pole. Hence, $z$ must be an accumulation of values evaluating to $infinity$. By spherical continuity, $exists delta>0$ such that 
$ d_sigma (f(zeta),infinity)<\frac pi2 forall zeta in D(z,delta). $
 Similarly, $exists N in NN$ such that $forall n>N$, 
$ d_sigma (f(zeta),f_n(zeta))<\frac pi2. $

            Hence, we have 
$ pi-d_sigma (infinity,f_n(zeta))=d_sigma(infinity,0)-d_sigma (infinity,f_n(zeta))>0. $
 By the reverse triangle inequality, we have 
$ d_sigma (0,f_n(zeta))>0. $

            Hence each $(1)/(f_n)$ is holomorphic on $D(z,delta)$ and converges locally uniformly spherically to $(1)/(f)$ on $D(z,delta)$. By Weierstrass (@thm:weierstrassconvergence), $\frac1f$ is holomorphic on $D(z,delta)$ and has zeros that accumulate at $z$. By the Identity Theorem, $\frac1f equiv0 => f equiv infinity$ on $D(z,delta)$.

    Let $S$ be the set of all $z in Omega$ such that $f(z)$ is finite. By the argument above, $S$ is open. The complement $Omega without S$ then consists of all points where $f(z)=infinity$. By the argument above, $Omega without S$ is also open. Since $Omega$ is connected, by @thm:connectedtopologicalspaceclopensets, either $S=emptyset$ or $S=Omega$. In the former case, $f equiv infinity$ on $Omega$, and in the latter case, $f$ is holomorphic on $Omega$.]

#theorem("#smallcaps[Marty's Criterion]")[A family of meromorphic functions $cal(F)$ on some $Omega subset.eq CC$ is spherically normal iff 
$ {f^\sharp | f in cal(F)}, $
 or the family of spherical derivatives, is locally uniformly bounded in $Omega$.] <thm:marty>

#proof[The condition is equivalent to that of 
$ (2 |f'(z)|)/(1+|f(z)|^2)lt.eq M forall f in cal(F) $
 for all compact $K subset Omega$, $forall z in K$, where $M$ depends only on $K$. Under the assumption that this holds, then 
$ d_sigma (f \qty(z_1),f \qty(z_2))=inf_gamma integral_Gamma dif s_{sigma}lt.eq M |z_2-z_1| forall f in cal(F) $
 where $gamma$ joins $f (z_1)$ and $f (z_2)$ where $z_1,z_2 in K$. Hence, $forall epsilon>0$, $forall z_1,z_2 in K$ such that $|z_1-z_2|<(epsilon)/(M)$, $d_sigma (f \qty(z_1),f \qty(z_2))<epsilon$, and hence $cal(F)$ is _uniformly spherically equicontinuous_. Since $d_sigma lt.eq pi$ for any two points by geometry of $S^2$, $cal(F)$ is also _uniformly spherically bounded_ (the compactness of $S^2$). Then the Arzelà--Ascoli Theorem (@thm:arzelaascoli) under the spherical metric gives that $cal(F)$ is a normal family.

    Conversely, assume for the sake of contradiction that $cal(F)$ is a normal family such that conclusion is not satisfied. Then, $exists K subset Omega$ compact and a sequence $\cbraces{f_n}_{n in NN}subset.eq cal(F)$ such that the sequence 
$ \cbraces{sup_{z in K}f^\sharp_n(z)}_{n in NN} $
 tends to $infinity$ (specifically, suppose that $forall n in NN$, $sup_{z in K}f_n^\sharp(z)>n$). By normality, we may extract a locally uniformly spherically convergent subsequence $\cbraces{f_{n_k}}_{k in NN}subset.eq \cbraces{f_n}_{n in NN}$. By @thm:uniformlimit under the spherical metric, the uniform spherical limit of $\cbraces{f_{n_k}}_{k in NN}$, $f$, is spherically continuous on $Omega$. For every point $z in Omega$, there are two possibilities:
    
+ If $f(z)eq.in.notfinity$, then by continuity, $exists delta>0$ such that $forall zeta in D(z,delta)$, 
$ d_sigma (f(zeta),f(z))<\frac12d_sigma (infinity, f(z)). $
 Similarly, $exists N in NN$ such that $forall k>N$, 
$ d_sigma (f(zeta),f_{n_k}(zeta))<\frac12d_sigma (infinity, f(z)). $

            Hence, we have 
$ d_sigma (infinity,f(z))-d_sigma (f(z),f_{n_k}(zeta))>0. $
 By the reverse triangle inequality, we have 
$ d_sigma (infinity,f_{n_k}(zeta))>0. $

            Hence, the meromorphy of each $f_{n_k}$ is actually holomorphy. By continuity, $f$ is locally uniformly bounded on $D(z,delta)$. Hence, $\cbraces{f_{n_k}}_{k>N}$ locally uniformly converges on $D(z,delta)$. By a result of Weierstrass (@thm:weierstrassconvergence), $f$ is holomorphic on $D(z,delta)$ and the sequence $\cbraces{f'_{n_k}}_{k>N}$ locally uniformly converges to $f'$ on $D(z,delta)$.

            By holomorphy of $f'$ on $overline(D (z,\frac delta2))$, $exists M'>0$ such that $sup_{zeta in overline(D (0,\frac delta2))}|f'(zeta)|<M'$. Uniform convergence of $\cbraces{f'_{n_k}}_{k>N}$ gives the existence of some $N'>N$ such that $forall k>N'$, 
$ |f'_{n_k}(zeta)-f'(zeta)|<1 => |f'_{n_k}(zeta)|lt.eq M'+1 forall zeta in overline(D (z,\frac delta2)). $
 Therefore, $\cbraces{f'_{n_k}}_{k>N}$ is uniformly bounded by 
$ M=max \qty(\cbraces{M'+1}union \cbraces{sup_{zeta in overline(D (0,\frac delta2))}|f_{n_k}'(zeta)|}_{N<k lt.eq N'}) $
 on this compact disk. Hence, $forall k>N$, 
$ f^\sharp_{n_k}(zeta)=\frac{2 |f_{n_k}'(zeta)|}{1+|f_{n_k}(zeta)|^2}lt.eq 2 |f'_{n_k}(zeta)|lt.eq 2M forall zeta in D (z,\frac delta2)subset overline(D (z,\frac delta2)). $
+ $f (z)=infinity$, then by continuity, $exists delta>0$ such that $forall zeta in D(z,delta)$, 
$ d_sigma (f(zeta),infinity)<\frac pi2. $
 Similarly, $exists N in NN$ such that $forall k>N$, 
$ d_sigma (f(zeta),f_{n_k}(zeta))<\frac pi2. $

            Hence, we have 
$ pi-d_sigma (infinity,f_{n_k}(zeta))=d_sigma(infinity,0)-d_sigma (infinity,f_{n_k}(zeta))>0. $
 By the reverse triangle inequality, we have 
$ d_sigma (0,f_{n_k}(zeta))>0. $

            Hence, each $g_{n_k}=\frac1{f_{n_k}}$ is holomorphic on $D(z,delta)$. By continuity, $g=\frac1f$ is locally uniformly bounded on $D(z,delta)$. It can also be realized that $\cbraces{g_{n_k}}_{k>N}$ locally uniformly converges on $D(z,delta)$. By a result of Weierstrass (@thm:weierstrassconvergence), $g$ is holomorphic on $D(z,delta)$ and the sequence $\cbraces{g_{n_k}'}_{k>N}$ locally uniformly converges to $g'$ on $D(z,delta)$.

            By holomorphy of $g'$ on $overline(D (z,\frac delta2))$, $exists M'>0$ such that $sup_{zeta in overline(D (0,\frac delta2))}|g'(zeta)|<M'$. Uniform convergence of $\cbraces{g'_{n_k}}_{k>N}$ gives the existence of some $N'>N$ such that $forall k>N'$, 
$ |g'_{n_k}(zeta)-g'(zeta)|<1 => |g'_{n_k}(zeta)|lt.eq M'+1 forall zeta in overline(D (z,\frac delta2)). $
 Therefore, $\cbraces{g'_{n_k}}_{k>N}$ is uniformly bounded by 
$ M=max \qty(\cbraces{M'+1}union \cbraces{sup_{zeta in overline(D (0,\frac delta2))}|g_{n_k}'(zeta)|}_{N<k lt.eq N'}) $
 on this compact disk. Hence, $forall k>N$, 
$ f^\sharp_{n_k}(zeta)=\frac{2 |-(g_{n_k}'(zeta))/(g_{n_k}(zeta)^2)|}{1+|g_{n_k}(zeta)|^{-2}}=\frac{2 |g_{n_k}'(zeta)|}{|g_{n_k}(zeta)|^2+1}lt.eq 2 |g'_{n_k}(zeta)|lt.eq 2M, forall zeta in D (z,\frac delta2). $

    In essence, for any point $z$, there exists an open disk $D_z$ centered at $z$ on which the spherical derivatives $f^\sharp_{n_k}$ are bounded by some constant $M_z$ for $k>N_z$. By Heine--Borel (@thm:heineborel), there exists a finite collection of disks $\cbraces{D_{z_j}}_{1 lt.eq j lt.eq n}$ that cover $K$. Thus, $\cbraces{f_{n_k}^\sharp(z)}_{k>N}$ is uniformly bounded on $K$ by $max_{1 lt.eq j lt.eq n}M_{z_j}$, where $N=max_{1 lt.eq j lt.eq n} N_{z_j}$, contradicting the assumption that $sup_{z in K}f^\sharp_n(z)>n$ for all $n in NN$.]

#theorem("#smallcaps[Fundamental Normality Test]")[Let $Omega subset.eq CC$ be a region and suppose that $cal(F)$ is a family of holomorphic functions on $Omega$. If there exist two different points $alpha,beta in CC$ such that $\cbraces{alpha,beta}sect cup_{f in cal(F)}f(Omega)=emptyset$, then $cal(F)$ must be a spherically normal family.] <thm:fundamentalnormalitytest>

#proof[Map $alpha$ and $beta$ to $0,1$ by a linear function $phi.alt(z)=(z-alpha)/(beta-alpha)$. Then the family of holomorphic functions 
$ tilde(cal(F))={phi.alt compose f | f in cal(F)} $
 omits $0$ and $1$ for all $z in Omega$.

    By @prop:conformalmetricnegativecurvatureexistencewhenomits2points, $exists beta>0$ such that for 
$ rho(z)=\frac{sqrt(1+|z|^{\frac13})sqrt(1+|z-1|^{\frac13})}{|z|^{\frac56}|z-1|^{\frac56}}, dif s^2_{rho}=rho(z)^2 |ddz|^2 $
 as in @eq:conformalmetricnegativecurvatureexistencewhenomits2points_metric,
    
$ K_rho(z)lt.eq-beta forall z in CCwithout \cbraces{0,1}. $

    Therefore, if we let $mu=rho sqrt(beta)$, then
    
$ K_mu=-(\laplacian(log compose mu))/(mu^2)=-(\laplacian(log compose rho))/(rho^2 beta)=(K_rho)/(beta)lt.eq-1 \qq{on}CCwithout \cbraces{0,1}. $ <eq:fundamentalnormalitytest_f_mu_pullback_inequality>

    Let $zeta in Omega$ be arbitrary and let $r_zeta>0$ satisfy $D (zeta,r_zeta)subset.eq Omega$. By @cor:generalizedahlfors, the pullback of $mu$ from $CCwithout \cbraces{0,1}$ to $D (zeta,r_zeta)subset.eq Omega$ satisfies 
$ f^*mu(z)lt.eq lambda_{r_zeta}(z-zeta)=> mu (f(z))|f'(z)|lt.eq (2r_zeta)/(r_zeta^2-|z-zeta|^2) forall z in D (zeta,r_zeta),f in tilde(cal(F)). $

    Since $forall w in CCwithout \cbraces{0,1}$, 
$ (sigma(w))/(mu(w))=\frac{(2)/(1+|w|^2)}{\frac{sqrt(1+|w|^{\frac13})sqrt(1+|w-1|^{\frac13})}{|w|^{\frac56}|w-1|^{\frac56}}}-> cases(0 & \qq*{as}w -> 0, ,
 0 & \qq*{as}w -> 1, ,
 (2 |w|^{-2})/(|w|^{-\frac43})->0 & \qq*{as}w -> infinity.) $

    Hence, there exist open neighborhoods $U_0,U_1,U_infinity$ of $0,1,infinity$ respectively on which $\frac sigma mu<1$. Since $(sigma)/(mu)in C^0(CC)$, by @thm:continuous_function_bounded_on_compact, $exists M'>0$ such that $(sigma)/(mu)<M'$ on $CCwithout (U_0 union U_1 union U_infinity)$. Let $M=max \cbraces{M',1}$, and 
$ \therefore sigma lt.eq M mu \qq{on}CCwithout \cbraces{0,1}. $

    Hence, $forall f in tilde(cal(F))$, we have by virtue of @eq:fundamentalnormalitytest_f_mu_pullback_inequality, 
$ f^\sharp(z)=sigma compose f(z)|f'(z)|lt.eq M mu compose f(z)|f'(z)|lt.eq (2rM)/(r_zeta^2-|z-zeta|^2) $
 for any $z in D (zeta,r_zeta)$. Now restricting $z$ to $D (zeta,(r_zeta)/(2))$, we have 
$ |z-zeta|^2<\frac{r_zeta^2}4 => r_zeta^2-|z-zeta|^2>\frac{3r_zeta^2}4 => |f^\sharp(z)|<(8r_zeta M)/(3r_zeta^2)=(8M)/(3r_zeta). $

    For any compact $K subset Omega$, the collection of open disks 
$ {D (zeta,(r_zeta)/(2)) | zeta in K} $
 forms an open cover of $K$. Hence, by Heine--Borel (@thm:heineborel), it admits a finite subcover 
$ {D (zeta_k,(r_{zeta_k})/(2)) | 1 lt.eq k lt.eq n} $
 for some $n in NN$. Then ${f^\sharp | f in tilde(cal(F))}$ is uniformly bounded on $K$ by 
$ M_K=max {(8M)/(3r_{zeta_k}) | 1 lt.eq k lt.eq n} $
 and is thus locally uniformly bounded on $Omega$. Marty's Criterion (@thm:marty) gives the normality of $tilde(cal(F))$; since $phi.alt$ is linear, it follows that $cal(F)$ is also normal on $Omega$.]

#corollary("name=#smallcaps[Montel--Carathéodory]")[Let $Omega subset.eq CC$ be a region and suppose that $cal(F)$ is a family of meromorphic functions on $Omega$. If there exist three different points $alpha,beta,gamma in hat(CC)$ such that $\cbraces{alpha,beta,gamma}sect cup_{f in cal(F)}f(Omega)=emptyset$, then $cal(F)$ must be a spherically normal family.] <cor:montelcaratheodory>

#proof[Let $phi.alt(z)=((z-alpha)(beta-gamma))/((z-gamma)(beta-alpha))$ be a Möbius transformation mapping $alpha,beta,gamma$ to $0,1,infinity$, respectively.
    Hence, the family of meromorphic functions 
$ tilde(cal(F))={phi.alt compose f | f in cal(F)} $
 omits $0$, $1$, and $infinity$ (and hence each function is holomorphic). By the Fundamental Holomorphic Normality Test (@thm:fundamentalnormalitytest), $tilde(cal(F))$ is normal.

    By @prop:linearfractionaltransformationuniformlysphericallycontinuous, $forall epsilon>0$, $exists delta>0$ such that $forall |w_1-w_2|<delta$ in $CC$, 
$ d_sigma (phi.alt^{-1}\qty(w_1),phi.alt^{-1}\qty(w_2))<epsilon. $

    Let $\cbraces{tilde(f)_n}_{n in NN}$ be any function sequence in $cal(F)$ and let $\cbraces{tilde(f)_{n_k}}_{k in NN}$ be locally uniformly convergent to $tilde(f)$ on a compact set $K subset Omega$. Then $exists N in NN$ such that $forall k>N$, 
$ |tilde(f)_{n_k}(z)-tilde(f)(z)|<delta forall z in K. $

    Therefore, $forall z in K$, $k>N$, we have 
$ d_sigma (phi.alt^{-1}compose tilde(f)_{n_k}(z),phi.alt^{-1}compose tilde(f)(z))=d_sigma (f_{n_k}(z),f(z))<epsilon. $
 Hence, every sequence $f_n$ has a locally uniformly spherically convergent subsequence, and the normality of $cal(F)$ follows.]
