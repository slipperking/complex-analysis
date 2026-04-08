#import "../../../lib.typ": *

== The Great Picard, Bloch, Landau, and Schottky Theorems
Recall the Casorati--Weierstrass Theorem, one of the earliest results on the value distribution near essential singularities: \getkeytheorem{thm:casoratiweierstrass} We will now prove a more advanced characterization of this distribution by methods of differential geometry.

#theorem("name=#smallcaps[Picard's Great Theorem],store=thm:greatpicard")[Suppose $f$ is holomorphic on a punctured neighborhood $D^*(z_0,delta)$ of $z_0$. If $z_0$ is an essential singularity of $f$, then $f (D^*\qty(z_0,delta))$ omits at most one value of $CC$.] <thm:greatpicard>

#proof[Without loss of generality, assume $z_0=0$ and that $f$ omits the values $0$ and $1$ (otherwise, consider $z |-> \frac1{beta-alpha}(f (z+z_0)-alpha)$, where $alpha$ and $beta$ are the omitted values). Define the family
    
$ cal(F)={z |-> f (\frac zn) | n in NN} $

    of holomorphic functions on $D^*(0,delta)$. Since $f$ omits $0$ and $1$, each element of $cal(F)$ does as well. By the Fundamental Normality Test (@thm:fundamentalnormalitytest), $cal(F)$ is spherically normal. Thus, there exists a subsequence $\cbraces{f_{n_k}}_{k in NN}subset.eq cal(F)$ that converges locally uniformly on $D^*(0,delta)$ in the spherical metric. By @prop:locallyuniformlysphericallyconvergentholomorphicsequenceuniformlimit, this subsequence converges locally uniformly either to a holomorphic function on $D^*(0,delta)$ or to $infinity$ thereon.
    
+ Suppose $\cbraces{f_{n_k}}_{k in NN}$ converges locally uniformly to a holomorphic function on $D^*(0,delta)$. Then $\cbraces{f_{n_k}}_{k in NN}$ is uniformly bounded on $partial D (0,\frac delta2)$. Hence, there exists $M>0$ such that
              
$ |f (\frac z{n_k})|=|f_{n_k}(z)|<M forall z in partial D (0,\frac delta2),\ k in NN. $

              In other words, $f$ is bounded by $M$ on every circle $partial D (0,(delta)/(2n_k))$ for $k in NN$. By the Maximum Modulus Principle (@thm:maximummodulus), $f$ is then bounded by $M$ on each annulus $overline(D (0,(delta)/(2n_k)))without D (0,(delta)/(2n_{k+1}))$ for $k in NN$. As
              
$ cup_{k in NN}overline(D (0,(delta)/(2n_k)))without D (0,(delta)/(2n_{k+1}))=overline(D (0,\frac delta{2n_1}))without \cbraces{0}, $

              it follows that $f$ is bounded on $D^*(0,\frac delta2)$. By Riemann's Removable Singularity Theorem (@thm:riemannremovablesingularities), $f$ therefore extends holomorphically to $0$.
+ Suppose $\cbraces{f_{n_k}}_{k in NN}$ converges locally uniformly to $infinity$ on $D^*(0,delta)$. Then, for every $epsilon.alt>0$, there exists $N in NN$ such that, for all $k>N$,
              
$ |(1)/(f ((z)/(n_k)))|=\abs{\frac1{f_{n_k}(z)}}<epsilon.alt forall z in partial D (0,\frac delta2). $

              By the same reasoning as in the previous case, $|\frac1f|<epsilon.alt$ on
              
$ cup_{k>N}overline(D (0,(delta)/(2n_k)))without D (0,(delta)/(2n_{k+1}))supset D^*(0,(delta)/(2n_{N+1})). $

              Thus, by the definition of the limit, $\lim_{z -> 0}1/f(z)=0$, so $f$ has a pole at $0$.

    In either case, we have derived a meromorphic continuation of $f$ to $0$, contradicting the assumption that $0$ is an essential singularity of $f$.]

#corollary("store=cor:greatpicardmeromorphic")[Suppose that $f$ is meromorphic on a punctured neighborhood $D^*(z_0,delta)$ of $z_0$. If $f (D^*\qty(z_0,delta))$ omits at least three different values of $hat(CC)$, then $f$ has a meromorphic continuation to $z_0$.] <cor:greatpicardmeromorphic>

#proof[A linear fractional transformation maps the omitted values to $0,1,infinity$, mapping $f$ so that it exhibits holomorphy. Similar to @cor:montelcaratheodory, the preceding result is preserved under the inverse linear fractional transformation.]

#remark[An accumulation point of poles is an essential singularity on the Riemann sphere.]

Picard's Great Theorem is also a generalization of Picard's Little Theorem (@thm:littlepicard):
\getkeytheorem{thm:littlepicard}

