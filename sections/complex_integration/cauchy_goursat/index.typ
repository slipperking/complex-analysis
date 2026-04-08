#import "../../../lib.typ": *

== The Cauchy--Goursat Theorem
It is important to know the differential 2-forms even for a single variable complex function. Consider $z=x+ii y$ and $overline(z)=x-ii y$. We can then define their corresponding differentials:

$ ddz=ddx+ii ddy, dif overline(z)=ddx-ii ddy. $

The antisymmetric properties of differential forms still hold in complex space. By taking the wedge product of the two basis complex differential forms, we get

$
  dif overline(z) and ddz & =(ddx-ii ddy) and (ddx+ii ddy) \\ & =2 ii ddx and ddy.
$

Analogous to the real case, a 0-form is defined as a scalar-valued function in the form $f (z,overline(z))$, a 1-form in the form of $omega_0 ddz+omega_1 dif overline(z)$, and a 2-form as $omega_0 ddz and dif overline(z)$. The exterior differential operator for this one-dimensional case is defined as $partial+overline(partial)$, where $partial=ddz and dvp(, z)$ and $overline(partial)=dif overline(z) and pdv(, overline(z))$. Occasionally, one will informally use $partial$ and $overline(partial)$ as an abbreviation for $\pdv{z}$ and $\pdv{overline(z)}$ respectively.

#theorem(
  "Lusin Area Theorem",
)[For a region $U subset CC$ and $f:U -> CC$ univalent, the area of the image $f(U)$ is equal to
  $ integral_{U}|f'(z)|^2 dif A. $] <thm:lusinarea>

#proof[We aim to find
  $ integral_{f(U)}dif A. $

  By the properties above,

  $
    integral_{f(U)}dif u and dif v & =(ii)/(2)integral_{f(U)}dif w and dif overline(w)=(ii)/(2)integral_{U}dif f(z) and dif overline(f(z)) \\ & =(ii)/(2)integral_{U}{f'(z)ddz} and {overline(f'(z))dif overline(z)}=integral_U |f'(z)|^2 ddx and ddy,
  $

  as desired.]

#remark[The Jacobian determinant of $u,v$ with respect to $x,y$, for a holomorphic function $f(z)=u(x,y)+ii v(x,y)$ is equal to
  $
    mat(delim: "|", u'_x, u'_y; v'_x, v'_y)=pdv(u, x)pdv(v, y)-pdv(u, y)pdv(v, x)=(pdv(u, x))^2+(pdv(u, y))^2=|f'(z)|^2
  $
  by @eq:holomorphicderivativedecomposition.]

#theorem(
  "Green's Theorem, Complex Form",
)[Let $U subset CC$ be bounded with a piecewise smooth boundary $partial U$. For two scalar functions $omega_1=omega_1 (z,overline(z))$ and $omega_2=omega_2 (z,overline(z))$ satisfying $omega_1,omega_2 in C^1 (overline(U))$, define the 1-form $omega=omega_1 ddz+omega_2 dif overline(z)$. Then,

  $ integral_{partial U}omega=integral_U dif omega. $ <eq:complexgreen>] <thm:complexgreen>

#proof[For real-valued functions $xi_1,xi_2,eta_1,eta_2$, let
  $ omega_1=xi_1+ii eta_1 space.quad text("and let") space.quad omega_2=xi_2+ii eta_2. $

  Then,

  $
    omega & =(xi_1+ii eta_1)ddz+(xi_2+ii eta_2)dif overline(z) \\ & =(xi_1+ii eta_1)(ddx+ii ddy)+(xi_2+ii eta_2)(ddx-ii ddy) \\ & =xi_1 ddx+ii eta_1 ddx+ii xi_1 ddy-eta_1 ddy+xi_2 ddx+ii eta_2 ddx-ii xi_2 ddy+eta_2 ddy \\ & =[(xi_1+xi_2)ddx+(eta_2-eta_1)ddy]+ii [(eta_1+eta_2)ddx+(xi_1-xi_2)ddy]
  $ <eq:complexgreen_omegaexpansionintermediate>

  Each of $xi_1,xi_2,eta_1,eta_2$ are real-valued functions that can be represented with a domain of $RR^2$. We then will apply the $\dd=partial+overline(partial)$ definition of the exterior derivative and relate it to @eq:complexgreen. Starting with @eq:complexgreen_omegaexpansionintermediate,

  $
    dif omega & =(partial+overline(partial))(xi_1+ii eta_1)ddz+(partial+overline(partial))(xi_2+ii eta_2)dif overline(z) \\ & =(pdv(xi_1, overline(z))+ii pdv(eta_1, overline(z)))dif overline(z) and ddz+(pdv(xi_2, z)+ii pdv(eta_2, z))ddz and dif overline(z) \\ & =2 (ii pdv(xi_1, overline(z))-pdv(eta_1, overline(z))-ii pdv(xi_2, z)+pdv(eta_2, z))ddx and ddy \\ & =(ii pdv(xi_1, x)-pdv(xi_1, y)-pdv(eta_1, x)-ii pdv(eta_1, y)-ii pdv(xi_2, x)-pdv(xi_2, y)+pdv(eta_2, x)-ii pdv(eta_2, y))ddx and ddy \\ & =(pdv(eta_2, x)-pdv(xi_1, y)-pdv(eta_1, x)-pdv(xi_2, y))dif A+ii (pdv(xi_1, x)-pdv(eta_1, y)-pdv(xi_2, x)-pdv(eta_2, y))dif A.
  $ <eq:complexgreen_exteriorderivativeresult>

  From @eq:complexgreen_realandcomplexdxdyintermediate, we can apply @thm:realgreen. For the real component of $omega$, we obtain

  $
    integral_{partial U}(xi_1+xi_2)ddx+(eta_2-eta_1)ddy=integral.double_U (pdv(eta_2, x)-pdv(xi_1, y)-pdv(eta_1, x)-pdv(xi_2, y))ddx ddy,
  $

  and for the imaginary component,

  $
    integral_{partial U}(eta_1+eta_2)ddx+(xi_1-xi_2)ddy=integral.double_U (pdv(xi_1, x)-pdv(eta_1, y)-pdv(xi_2, x)-pdv(eta_2, y))ddx ddy,
  $

  and the integrands on the right side both match those of @eq:complexgreen_exteriorderivativeresult.]

The theorem above is only a specific case of the Stokes-Cartan Theorem (@thm:stokescartan). However, it proves the validity of the treatment of the $partial$ and $overline(partial)$ operators, and the generalization to forms with basis $ddz$ and $dif overline(z)$.

#theorem(
  "#smallcaps[Cauchy--Pompeiu]",
)[Let $U subset CC$ be bounded with a piecewise $C^1$ boundary $partial U$. Let $f(z)in C^1 (overline(U))$. Then $forall z in U without partial U$,

  $
    f(z)=(1)/(2 pi ii)(integral_{partial U}(f(zeta))/(zeta-z)ddzeta-integral_{U}pdv(f(zeta), overline(zeta))(dif overline(zeta) and ddzeta)/(zeta-z)).
  $] <thm:pompeiu>

