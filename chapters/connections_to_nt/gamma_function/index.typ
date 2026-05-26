#import "/lib.typ": *

== The $Gamma$-Function<sec:gamma_function>

#definition[The Gamma function is defined by

  $ Gamma(z)=integral_0^oo ee^{-t}t^{z-1}dif t, $ <eq:gammafunction>
  where $z in CC$.] <def:gammafunction>

By letting $z=x+ii y$ where $x,y in RR$, we have $|ee^{-t}t^{z-1}|=ee^{-t}t^{x-1}$. Notice that for $x>0$,

$
  |Gamma(x)| & =integral_0^1 ee^{-t}t^{x-1}ddt+integral_1^oo ee^{-t}t^{x-1}ddt \\ & lt.eq integral_0^1 t^{x-1}ddt+integral_1^oo ee^{-t}t^{x-1}ddt=(1)/(x)+integral_1^oo ee^{-t}t^{x-1}ddt.
$

Since $integral_1^oo (ddt)/(t^2)$ is convergent and $\lim_{t -> oo}(ee^{-t}t^{z-1})/(t^{-2})=0$, then by comparison, the second integral is convergent.

Therefore, $Gamma(x)$ is convergent on $RR_(>0)$. It follows that $Gamma(z)$ is absolutely convergent on the right half-plane ${z in CC | Re(z)>0}$.

#theorem[The $Gamma$-function is holomorphic on ${z in CC | Re(z)>0}$.]

#proof[Let $gamma subset {z in CC | Re(z)>0}$ be an arbitrary simple, closed, rectifiable curve. By Morera's Theorem (@thm:morera), it suffices to show that $oint.cont_gamma Gamma(z)ddz=0$. We have

  $
    oint.cont_gamma Gamma(z)ddz & =oint.cont_gamma (integral_0^oo ee^{-t}t^{z-1}ddt)ddz=integral_0^oo ee^{-t}(oint.cont_gamma t^{z-1}ddz)ddt=0,
  $

  where the integral exchange is justified by uniform convergence of $Gamma$ on compact subsets of ${z in CC | Re(z)>0}$ (by the Weierstrass $M$--Test, @thm:weierstrassmtest).]

From integration by parts, we obtain

$ Gamma(z+1)=integral_0^oo ee^{-t}t^z ddt=-\eval{ee^{-t}t^z}_0^oo+z integral_0^oo ee^{-t}t^{z-1}ddt.=z Gamma(z). $

Additionally,
$ Gamma(1)=integral_0^oo ee^{-t}ddt=-\eval{ee^{-t}}_0^oo=1. $

Hence, we have $Gamma(z+1)=z!$, and the $Gamma$-function generalizes the factorial. We also have
$ Gamma(z+n)=Gamma(z)product_(k=0)^(n-1)(z+k), Re(z)>0, n in NN. $

Therefore, can derive its analytic continuation via

$ Gamma(z)=(Gamma(z+n))/(product_(k=0)^(n-1)(z+k)), Re(z)>-n. $

Since the numerator is holomorphic on $Re(z)>-n$ and $n$ was arbitrary, the analytic continuation of $Gamma$ has simple poles at each of $ZZ_{lt.eq0}$. Hence, $Gamma(z)$ is meromorphic on $CC$.

By @eq:residueatpole, the residue at each pole is equal to

$
  limits(Res){z=-n}Gamma(z)=\lim_{z -> -n}(Gamma(z+n+1))/(product_(k=0)^(n-1)(z+k))=(1)/(product_{k=1}^n(-k))=({(-1)}^n)/(n!).
$

We will now study two representations for the Gamma function.

#theorem[Gauss][
  The Gamma function satisfies
  $
    Gamma(z)=\lim_{n -> oo}(n^z n!)/(product_(k=0)^n(z+k)), Re z>0.
  $ <eq:gammafunctiongaussformula>
] <thm:gammafunctiongaussformula>

