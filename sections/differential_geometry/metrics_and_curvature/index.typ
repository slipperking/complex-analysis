#import "/lib.typ": *

== Conformal Metrics and Curvature
Let $Omega subset.eq CC$ be a region and let $rho in C^0(Omega)$ be a positive function. The _conformal metric_ (in the following chapters when we refer to _metric_ we mean conformal) induced by $rho$ is given by 
$ dif s=rho(z)|dif z|\qor dif s^2=rho(z)^2 |dif z|^2. $

The term ``conformality'' is explained in the previous section (note that this specific usage has little to do with holomorphy). The distance between two points $z_1,z_2 in Omega$ is defined as 
$ d (z_1,z_2)=inf_{gamma subset Omega}integral_gamma rho(z)|dif z|, $
 where the infimum is taken over all piecewise smooth curves $gamma$ in $Omega$ joining $z_1$ and $z_2$.

A $C^2$ metric is said to be _regular_. The (Gaussian) _curvature_ of the regular metric $rho$ at $z in Omega$ is defined as

$ K_rho(z)=-(\laplacian(log rho)(z))/(rho(z)^2), $ <eq:curvatureofmetric>
 where $\laplacian=\pdv[2]{}{x}+\pdv[2]{}{y}=4 \pdv[2]{}{overline(z)}{z}$ is the Laplacian operator. This is the same definition as the Gaussian curvature in @eq:gaussiancurvatureofsurface_gaussiancurvatureconformalmetricformula.

The three following metrics are of particular interest in complex differential geometry:

+ Perhaps the most trivial metric is the _Euclidean metric_ (also known as the _parabolic metric_) on $CC$, and is given by 
$ rho=1, dif s^2=|ddz|^2. $
 The _Euclidean distance_ between two points $z_1,z_2 in CC$ is 
$ inf_{gamma}integral_gamma |ddz|=|z_2-z_1| $
 is the length of the straight line segment connecting $z_1$ and $z_2$. The group formed by all transformations in the form of $z |-> ee^{ii theta}z+a$ (where $a in CC$ and $theta in RR$) is known as _the group of rigid motions_, or more abstractly, the _special Euclidean group_ of order 2, denoted by $upright("SE")(2)<Aut(CC)$, intuitively consists of all rotations and translations and their compositions, while the _Euclidean_ group $upright("E")(2)>upright("SE")(2)$ consists of reflections in the form of $z |-> ee^{ii theta}overline(z)+a$. Obviously, the Euclidean metric is invariant under both groups.

        From @eq:curvatureofmetric, we find that Euclidean metric has curvature $K=0$.
+ The _Poincaré metric_ (also referred to as the _hyperbolic metric_) on $bb(D)$ is given by
        
$ rho=lambda(z)=(2)/(1-|z|^2), dif s_{lambda}^2=(4 |ddz|^2)/((1-|z|^2)^2) $ <eq:poincaremetricdefinition>

        In @lem:schwarzpick, it was shown that the metric is invariant under $Aut(bb(D))$.

        We will now calculate the Poincaré distance between two points $z_1,z_2 in CC$. First assume the case where $z_1=0$ and $z_2=R in (0,1)$. Consider a piecewise smooth curve $gamma subset bb(D)$ parameterized by $z(t)$ connecting $z_1$ and $z_2$; or in other words 
$ z(t)=x(t)+ii y(t), z(0)=z_1=0, z(1)=z_2=R, $
 where $x in C^1([0,1])$ and $y in C^1([0,1])$ are real-valued functions. Then
        
$
integral_gamma dif s & =integral_0^1 (2 sqrt(x'(t)^2+y'(t)^2))/(1-x(t)^2-y(t)^2)dif tgt.eq integral_0^1 (2 |x'(t)|)/(1-x(t)^2)ddt gt.eq |integral_0^1 (2x'(t))/(1-x(t)^2)dif t| \\ & =|integral_0^R (2)/(1-x^2)ddx|=log((1+R)/(1-R)).
$
 Assuming that $gamma$ is in the form of $z(t)=Rt, z'(t)=R$ where $t in[0,1]$, we have 