#proof[Since $z in U without partial U$, $exists epsilon.alt>0$ such that $D(z,epsilon.alt)subset U$. Consider the complex differential form
  $ (f(zeta)ddzeta)/(zeta-z) $

  with a singularity at $zeta=z$. Consider the region $U without D(z,epsilon.alt)$. Since $f in C^1 (overline(U))$, by applying Green's Theorem (@thm:complexgreen),

  $
    integral_{U without D(z,epsilon.alt)}\dd((f(zeta)ddzeta)/(zeta-z))=integral_{partial U}(f(zeta)ddzeta)/(zeta-z)-integral_{partial D(z,epsilon.alt)}(f(zeta)ddzeta)/(zeta-z).
  $ <eq:pompeiu_directintermediate>

  By properties of $\dd$, the expression is equal to

  $
    integral_{U without D(z,epsilon.alt)}(partial+overline(partial))((f(zeta))/(zeta-z)) and ddzeta & =integral_{U without D(z,epsilon.alt)}pdv(, zeta)((f(zeta))/(zeta-z))ddzeta and ddzeta \\
    & +\pdv{overline(zeta)}((f(zeta))/(zeta-z))dif overline(zeta) and ddzeta.
  $

  The first term in the integrand vanishes as it contains $ddzeta and ddzeta$. The second term can be simplified using the fact that $\pdv{overline(zeta)}((1)/(zeta-z))=0$, leading to

  $ integral_{U without D(z,epsilon.alt)}pdv(f, overline(zeta))dot.c (dif overline(zeta) and ddzeta)(zeta-z). $

  The rightmost term in @eq:pompeiu_directintermediate can be parameterized with $zeta=z+epsilon.alt ee^{ii t}$, $t in[0,2 pi]$. Then,

  $
    integral_{partial D(z,epsilon.alt)}(f(zeta)ddzeta)/(zeta-z)=integral_0^{2 pi}(f (z+epsilon.alt ee^{ii t}))/(epsilon.alt ee^{ii t})dot.c ii epsilon.alt ee^{ii t}dif t=ii integral_0^{2 pi}f(z+epsilon.alt ee^{ii t})dif t\\ =ii integral_0^{2 pi}(f (z+epsilon.alt ee^{ii t})-f(z))dif t+ii integral_0^{2 pi}f(z)dif t.
  $

  Because $f in C^1 (overline(U))$, by @prop:c1lipschitz, $f$ is Lipschitz continuous on $overline(U)$, and $exists M in RR_{>0}$ such that $forall z_0,z_1 in overline(U)$, $|f (z_1)-f (z_0)|lt.eq M |z_1-z_0|$. On $partial D(z,epsilon.alt)$, we get that $|f(z+epsilon.alt ee^{ii t})-f(z)|lt.eq M epsilon.alt$. Therefore,
  $
    |integral_0^{2 pi}(f(z+epsilon.alt ee^{ii t})-f(z))dif t|lt.eq integral_0^{2 pi}|f (z+epsilon.alt ee^{ii t})-f(z)|dif t <= 2M pi epsilon.alt,
  $
  which approaches 0 as $epsilon.alt ->0$. Taking this limit, we obtain

  $
    2 pi ii f(z)=integral_{partial U}(f(zeta)ddzeta)/(zeta-z)-integral_{U}pdv(f, overline(zeta))dot.c (dif overline(zeta) and ddzeta)/(zeta-z)+\lim_{epsilon.alt ->0}integral_{D(z,epsilon.alt)}pdv(f, overline(zeta))dot.c (dif overline(zeta) and ddzeta)/(zeta-z).
  $ <eq:pompeiu_epsilonlimitintermediate>

  We then aim to prove that

  $
    \lim_{epsilon.alt ->0}integral_{D(z,epsilon.alt)}pdv(f, overline(zeta))dot.c (dif overline(zeta) and ddzeta)/(zeta-z)=0.
  $ <eq:pompeiu_areadiskstatement>

  Notice that since $f in C^1 (overline(U))$, by @thm:continuousfunctionboundedoncompact, $exists M'in RR_{>0}$ such that $forall zeta in overline(U)$, $|pdv(f, overline(zeta))|lt.eq M'$. Then,

  $
    \lim_{epsilon.alt ->0}abs(integral_{D(z,epsilon.alt)}pdv(f, overline(zeta))dot.c (dif overline(zeta) and ddzeta)/(zeta-z))lt.eq M'\lim_{epsilon.alt ->0}|integral_{D(z,epsilon.alt)}(1)/(zeta-z)dif overline(zeta) and ddzeta|.
  $

  By a change of variables to a polar coordinate system centered at $z$, we obtain

  $
    M'\lim_{epsilon.alt ->0}abs{integral_{D(z,epsilon.alt)}(1)/(r ee^{ii theta})\dd{(z+r ee^{-ii theta})} and \dd{(z+r ee^{ii theta})}},
  $
  and by expansion of the wedge product,

  $
    M'\lim_{epsilon.alt ->0}|integral_{D(z,epsilon.alt)}(2 ii)/(ee^{ii theta})dif r and dif theta| & =2M'\lim_{epsilon.alt ->0}|integral_{D(z,epsilon.alt)}(1)/(ee^{ii theta})dif r and dif theta| \\ & =2M'\lim_{epsilon.alt ->0}|integral_0^{2 pi}integral_0^epsilon.alt ee^{-ii theta}dif r dif theta| \\ & =0.
  $ <eq:pompeiu_weaksingularityvanishes>

  Then from rearranging @eq:pompeiu_epsilonlimitintermediate, we obtain:

  $
    f(z)=(1)/(2 pi ii)(integral_{partial U}(f(zeta)ddzeta)/(zeta-z)-integral_{U}pdv(f, overline(zeta))dot.c (dif overline(zeta) and ddzeta)/(zeta-z)).
  $]

#corollary[Let $f:CC-> CC$ be a continuously differentiable, compactly supported function.
  Then
  $ f(z)=-(1)/(pi)integral.double_{CC}pdv(f, overline(zeta))(dif xi dif eta)/(zeta-z) $
  for all $z in CC$ where $zeta=xi+ii eta$.] <cor:pompeiuwithoutcauchyterm>

#proof[Choose $R>0$ such that $D(0,R)supset op("supp")(f)$. By the Cauchy--Pompeiu Theorem (@thm:pompeiu), we have
  $
    f(z)=1/pi (1/(2 ii)integral_{partial D(0,R)}(f(zeta)ddzeta)/(zeta-z)-integral.double_{D(0,R)}pdv(f, overline(zeta))(dif xi dif eta)/(zeta-z)).
  $

  Then the proof is complete given that $f$ vanishes on $partial D(0,R)$ and by letting $R -> infinity$.]

In complex analysis, when integrating over a region that contains a singularity, it is common to exclude a small disk of radius $epsilon.alt$ around the singularity, perform the integration over the punctured region, and then take the limit as $epsilon.alt ->0$. As in the proof above, the steps calculating the integral over the removed disk as in @eq:pompeiu_areadiskstatement are still necessary in confirmation, although they are typically tacitly elided.

From the above result, we can directly obtain the following theorem:

