#import "/lib.typ": *

=== The Wiener--Ikehara Theorem
Previously we have seen the subtle relation between $zeta$ and $psi$. Given the properties of the Laplace transform of $psi compose exp$ and certain conditions established above, we apply now prove what is known as a _Tauberian_ theorem to extract sufficient information (such as convergence) of the function itself.

For arbitrary $x in RR$ and $lambda>0$, define a triangular kernel cutoff by
$
  K_lambda(x)= cases(
    1-(|x|)/(2 lambda) & |x|<2 lambda, ,
    0 & "otherwise",
  ) op("supp") K_lambda=[-2 lambda,2 lambda],
$
and a normalized Fejér kernel by

$
  k_lambda(x)= cases(
    (2 lambda)/(sqrt(2 pi))\qty((sin(lambda x))/(lambda x))^2 & x eq.not 0, ,
    (2 lambda)/(sqrt(2 pi)) & x=0.
  )
$

The two kernels are related by a angular unitary Fourier transform:

#lemma[For every $lambda>0$, we have that
  $
    cal(F)\cbraces{K_lambda}(x)=cal(F)^{-1}\cbraces{K_lambda}(x)=k_lambda(x), cal(F)\cbraces{k_lambda}(x)=cal(F)^{-1}\cbraces{k_lambda}(x)=K_lambda(x),
  $
  where we define
  $
    cal(F)\cbraces{f}(x)=\frac1{sqrt(2 pi)}integral_{-oo}^oo f(t)ee^{-ii xt}ddt, cal(F)^{-1}\cbraces{f}(x)=\frac1{sqrt(2 pi)}integral_{-oo}^oo f(t)ee^{ii xt}ddt.
  $] <lem:wienerikehara_kernels_fouriertransform>