$ integral_gamma dif s=integral_0^1 (2R ddt)/(1-R^2t^2)=log((1+R)/(1-R)). $
 Hence, the Poincaré distance between $0$ and $R$ is given by 
$ d (0,R)=log((1+R)/(1-R)) $
 and the straight line segment connecting the two points is a _geodesic_. For fixed $theta in RR$ since $z |-> z ee^{ii theta}in Aut(bb(D))$, by the Schwarz--Pick Lemma (@lem:schwarzpick), we have 
$ d (0,R)=d (0,R ee^{ii theta})=log((1+R)/(1-R)) $
 by the invariance under $Aut(bb(D))$. Now let $z_1$ and $z_2$ be arbitrary points in $bb(D)$. The Möbius transformation 
$ phi.alt_{z_1}(z)=(z-z_1)/(1-overline(z_1)z) $

        maps $z_1$ to $0$ and maps $z_2$ to $(z_2-z_1)/(1-overline(z_1)z_2)$. Hence, we have 
$ d (z_1,z_2)=d \qty(0,(z_2-z_1)/(1-overline(z_1)z_2))=log [\frac{1+|(z_2-z_1)/(1-overline(z_1)z_2)|}{1-|(z_2-z_1)/(1-overline(z_1)z_2)|}]=inf_{gamma}integral_gamma dif s, $
 which is the Poincaré distance (or _hyperbolic distance_) between $z_1$ and $z_2$. The infimum is attained along the geodesic curve $gamma$ parameterized by
        
$ z(t)=(phi.alt_{z_1})^{-1}\qty((z_2-z_1)/(1-overline(z_1)z_2)t) $

        for $t in[0,1]$. By @thm:linearfractionaltransformationmapscirclestocircles, the geodesic is either an arc or a straight line segment passing through $z_1$ and $z_2$. Since $partial bb(D)$ is orthogonal to the straight line passing through $0$ and $(z_2-z_1)/(1-overline(z_1)z_2)$, by the conformality of $phi.alt_{z_1}^{-1}$, $phi.alt_{z_1}^{-1}(partial bb(D))=partial bb(D)$ is orthogonal to the circular (or straight line) extension of the geodesic curve.

        As a consequence of the Schwarz--Pick Lemma (@lem:schwarzpick), for any $f:bb(D)-> bb(D)$ is holomorphic, we have 
$ d (f(z_1),f(z_2))lt.eq d (z_1,z_2), $
 where equality is attained iff $f in Aut(bb(D))$. The Poincaré metric has constant negative curvature $-1$ since
        