#theorem(
  "Cauchy's Integral Formula",
)[Let $U subset CC$ be an open region with a piecewise $C^1$ boundary $partial U$, and let $f in C^1 (overline(U))$ be holomorphic on $U$. Then for all $z in U$,

  $
    f(z)=(1)/(2 pi ii)integral.cont_{partial U}(f(zeta))/(zeta-z)dif zeta.
  $ <eq:cauchyintegralformula>] <thm:cauchyintegralformula>

#proof[By @eq:wirtingerderivative2, for $f (zeta,overline(zeta))$, $pdv(f, overline(zeta))=0$. Applying the Cauchy--Pompeiu Theorem (@thm:pompeiu), the area integral vanishes, and @eq:cauchyintegralformula consequently follows.]

#theorem(
  "Cauchy's Integral Theorem",
)[Let $U subset CC$ be an open region with piecewise $C^1$ boundary $partial U$. For a function $f(z)in C^1 (overline(U))$ holomorphic over $U$,
  $ integral.cont_{partial U}f(zeta)ddzeta=0. $] <thm:cauchyintegraltheorem>

#proof[Let $psi(z)=z f(z)$. Applying @thm:cauchyintegralformula on $psi(zeta)$ with $z=0$, we obtain
  $
    0=(1)/(2 pi ii)integral.cont_{partial U}(psi(zeta))/(zeta)ddzeta=(1)/(2 pi ii)integral.cont_{partial U} f (zeta)ddzeta.
  $

  Alternatively, we can use Green's Theorem (@thm:complexgreen) with $omega=f(zeta)ddzeta$:

  $
    integral.cont_{partial U}f(zeta)ddzeta=integral.cont_{partial U}omega=integral_{U}dif omega=integral_U pdv(f, overline(zeta))dif overline(zeta) and ddzeta=0.
  $]

#theorem[For a compactly supported function $psi(z)in C^1 (CC)$, a solution satisfying $u(z)in C^1 (CC)$ to the non-homogeneous Cauchy--Riemann equation
  $ pdv(u(z), overline(z))=psi(z) $
  is

  $
    u(z)=-(1)/(2 pi ii)integral_{CC}(psi(zeta))/(zeta-z)dif overline(zeta) and ddzeta.
  $ <eq:onedimensionalpartialconjugatesolution>] <thm:onedimensionalpartialconjugatesolution>

#proof[Split $CC$ into $CC without D (z,epsilon.alt)$ and $overline(D (z,epsilon.alt))$.\ $forall epsilon.alt>0$, the integral
  $ -(1)/(2 pi ii)integral_{CC without D (z,epsilon.alt)}(psi(zeta))/(zeta-z)dif overline(zeta) and ddzeta $
  is continuous. Since $psi(zeta)$ is compactly supported over $CC$ and continuous, by @thm:continuousfunctionboundedoncompact, it is bounded. Then the limit
  $
    lim_{epsilon.alt ->0}(-(1)/(2 pi ii)integral_{D (z,epsilon.alt)}(psi(zeta))/(zeta-z)dif overline(zeta) and ddzeta)=0.
  $

  Therefore, @eq:onedimensionalpartialconjugatesolution is continuous. A trivial substitution can be used to rewrite
  $ u(z)=(1)/(2 pi ii)integral_{CC}(psi(zeta+z))/(zeta)dif zeta and dif overline(zeta) $
  Then,

  $
    (u(z+Delta z)-u (z))/(Delta z)=(1)/(2 pi ii)integral_{CC}(psi(zeta+z+Delta z)-psi (zeta+z))/(Delta z zeta)dif zeta and dif overline(zeta).
  $ <eq:onedimensionalpartialconjugatesolution_differenceexpr>

  For a fixed $z$, the value of
  $ (psi(zeta+z+Delta z)-psi (zeta+z))/(Delta z) $
  tends to $\pdv*{psi (zeta+z)}{zeta}$ as $Delta z ->0$. Because $psi(zeta)=psi (zeta+z)$ has compact support and is $C^1$, by @prop:c1lipschitz, it is Lipschitz continuous for a constant $M$. Let $|Delta z|<1$ and let $K={w in CC | inf_{zeta in op("supp") phi.alt}|w-zeta|lt.eq 1}$. Then,
  $ |(psi(zeta+z+Delta z)-psi (zeta+z))/(Delta z)|lt.eq M, $
  and specifically, when $zeta+z in.not K$,
  $ (psi(zeta+z+Delta z)-psi (zeta+z))/(Delta z)=0. $

  As shown above, the integrand is uniformly bounded by $M$, which has a convergent integral of $integral_{K}M dif zeta and dif overline(zeta)$, the limit $Delta z ->0$ may commute with the integral in @eq:onedimensionalpartialconjugatesolution_differenceexpr. Let $zeta=xi+ii eta$. From the real axis,

  $
    pdv(u, x)(z)=(1)/(2 pi ii)integral_{CC}(1)/(zeta)pdv(psi, xi)(zeta+z)dif zeta and dif overline(zeta)=(1)/(2 pi ii)integral_{CC}pdv(psi(zeta), xi)dot.c (1)/(zeta-z)ddzeta and dif overline(zeta).
  $ <eq:onedimensionalpartialconjugatesolution_differenceexpr_realaxisderivative>

  From the imaginary axis,

  $
    pdv(u, y)(z)=(1)/(2 pi ii)integral_{CC}(1)/(zeta)pdv(psi, eta)(zeta+z)dif zeta and dif overline(zeta)=(1)/(2 pi ii)integral_{CC}pdv(psi(zeta), eta)dot.c (1)/(zeta-z)ddzeta and dif overline(zeta).
  $ <eq:onedimensionalpartialconjugatesolution_differenceexpr_imaginaryaxisderivative>

  Since $psi in C^1 (CC)$ and has Lipschitz constant $M$, @eq:onedimensionalpartialconjugatesolution_differenceexpr_realaxisderivative, @eq:onedimensionalpartialconjugatesolution_differenceexpr_imaginaryaxisderivative are both continuous (by the same argument for the continuity of $u(z)$). Thus, $u in C^1(CC)$. It follows from the two equations that
  $
    pdv(u, overline(z))=(1)/(2 pi ii)integral_{CC}pdv(psi, overline(zeta))dot.c (1)/(zeta-z)ddzeta and dif overline(zeta)=(1)/(2 pi ii)integral_{K}pdv(psi, overline(zeta))dot.c (1)/(zeta-z)ddzeta and dif overline(zeta).
  $

  By @cor:pompeiuwithoutcauchyterm,
  $ pdv(u, overline(z))=psi(z). $]