#proof[
  Define the sequence of functions

  $ f_n (z)=integral_0^n{(1-(t)/(n))}^n t^{z-1}ddt=n^z integral_0^1{(1-t)}^n t^{z-1}ddt, Re(z)>0. $

  By integration by parts, we have

  $
    f_n (z) & =n^z [\eval{(t^z)/(z){(1-t)}^n}_0^1+(n)/(z)integral_0^1{(1-t)}^(n-1)t^z ddt] \\ & =((n)/(n-1))^{z+1}(f_{n-1}(z+1))/(z)=[(n^{z+1}(n-1))/({(n-2)}^{z+2})](f_{n-2}(z+2))/(z(z+1)) \\ & =n^{z+1}(n-1)!(f_1 (z+n-1))/(product_(k=0)^{n-2}(z+k)) \\ & =(n^z n!)/(product_(k=0)^n(z+k)).
  $ <eq:gammafunctiongaussformulaprelimit>

  Let us now analyze the difference

  $
    \lim_{n -> oo}[integral_0^n ee^{-t}t^{z-1}ddt-f_n (z)]=\lim_{n -> oo}integral_0^n ee^{-t}t^{z-1}[1-ee^{t}{(1-(t)/(n))}^n]ddt.
  $ <eq:gammafunction_gaussformulaintermediate1>

  Since
  $ \dv{t}(ee^t{(1-(t)/(n))}^n)=ee^t (1-(t)/(n))^n-ee^t (1-(t)/(n))^(n-1)=-ee^t (t)/(n){(1-(t)/(n))}^(n-1), $

  we have

  $
    1-ee^t (1-(t)/(n))^n=(1)/(n)integral_0^t u ee^u (1-(u)/(n))^(n-1)dif u.
  $ <eq:gammafunction_gaussformulaintermediate2>

  Additionally, since

  $
    \dv{u}(ee^u (1-(u)/(n))^(n-1))=ee^u (1-(u)/(n))^(n-1)-(n-1)/(n)ee^u (1-(u)/(n))^{n-2}=(ee^u)/(n)(1-(u)/(n))^{n-2}(1-u)
  $
  has zeros at $u=1$ and at $u=n$, and
  $ \dv[2]{u}(ee^u (1-(u)/(n))^(n-1))=(ee^u)/(n^2)(1-(u)/(n))^{n-3}(u^{2}-2u-n+2), $

  evaluates to $-(ee(n-1)^{n-2})/(n^(n-1))<0$ at $u=1$ and evaluates to
  $ (ee^n)/(n^(n-1))(n-u)^{n-3}(n-2)(n-1)->0^+ $
  as $u -> n^-$, $ee^u{(1-(u)/(n))}^(n-1)$ attains its maximum of $ee{((n-1)/(n))}^(n-1)$ at $u=1$. For $n>1$, $ee ((n-1)/(n))^(n-1)lt.eq ee$. From @eq:gammafunction_gaussformulaintermediate2, we have
  $ 1-ee^{t}(1-(t)/(n))^n lt.eq (ee t^2)/(2n). $
  Moreover, since for $0 lt.eq u lt.eq t lt.eq n$,
  $ u ee^u (1-(u)/(n))^(n-1)>0, $

  it follows that $1-ee^{t}{(1-(t)/(n))}^n$ is positive. By @eq:gammafunction_gaussformulaintermediate1, we have
  $
    |integral_0^n ee^{-t}t^{z-1}[1-ee^{t}{(1-(t)/(n))}^n]ddt|lt.eq (ee)/(2n)|integral_0^n ee^{-t}t^{z+1}ddt|<(1)/(2n)|Gamma(z+2)|-> 0
  $
  as $n -> oo$. From @eq:gammafunctiongaussformulaprelimit, we have $Gamma(z)=\lim_{n -> oo}(n^z n!)/(product_(k=0)^n (z+k))$, or @eq:gammafunctiongaussformula]

The _Weierstrass formula_ is a direct consequence of the Gauss formula.

#theorem("Weierstrass")[The reciprocal $Gamma$-function has the entire Weierstrass factorization of

  $ (1)/(Gamma(z))=z product_{k=1}^n [(1+(z)/(k))ee^{-(z)/(k)}]ee^{z gamma}, $ <eq:gammafunction_weierstrassformula>
  where $\upgamma=integral_1^oo ((1)/(\floor{x})-(1)/(x))ddx$.] <thm:gammafunction_weierstrassformula>