#proof[Let $g(z)=f (\frac 1z)$ with an isolated singularity at 0 and a removable singularity at $infinity$. By Picard's Great Theorem (@thm:greatpicard), $g(z)$ has a meromorphic extension to $z=0$. If $z=0$ is removable, by virtue of @prop:removablesingularityatinftyentireconstant, @thm:liouville, the constancy of $g$ and $f$ follows.

    If instead $z=0$ is a pole of $g$, then $z=infinity$ is a pole of $f$, and hence $f$ is a polynomial. Assume, for the sake of contradiction that $f$ is non-constant. Then $forall w in CC$, the Fundamental Theorem of Algebra (@thm:fundamentaltheoremofalgebra) gives the existence of some $z in CC$ such that $f(z)=w$. Hence, $f$ attains every value $w in CC$. This contradicts the statement and hence $f$ is constant.]

The efforts of many mathematicians resulted in several alternative proofs following that of Picard; the geometric realization of Ahlfors (@thm:schwarzahlforspick) was followed by results discovered by R. M. Robinson. Other approaches from Nevanlinna theory appeared later in the 20th century.

Picard's original proof, providing an advanced characterization of the value distribution at essential singularities, relied primarily on the properties of the elliptic modular function (as a ``covering map''). From this, Picard deduced that the function would necessarily extend holomorphically across the singularity, contradicting its essential nature. Thus, his proof established that near an essential singularity, a holomorphic function attains every complex value, with at most one exception, infinitely often.

More importantly, we have shown the utility of even seemingly fundamental differential geometry, which can also be used in the proof of many other important results.

The methods of differential geometry can also be used to prove the statements of the following theorems (which can also be independently used to prove the Picard theorems), but is made meaningful with the notion of Riemann surfaces.

#theorem("name=#smallcaps[Bloch]")[Let $f:bb(D)-> CC$ be holomorphic such that $|f'(0)|=1$. Then there is a region $S subset.eq bb(D)$ on which $f$ is univalent such that $f(S)$ contains a disk with a radius of at least $(sqrt(3))/(4)$ (known as a schlicht disk).] <thm:bloch>

#remark[_Bloch's constant_ $B$ is defined as the supremum of the radii of such disks that can be contained in $f(bb(D))$ for any holomorphic function $f:bb(D)-> CC$ satisfying $f'(0)=1$.

    The precise value of $B$ remains unknown to this day. In 1937, H. Grunsky and L. Ahlfors established the bound
    
$ B lt.eq (Gamma ((1)/(3))Gamma ((11)/(12)))/(Gamma ((1)/(4)))sqrt((\sqrt{3}-1)/(2)), $

    where $Gamma$ denotes the Gamma function (as in @eq:gammafunction). Later the lower bound of $(sqrt(3))/(4)$ was given, then to be refined to $B gt.eq (sqrt(3))/(4)+(10^{-12})/(13)$ by M. Bonk, which was further improved to $B gt.eq (sqrt(3))/(4)+(1)/(5000)$ in 1996 by H. Chen and P. M. Gauthier.

    Grunsky and Ahlfors actually conjectured that the upper bound in their inequality is exact---that is, $B=(Gamma ((1)/(3))Gamma ((11)/(12)))/(Gamma ((1)/(4)))sqrt((\sqrt{3}-1)/(2))$.]

#theorem("#smallcaps[Landau]")[The image of any holomorphic function $f$ in $bb(D)$ satisfying $f(0)=0$ and $f'(0)=1$ contains a disk with radius of at least $\frac12$.]

#remark[Similarly, the estimate $\frac12$ is not optimal. It was established that the corresponding _Landau's constant_ lies between $\frac12$ and $(Gamma (\frac13)Gamma (\frac56))/(Gamma (\frac16))$.]

Without Riemann surfaces, the proof of the two aforesaid results are rather difficult, as a distinction must be established for a point $w in f(bb(D))$ which two values $z_1,z_2$ map to. More details may be found in~@ahlforsanextensionofschwarzlemma.

Hence, for simplicity, we entertain a much simpler case without algebraic branch points.

#theorem[Let $f:bb(D)-> CC$ be univalent such that $|f'(0)|=1$. Then $f(bb(D))$ contains a disk with a radius of at least $(sqrt(3))/(4)$.]

#proof[For $w in f(bb(D))$, let $phi(w)$ denote the radius of the largest schlicht disk in $f(bb(D))$ centered at $w$ (it is mapped to univalently by $f$ on some subdomain). Trivially, $phi$ is $C^0$ and vanishes toward the boundary of $f(bb(D))$.
    
    Define the metric 