$
K_lambda & =-(4)/(lambda^2)\pdv[2]{}{overline(z)}{z}(log compose lambda)=-(4)/(lambda^2)\pdv{overline(z)}((lambda'_z)/(lambda))=-(2)/(lambda^2)\pdv{overline(z)}((2 overline(z))/(1-|z|^2)) \\ & =-(2)/(lambda^2)(lambda+overline(z)lambda'_{overline(z)})=-((1-|z|^2)^2)/(2)\qty(lambda+overline(z)\qty((2z)/((1-|z|^2)^2))) \\ & =-(1-|z|^2)-|z|^2=-1,
$
 where $lambda'_z=pdv(lambda, z)$ and $lambda'_{overline(z)}=pdv(lambda, overline(z))$.
+ The _spherical metric_ (also referred to as the _elliptic metric_) on $hat(CC)$ is given by
        
$ rho=sigma(z)=(2)/(1+|z|^2), dif s^2_sigma=(4 |ddz|^2)/((1+|z|^2)^2). $ <eq:sphericalmetricdefinition>

        Under the inverse stereographic projection of $S^2 -> hat(CC)$, for a given $z in hat(CC)$, the corresponding point in $S^2$ is 
$ (x_1,x_2,x_3)=\qty((z+overline(z))/(|z|^2+1),(z-overline(z))/(ii |z|^2+ii),(|z|^2-1)/(|z|^2+1)). $
 If we let $P=(x_1,x_2,x_3)$ and $Q=(tilde(x_1),tilde(x_2),tilde(x_3))$ be two points in $S^2$, the distance between the two points is the length of the shortest arc $\widearc{PQ}$ (a subset of great circle passing the two points). By considering $P$ and $Q$ as vectors from $(0,0,0)$, this distance is equal to
        
$
arccos(P dot.c Q)=2 arctan sqrt((1-x_1 tilde(x_1)-x_2 tilde(x_2)-x_3 tilde(x_3))/(1+x_1 tilde(x_1)+x_2 tilde(x_2)+x_3 tilde(x_3))) \\ =2 arctan \sqrt{\frac{1-\frac{(z+overline(z))\qty(tilde(z)+overline(tilde(z)))}{(|z|^2+1)(|tilde(z)|^2+1)}+\frac{(z-overline(z))\qty(tilde(z)-overline(tilde(z)))}{(|z|^2+1)(|tilde(z)|^2+1)}-\frac{(|z|^2-1)(|tilde(z)|^2-1)}{(|z|^2+1)(|tilde(z)|^2+1)}}{1+\frac{(z+overline(z))\qty(tilde(z)+overline(tilde(z)))}{(|z|^2+1)(|tilde(z)|^2+1)}-\frac{(z-overline(z))\qty(tilde(z)-overline(tilde(z)))}{(|z|^2+1)(|tilde(z)|^2+1)}+\frac{(|z|^2-1)(|tilde(z)|^2-1)}{(|z|^2+1)(|tilde(z)|^2+1)}}} \\ =2 arctan \sqrt{\frac{-z overline(tilde(z))-overline(z)tilde(z)+|z|^2+|tilde(z)|^2}{z overline(tilde(z))+overline(z)tilde(z)+|z|^2 |tilde(z)|^2+1}}=2 arctan \sqrt{\frac{(z-tilde(z))\qty(overline(z)-overline(tilde(z)))}{\qty(z overline(tilde(z))+1)(overline(z)tilde(z)+1)}}.
$

        Notice that the fraction within the square root is a product between a complex number and its conjugate. Thus, this distance is equal to 
$ d (z,tilde(z))=2 arctan |\frac{z-tilde(z)}{z overline(tilde(z))+1}| $
 in the extended complex plane. Let $tilde(z)=z+Delta z$. It follows that
        
$
d(z,z+Delta z) & =2 arctan |(Delta z)/(\abs{z}^2+z overline(Delta z)+1)|=2 arctan |(Delta z)/(\abs{z}^2+1)(1)/(1+(z overline(Delta z))/(\abs{z}^2+1))| \\ & =2 arctan |(Delta z)/(\abs{z}^2+1)(1+cal(O)(Delta z))|=2 arctan |(Delta z)/(\abs{z}^2+1)+cal(O)(Delta z^2)| \\ & =2 \qty[|(Delta z)/(\abs{z}^2+1)+cal(O)(Delta z^2)|+\order{Delta z^3 [(1)/(|z|^2+1)+cal(O)(Delta z)]^3}] \\ & =2 [|(Delta z)/(\abs{z}^2+1)+o (Delta z^2)|],
$

        where we have taken the liberty to coalesce orders for simplification. Since 
$ \lim_{Delta z -> 0}|(d (z,z+Delta z))/(Delta z)|=(2)/(|z|^2+1), $
 the metric as defined in @eq:sphericalmetricdefinition has a clear geometric meaning: the distance between two points $z$ and $tilde(z)$ under the metric in @eq:sphericalmetricdefinition is the shortest distance between the corresponding points in $S^2$, or their spherical distance.

        Thus, if curve $gamma$ joins $z$ and $tilde(z)$, we have 
$ d (z,tilde(z))=inf_{gamma}integral_gamma sigma(z)|ddz|, $
 which attains its infimum when the inverse stereographic projection of $gamma$ is a great circle of $S^2$. Thus, $sigma$ is known as the spherical metric.

        The corresponding curvature is given by
        
$
K_sigma & =-(4)/(sigma^2)\pdv[2]{}{overline(z)}{z}(log(sigma))=-(4)/(sigma^2)\pdv{overline(z)}((sigma'_z)/(sigma))=(2)/(sigma^2)\pdv{overline(z)}((2 overline(z))/(1+|z|^2)) \\ & =(2)/(sigma^2)(sigma+overline(z)sigma'_{overline(z)})=((1+|z|^2)^2)/(2)\qty((2)/(1+|z|^2)-(2 |z|^2)/((1+|z|^2)^2)) \\ & =(1+|z|^2)-|z|^2=1,
$
 where $sigma'_z=pdv(sigma, z)$ and $sigma'_{overline(z)}=pdv(sigma, overline(z))$. This can also be verified by computing the principal curvatures of the unit sphere, which are both one.

The importance of the selected regions lies in the uniformization to be mentioned in @sec:riemannsurfaces.

Let $Omega_1$ and $Omega_2$ be two open regions in $CC$ such that $f:Omega_1 -> Omega_2$ is univalent (implying that $f'eq.not 0$ by @lem:univalentnonvanishingderivative). If $rho$ is a metric on $Omega_2$, then

$ f^*rho=(rho compose f)|f'| $ <eq:pullbackmetric>
 defines a metric on $Omega_1$, referred to as the _metric pullback of_ $rho$ _by_ $f$.

Curvature as defined in @eq:curvatureofmetric is invariant under pullbacks of conformal mappings, or in the case above, we now aim to show that (under assumptions of regularity)

$ K_rho(f(z))=K_{f^*rho}(z). $ <eq:curvatureinvarianceunderholomorphicpullback>

By explicit definition, 
$ K_{f^*rho}(z)=-(\laplacian(log compose f^*rho)(z))/((f^*rho)(z)^2)=-((\laplacian log compose rho \qty(f))(z)+\laplacian log |f'(z)|)/((f^*rho)^2(z)). $
 Since $f'(z)eq.not 0$, $log compose |f'|=Re log(f')$ is harmonic on $Omega_1$ with a vanishing Laplacian. Hence,

$
K_{f^*rho}(z) & =-((\laplacian log compose rho \qty(f))(z))/((rho compose f)^2 |f'|^2)=-(4)/((rho compose f)^2 |f'|^2)\pdv{overline(z)}(\pdv{z}(log compose rho compose f(z))) \\ & =-(4)/((rho compose f)^2 |f'|^2)\pdv{overline(z)}(pdv(log compose rho, f)pdv(f, z)+pdv(log compose rho, overline(f))\overline{(pdv(f, overline(z)))}) \\ & =-(4)/((rho compose f)^2 |f'|^2)pdv(f, z)\pdv{overline(z)}(pdv(log compose rho, f)) \\ & =-(4)/((rho compose f)^2 |f'|^2)pdv(f, z)\qty(\pdv[2]{log compose rho}{f}pdv(f, overline(z))+\pdv[2]{log compose rho}{overline(f)}{f}overline((pdv(f, z)))) \\ & =-(4)/((rho compose f)^2)\pdv[2]{}{overline(f)}{f}(log compose rho)=-(\laplacian_f (log compose rho))/((rho compose f)^2)=K_rho (f(z)).
$

For a given metric $dif s=lambda(z)|ddz|$, if there is some other parameterization such that $dif s=lambda'(z')|dif z'|$, $z'=f(z)$ is conformal, then the relation is given by $lambda=f^*lambda'$. Under differing parameterizations of a metric $dif s$, we once again have the invariance of curvature.