#remark[In the first part, we established that a function $psi(z)in C^0(CC)$ with compact support satisfies
  $ u(z)=-(1)/(2 pi ii)integral_{CC}(psi(zeta))/(zeta-z)dif overline(zeta) and ddzeta in C^0(CC). $

  If $psi(z)in C^1(CC)$, then the first order derivatives of $u(z)$ can be written in the same form (@eq:onedimensionalpartialconjugatesolution_differenceexpr_realaxisderivative, @eq:onedimensionalpartialconjugatesolution_differenceexpr_imaginaryaxisderivative) since $pdv(psi, xi),pdv(psi, eta)in C^0(CC)$ and are also compactly supported. Then they too are continuous functions, and $u(z)in C^1(CC)$.

  Then using the same argument, In general, for $psi(z)in C^k(CC)$, the same process can be used recursively to find that $u(z)in C^k(CC)$ as well.

  If the support of $psi(z)$ is the union of infinitely many or finitely many disjoint compact sets, then the integral in @eq:onedimensionalpartialconjugatesolution can be split into a sum of integrals over each compact set, and the same argument applies to each term.]

When Cauchy formalized @thm:cauchyintegralformula, @thm:cauchyintegraltheorem, he included the necessary condition that $f(z)in C^1 (overline(U))$. It was later shown that all such holomorphic functions had holomorphic derivatives, and this condition was thus later dropped by Goursat:

#lemma[Let $f:G -> CC$ be a continuous function defined for a region $G subset.eq CC$. Let $Gamma subset G$ be a rectifiable piecewise smooth curve. Then $forall epsilon.alt>0$, there exists a polygonal chain $P subset G$ inscribing $Gamma$ (each vertex lies on $Gamma$) where
  $ |integral_{Gamma}f(z)ddz-integral_{P}f(z)ddz|<epsilon.alt. $] <lem:integralpiecewisesmoothtopolygonalchain>

#proof[Because $f in C^0(G)$, there is a compact set $D subset.eq G$ enclosing $Gamma$ and is the closure of some open set. By @thm:heinecantor, $forall epsilon.alt>0$, $exists delta>0$ such that $forall z',z''in D$ satisfying $|z''-z'|<delta$, $|f (z'')-f (z')|<epsilon.alt$. Partition $Gamma$ into $n in NN$ curves $gamma_0,gamma_1,dots,gamma_{n-1}$ between points $z_0,z_1,dots z_n$ such that $forall k in {0,1,dots,n-1}$ the length of $gamma_k$ is less than $delta$.\ $forall k in {0,1,dots,n-1}$, let $l_k$ denote the straight line segment connecting $z_k$ and $z_{k+1}$. The length of $l_k$ is less than $delta$ as well. Then let
  $ P=union_{k=0}^{n-1}l_k. $
  Over the partition formed with $gamma_k$, the integral

  $ integral_{Gamma}f(z)ddz $
  can be approximated with the Riemann sum
  $ S=sum_{k=0}^{n-1}f (z_k)Delta z_k $
  where
  $ Delta z_k=z_{k+1}-z_k=integral_{gamma_k}ddz=integral_{l_k}ddz. $

  Then the sum above can be written as
  $ S=sum_{k=0}^{n-1}integral_{gamma_k}f (z_k)ddz=sum_{k=0}^{n-1}integral_{l_k}f (z_k)ddz, $
  and it follows that
  $
    |integral_{Gamma}f(z)ddz-S|=abs(sum_{k=0}^{n-1}integral_{gamma_k}[f(z)-f (z_k)]ddz)<epsilon.alt dot.c op("length")(Gamma)
  $
  and
  $
    |integral_{P}f(z)ddz-S|=abs(sum_{k=0}^{n-1}integral_{l_k}[f(z)-f (z_k)]ddz)<epsilon.alt dot.c upright("length")(P)<epsilon.alt dot.c upright("length")(Gamma)
  $
  where $upright("length")(Gamma)$ is the length of $Gamma$ and $upright("length")(P)$ is the length of $P$. Then,
  $
    |integral_{Gamma}f(z)ddz-integral_{P}f(z)ddz|lt.eq |integral_{Gamma}f(z)ddz-S|+|integral_{P}f(z)ddz-S|lt.eq 2 epsilon.alt dot.c upright("length")(Gamma).
  $]

#lemma(
  "#smallcaps[Goursat]",
)[Given a holomorphic function $f(z)$ on a simply connected region $U subset.eq CC$, for any piecewise $C^1$ closed curve $Gamma subset U$,

  $
    integral_Gamma f(zeta)ddzeta=0.
  $ <eq:cauchyintegraltheoremoversimplyconnectedset_statement>] <lem:cauchyintegraltheoremoversimplyconnectedset>