#proof[Since the Gauss formula agrees with @eq:gammafunction on the right half-plane, the analytic continuation of $Gamma(z)$ is unique on the entire complex plane except for the poles at $ZZ_{lt.eq0}$ by the Identity Theorem (@thm:identity). Since

  $
    (n^z n!)/(product_(k=0)^n (z+k)) & =(exp [z log(n)])/(z product_{k=1}^n (1+(z)/(k))) \\ & =(exp [z integral_1^n (1)/(x)ddx])/(z product_{k=1}^n (1+(z)/(k)))(exp [-z sum_{k=1}^n (1)/(k)])/(product_{k=1}^n exp [-(z)/(k)]) \\ & =(1)/(z product_{k=1}^n [(1+(z)/(k))ee^{-(z)/(k)}])exp [-z \qty(integral_1^n ((1)/(\floor{x})-(1)/(x))ddx)].
  $

  Therefore,

  $
    (1)/(Gamma(z)) & =\lim_{n -> oo}(product_(k=0)^n(z+k))/(n^z n!) \\ & =z product_{k=1}^n [(1+(z)/(k))ee^{-(z)/(k)}]\lim_{n -> oo}exp [z \qty(integral_1^n ((1)/(\floor{x})-(1)/(x))ddx)] \\ & =z product_{k=1}^n [(1+(z)/(k))ee^{-(z)/(k)}]exp (z \upgamma).
  $

  The constant $\upgamma=integral_1^oo ((1)/(\floor{x})-(1)/(x))ddx$ is known as the _Euler--Mascheroni constant_. For each $x$, $0 lt.eq \frac1{\floor{x}}-\frac1x<\frac1{\floor{x}}-\frac1{\floor{x}+1}$, and the integral is bounded by $sum_{n=1}^oo (\frac1n-\frac1{n+1})<1$, and hence the integral is convergent. The properties of $\upgamma$ still largely remain unknown.

  By the Weierstrass Factorization Theorem (@thm:weierstrassfactorization), if we let $a_n=-n$ and $p_n=1$, it follows that
  $ sum_{n=1}^oo |(R)/(a_n)|^{p_n+1}=R^2 sum_{n=1}^oo (1)/(n^2)=(R^2 pi^2)/(6) $
  is convergent. Thus, the Weierstrass formula defines an entire function with zeros at each of $ZZ_{lt.eq 0}$.]

We have two famous identities on the $Gamma$-function:

#theorem(
  "Euler's Reflection Formula",
)[The analytic continuation of the $Gamma$-function can be analytically continued to the left half-plane with the functional equation of

  $ Gamma(z)Gamma(1-z)=pi csc(pi z) $ <eq:gammafunction_eulerreflection>
  for $z in CCwithout NN$.] <thm:gammafunction_eulerreflection>

#proof[By the Weierstrass Formula (@thm:gammafunction_weierstrassformula), we have

  $
    (1)/(Gamma(z))=z product_{k=1}^n [(1+(z)/(k))ee^{-(z)/(k)}]ee^{z \upgamma}, (1)/(Gamma(-z))=-z product_{k=1}^n [(1-(z)/(k))ee^{(z)/(k)}]ee^{-z \upgamma}.
  $

  Since the Weierstrass elementary factors form an absolutely convergent infinite product, we may rearrange its terms. Hence, by @thm:sinproductformula, we have
  $ (1)/(Gamma(z)Gamma(1-z))=-(1)/(z Gamma(z)Gamma(-z))=z product_{k=1}^n (1-(z^2)/(k^2))=(sin(pi z))/(pi), $
  which confirms @eq:gammafunction_eulerreflection.]

#example[Evaluate $Gamma ((1)/(2))$.] <ex:gammafunction_onehalf>

#proof[By the Reflection Formula (@thm:gammafunction_eulerreflection), we have that
  $ Gamma ((1)/(2))^2=pi csc((pi)/(2))=pi, $

  and it follows that $Gamma ((1)/(2))=sqrt(pi)$ as it is positive.]

#theorem("Legendre's Duplication Formula")[For any $z in CCwithout (-(NN)/(2))$, we have

  $
    Gamma(z)Gamma (z+(1)/(2))=2^{1-2z}sqrt(pi)Gamma(2z).
  $ <eq:gammafunction_legendreduplication>] <thm:gammafunction_legendreduplication>

