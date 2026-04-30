#import "/lib.typ": *

== Alternative Integral Formulas
As in the Cauchy Integral Formula (@thm:cauchygoursatformula), we can write holomorphic functions in terms of an integral representation. We define the _Cauchy kernel_ to be equal to

$ H(zeta,z)=(1)/(taui (zeta-z)). $

Then @eq:cauchygoursatformula can be written as:

$ f(z)=oint.cont_(partial U)f(zeta)H(zeta,z)ddzeta. $
 There also exist other integral formulas for functions, varying in the kernel of the expression.

Let $z in bb(D)$ and notice that $phi.alt_z(zeta)=(zeta-z)/(1-overline(z)zeta)in Aut(bb(D))$ maps $partial bb(D)$ to $partial bb(D)$ bijectively. Let $Phi:bb(D)-> RR$ be harmonic such that $Phi$ is continuous on $overline(bb(D))$. By the mean-value property introduced in @lem:holomorphicmeanvalueproperty, we have 
$ Phi (0)=(1)/(2 pi rho)integral_0^{2 pi}Phi (rho ee^{ii psi})dif psi, $

where $0<rho<1$. By the uniform continuity of $Phi$ on $overline(bb(D))$ (@thm:heinecantor), $forall epsilon>0$, $exists delta>0$ such that $forall rho in ((1)/(2),1)$ satisfying $1-rho<delta$ and $forall psi in[0,2 pi]$, 
$ |Phi (ee^{ii psi})-Phi (rho ee^{ii psi})|<epsilon. $
 It then follows that 
$ |(1)/(2 pi rho)integral_0^{2 pi}Phi (ee^{ii psi})dif psi-(1)/(2 pi rho)integral_0^{2 pi}Phi (rho ee^{ii psi})dif psi|<(epsilon)/(rho)<2 epsilon. $

Hence,

$ \lim_{rho ->1^-}(1)/(2 pi rho)integral_0^{2 pi}Phi (rho ee^{ii psi})dif psi=(1)/(2 pi)integral_0^{2 pi}Phi (ee^{ii psi})dif psi=Phi(0). $ <eq:harmonicfunctionmeanvalueoverboundaryofunitdisk>

Let $u(zeta)=Phi compose phi.alt_z(zeta)$, which is also harmonic on $bb(D)$. By the univalence of $phi.alt_z$, let $ee^{ii psi}=phi.alt_z (ee^{ii tau})$. It follows that

$
ii ee^{ii psi}dif psi=ii (1-overline(z)z)/((1-overline(z)ee^{ii tau})^2)ee^{ii tau}dif tau,\\ dif psi=(1-overline(z)z)/((1-overline(z)ee^{ii tau})^2)(1-overline(z)ee^{ii tau})/(ee^{ii tau}-z)ee^{ii tau}dif tau=\frac{1-|z|^2}{|1-overline(z)ee^{ii tau}|^2}dif tau.
$

Then from @eq:harmonicfunctionmeanvalueoverboundaryofunitdisk, since $Phi(0)=u compose phi.alt_{-z}(0)=u(z)$, 
$ Phi(0)=(1)/(2 pi)integral_0^{2 pi}u (ee^{ii tau})\frac{1-|z|^2}{|1-overline(z)ee^{ii tau}|^2}dif tau=u(z). $

Let $P(zeta,z)=(1-|z|^2)/(2 pi \qty|1-overline(z)zeta|^2)=(1-|z|^2)/(2 pi |zeta-z|^2)$, known as the _Poisson kernel_. Then,

$ u(z)=integral_0^{2 pi}u (zeta)P(zeta,z)dif tau, $ <eq:poissonintegralformula>

where $zeta=ee^{ii tau}$. @eq:poissonintegralformula is also known as the _Poisson Integral Formula_.
$forall z in D(0,R)$, $forall R>0$, we can apply the transformation $tilde(phi.alt)_z (zeta)=R phi.alt_{\flatfrac{z}{R}}((zeta)/(R))$ to extend the automorphism to $D(0,R)$. Let $Phi$ instead be harmonic on $D(0,R)$ and continuous on $overline(D(0,R))$. Then, 
$ Phi(0)=(1)/(2 pi)integral_0^{2 pi}Phi (R ee^{ii psi})dif psi. $

It follows that $u=Phi compose tilde(phi.alt)_z$ is also harmonic on $D(0,R)$ with $Phi(0)=u compose tilde(phi.alt)_{-z}(0)=u(z)$, and from the bijectivity of $R ee^{ii psi}=tilde(phi.alt)_z (R ee^{ii tau})$,

$ dif psi=\frac{1-(|z|^2)/(R^2)}{(1-(overline(z))/(R)ee^{ii tau})^2}ee^{ii tau}ee^{-ii psi}dif tau=\frac{1-(|z|^2)/(R^2)}{(1-(overline(z))/(R)ee^{ii tau})^2}(1-(overline(z))/(R)ee^{ii tau})/(1-(z)/(R)ee^{-ii tau})dif tau=\frac{R^2-|z|^2}{|R ee^{ii tau}-z|^2}dif tau. $ <eq:poissonintegralformula2_differentialcomputation>