#proof[By @lem:integralpiecewisesmoothtopolygonalchain, $forall epsilon.alt>0$, there is a polygonal chain $P$ where

  $
    |integral_{Gamma}f(z)ddz-integral_{P}f(z)ddz|<epsilon.alt.
  $ <eq:cauchyintegraltheoremoversimplyconnectedset_chaindefinition>
  The statement we aim to prove is equivalent to proving that

  $ integral_{P}f(z)ddz=0. $ <eq:cauchyintegraltheoremoversimplyconnectedset_chainvanishingstatement>
  #let halflength-arrow(start, end, stroke: 2pt) = {
    let pstart = (
      start.x + 0.25 * (end.x - start.x),
      start.y + 0.25 * (end.y - start.y),
    )
    let pend = (
      start.x + 0.75 * (end.x - start.x),
      start.y + 0.75 * (end.y - start.y),
    )

    draw(
      pstart,
      pend,
      stroke: stroke,
      arrow-end: "stealth",
    )
  }

  #figure(
    columns: 2,
    [
      #canvas({
        let A = (0, 1.702125)
        let B = (2.122875, 0)
        let C = (3.4, 1.275)
        let D = (2.976125, 3.4)
        let E = (1.275, 3.4)

        draw(A, B, C, D, E, A, stroke: 2pt)
        draw(B, E, stroke: 2pt)
        draw(C, E, stroke: 2pt)

        // Arrows
        halflength-arrow(B, E)
        halflength-arrow(E, B)
        halflength-arrow(E, A)
        halflength-arrow(B, C)
        halflength-arrow(A, B)
        halflength-arrow(C, E)
        halflength-arrow(E, C)
        halflength-arrow(D, E)
        halflength-arrow(C, D)

        text("A", at: A, anchor: "e")
        text("B", at: B, anchor: "n")
        text("C", at: C, anchor: "w")
        text("D", at: D, anchor: "s")
        text("E", at: E, anchor: "s")
      })
      #caption("Closed triangulated polygonal chain")
    ],

    // ================= RIGHT FIGURE =================
    [
      #canvas({
        let A = (0, 0)
        let D = (4.14375, 1.59375)
        let F = (1.59375, 1.59375)
        let C = (5.1, 0)
        let B = (3.1875, 3.1875)
        let E = (2.55, 0)

        draw(A, F, E, A, stroke: 2pt)
        draw(B, D, F, B, stroke: 2pt)
        draw(C, D, E, C, stroke: 2pt)

        // Arrows
        halflength-arrow(F, A)
        halflength-arrow(B, F)
        halflength-arrow(D, E)
        halflength-arrow(E, D)
        halflength-arrow(E, F)
        halflength-arrow(D, B)
        halflength-arrow(C, D)
        halflength-arrow(F, E)
        halflength-arrow(A, E)
        halflength-arrow(E, C)
        halflength-arrow(F, D)
        halflength-arrow(D, F)

        // midpoints
        let AE = ((A.x + E.x) / 2, (A.y + E.y) / 2)
        let AF = ((A.x + F.x) / 2, (A.y + F.y) / 2)
        let FD = ((F.x + D.x) / 2, (F.y + D.y) / 2)
        let BF = ((B.x + F.x) / 2, (B.y + F.y) / 2)
        let EC = ((E.x + C.x) / 2, (E.y + C.y) / 2)
      })
      #caption("Quadrisection of $\\int \\Delta$")
      <fig:cauchyintegraltheoremoversimplyconnectedset_trianglequadrisection>
    ],
  )
  Since $P$ is a closed polygonal chain, we can triangulate the interior. For example, consider @fig:cauchyintegraltheoremoversimplyconnectedset_closedpolygonalchaintriangulation. Then,

  $
    integral_{A B C D E}f(z)ddz & =(integral_{\overrightarrow{AB}}+integral_{\overrightarrow{BC}}+integral_{\overrightarrow{CD}}+integral_{\overrightarrow{DE}}+integral_{\overrightarrow{EA}})f(z)ddz \\ & +(integral_{\overrightarrow{BE}}+integral_{\overrightarrow{EB}}+integral_{\overrightarrow{CE}}+integral_{\overrightarrow{EC}})f(z)ddz \\ & =integral_{Delta{ABE}}f(z)ddz+integral_{Delta{BCE}}f(z)ddz+integral_{Delta{CDE}}f(z)ddz.
  $
  Thus, if the integral over every triangle in $U$ vanishes, then @eq:cauchyintegraltheoremoversimplyconnectedset_statement follows. Consider a triangle in $U$ with boundary $Delta$. Then define $M$ to be
  $ M=|integral_{Delta}f(z)ddz|. $

  We can quadrisect the triangle bounded by $Delta$ into four triangles with boundaries $Delta_1,Delta_2,Delta_3,Delta_4$ as in @fig:cauchyintegraltheoremoversimplyconnectedset_trianglequadrisection. Then one of $Delta_1$, $Delta_2$, $Delta_3$, or $Delta_4$ (denote this to be $Delta^1$) satisfy

  $ |integral_{Delta^1}f(z)ddz|gt.eq (M)/(4), $

  and recursively, choose

  $
    |integral_{Delta^2}f(z)ddz|gt.eq (M)/(4^2),dots,|integral_{Delta^n}f(z)ddz|gt.eq (M)/(4^n).
  $ <eq:cauchyintegraltheoremoversimplyconnectedset_trianglelowerbound>

  Let $L$ denote the perimeter of $Delta$. Then, the perimeters of $Delta^1,Delta^2,dots$ respectively are $(L)/(2),(L)/(2^2),dots$. As $n -> infinity$, $Delta_n$ shrinks to a single point $z_0$. Then, $forall n in NN$, $z_0 in Delta^n$.

  By the definition of holomorphy, $forall epsilon.alt>0$, $exists delta>0$ such that $forall z in D (z_0,delta)$,
  $ |(f (z)-f (z_0))/(z-z_0)-f'(z_0)|<epsilon.alt, $

  $ |f (z)-f (z_0)-f'(z_0)(z-z_0)|<epsilon.alt |z-z_0|, $
  and $exists N in NN$ such that $forall n in NN_{>N}$, $Delta^n subset D (z_0,delta)$. By @thm:cauchyintegraltheorem, since the functions $z |-> 1$ and $z |-> z$ are both entire,
  $ integral_{Delta^n}ddz=0, integral_{Delta^n}z ddz=0. $
  Then

  $
    integral_{Delta^n}f(z)ddz & =integral_{Delta^n}f(z)ddz-f (z_0)integral_{Delta^n}ddz-f'(z_0)(integral_{Delta^n}z ddz-z_0 integral_{Delta^n}ddz) \\ & =integral_{Delta^n}\brackets{f(z)-f (z_0)-f'(z_0)(z-z_0)}ddz.
  $

  Because the distance between any two points in the interior of a triangle is always less than its perimeter, using the triangle inequality for complex integrals,
  $
    integral_{Delta^n}|f(z)||ddz|lt.eq epsilon.alt integral_{Delta^n}|z-z_0||ddz|=(epsilon.alt L)/(2^n)integral_{Delta^n}|ddz|=(epsilon.alt L^2)/(4^n).
  $

  Comparing the above equation with @eq:cauchyintegraltheoremoversimplyconnectedset_trianglelowerbound,
  $ (M)/(4^n)<(epsilon.alt L)/(4^n), M<epsilon.alt L. $
  Since $Delta$ is rectifiable, $L$ is finite, and letting $epsilon.alt ->0$, we find that $M ->0$. Then, for every triangle in $U$, the integral vanishes, and @eq:cauchyintegraltheoremoversimplyconnectedset_chainvanishingstatement, @eq:cauchyintegraltheoremoversimplyconnectedset_chaindefinition follow.] <fig:cauchyintegraltheoremoversimplyconnectedset_closedpolygonalchaintriangulation>

#theorem(
  "#smallcaps[Cauchy--Goursat]",
)[Let $U subset CC$ be an open region bounded with boundary $partial U$. Let $f:U -> CC$ be a holomorphic function continuous on $overline(U)$. Then,
  $ integral.cont_{partial U}f(zeta)ddzeta=0. $] <thm:cauchygoursattheorem>