#proof[From @thm:gammafunctiongaussformula, we have
  $
    Gamma(z)Gamma (z+(1)/(2))=\lim_{n -> oo}(n^{2z+(1)/(2)}n!^2)/(product_(k=0)^n(z+k)(z+k+(1)/(2)))=\lim_{n -> oo}(2^{2n+2}n^{2z+(1)/(2)}n!^2)/(product_(k=0)^{2n+1}(2z+k))
  $

  where the left-hand side is defined since $z in CCwithout (-(NN)/(2))$. By expansion of the value, we have

  $
    Gamma(z)Gamma (z+(1)/(2)) & =\lim_{n -> oo}((2n)^{2z}(2n)!)/(product_(k=0)^(2n)(2z+k))dot.c (n^{(1)/(2)}n!^2 2^{2n+2-2z})/((2z+2n+1)(2n)!) \\ & =Gamma(2z)\lim_{n -> oo}(n^{(1)/(2)}n!^2 2^{2-2z})/((2z+2n+1)product_(k=0)^(n-1)(k+(1)/(2))product_{k=1}^n k) \\ & =2^{2-2z}Gamma(2z)\lim_{n -> oo}(n^{(1)/(2)}n!)/(product_(k=0)^n (k+(1)/(2)))dot.c (n+\frac12)/(2z+2n+1) \\ & =2^{1-2z}Gamma(2z)Gamma ((1)/(2)) \\ & =2^{1-2z}Gamma(2z)sqrt(pi),
  $

  where the last step is derived from @ex:gammafunction_onehalf.]

The identity above is a special case of the following result:

#theorem("Gauss Multiplication Theorem")[Suppose $m in NN_{gt.eq 2}$. Let $z in CCwithout (-(NN)/(m))$. Then we have

  $
    Gamma(z)Gamma (z+(1)/(m))dots.c Gamma (z+(m-1)/(m))=(2 pi)^{(m-1)/(2)}m^{(1)/(2)-mz}Gamma(mz).
  $ <eq:gammafunction_gaussmultiplication>]

The Gamma function as in @eq:gammafunction is commonly referred to as the _Euler Integral of the Second Kind_. The _Euler Integral of the First Kind_ is also known as the _Beta function_, and is defined by
$ op("B")(z_1,z_2)=integral_0^1 t^{z_1-1}(1-t)^{z_2-1}ddt. $
By a change of variables (by letting $tau=1-t$), we derive the symmetry of the Beta function:
$ op("B")(z_1,z_2)=integral_0^1 tau^{z_2-1}(1-tau)^{z_1-1}\dd tau=op("B")(z_2,z_1). $

The Beta function is commonly treated as an auxiliary function in many cases of integral evaluation due to its connection with the Gamma function:

#theorem[For any $Re (z_1),Re (z_2)>0$, we have
  $ op("B")(z_1,z_2)=(Gamma (z_1)Gamma (z_2))/(Gamma (z_1+z_2)). $] <thm:betagammafunctionrelationship>

#proof[Consider the product $Gamma (z_1)Gamma (z_2)$. By letting $s=ut$ and $v=t(u+1)$, we have

  $
    Gamma (z_1)Gamma (z_2) & =integral_0^oo ee^{-s}s^{z_2-1}[integral_0^oo ee^{-t} t^{z_1-1}ddt]dif s \\ & =integral_0^oo u^{z_2-1}[integral_0^oo ee^{-v}((v)/(u+1))^{z_1+z_2-1}\dd((v)/(u+1))]dif u. \\ & =integral_0^oo (u^{z_2-1})/((u+1)^{z_1+z_2})[integral_0^oo ee^{-v}v^{z_1+z_2-1}dif v]dif u.
  $ <eq:beta_gamma_function_relationship_intermediate>

  Let $r=(u)/(u+1)$, $u=(r)/(1-r)$, and $dif u=(1)/((1-r)^2)$. Then we have
  $ Gamma (z_1)Gamma (z_2)=Gamma (z_1+z_2)integral_0^1 r^{z_2-1}(1-r)^{z_1-1}dif r=Gamma (z_1+z_2)op("B")(z_1,z_2). $]