Then because $tilde(phi.alt)_z^{-1}(zeta)=R phi.alt_{-\flatfrac{z}{R}}((zeta)/(R))$,

$ u(z)=(1)/(2 pi)integral_0^{2 pi}u (R ee^{ii tau})\frac{R^2-|z|^2}{|R ee^{ii tau}-z|^2}dif tau. $

The expression $P(zeta,z)=(|zeta|^2-|z|^2)/(2 pi |zeta-z|^2)$ is a general form of the Poisson kernel. Then with $zeta=R ee^{ii tau}$,

$ u(z)=integral_0^{2 pi}u(zeta)P(zeta,z)dif tau. $ <eq:poissonintegralformula2>

The Poisson kernel can also be rewritten as

$ P(zeta,z)=\frac{|zeta|^2-|z|^2}{2 pi (zeta-z)(overline(zeta)-overline(z))}=(1)/(4 pi)((zeta+z)/(zeta-z)+(overline(zeta)+overline(z))/(overline(zeta)-overline(z)))=(1)/(2 pi)Re ((zeta+z)/(zeta-z)). $ <eq:poissonkernelgeneralform>

Thus, @eq:poissonintegralformula2 is equivalent to:

$ u(z)=(1)/(2 pi)integral_0^{2 pi}u(zeta)Re ((zeta+z)/(zeta-z))dif tau. $

Since $ddzeta=ii R ee^{ii tau}dif tau$, $dif tau=(ddzeta)/(ii zeta)$, and 
$ u(z)=(1)/(taui)integral_{partial D(0,R)}(u(zeta))/(zeta)Re ((zeta+z)/(zeta-z))ddzeta=Re [(1)/(taui)oint.cont_{partial D(0,R)}(u(zeta))/(zeta)(zeta+z)/(zeta-z)ddzeta], $

where $z in D(0,R)$. Since $R>0$ and $zeta-z eq.not0$, the function 
$ (1)/(taui)oint.cont_{partial D(0,R)}(u(zeta))/(zeta)(zeta+z)/(zeta-z)ddzeta $
 // TODO: provide more justification on holomorphy
is holomorphic on $D(0,R)$. Therefore, $u(z)$ is the real part of a holomorphic function $f(z)=(1)/(taui)oint.cont_{partial D(0,R)}(u(zeta))/(zeta)(zeta+z)/(zeta-z)ddzeta+ii c$, where $c in RR$. Since $c in RR$ is holomorphic, by @prop:realvaluedholomorphicfunctionconstant, $c$ is constant. For $f(z)=u(z)+ii v(z)$,

$ v(z)=c+(1)/(taui)oint.cont_{partial D(0,R)}(u(zeta))/(zeta)Im ((zeta+z)/(zeta-z))ddzeta. $ <eq:schwarzintegralformulaimaginarypart>

Letting $z=0$, the integral vanishes, and we obtain $c=v(0)=Im(f(0))$.

Define the _Schwarz kernel_ to be 
$ S(zeta,z)=(zeta+z)/(taui(zeta-z)zeta). $

Then for a holomorphic function $f$ on $D(0,R)$ that is continuous on $overline(D(0,R))$, we obtain the _Schwarz Integral Formula_:

$ f(z)=oint.cont_{partial D(0,R)}Re (f(zeta))S(zeta,z)ddzeta+ii Im (f(0)). $ <eq:schwarzintegralformula>

The significance of this alternative formula implies that a holomorphic function can be recovered from the real part on the boundary of a disk and the imaginary part at a single point.

From @eq:schwarzintegralformulaimaginarypart, we can rewrite 
$ Im ((zeta+z)/(zeta-z))=Im (1+(2z)/(zeta-z))=Im (\frac{2z (overline(zeta)-overline(z))}{|zeta-z|^2})=(2 Im (z overline(zeta)))/(|zeta-z|^2). $

Let $Q(zeta,z)=(Im (z overline(zeta)))/(pi |zeta-z|^2)$, which is known as the _conjugate Poisson kernel_. Then @eq:schwarzintegralformulaimaginarypart yields yet another integral representation of harmonic functions:

$ v(z)=v(0)+integral_0^{2 pi}u(zeta)Q(zeta,z)dif tau, $

where $zeta=R ee^{ii tau}$. Two harmonic functions are said to be _conjugate_ if they are the real and imaginary parts of a holomorphic function. As seen above, on open disks, any harmonic function will admit a unique conjugate, (up to an additive constant $v(0)$). For a harmonic function $u$, we can construct its harmonic conjugate from @eq:harmonicconjugate.

The Poisson kernel is important in many branches of mathematics. We will introduce two of the important uses below.
// include solution_to_dirichlet_problem_on_disk/index.tex
// include in_harmonic_analysis/index.tex