$ rho(w)=(A)/(sqrt(phi(w))(A^2-phi(w))), dif s=rho(w)|dif w| $
 for $w in f(bb(D))$ and $rho(w)eq.not 0$, where $A^2>sup_w rho(w)$ is a constant. We may assume that $sup_w rho(w)$ is finite, since otherwise the theorem is already proved for $f$.

    For every point $w_0 in f(bb(D))$, the bounding circle corresponding to $phi (w_0)$ passes through a (at least one) boundary point, denoted by $b=b_{w_0}$. Let $phi_{w_0}(w)=|w-b|$ and let 
$ rho_{w_0}(w)=\frac{A}{sqrt(phi_{w_0}(w))(A^2-phi_{w_0}(w))}, w in D (w_0,phi(w_0)). $

    By the definition of $phi$, we have $phi_{w_0}gt.eq phi$ everywhere in this neighborhood. Since $rho_{w_0}=(rho_{w_0}|-> sqrt(phi_{w_0}))^*\qty(phi |-> (2A)/((A^2-phi^2)))$ is the pullback of the hyperbolic metric in @eq:poincaremetricscaledcurvature, the metric $rho_{w_0}(w)$ has the constant negative curvature of $-1$. 

    Our goal is to construct $rho_{w_0}$ so that it is the function of a supporting metric for $rho$ (satisfies the criteria for @thm:schwarzahlforspicksupportingmetric). For $rho_{w_0}lt.eq rho$ to be satisfied, we consider 
$ sqrt(phi_{w_0}(w))(A^2-phi_{w_0}(w))gt.eq sqrt(phi(w))(A^2-phi(w)), phi_{w_0}(w)gt.eq phi(w). $
 In particular, we want
    
$ t |-> sqrt(t)(A^2-t) $

    to be increasing on $[0,phi (w_0)+delta]$ for arbitrary $delta>0$. The function itself can be calculated to be increasing for $t lt.eq \frac{A^2}3$ by elementary methods (using derivative tests). Therefore, the conditions for a supporting metric are satisfied if $\frac{A^2}3 gt.eq sup_{w in f(bb(D))}phi(w)gt.eq phi (w_0)+delta$. Without loss of generality we let $delta -> 0^+$ and thus, under the condition that $\frac{A^2}3>sup_{w}phi(w)$, @thm:schwarzahlforspicksupportingmetric gives that 
$ rho(w)|dif w|lt.eq (2 |ddz|)/(1-|z|^2). $
 Let $z=0$, $w=f(0)$, $|\dv*{w}{z}|=1$, and therefore 
$ rho (f(0))lt.eq 2 => A lt.eq 2 sqrt(phi (f(0)))[A^2-phi (f(0))]. $
 By the previous assumptions on $A$, the corresponding function on the right-hand side is increasing, and since $phi (f(0))lt.eq sup_{w}phi(w)$, we have 
$ A^2 lt.eq 4 sup_{w}phi(w)(A^2-sup_{w}phi(w))^2 \xRightarrow[\flatfrac{A^2}3 -> sup_{w}phi(w)^+]{}sup_{w}phi(w)gt.eq \frac{sqrt(3)}4. $]

It is however notable that the proof follows similarly for general functions, but now we consider functions $f:bb(D)-> W$, where $W$ is a Riemann surface and the ``singularities'' are not only boundary points but also algebraic branch points (where $f'=0$).

#theorem("#smallcaps[Landau--Carathéodory]")[Let $f(z)=sum_{n=0}^infinity a_n z^n$ such that $a_1 eq.not0$ and $f$ is holomorphic on $D(0,r)$. If $f$ omits 0 and 1, then $exists R$ dependent only on $a_0$ and $a_1$ such that $r lt.eq R$.]

#theorem("#smallcaps[Schottky]")[Suppose that $f:bb(D)-> CC$ is holomorphic and omits 0 and 1. Then 
$ log |f(z)|<(1+|z|)/(1-|z|)(7+op("log+") |f(0)|), $
 where $op("log+") (x)=max \cbraces{0,log x}$ (common notation in Nevanlinna theory).]

#proof[Consider conformal map $zeta_1(w):CCwithout[0,1]-> CCwithout overline(bb(D))$, which extends to 0, 1, and $infinity$ continuously such that $zeta_1(infinity)=infinity$, $zeta_1(1)=1$, $zeta_1(0)=-1$. Explicitly, we have the relationship 
$ zeta_1+\frac1{zeta_1}=4w-2 $
 as an affine transformation of the inverse _Joukowski transform_ (inverse of $z |-> z+z^{-1}$). We then obtain 
$ zeta_1(w)=2w-1 plus.minus2 sqrt(w^2-w) $
 where we select the branch of the square root by means of the principal branch logarithm:
    
$ zeta_1(w)=2w-1+2 exp(\frac12 Log (w^2-w)) $
 with a branch cut for $w^2-w<0 =>0<w<1$. It is easily verifiable that the three points indeed do map to their prescribed points. This is sufficient to prove univalence.]