#proof[The equivalence between the Fourier and inverse Fourier transforms follows from the evenness of both kernels. We hence prove only the forward transform equivalences.

  Since $op("supp") K_lambda=[-2 lambda,2 lambda]$, we have that

  $
    cal(F)\cbraces{K_lambda}(x) & =\frac1{sqrt(2 pi)}integral_{-2 lambda}^{2 lambda}(1-(|t|)/(2 lambda))ee^{-ii xt}ddt=(1)/(sqrt(2 pi))integral_0^{2 lambda}(1-(t)/(2 lambda))(ee^{-ii xt}+ee^{ii xt})ddt \\ & =(sqrt(2))/(sqrt(pi))integral_0^{2 lambda}(1-(t)/(2 lambda))cos (xt)ddt \\ & =(sqrt(2))/(sqrt(pi))[\eval{\frac{sin(xt)}x}_0^{2 lambda}-\eval{(t sin(xt))/(2 lambda x)}_0^{2 lambda}+integral_0^{2 lambda}(sin(xt))/(2 lambda x)ddt] \\ & =(sqrt(2))/(sqrt(pi))[\frac{sin(2 lambda x)}x-(sin(2 lambda x))/(x)-\eval{(cos(xt))/(2 lambda x^2)}_0^{2 lambda}] \\ & =(sqrt(2))/(sqrt(pi))[(1-cos(2 lambda x))/(2 lambda x^2)]=(2 lambda)/(sqrt(2 pi))\qty((sin(lambda x))/(lambda x))^2=k_lambda(x).
  $

  On the other hand,

  $
    cal(F)\cbraces{k_lambda}(x) & =(2 lambda)/(2 pi)integral_{-oo}^oo \qty((sin(lambda t))/(lambda t))^2 ee^{-ii xt}ddt=\frac2{pi lambda}integral_{0}^oo (sin^2(lambda t))/(t^2)cos(xt)ddt \\ & =(1)/(pi lambda)integral_0^oo (1-cos(2 lambda t))/(t^2)cos(xt)ddt.
  $

  Let $I(x)=integral_0^oo (1-cos(2 lambda t))/(t^2)cos(xt)ddt$. Differentiation under the integral sign yields
  $
    dv(I, x)=integral_0^oo \pdv{x}\qty((1-cos(2 lambda t))/(t^2)cos(xt))ddt=integral_0^oo \qty((cos(2 lambda t)-1)/(t))sin(xt)ddt.
  $
  // TODO: prove the conditions required for the commute
  By the product-to-sum formulas, this can be rewritten as
  $
    dv(I, x)=integral_0^oo (sin(xt+2 lambda t))/(2t)ddt+integral_0^oo (sin(xt-2 lambda t))/(2t)ddt-integral_0^oo \frac{sin(xt)}t ddt=upright("I")+\mathrm{I\!I}-\mathrm{I\!I\!I}.
  $

  By substituting $u=t(x+2 lambda)$, we have that
  $
    upright("I")=integral_0^{plus.minus oo}(sin u)/(2u)dif u,\qfor plus.minus oo= cases(
      +oo & x+2 lambda>0, ,
      -oo & x+2 lambda<0,
    )
  $
  and substituting $u=t(x-2 lambda)$ gives
  $
    \mathrm{I\!I}=integral_0^{plus.minus oo}(sin u)/(2u)dif u,\qfor plus.minus oo= cases(
      +oo & x-2 lambda>0, ,
      -oo & x-2 lambda<0.
    )
  $
  By the Dirichlet integral $integral_0^oo \frac{sin u}u dif u=\frac pi2$, we have that
  $ upright("I")=\frac pi4 op("sgn")(x+2 lambda), \mathrm{I\!I}=\frac pi4 op("sgn")(x-2 lambda). $

  Similarly, $\mathrm{I\!I\!I}=\frac pi2 op("sgn")(x)$. Hence,
  $
    dv(I, x)=\frac pi4 [op("sgn")(x+2 lambda)+op("sgn")(x-2 lambda)-2 op("sgn")(x)]=\frac{pi}4 cases(
      0 & |x|>2 lambda, ,
      1 & -2 lambda<x<0, ,
      -1 & 0<x<2 lambda,
    )
  $
  and
  $
    I(0)+integral_0^x dv(I, t)ddt=I(0)+ cases(
      (\mathmakebox[\widthof{\(integral^-\)}][l]{integral_0^{-2 lambda}}+integral_{-2 lambda}^x)dv(I, t)ddt & x<-2 lambda, ,
      integral_0^x dv(I, t)ddt & -2 lambda<x<0, ,
      integral_0^x dv(I, t)ddt & 0<x<2 lambda, ,
      (\mathmakebox[\widthof{\(integral^-\)}][l]{integral_0^{2 lambda}}+integral_{2 lambda}^x)dv(I, t)ddt & x>2 lambda,
    )
  $
  which after simplification, becomes
  $
    I(x)=I(0)+pi cases(
      -lambda & x<-2 lambda, ,
      \frac x2 & -2 lambda<x<0, ,
      -\frac x2 & 0<x<2 lambda, ,
      lambda & x>2 lambda,
    ).
  $

  Since

  $
    I(0) & =integral_0^oo (1-cos(2 lambda t))/(t^2)ddt=\eval{(cos(2 lambda t)-1)/(t)}_0^oo+integral_0^oo 2 lambda (sin(2 lambda t))/(t)ddt \\ & =\lim_{t -> 0}(1-cos(2 lambda t))/(t)+2 lambda \frac pi2=pi lambda,
  $

  we obtain
  $
    I= cases(
      0 & x<-2 lambda, ,
      pi (lambda+\frac x2) & -2 lambda<x<0, ,
      pi (lambda-\frac x2) & 0<x<2 lambda, ,
      0 & x>2 lambda,
    )=> cal(F)\cbraces{k_lambda}(x)= cases(
      0 & x<-2 lambda, ,
      (1+\frac x{2 lambda}) & -2 lambda<x<0, ,
      (1-\frac x{2 lambda}) & 0<x<2 lambda, ,
      0 & x>2 lambda,
    )
  $
  which confirms the second equivalence.]