#example("MIT Integration Bee 2023 Finals \#1")[Evaluate
  $ integral_0^{(pi)/(2)}(root(3, tan(x)))/((sin(x)+cos(x))^2)ddx. $]

#proof[By rewriting the integral, and letting $u=tan(x)$, we have

  $
    I=integral_0^{(pi)/(2)}(root(3, tan(x)))/((sin(x)+cos(x))^2)ddx & =integral_0^oo (u^{(1)/(3)}sec[2](x)ddx)/((u+1)^2) \\ & =integral_0^oo (u^{(1)/(3)}dif u)/((u+1)^2) \\ & =op("B")((4)/(3),(2)/(3)),
  $

  where the last step recognizes the form of @eq:beta_gamma_function_relationship_intermediate. @thm:betagammafunctionrelationship then gives
  $ I=(Gamma ((2)/(3))Gamma ((4)/(3)))/(Gamma(2))=(1)/(3)Gamma ((1)/(3))Gamma ((2)/(3)). $
  Lastly, the Reflection Formula (@thm:gammafunction_eulerreflection) gives that
  $ I=(pi)/(3 sin((pi)/(3)))=(2 pi sqrt(3))/(9). $]

#example[Evaluate
  $ I=integral_0^{\frac{pi}2}x sqrt(tan{x})ddx. $]

#proof[Apply the substitution $u=tan x$, $s=u^2$ and the integral representation $\textstyle arctan{u}=integral_0^u (dif v)/(1+v^2)=integral_0^1 (u dif v)/(1+u^2v^2)$ to get

  $
    I&=integral_0^{oo}arctan{u}(sqrt(u)dif u)/(1+u^2)=integral_0^oo (integral_0^1 (u)/(1+u^2v^2)dif v)(sqrt(u))/(1+u^2)dif u\\ &=integral_0^1 integral_0^oo (u^{\frac32})/((1+u^2v^2)(1+u^2))dif udif v=integral_0^1 integral_0^oo (s^{\frac14})/(2 (1+sv^2)(1+s))dif sdif v.
  $

  The integral switch is justified since the integrand $gt.eq 0$ throughout. Consider the integral for
  $
    integral_0^oo (s^{\frac14}dif s)/((1+sv^2)(s+1))=\frac1{1-v^2}integral_0^{oo}s^{beta}(\frac1{1+s}-(1)/(c+s))dif s, c=v^{-2}, beta=\frac14
  $

  Let the integral in the last expression be a complex function of $beta$, more explicitly $J(beta)$, defined for $-1<Re beta<1$.

  Notice that the integral maybe written as the difference of two convergent integrals for $-1<Re beta<0$:
  $
    J(beta)=integral_0^oo (s^beta dif s)/(1+s)-integral_0^oo (s^beta c^{beta}dif s)/(1+s)=(1-c^beta)op("B")(-beta,beta+1)=(c^beta-1)pi csc (pi beta)
  $
  by the reflection formula (@thm:gammafunction_eulerreflection), which derives an analytic continuation of $J \restriction_{-1<Re beta<1}$ to everywhere in $CCwithout ZZ$.

  One can show by differentiation under the integral sign, that the integral $J(beta)$ is holomorphic for $-1<Re{beta}<1$. The identity theorem (@thm:identity) then allows the computed cosecant expression to be assigned to $J(beta)$:

  $
    I&=integral_0^1 ((v^{-\frac12}-1)pi csc (\frac{pi}4))/(2-2v^2)dif v=\frac{pi sqrt(2)}2 integral_0^1 ((v^{-\frac12}-1))/(1-v^2)dif v={pi sqrt(2)}integral_0^1 ((1-u))/(1-u^4)dif u\\ &={pi sqrt(2)}integral_0^1 (dif u)/((1+u)(1+u^2))=\frac{pi sqrt(2)}2 integral_0^1 ((1)/(1+u)+(1-u)/(1+u^2))dif u\\ &=\frac{pi sqrt(2)}2 (ln{2}+arctan 1-\frac12 ln2)=\frac{pi^2 \sqrt2}8+\frac{pi sqrt(2)}4 ln 2.
  $]