#proof[Since $partial U sect U=emptyset$ and $f(z)$ is not necessarily holomorphic over $overline(U)$, we cannot directly apply @lem:cauchyintegraltheoremoversimplyconnectedset.
  \begin{figure}
  \centering
  \begin{tikzpicture}[>=stealth,
  arrow style/.style={
  postaction={decorate},
  decoration={markings, mark=at position 0.5 with {\arrow[scale=1]{Stealth}}}
  }]
  \pgfmathsetmacro{\lengtheta}{18pt}
  \pgfmathsetmacro{\lengthepsilon}{20pt}
  \coordinate (M) at (1, 1.5);
  \coordinate (P) at (1, 4.2);
  \coordinate (Q) at (5, 4.4);
  \coordinate (N) at (5, 1.7);
  \coordinate (Mprime) at ([yshift=\lengtheta] M);
  \coordinate (Pprime) at ([yshift=-\lengtheta] P);
  \coordinate (Qprime) at ([yshift=-\lengtheta] Q);
  \coordinate (Nprime) at ([yshift=\lengtheta] N);
  \draw[-{Stealth}, thick] (-0.5, 0) -- (6, 0);
  \draw[-{Stealth}, thick] (0, -0.5) -- (0, 6);
  \draw[thick, arrow style] (P) -- (M);
  \draw[thick, arrow style, name path=curveQP] (Q) to[out angle=90, in angle=90, curve through = {([shift={(2, 0)}] P) ([shift={(1.5, 0.2)}] P)}] (P);
  \draw[thick, arrow style] (N) -- (Q);
  \draw[thick, arrow style, name path=curveMN] (M) to[out angle=270, in angle=270, curve through = {([shift={(-2, 0)}] N) ([shift={(-1.5, -0.2)}] N)}] (N);
  \path let \p1 = (P) in coordinate (P1x) at ({\x1 + \lengthepsilon}, 0);
  \path let \p1 = (Q) in coordinate (Q1x) at ({\x1 - \lengthepsilon}, 0);
  \path[name path=verticalleftmarker](P1x) -- (P1x |- 0, 6);
  \path[name path=verticalrightmarker](Q1x) -- (Q1x |- 0, 6);
  \path[name intersections={of=curveQP and verticalleftmarker, by=P1}];
  \path[name intersections={of=curveMN and verticalleftmarker, by=M1}];
  \draw[thin] (M1) -- (P1);
  \path[name intersections={of=curveQP and verticalrightmarker, by=Q1}];
  \path[name intersections={of=curveMN and verticalrightmarker, by=N1}];
  \draw[thin] (N1) -- (Q1);
  \draw[thin] (Mprime) to[out angle=270, in angle=270, curve through = {([shift={(-2, 0)}] Nprime) ([shift={(-1.5, -0.2)}] Nprime)}] (Nprime);
  \draw[thin] (Qprime) to[out angle=90, in angle=90, curve through = {([shift={(2, 0)}] Pprime) ([shift={(1.5, 0.2)}] Pprime)}] (Pprime);
  \draw[dashed] (M) -- (M |- 0, 0);
  \draw[dashed] (N) -- (N |- 0, 0);
  \draw[dashed] (M1) -- (P1x);
  \draw[dashed] (N1) -- (Q1x);
  \node[anchor=north east] at (M) {$M$};
  \node[anchor=south east] at (P) {$P$};
  \node[anchor=south west] at (Q) {$Q$};
  \node[anchor=north west] at (N) {$N$};
  \node[anchor=north east] at (Mprime) {$M'$};
  \node[anchor=south east] at (Pprime) {$P'$};
  \node[anchor=south west] at (Qprime) {$Q'$};
  \node[anchor=north west] at (Nprime) {$N'$};
  \node[anchor=north west] at (M1) {$M_1$};
  \node[anchor=south] at (P1) {$P_1$};
  \node[anchor=south] at (Q1) {$Q_1$};
  \node[anchor=north east] at (N1) {$N_1$};
  \node[anchor=south west] at ([yshift=\lengtheta+7pt] M1) {$M'_1$};
  \node[anchor=north west] at ([yshift=-\lengtheta-3pt] P1) {$P'_1$};
  \node[anchor=north east] at ([yshift=-\lengtheta-7pt] Q1) {$Q'_1$};
  \node[anchor=south east] at ([yshift=\lengtheta+3pt] N1) {$N'_1$};
  \node[anchor=north] at (M |- 0, 0) {$a$};
  \node[anchor=north] at (N |- 0, 0) {$b$};
  \node[anchor=north] at (P1x |- 0, 0) {$a+epsilon.alt$};
  \node[anchor=north] at (Q1x |- 0, 0) {$b-epsilon.alt$};
  \node[anchor=north, xshift=-2pt] at (6, 0) {$x$};
  \node[anchor=east, yshift=-2pt] at (0, 6) {$y$};
  \end{tikzpicture}
  \caption{A simplified region containing two vertical lines and two continuous, rectifiable curves.}

  \end{figure}

  First assume $U$ has the shape of $MNQP$ in @fig:cauchygoursattheorem_simplifiedregion. That is, $U$ consists of $x=a$, $x=b$ for $a<b$, and two rectifiable $C^0$ curves $\overrightarrow{MN}:y=phi.alt(x)$ and $\overrightarrow{QP}:psi(x)$ such that $phi.alt(x)<psi(x)$, $forall a lt.eq x lt.eq b$.

  For some $epsilon.alt>0$, $eta>0$, construct a new curve $M_1'N_1'Q_1'P_1'in U$ to be the boundary of the region bounded by $P_1M_1:x=a+epsilon.alt$, $N_1Q_1:b-epsilon.alt$, $M'N':phi.alt(x)+eta$, and $Q'P':psi(x)-eta$ such that $M_1'N_1'Q_1'P_1'$ remains simple. By @lem:cauchyintegraltheoremoversimplyconnectedset,
  $ integral.cont_{M_1'N_1'Q_1'P_1'}f(z)ddz=0. $

  By @thm:heinecantor, $f(z)$ is uniformly continuous over $overline(U)$, and therefore $forall epsilon.alt'>0$, we can choose $eta>0$ so that $forall z in \overrightarrow{M_1'N_1'}$, $|f (z)-f (z-eta)|<epsilon.alt'$ is satisfied. Letting $eta ->0$ (with $epsilon.alt'->0$) and fixing $epsilon.alt>0$, we get that

  $
    \abs{integral_{\overrightarrow{M_1'N_1'}}f(z)ddz-integral_{\overrightarrow{M_1N_1}}f(z)ddz} & lt.eq integral_{\overrightarrow{M_1'N_1'}}|f(z)-f (z-eta)||ddz| \\ & <epsilon.alt'integral_{\overrightarrow{M_1'N_1'}}|dz|->0,
  $

  and consequently,

  $
    integral_{\overrightarrow{M_1'N_1'}}f(z)ddz -> integral_{\overrightarrow{M_1N_1}}f(z)ddz.
  $ <eq:cauchygoursattheorem_innerinnerhorizontaltoouterinnerhorizontal1>

  Under the same limit, we get

  $
    integral_{\overrightarrow{Q_1'P_1'}}f(z)ddz -> integral_{\overrightarrow{Q_1P_1}}f(z)ddz.
  $ <eq:cauchygoursattheorem_innerinnerhorizontaltoouterinnerhorizontal2>
  By the continuity of $f(z)$ over a compact set,

  $
    integral_{\overrightarrow{P_1'M_1'}}f(z)ddz -> integral_{\overrightarrow{P_1M_1}}f(z)ddz, integral_{\overrightarrow{N_1'Q_1'}}f(z)ddz -> integral_{\overrightarrow{N_1Q_1}}f(z)ddz.
  $ <eq:cauchygoursattheorem_innerinnerverticaltoouterinnervertical>

  Then letting $epsilon.alt ->0$, for the same reason as @eq:cauchygoursattheorem_innerinnerverticaltoouterinnervertical, @eq:cauchygoursattheorem_innerinnerhorizontaltoouterinnerhorizontal1, @eq:cauchygoursattheorem_innerinnerhorizontaltoouterinnerhorizontal2 yield
  $
    integral_{\overrightarrow{M_1N_1}}f(z)ddz -> integral_{\overrightarrow{MN}}f(z)ddz, integral_{\overrightarrow{Q_1P_1}}f(z)ddz -> integral_{\overrightarrow{QP}}f(z)ddz.
  $

  We are left to show the subsequent limits of the results from @eq:cauchygoursattheorem_innerinnerverticaltoouterinnervertical. For the left integral, let $y_{phi.alt}=max \cbraces{phi.alt(a),phi.alt (a+epsilon.alt)}$ and $y_{psi}=max \cbraces{psi(a),psi (a+epsilon.alt)}$.

  Then,
  $
    integral_{\overrightarrow{PM}}f(z)ddz=ii integral_{psi(a)}^{phi.alt(a)}f (a+ii y)ddy=ii (integral_{psi(a)}^{y_phi.alt}+integral_{y_phi.alt}^{y_psi}+integral_{y_psi}^{phi.alt(a)})f(a+ii y)ddy.
  $

  Similarly,
  $
    integral_{\overrightarrow{P_1M_1}}f(z)ddz=ii (integral_{psi(a+epsilon.alt)}^{y_phi.alt}+integral_{y_phi.alt}^{y_psi}+integral_{y_psi}^{phi.alt(a+epsilon.alt)})f(a+epsilon.alt+ii y)ddy.
  $

  The difference $\paren{integral_{\overrightarrow{PM}}-integral_{\overrightarrow{P_1M_1}}}f(z)ddz$ between the two is then equal to

  $
    ii integral_{y_{phi.alt}}^{y_{psi}}(f \paren{a+ii y}-f \paren{a+epsilon.alt+ii y})ddz\\ {}+{ii (integral_{psi(a)}^{y_phi.alt}+integral_{y_psi}^{phi.alt(a)})f(a+ii y)-ii \paren{integral_{psi(a+epsilon.alt)}^{y_phi.alt}z+integral_{y_psi}^{phi.alt (a+epsilon.alt)}}f(a+epsilon.alt+ii y)}.
  $

  The first term vanishes by uniform continuity (through the same argument used for $M_1'N_1'-> M_1N_1$) and the remaining four integrals all equal 0 as they are all integrable on a degenerating interval (as $epsilon.alt ->0$, $y_phi.alt -> phi.alt(a)$ and $y_psi -> psi(a)$ because $phi.alt,psi in C^0$). Therefore,
  $ integral_{\overrightarrow{P_1M_1}}f(z)ddz -> integral_{\overrightarrow{PM}}f(z)ddz, $

  and through similar logic,
  $ integral_{\overrightarrow{N_1Q_1}}f(z)ddz -> integral_{\overrightarrow{NQ}}f(z)ddz. $
  Therefore,
  $ integral.cont_{MNQP}f(z)ddz=0. $

  Any open region $U subset CC$ with a simple closed boundary can be broken up into smaller regions with the same form as $MNQP$ with finitely many auxiliary lines. Then the conclusion follows.] <fig:cauchygoursattheorem_simplifiedregion>

#remark[The theorem is also valid for any multiply connected region (and its boundary will consist of multiple curves) as a multiply connected region is equal to the union of several simply connected regions with vertical auxiliary lines between.

  Additionally, if $U subset CC$ is simply connected and $f$ is holomorphic on $U$, then for any two points $z,z_0 in U$, the integral
  $ integral_{z_0}^z f(zeta)ddzeta $
  is well-defined and independent of the path taken from $z_0$ to $z$. In this sense, a holomorphic function behaves analogously to a potential field.]

#theorem(
  "#smallcaps[Cauchy--Goursat]",
)[Let $U subset CC$ be an open region bounded with a simple closed boundary $partial U$, and let $f:U -> CC$ be a holomorphic function continuous on $overline(U)$. Then for all $z in U$,

  $
    f(z)=(1)/(2 pi ii)integral.cont_{partial U}(f(zeta))/(zeta-z)ddzeta.
  $ <eq:cauchygoursatformula>] <thm:cauchygoursatformula>

#proof[By the Cauchy--Goursat Theorem (@thm:cauchygoursattheorem),
  $
    integral_{partial (U without D(z,epsilon.alt))}(f(zeta))/(zeta-z)ddzeta=integral.cont_{partial U}(f(zeta))/(zeta-z)ddzeta-integral.cont_{partial D(z,epsilon.alt)}(f(zeta))/(zeta-z)ddzeta=0.
  $

  From rearrangement,
  $
    integral.cont_{partial U}(f(zeta))/(zeta-z)ddzeta=2 pi ii f(z)+ii integral_0^{2 pi}\paren{f (z+epsilon.alt ee^{ii t})-f(z)}dif t.
  $

  Since $f in C^0(partial D(z,epsilon.alt))$, as $epsilon.alt ->0$,

  $
    \abs{integral_0^{2 pi}\paren{f (z+epsilon.alt ee^{ii t})-f(z)}dif t} & lt.eq integral_0^{2 pi}\abs{f (z+epsilon.alt ee^{ii t})-f(z)}dif t \\ & lt.eq2 pi max_{t in[0,2 pi]}\abs{f (z+epsilon.alt ee^{ii t})-f(z)}->0.
  $

  By rearrangement,
  $ f(z)=(1)/(2 pi ii)integral.cont_{partial U}(f(zeta))/(zeta-z)ddzeta. $]

#remark[In the proof of @thm:pompeiu, we used Lipschitz continuity for a smooth function, which was a stronger condition than necessary. The true necessity of smoothness was to be able to apply Green's Theorem (@thm:complexgreen).]

This profound theorem is extremely important and helpful in complex integration and essential in the evaluation of integrals, as demonstrated below.

#example[Evaluate the integral $integral.cont_{partial D(0,2)}(ddz)/(z^n-1)$, where $n in NN_{gt.eq 2}$.] <ex:cauchygoursatformulazeroofunity>

#proof[Since $z^n-1=product_{k=0}^{n-1}(z-omega^k_n)$, where $omega^k_n=ee^{ii pi (k)/(n)}$, the integrand has singularities at every $n$-th zero of unity. Then the integral is equal to:

  $
    integral.cont_{partial D(0,2)}(ddz)/(product_{j=0}^{n-1}(z-omega_j))=integral.cont_{partial D(0,2)}sum_{j=0}^{n-1}(c_j)/(z-omega_j)ddz,
  $ <eq:cauchygoursatformulazerosofunity>

  where $\cbraces{c_j}$ are the coefficients of the partial fraction decomposition. By the Cauchy--Goursat Formula (@thm:cauchygoursatformula), @eq:cauchygoursatformulazerosofunity becomes:
  $ sum_{k=0}^{n-1}integral.cont_{partial D(0,2)}(c_k)/(z-omega_k)ddz=2 pi ii sum_{k=0}^{n-1}c_k. $

  Observe that $sum_{k=0}^{n-1} c_k=\lim_{z -> infinity}sum_{k=0}^{n-1}(zc_k)/(z-omega_k)=\lim_{z -> infinity}(z)/(z^n-1)=0$ since $n gt.eq2$. Therefore,
  $ integral.cont_{partial D(0,2)}(ddz)/(z^n-1)=0. $]

We have also already seen the utility of parameterization via a polar transformation. Many useful identities in classical calculus can also be derived from concepts in its generalization:

#example[Prove that $forall n in NN$,
  $ integral_{0}^{2 pi}cos^{2n}theta dif theta=2 pi product_{k=1}^n (2k-1)/(2k). $]

#proof[Consider the integral
  $ integral.cont_{partial bb(D)}(z+(1)/(z))^{2n}(ddz)/(z). $

  Letting $z=ee^{ii theta}$, we get $integral.cont_{partial bb(D)}(ee^{ii theta}+ee^{-ii theta})^{2n}ee^{-ii theta}ddz=2^{2n}ii integral_0^{2 pi}cos^{2n}theta dif theta$. Alternatively, we can expand the integrand and get
  $
    integral.cont_{partial bb(D)}sum_{k=0}^{2n}\binom{2n}{k}z^{2k-2n}(ddz)/(z)=sum_{k=0}^{2n}integral.cont_{partial bb(D)}\binom{2n}{k}z^{2k-2n-1}ddz.
  $

  When $2k-2n-1 gt.eq0$, the integrand is holomorphic. The integral is then equal to
  $
    \binom{2n}{0}integral.cont_{partial bb(D)}z^{-2n-1}ddz+\binom{2n}{1}integral.cont_{partial bb(D)}z^{-2n+1}ddz+dots.c+\binom{2n}{n}integral.cont_{partial bb(D)}(ddz)/(z)=2 pi ii \binom{2n}{n},
  $

  since all the higher order terms vanish:

  $
    integral.cont_{partial bb(D)}z^{2k-2n-1}ddz=ii integral_0^{2 pi}ee^{2 ii theta(k-n)}dif theta= cases(
      0 & \qif* k<n, ,
      2 pi ii & \qif* k=n.
    )
  $

  Therefore,
  $
    2^{2n}ii integral_0^{2 pi}cos^{2n}theta dif theta=2 pi ii \binom{2n}{n}<=> integral_0^{2 pi}cos^{2n}theta dif theta=(2 pi (2n)!)/(2^{2n}(n!)^2)=(2 pi product_{k=1}^{2n}k)/(product_{k=1}^{n}{(2k)}^2).
  $

  From simple cancellation, we get
  $ 2 pi (product_{k=1}^{n}(2k-1))/(product_{k=1}^n (2k))=2 pi product_{k=1}^n (2k-1)/(2k), $

  as expected.]

#example(
  "Cauchy--Goursat Formula on the Exterior",
)[Let $gamma subset CC$ be a simple closed curve, and suppose that $f:upright("ext")(gamma)-> CC$ is holomorphic and continuous on $overline(upright("ext")(gamma))=CCwithout upright("int")(gamma)$, where $upright("int")$ and $upright("ext")$ respectively denote the interior and exterior as in @thm:jordancurve.

  + If $f$ has a removable singularity at $infinity$, or if $w=\lim_{z -> infinity} f(z)$ exists and is finite, then $forall z in CCwithout gamma$,
  $
    (1)/(2 pi ii)integral.cont_gamma (f(zeta))/(zeta-z)ddzeta= cases(
      w & \qif* z in upright("int")(gamma), ,
      w-f(z) & \qif* z in upright("ext")(gamma).
    )
  $
  + If $gamma$ encloses the origin, then $forall z in CCwithout gamma$, then

  $
    (1)/(2 pi ii)integral.cont_gamma (zf(zeta))/(z zeta-zeta^2)ddzeta= cases(
      0 & \qif* z in upright("int")(gamma), ,
      f(z) & \qif* z in upright("ext")(gamma).
    )
  $ <eq:cauchygoursatformulaexteriorpart2_statement>] <ex:cauchygoursatformulaexterior>

#proof[
  + By the compactness of $gamma$, it can be completely contained within a sufficiently large disk centered at the origin ($gamma subset D(0,R)$). Then by applying @thm:cauchygoursatformula or @thm:cauchygoursattheorem on the set $D(0,R)sect upright("ext")(gamma)=D(0,R)without overline(upright("int")(gamma))$, we get that
  $
    (1)/(2 pi ii)integral.cont_{partial D(0,R)}(f(zeta))/(zeta-z)ddzeta=(1)/(2 pi ii)integral.cont_gamma (f(zeta))/(zeta-z)ddzeta+ cases(
      0 & \qif* z in upright("int")(gamma), ,
      f(z) & \qif* z in D(0,R)sect upright("ext")(gamma).
    )
  $

  By letting $R -> infinity$ and letting $zeta=R ee^{ii theta}$, we get that
  $
    (1)/(2 pi ii)integral.cont_gamma (f(zeta))/(zeta-z)ddzeta=(1)/(2 pi)\lim_{R -> infinity}integral_0^{2 pi}(f (R ee^{ii theta}))/(1-(z)/(R ee^{ii theta}))dif theta- cases(
      0 & \qif* z in upright("int")(gamma), ,
      f(z) & \qif* z in upright("ext")(gamma).
    )
  $

  By the continuity of $f$ on $partial D(0,R)$, it attains its maximum $M$. For sufficiently large $R$, $|1-(z)/(R ee^{ii theta})|$ attains a positive minimum. Then the integrand is uniformly bounded in $R$ and $theta$, and hence the order of the limit and the integral may be exchanged. Hence,

  $
    (1)/(2 pi ii)integral.cont_gamma (f(zeta))/(zeta-z)ddzeta & =(1)/(2 pi)integral_0^{2 pi}(w)/(1-\lim_{R -> infinity}(z)/(R ee^{ii theta}))dif theta- cases(
                                                                  0 & \qif* z in upright("int")(gamma), ,
                                                                  f(z) & \qif* z in upright("ext")(gamma),
                                                                ) \\ & = cases(
                                                                         w & \qif* z in upright("int")(gamma), ,
                                                                         w-f(z) & \qif* z in upright("ext")(gamma),
                                                                       )
  $
  as expected.
  + Under the partial fraction decomposition of @eq:cauchygoursatformulaexteriorpart2_statement, we get that

  $
    I & =integral.cont_gamma (zf(zeta))/(z zeta-zeta^2)ddzeta=integral.cont_gamma \qty((f(zeta))/(zeta)-(f(zeta))/(zeta-z))ddzeta \\ & =integral_0^{2 pi}\qty(f (R ee^{ii theta})-(f (R ee^{ii theta}))/(1-(z)/(R ee^{ii theta})))dif theta+ cases(
      0 & \qif* z in upright("int")(gamma), ,
      2 pi ii f(z) & \qif* z in upright("ext")(gamma)sect D(0,R),
    )
  $ <eq:cauchygoursatformulaexteriorpart2_prelimitintegral>
  when $gamma subset D(0,R)$.
  We will analyze the first integral as $R -> infinity$. By the triangle and reverse triangle inequalities,

  $
    \qty|integral_0^{2 pi}\qty(f (R ee^{ii theta})-(f (R ee^{ii theta}))/(1-(z)/(R ee^{ii theta})))dif theta| & lt.eq integral_0^{2 pi}\qty|(z)/(R ee^{ii theta}-z)|dif theta \\ & lt.eq integral_0^{2 pi}(|z|)/(R-|z|)dif theta=(2 pi |z|)/(R-|z|)->0.
  $

  By substituting the result into @eq:cauchygoursatformulaexteriorpart2_prelimitintegral, and letting $R -> infinity$, we get that
  $
    (1)/(2 pi ii)integral.cont_gamma (zf(zeta))/(z zeta-zeta^2)ddzeta= cases(
      0 & \qif* z in upright("int")(gamma), ,
      f(z) & \qif* z in upright("ext")(gamma),
    )
  $
  as desired.]