#definition[A function $f:RR-> RR$ is said to be _slowly decreasing_ if
  $ \liminf_{delta ->0^+}\liminf_{x ->+oo}[f(x+delta)-f(x)]gt.eq 0, $
  or equivalently, for every $epsilon>0$, $exists x_0$, $exists delta>0$ such that
  $ forall x,y>x_0, 0<y-x<delta => f(y)-f(x)>-epsilon. $]

#proof("Proof of equivalence")[]

#proposition[Let $f:RR-> RR$ be a slowly decreasing function bounded by $M>0$. If the limit of the convolution $f*k_lambda$ given by
  $ L equiv \lim_{x ->+oo}(f*k_lambda)(x)=\lim_{x ->+oo}\frac1{sqrt(2 pi)}integral_{-oo}^oo f(t)k_lambda(x-t)ddt $
  is independent of $lambda>0$, then $\lim_{x ->+oo}f(x)=L$.] <prop:wienerikehara_intermediatetauberiantheorem>

#proof[Let $epsilon>0$ be arbitrary. Assume, for the sake of contradiction, that $f \not -> L$ as $x -> oo$. Then there exists some sequence $\cbraces{x_n}_{n in NN}$ such that $|f(x_n)-L|>epsilon$ for all $n$. From here, we may extract an infinite subsequence (continued to be denoted by $\cbraces{x_n}$) such that one of the two cases is assumed:

  + $f(x_n)-L>epsilon$ for all $n in NN$. By the slow decrease of $f$, there exist $delta>0$ and $N in NN$ such that
  $ f(y)>f (x_n)-(epsilon)/(2)>L+\frac epsilon2 $
  for any $n>N$ and $0<y-x_n<2 delta$. Then we have

  $
    (f*k_lambda)(x+delta) & =\frac1{sqrt(2 pi)}integral_{-oo}^oo f(t)k_lambda (x+delta-t)ddt \\ & =\frac1{sqrt(2 pi)}(integral_x^{x+2 delta}+integral_{-oo}^x+integral_{x+2 delta}^oo)f(t)k_lambda (x+delta-t)ddt \\ & >(1)/(sqrt(2 pi))integral_x^{x+2 delta}(L+\frac{epsilon}2)k_lambda (x+delta-t)ddt \\ & -\frac M{sqrt(2 pi)}(integral_{-oo}^x+integral_{x+2 delta}^oo)k_lambda (x+delta-t)ddt \\ & >(2L+epsilon)/(2 sqrt(2 pi))integral_x^{x+2 delta}k_lambda (x+delta-t)ddt-\frac M{sqrt(2 pi)}(integral_delta^oo+integral_{-oo}^{-delta})k_lambda(u)dif u.
  $

  Because

  $
    (1)/(sqrt(2 pi))integral_{-oo}^oo k_{lambda}(t)ddt & =(lambda)/(pi)integral_{RR}\qty((sin(lambda t))/(lambda t))^2 ddt=(1)/(pi)integral_{RR}(\frac{sin t}t)^2 ddt \\ & =-\eval{(sin^2 t)/(pi t)}_{-oo}^oo+integral_{RR}(\dd(sin^2 t))/(pi t)=integral_{RR}(sin(2t))/(pi t)ddt=1,
  $

  we then have for any $n>N$, that
  $
    \lim_{n -> oo}(f*k_lambda)(x_n+delta)gt.eq (2L+epsilon)/(2 sqrt(2 pi))integral_{-delta}^{delta}(2 lambda)/(sqrt(2 pi))\qty((sin (lambda u))/(lambda u))^2 dif u-(2M)/(pi)integral_{delta lambda}^oo ((sin t)/(t))^2 ddt.
  $

  Letting $lambda -> oo$, we have
  $
    (2L+epsilon)/(2 pi)integral_{-delta lambda}^{delta lambda}\mathmakebox[\widthof{\(((sin t)/(t))\)}][l]{((sin t)/(t))^2}ddt-(2M)/(pi)integral_{delta lambda}^oo \mathmakebox[\widthof{\(((sin t)/(t))\)}][l]{((sin t)/(t))^2}ddt -> (2L+epsilon)/(2 pi)integral_{RR}\mathmakebox[\widthof{\(((sin t)/(t))\)}][l]{((sin t)/(t))^2}ddt=L+(epsilon)/(2).
  $

  Because $\lim_{n -> oo}(f*k_lambda)(x_n+delta)=L gt.eq L+\frac epsilon2$, we reach a contradiction.
  + $f(x_n)-L<-epsilon$. Then there exist $delta>0$, $N in NN$ such that
  $ f (x_n)-f(y)>-\frac epsilon2 => f(y)<f (x_n)+\frac epsilon2<L-\frac epsilon2 $
  for any $n>N$ and $0<x_n-y<2 delta$. Splitting the convolution integral into $integral_infinity^{x_n-2 delta}$, $integral_{x_n-2 delta}^{x_n}$, and $integral_{x_n}^oo$, we have

  $
    (f*k_lambda)(x_n-delta) & =\frac1{sqrt(2 pi)}integral_{-oo}^oo f(t)k_lambda (x_n-delta-t)ddt \\ & =\frac1{sqrt(2 pi)}(integral_{-oo}^{x_n-2 delta}+integral_{x_n-2 delta}^{x_n}+integral_{x_n}^oo)f(t)k_lambda (x_n-delta-t)ddt \\ & <\frac M{sqrt(2 pi)}(integral_{-oo}^{x_n-2 delta}+integral_{x_n}^oo)k_lambda (x_n-delta-t)ddt \\ & +(1)/(sqrt(2 pi))integral_{x_n-2 delta}^{x_n}(L-\frac{epsilon}2)k_lambda (x_n-delta-t)ddt \\ & <\frac M{sqrt(2 pi)}(integral_{-oo}^{-delta}+integral_{delta}^oo)k_lambda(u)dif u+(2L-epsilon)/(2 sqrt(2 pi))integral_{-delta}^{delta}k_lambda(u)dif u.
  $

  Letting $lambda -> oo$, we have similarly that
  $ \lim_{n -> oo}(f*k_lambda)(x_n-delta)lt.eq L-\frac{epsilon}2, $
  contradicting $\lim_{n -> oo}(f*k_lambda)(x_n-delta)=L$.

  Hence, no such sequence exists in either case, and $\lim_{x ->+oo}f(x)=L$.]

#theorem(
  "Wiener" + sym.dash.en + "Ikehara",
)[Let $f:RR_{gt.eq0}-> RR$ be a nonnegative, monotically nondecreasing function such that the Laplace transform

  $ cal(L)\cbraces{f}(s)=integral_0^oo f(x)ee^{-sx}ddx $ <eq:wienerikehara_laplacetransform>
  converges for $Re s>1$. Suppose that there exists some constant $c>0$ such
  that

  $ g(t)=\lim_{sigma ->1^+}[cal(L)\cbraces{f}(s)-\frac c{s-1}], s=sigma+ii t $ <eq:wienerikehara_gfunction>
  converges locally uniformly with respect to $t$ in $RR$ and is continuously differentiable. Then

  $ \lim_{x ->+oo}(f(x))/(ee^x)=c. $ <eq:wienerikehara_conclusion>] <thm:wienerikehara>

#proof[Let
  $
    a(t)= cases(
      f(t)ee^{-t} & t gt.eq 0, ,
      0 & t<0,
    )\qand A(t)= cases(
      c & t gt.eq 0, ,
      0 & t<0.
    )
  $

  The convergence of @eq:wienerikehara_laplacetransform implies that for $epsilon,lambda>0$, the convolution
  $ I_{lambda,epsilon}=\frac1{sqrt(2 pi)}integral_{-oo}^oo k_lambda(x-t)\qty((a(t)-A(t))/(ee^{epsilon t}))ddt $
  converges. Since
  $ integral_{-oo}^oo (a(t)-A(t))/(ee^{(epsilon+ii y)t})ddt $
  converges uniformly for $|y|<2 lambda$, we have by virtue of @lem:wienerikehara_kernels_fouriertransform, that

  $
    I_{lambda,epsilon}(x) & =(1)/(2 pi)integral_{-oo}^oo (a(t)-A(t))/(ee^{epsilon t})integral_{-2 lambda}^{2 lambda}K_lambda(y)ee^{ii(x-t)y}ddy ddt \\ & =(1)/(2 pi)integral_{-2 lambda}^{2 lambda}K_lambda(y)ee^{ii xy}integral_0^oo (a(t)-A(t))/(ee^{(epsilon+ii y)t})ddt ddy \\ & =(1)/(2 pi)integral_{-2 lambda}^{2 lambda}K_lambda(y)ee^{ii xy}[cal(L)\cbraces{f}(1+epsilon+ii y)-\frac c{epsilon+ii y}]ddy.
  $

  Now $forall epsilon'>0$, by the local uniform convergence of $g$ in @eq:wienerikehara_gfunction, there exists some $delta>0$ such that
  $ forall |y|<2 lambda, |cal(L)\cbraces{f}(1+epsilon+ii y)-\frac c{epsilon+ii y}-g(y)|<(pi epsilon')/(lambda). $
  Hence, we have that
  $
    |I_{lambda,epsilon}(x)-\frac1{2 pi}integral_{-2 lambda}^{2 lambda}K_lambda(y)ee^{ii xy}g(y)ddy|lt.eq (1)/(2 pi)integral_{-2 lambda}^{2 lambda}K_lambda(y)(pi epsilon')/(lambda)ddy=epsilon'.
  $
  Therefore,
  $
    \lim_{epsilon -> 0^+}I_{lambda,epsilon}(x)=\frac1{2 pi}integral_{-2 lambda}^{2 lambda} K_lambda(y)ee^{ii xy}g(y)ddy,
  $
  or when the limit is exchanged with the integral. By parts, we have that
  $
    \lim_{epsilon ->0^+}I_{lambda,epsilon}(x)=(1)/(2 pi)(\eval{K_lambda(y)g(y)(ee^{ii x y})/(ii x)}_{-2 lambda}^{2 lambda}-(1)/(ii x)integral_{-2 lambda}^{2 lambda}\qty(K_lambda g)'(y)ee^{ii xy}ddy).
  $

  This implies that $\lim_{x ->+oo}\lim_{epsilon ->0^+}I_{lambda,epsilon}(x)equiv 0$. On the other hand, manual calculation yields
  $
    \lim_{epsilon ->0^+}I_{lambda,epsilon}(x)=\lim_{epsilon ->0^+}\frac1{sqrt(2 pi)}(integral_0^oo k_lambda(x-t)a(t)ee^{-epsilon t}ddt-integral_0^oo k_lambda(x-t)A(t)ee^{-epsilon t}ddt).
  $
  The Lebesgue's Dominated Convergence Theorem then gives
  $
    \lim_{epsilon ->0^+}I_{lambda,epsilon}(x)=\frac1{sqrt(2 pi)}integral_0^oo k_lambda(x-t)(a(t)-A(t))ddt=(a*k_lambda-A*k_lambda)(x)->0
  $
  as $x ->+oo$. Since $(A*k_lambda)(x)=c$ for all $x$, we have that

  $ \lim_{x ->+oo}(a*k_lambda)(x)=c. $ <eq:wienerikehara_convolutionlimit>

  Therefore, $exists x_0>0$ such that
  $ (a*k_lambda)(x)<c+1 => (1)/(pi)integral_{-oo}^oo ((sin t)/(t))^2a (x-\frac t lambda)ddt<c+1 $
  for all $x>x_0$. Substituting $x+\frac2{sqrt(lambda)}$ for $x$ in the integral, we have (after further restricting the integration bounds, which preserves the inequality)

  $ integral_{-sqrt(lambda)}^{sqrt(lambda)}(\frac{sin t}t)^2a (x+\frac{2 sqrt(lambda)-t}lambda)ddt<pi(c+1) $

  Since $ee^{u}a(u)=f(u)$ (for $u=x+\frac{2 sqrt(lambda)-t}lambda>0$) is nondecreasing in $u$, it is bounded below by $f (x+\frac{sqrt(lambda)}lambda)>f(x)$. Thus, we have
  $ integral_{-sqrt(lambda)}^{sqrt(lambda)}(\frac{sin t}t)^2 exp \qty((t-2 sqrt(lambda))/(lambda)-x)f (x)ddt<pi (c+1), $
  implying that
  $
    integral_{-sqrt(lambda)}^{sqrt(lambda)}(\frac{sin t}t)^2 ee^{(t-2 sqrt(lambda))/(lambda)}a (x)ddt<pi (c+1)=> a(x)ee^{-(3)/(sqrt(lambda))}integral_{-sqrt(lambda)}^{sqrt(lambda)}(\frac{sin t}t)^2 ddt<pi(c+1),
  $

  which is satisfied for all $lambda>0$ and $x>x_0$. Letting $lambda -> oo$, we have that $a(x)<c+1$. Compactness shows that $a$ is bounded on $[0,x_0]$ (@thm:continuous_function_bounded_on_compact). Hence, $a$ is bounded (above) on $RR$ by some $M>0$.

  The final hypothesis required is the slow decrease of $a$: for any $epsilon>0$, $exists delta>0$ such that $forall x,y>0$ with $0<y-x<delta$, we have

  $
    a(y)-a(x) & =ee^{-x}(ee^{x-y}f(y)-f(x))>ee^{-x}f(x)(ee^{-delta}-1) \\ & =a(x)(ee^{-delta}-1)>M (ee^{-delta}-1).
  $

  If $delta$ is chosen so that $M (1-ee^{-delta})<epsilon$, namely
  $0<delta<ln (\frac M{M-epsilon})$, then $a(y)-a(x)>-epsilon$,
  and $a$ then exhibits slow decrease.

  The slow decrease, boundedness, and the condition in @eq:wienerikehara_convolutionlimit are sufficient by @prop:wienerikehara_intermediatetauberiantheorem, to show that $\lim_{x ->+oo}a(x)=c$, or equivalently, $\lim_{x ->+oo}(f(x))/(ee^x)=c$.]

#theorem(
  "name=_Prime Number Theorem_,store=thm:primenumber",
)[The prime counting function $pi(x)$ is asymptotically equal to $\frac x{log x}$, i.e., $\lim_{x ->+oo}\frac{pi(x)log x}x=1$.] <thm:primenumber>

#proof[By @thm:chebyshevfunctions_limsup_inflim_equivalences, it suffices to show that $\lim_{x ->+oo}\frac{psi(x)}x=1$. Consider the Laplace transform of $psi compose exp$ in @eq:primenumbertheorem_laplacetransformchebyshevfunction_statement. By @thm:primenumbertheorem_laplacetransformchebyshevfunction, the function $g$ defined therein converges uniformly on compact subsets of $RR$ and is continuously differentiable. Hence, by the Wiener--Ikehara theorem (@thm:wienerikehara), we have that
  $ \lim_{x ->+oo}(psi (ee^x))/(ee^x)=\lim_{x ->+oo}(psi (x))/(x)=1, $
  and the Prime Number Theorem follows.]
