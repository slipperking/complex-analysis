#import "/lib.typ": *

== The Riemann $zeta$-Function
The $zeta$-function was first studied by Euler in the 18th century, who investigated its values at positive integers and informally discovered its connection to prime numbers through what is currently known as the _Euler Product Formula_. In the 19th century, Bernhard Riemann extended the function to complex arguments. Riemann also primarily used the related $Pi(z)=Gamma(z+1)$ and $xi(z)$-functions, to express the $zeta$-function's analytic continuation and functional equation more elegantly. While his original notations have largely been deprecated, his contributions are a fundamental part of analytic number theory.

Following Riemann's personal convention, denote the primary variable with
$s=sigma+ii t$.

#definition[For $s=sigma+ii t$, define the Riemann $zeta$-function by the series 
$ zeta(s)=sum_{n=1}^infinity (1)/(n^s), sigma=Re s>1. $] <def:riemannzetafunction>

Let $alpha in RR_{>1}$ be arbitrary. It is well known that $zeta(alpha)$ absolute converges by integral comparison. Therefore, $forall sigma gt.eq alpha$, 
$ |sum_{n=1}^infinity (1)/(n^s)|lt.eq sum_{n=1}^infinity (1)/(n^sigma)lt.eq sum_{n=1}^infinity (1)/(n^alpha). $
 Hence, $zeta(s)$ is uniformly and absolutely convergent on
${s in CC | Re(s)gt.eq alpha}$ by the Weierstrass $M$--Test
(@thm:weierstrassmtest). The Weierstrass Theorem
(@thm:weierstrassconvergence) gives the analyticity of $zeta$ thereon.
We will now explain the simple connection between $zeta$ and the prime
numbers. Let $p_1=2,p_2=3,p_3=5,dots$ be the sequence of all prime numbers
in increasing order.

#theorem("Euler Product Formula")[For $Re(s)=sigma>1$, we have
    
$ \frac1{zeta(s)}=product_{n=1}^infinity (1-(1)/(p_n^s)), $ <eq:riemannzetafunction_infiniteproduct>
 where $p_n$ is the $n$-th prime number.] <thm:riemannzetafunction_infiniteproduct>

#proof[Since $sum_{n=1}^infinity |p_n^{-s}|=sum_{n=1}^infinity (1)/(p_n^sigma)<sum_{n=1}^infinity (1)/(n^sigma)$ is an absolutely convergent sequence, it follows from @sec:constructionofentireandmeromorphicfunctions that the infinite product in @eq:riemannzetafunction_infiniteproduct is absolutely convergent. Because 
$ zeta(s)(1-(1)/(2^s))=sum_{n=1}^infinity (1)/(n^s)-sum_{n=1}^infinity (1)/((2n)^s)=sum_{2 \nmid n}\frac1{n^s}. $

    Consequently, 
$ zeta(s)(1-(1)/(2^s))(1-(1)/(3^s))=sum_{2,3 \nmid n}(1)/(n^s). $

    Repeating this process for up to the $n$-th prime (by the Sieve of
    Eratosthenes), we have 
$ |zeta(s)product_{k=1}^n (1-\frac1{p_k^s})-1|lt.eq sum_{\substack{p_1,dots,p_n \nmid n\\n gt.eq 2}}\frac1{n^sigma}lt.eq sum_{k=p_n+1}^infinity (1)/(n^sigma)<integral_{p_n}^infinity (ddx)/(x^sigma)=(1)/((sigma-1)p_n^{sigma-1})-> 0 $
 as $n -> infinity$. This completes the proof.]

#theorem[Let $s in CC$ with $Re(s)>1$. Then
    
$ Gamma(s)zeta(s)=integral_0^infinity (x^{s-1})/(ee^{x}-1)ddx. $] <thm:riemannzetafunctiongammaintegral>

#proof[Starting from the Euler integral for the Gamma function and rewriting the exponential factor,
    
$ Gamma(s)=integral_0^infinity ee^{-x}x^{s-1}ddx=integral_0^infinity ee^{-xn}x^{s-1}n^s (ddx)/(n^s), $

    so for each fixed $n gt.eq1$ one has
    
$ Gamma(s)=n^s integral_0^infinity ee^{-xn}x^{s-1}ddx. $

    Multiplying by $n^{-s}$ and summing over $n gt.eq1$ yields
    
$ Gamma(s)zeta(s)=sum_{n=1}^infinity integral_0^infinity ee^{-xn}x^{s-1}ddx. $

    By Fubini's theorem, the summation and integral may be interchanged:
    
$ Gamma(s)zeta(s)=integral_0^infinity x^{s-1}sum_{n=1}^infinity ee^{-xn}ddx=integral_0^infinity x^{s-1}(ee^{-x})/(1-ee^{-x})ddx=integral_0^infinity (x^{s-1})/(ee^{x}-1)ddx. $]

\begin{figure}[!tbp]
    \centering\vspace{0pt}
    \begin{minipage}{0.45\textwidth}
        \centering
        \vspace{0pt}
        \begin{tikzpicture}[>=stealth,
                arrow style/.style={
                    postaction={decorate},
                    decoration={markings, mark=at position 0.5 with {\arrow[scale=1]{Stealth}}}
            }]
            \draw[-{Stealth}, ultra thin] (0, 0) -- (4.5, 0);
            \draw[-{Stealth}, ultra thin] (0, 0) -- (-1, 0);
            \draw[-{Stealth}, thin] (0, 0) -- (0, 1.5);
            \draw[-{Stealth}, thin] (0, 0) -- (0, -1.5);
            \draw[-{Stealth}, thick] ({0.2*sqrt(3)}, 0.2) arc (30:181:0.4);
            \draw[-{Stealth}, thick] (-0.4,0) arc (180:331:0.4);
            \draw[-{Stealth}, thick] ({0.2*sqrt(3)},-0.2) -- (3.2,-0.2);
            \draw[-{Stealth}, thick] (3.2,0.2) -- ({0.2*sqrt(3)-0.05},0.2);
            \node[anchor=north, xshift=-2pt] at (4.5, 0) {$Re(z)$};
            \node[anchor=east, yshift=-2pt] at (0, 1.5) {$Im(z)$};
            \node[anchor=west] at (-0.8,-0.5) {$C_epsilon$};
            \node[anchor=north] at (2,-0.3) {$Gamma_1$};
            \node[anchor=south] at (2,0.3) {$Gamma_2$};
            \draw[thin, |-|, line cap=round, shorten >=1pt, shorten <=1pt] (3.5,0.2) -- (3.5,-0.2) node[midway, anchor=west] {$2 delta$};
        \end{tikzpicture}
        \caption{A Hankel contour.}
        <fig:hankelcontour>
    \end{minipage}
    \hfill
    \begin{minipage}{0.45\textwidth}
        \centering
        \vspace{0pt}
        \begin{tikzpicture}[>=stealth,
                arrow style/.style={
                    postaction={decorate},
                    decoration={markings, mark=at position 0.5 with {\arrow[scale=1]{Stealth}}}
            }]
            \draw[-{Stealth}, ultra thin] (0, 0) -- (2.2, 0);
            \draw[-{Stealth}, ultra thin] (0, 0) -- (-2.2, 0);
            \draw[-{Stealth}, thin] (0, 0) -- (0, 2);
            \draw[-{Stealth}, thin] (0, 0) -- (0, -2);
            \draw[-{Stealth}, thick] ({0.2*sqrt(3)}, -0.2) arc (330:179:0.4);
            \draw[-{Stealth}, thick] (-0.4,0) arc (180:29:0.4);
            \draw[-{Stealth}, thick] ({0.2*sqrt(3)},0.2) -- (1.2,0.2);
            \draw[-{Stealth}, thick] (1.2,-0.2) -- ({0.2*sqrt(3)-0.05},-0.2);
            \draw[-{Stealth}, thick] (1.2, 0.2) arc ({atan(1/6)}:181:{0.2*sqrt(37)});
            \draw[-{Stealth}, thick] ({-0.2*sqrt(37)}, 0) arc (180:{360-atan(1/6)}:{0.2*sqrt(37)});

            \node[anchor=north, xshift=-2pt] at (2,0) {$Re(z)$};
            \node[anchor=east, yshift=-2pt] at (0,2) {$Im(z)$};
        \end{tikzpicture}
        \caption{A keyhole contour.}
        <fig:keyholecontour>
    \end{minipage}
\end{figure}Now consider the _Hankel contour_, which consists of an arc and two rays oriented as in @fig:hankelcontour (note that this contour is not actually closed):

$ C_{epsilon}={epsilon ee^{ii theta} | \asin((delta)/(epsilon))lt.eq theta lt.eq2 pi-\asin((delta)/(epsilon))}, overset(plus.minus, Gamma)_epsilon={x plus.minus ii delta | sqrt(epsilon^2-delta^2)lt.eq x<infinity}. $

Define the auxiliary function 
$ F_{epsilon,delta}(s)=integral_{C_epsilon union {overset(plus.minus, Gamma)_epsilon}}((-z)^{s-1})/(ee^z-1)ddz=(integral_{C_epsilon}+integral_{\overset+Gamma_epsilon}+integral_{\overset-Gamma_epsilon})((-z)^{s-1})/(ee^z-1)ddz, Re(s)>1 $
 where the branch cut of the power function lies on the negative real axis. It
is important to note that $F_{epsilon,delta}$ is independent of
$epsilon gt.eq delta$. To see this, suppose that
$delta lt.eq epsilon_1<epsilon_2<2 pi$ is arbitrarily chosen. Then we
have

$
F_{epsilon_2,delta}(s)-F_{epsilon_1,delta}(s) & =(integral_{\mathmakebox[0.5em][l]{C_{epsilon_2}}}-integral_{\mathmakebox[0.5em][l]{C_{epsilon_1}}}+integral_{\mathmakebox[0.5em][l]{\overset+Gamma_{epsilon_2}}}+integral_{\mathmakebox[0.5em][l]{\overset-Gamma_{epsilon_2}}}-integral_{\mathmakebox[0.5em][l]{\overset+Gamma_{epsilon_1}}}-integral_{\overset-Gamma_{epsilon_1}})((-z)^{s-1}ddz)/(ee^{z}-1)=oint.cont_Gamma ((-z)^{s-1}ddz)/(ee^z-1),
$
 where $gamma$ is a closed _keyhole countour_ (@fig:keyholecontour) around the positive real axis. Since $((-z)^{s-1})/(ee^z-1)$ is holomorphic on and inside $gamma$, Cauchy--Goursat (@thm:cauchygoursattheorem) implies that $oint.cont_Gamma ((-z)^{s-1})/(ee^z-1)=0$. Therefore, $F_{epsilon_2,delta}(s)=F_{epsilon_1,delta}(s)$. Now we define $F_{epsilon}=\lim_{delta ->0^+}F_{epsilon,delta}$.

For brevity, let $theta.alt=\asin(\frac delta epsilon)$ and let
$tilde(delta)=sqrt(epsilon^2-delta^2)$. Then
$F_{epsilon,delta}$ can be expanded as

$
F_{epsilon,delta}(s) & =integral_{theta.alt}^{2 pi-theta.alt}\frac{(-epsilon ee^{ii theta})^{s-1}}{ee^{epsilon ee^{ii theta}}-1}epsilon ii ee^{ii theta}dif theta+integral_{tilde(delta)}^infinity ((ii delta-x)^{s-1})/(ee^{-ii delta+x}-1)ddx-integral_{tilde(delta)}^infinity ((-ii delta-x)^{s-1})/(ee^{ii delta+x}-1)ddx \\ & = upright("I") + \mathrm{I\!I} + \mathrm{I\!I\!I}.
$ <eq:riemannzetafunction_remainingthreeintegralshankelcontour>

By the Maclaurin expansion with respect to $epsilon ee^{ii theta}$, we have 
$ ee^{epsilon ee^{ii theta}}-1=epsilon ee^{ii theta}+((epsilon ee^{ii theta})^2)/(2!)+dots.c=epsilon ee^{ii theta}+R(epsilon,theta) $
 (where we have $|R(epsilon,theta)|=cal(O)(epsilon^2)< c epsilon^2$, where $c>0$ is independent of $theta$) by absolute convergence, which implies that for $epsilon<\frac1{c}$ (so that $epsilon-|R(epsilon,theta)|>0$), 
$ \abs{ee^{epsilon ee^{ii theta}}-1}=|epsilon ee^{ii theta}+R(epsilon,theta)|gt.eq epsilon-|R(epsilon,theta)|>epsilon-c epsilon^2>0. $

Then for $epsilon<(1)/(2c)$, we have that
$c<(1)/(2 epsilon)$, and thus $\abs{ee^{epsilon ee^{ii theta}}-1}>(epsilon)/(2)$. Therefore,

$
|upright("I")| & lt.eq epsilon integral_theta.alt^{2 pi-theta.alt}\abs{\frac{(epsilon ee^{ii theta})^{s-1}}{ee^{epsilon ee^{ii theta}}-1}}dif thetalt.eq2 pi epsilon^{Re(s)}sup_{theta.alt lt.eq theta lt.eq2 pi-theta.alt}\frac{|ee^{ii theta(s-1)}|}{\frac{epsilon}2} \\ & =4 pi epsilon^{Re(s)-1}sup_theta |ee^{theta(ii (Re(s)-1)-Im(s))}|=4 pi epsilon^{Re(s)-1}sup_theta ee^{-theta Im(s)} \\ & lt.eq4 pi epsilon^{Re(s)-1}ee^{2 pi |Im(s)|}->0 \qq{as}epsilon -> 0.
$

On the contrary,

$
\mathrm{I\!I}+\mathrm{I\!I\!I} & =integral_{tilde(delta)}^infinity (ee^{Log(ii delta-x)(s-1)})/(ee^{-ii delta+x}-1)ddx-integral_{tilde(delta)}^infinity (ee^{Log(-ii delta-x)(s-1)})/(ee^{ii delta+x}-1)ddx \\ |\mathrm{I\!I}+\mathrm{I\!I\!I}| & lt.eq integral_{tilde(delta)}^infinity (ee^{Re [Log(ii delta-x)(s-1)]})/(ee^x-1)ddx+integral_{tilde(delta)}^infinity (ee^{Re [Log(-ii delta-x)(s-1)]})/(ee^x-1)ddx \\ & lt.eq integral_{tilde(delta)}^infinity \frac{ee^{Log sqrt(delta^2+x^2)(Re(s)-1)-Arg (ii delta-x)Im(s)}}{ee^x-1}ddx \\ & +integral_{tilde(delta)}^infinity \frac{ee^{Log sqrt(delta^2+x^2)(Re(s)-1)-Arg (-ii delta-x)Im(s)}}{ee^x-1}ddx \\ & lt.eq integral_{tilde(delta)}^infinity \frac{ee^{Log sqrt(1+x^2)(Re(s)-1)+pi Im(s)}}{ee^x-1}ddx \\ & +integral_{tilde(delta)}^infinity \frac{ee^{Log sqrt(1+x^2)(Re(s)-1)+pi Im(s)}}{ee^x-1}ddx 
$ <eq:riemannzetafunction_remainingtwointegralshankelcontour>
 where we choose the principal branch logarithm such that $\arg(z)in(-pi,pi]$ and take $0<delta lt.eq1$. It is trivial to see that the bounding integrals (now independent of $delta$) are convergent for fixed $s$. Then Lebesgue's Dominated Convergence Theorem applies to @eq:riemannzetafunction_remainingtwointegralshankelcontour as $delta -> 0^+$, resulting in

$
\mathrm{I\!I}+\mathrm{I\!I\!I} & -> integral_{tilde(delta)}^infinity (ee^{(s-1)[log (x)+ii pi]})/(ee^x-1)ddx-integral_{tilde(delta)}^infinity (ee^{(s-1)[log(x)-ii pi]})/(ee^x-1)ddx \\ & =integral_{tilde(delta)}^infinity (x^{s-1}ee^{ii pi(s-1)})/(ee^x-1)ddx-integral_{tilde(delta)}^infinity (x^{s-1}ee^{-ii pi(s-1)})/(ee^x-1)ddx \\ & =(ee^{-ii pi s}-ee^{ii pi s})integral_{tilde(delta)}^infinity (x^{s-1}ddx)/(ee^x-1)=-2 ii sin (pi s)integral_{tilde(delta)}^infinity (x^{s-1}ddx)/(ee^x-1).
$ <eq:riemannzetafunction_remainingtwointegralslimit>

Now under the limiting operations $delta -> 0^+$ and $epsilon ->0^+$, we have

$ F(s)=F_epsilon(s)(forall epsilon<2 pi)=\lim_{epsilon -> 0^+}F_epsilon(s)=\lim_{epsilon -> 0}\lim_{delta ->0}upright("I")+\mathrm{I\!I}+\mathrm{I\!I\!I}=-2 ii sin (pi s)Gamma(s)zeta(s) $ <eq:riemannzetafunctionthreeintegralslimit>
 by virtue of @thm:riemannzetafunctiongammaintegral. The integral $upright("I")+\mathrm{I\!I}+\mathrm{I\!I\!I}$ for any $epsilon$ and $delta$ defines an entire function of $s$---by expressing each integral in its parametric form as in @eq:riemannzetafunction_remainingthreeintegralshankelcontour, a simple calculation yields that $dv(F_epsilon(s), overline(s))equiv 0$ (either through differentiation under the integral sign, or by Lebesgue's Dominated Convergence) and hence the entireness of each $F_epsilon$ follows.

Thus @eq:riemannzetafunctionthreeintegralslimit defines an analytic
continuation of $zeta(s)$ by

$ zeta(s)=(\lim_{epsilon -> 0^+}F_epsilon(s))/(-2 ii sin(pi s)Gamma(s)), $ <eq:riemannzetafunction_analyticcontinuationcontourintegral>
 whose singularities lie within $ZZ$ (the $Gamma$-function never vanishes since $\frac1 Gamma$ is entire by its Weierstrass factorization in @thm:gammafunction_weierstrassformula). By the series definition, the singularities at $s in NN_{gt.eq2}$ are removable and hence unimportant to our consideration, while the simple zeros of the $sin(pi s)$ function at each $s in ZZ_{lt.eq0}$ cancel with the simple poles of the $Gamma$-function and hence those are removable singularities of $zeta$ as well. Our final consideration is of the singularity at $s=1$:

#theorem[The Riemann $zeta$-function is holomorphic on $CCwithout \cbraces{1}$. The singularity at $s=1$ is a simple pole with a residue of $1$.]

#proof[Our previous characterizations of the removable singularities in $ZZwithout \cbraces{1}$ allow for its analytic continuation to $CCwithout \cbraces{1}$. Hence we are left to show the nature of the singularity at $s=1$.

    The $\mathrm{I\!I}$ and $\mathrm{I\!I\!I}$ integrals vanish at $s=1$
    since $sin(pi)=0$ (in
    @eq:riemannzetafunction_remainingtwointegralslimit). Now because 
$ upright("I")-> oint.cont_{partial D (0,epsilon)}(ddz)/(ee^z-1)=taui limits(Res){z=0}(\frac1{ee^z-1}) $
 as $delta -> 0^+$, the integrand has a simple pole at $z=0$. Its residue,
    calculated via @eq:residueatpole, is equal to 
$ limits(Res){z=0}(\frac1{ee^z-1})=\lim_{z -> 0}(z)/(ee^z-1)=\lim_{z -> 0}(1)/(ee^z)=1. $

    Hence, $F(1)=taui$. Now the expression
    $zeta(1)=-(pi)/(sin(pi)Gamma(1))$ shows that the singularity at
    $s=1$ is a simple pole (contributed from the simple zero of $sin$). By
    @eq:residueatpole once more, the residue at $s=1$ is equal to
    
$
limits(Res){s=1}zeta(s) & =\lim_{s -> 1}(s-1)zeta(s)=\lim_{s -> 1}(1-s)\qty((F_epsilon(s))/(2 ii sin(pi s)Gamma(s))) \\ & =(taui)/(2 ii Gamma(1))\lim_{s -> 1}(1-s)/(sin(pi s))=-pi \lim_{s ->1}(1)/(pi cos(pi s))=1.
$]

The functional equation as provided by Riemann in his original paper gives a more advanced characterization of the $zeta$-function's continuation:

#theorem("#smallcaps[Riemann's Reflection Formula]")[For any $s eq.not 0$, we have
    
$ zeta(1-s)=2 zeta(s)Gamma(s)cos(\frac pi2s)(2 pi)^{-s}. $ <eq:riemannzetafunction_functionalequation>] <thm:riemannzetafunction_functionalequation>

#proof[We restrict our consideration to $s eq.not 0,-1,-2,dots$ (and the usage of limits suffices to extend the relation to all of $CC^*$). The integrand $((-z)^{s-1})/(ee^z-1)$ (as a function of $z$) has a branch cut singularity on $RR_{gt.eq 0}$ (a region excluded by all Hankel contours and thus irrelevant to our interest). The denominator vanishes (simply) when $ee^z=1$ or when $z in2 pi ii ZZ$ and thus has simple poles at these points.

    Suppose that $Re s<0$. Now the Residue Theorem (@thm:residuethm) gives
    that 
$ F_{(2n+1)pi}(s)-F_{epsilon}(s)=taui sum_{\mathclap{\substack{z in2 pi ii ZZ\\z in " contour"}}}limits(Res)z ((-z)^{s-1})/(ee^z-1), epsilon<2 pi $
 where the contour is the keyhole contour in @fig:keyholecontour with a
    larger radius of $(2n+1)pi$ and a smaller one of $epsilon$. Then we
    have, by virtue of @eq:residueatpole:
    
$
\frac1{taui}(F_{(2n+1)pi}(s)-F_epsilon(s))=sum_{\substack{k=-n\\k eq.not 0}}^{n}\lim_{zeta ->taui k}((zeta-taui k)(-zeta)^{s-1})/(ee^zeta-1)\\ =sum_{\substack{k=-n\\k eq.not 0}}^n \lim_{zeta -> taui k}(taui k(s-1)(-zeta)^{s-2}+s(-zeta)^{s-1})/(ee^zeta)\\ =sum_{\substack{k=-n\\k eq.not0}}^n [taui k(s-1)(-taui k)^{s-2}+s(-taui k)^{s-1}]=sum_{\substack{k=-n\\k eq.not0}}^n(-taui k)^{s-1},
$

    where we utilize the principal branch logarithm:
    
$
F_{(2n+1)pi}(s)-F_epsilon(s) & =taui sum_{k=1}^n [ee^{Log(taui k)(s-1)}+ee^{Log(-taui k)(s-1)}] \\ & =taui sum_{k=1}^n [ee^{Log(2 pi k)(s-1)}ee^{Log(ii)(s-1)}+ee^{Log(2 pi k)(s-1)}ee^{Log(-ii)(s-1)}] \\ & =taui sum_{k=1}^n(2 pi k)^{s-1}[ee^{ii (pi)/(2)(s-1)}+ee^{-ii (pi)/(2)(s-1)}] \\ & =4 pi ii cos (\frac pi2(s-1))sum_{k=1}^n(2 pi k)^{s-1}.
$

    Now as $n -> infinity$,
    
$
|F_{(2n+1)pi}(s)| & lt.eq |oint.cont_{partial D(0,R)}((-z)^{s-1}ddz)/(ee^z-1)|+2 |sin(pi s)integral_{R}^infinity (x^{s-1}ddx)/(ee^x-1)|, R=(2n+1)pi \\ & lt.eq2 pi R^{Re s}sup_{theta in[0,2 pi]}|(-ee^{ii theta})^{s-1}|sup_{z in partial D(0,R)}(1)/(|ee^z-1|)+2 |sin(pi s)integral_{R}^infinity (x^{s-1}ddx)/(ee^x-1)|.
$ <eq:riemannzetafunction_functionalequation_contourintegralbound>

    As $n -> infinity$, the second integral vanishes by the definition of convergent improper integrals. Now observe that $(-ee^{ii theta})^{s-1}$ depends only on $s$ and $theta$ and is independent of $n$, and hence is insignificant. We now aim to prove that $\frac1{|ee^z-1|}$ is above by a positive constant for all $z in cup partial D(0,R)$. Observe that
    
$
|ee^z-1|^2 & =ee^{2x}-2 ee^x cos y+1=2 ee^x (cosh x-cos y) \\ & =2 ee^x (2 sinh^2{\frac x2}+2 sin^2{\frac y2})=4 ee^x (sinh^2{\frac x2}+sin^2{\frac y2}),
$
 (by the double argument/angle formulas) where $x^2+y^2=R^2$ for some $R=(2n+1)pi$. Now we observe two cases:
    
+ If $|x|gt.eq2$, then
            $|ee^z-1|gt.eq |\abs{ee^z}-1|=|ee^x-1|gt.eq 1-ee^{-2}$.
+ If $|x|<2$, then $ee^x>ee^{-2}$. Assume, without loss of generality,
            that $y>0$ ($y<0$ gives the same conclusion since $sin^2 \frac y2$ is
            even, and $y=0$ cannot happen for the given range of $x$). Since 
$ sin (\frac y2)=sin (xi-eta)=sin xi cos eta-sin eta cos xi xi=\frac R2,eta=xi-\frac y2. $

            Because $xi=n pi+\frac pi2$, we deduce that 
$ sin(\frac y2)=(-1)^n cos eta => sin[2](\frac y2)=cos^2 eta=cos[2](\frac R2 \qty(1-sqrt(1-(x^2)/(R^2)))). $

            Since $|x|<2$, we have that $0 lt.eq (x^2)/(R^2)<\frac4{R^2}<1$, which
            implies that 
$ sqrt(1-(x^2)/(R^2))gt.eq 1-(x^2)/(R^2) $
 (since concavity of $sqrt(1-t)$ for $t in(0,1)$ suffices to ensure that the tangent line at $0$ is an over-approximation). Therefore, we have 
$ 1-sqrt(1-(x^2)/(R^2))lt.eq (x^2)/(R^2)=> (R)/(2)\qty(1-sqrt(1-(x^2)/(R^2)))lt.eq (x^2)/(2R)lt.eq (2)/(R)lt.eq (2)/(pi) $
 since $R gt.eq pi$. On this range $cos$ is decreasing and we hence obtain 
$ sin^2 \frac y2=cos^2 eta gt.eq cos[2](\frac2 pi)=> |ee^z-1|^2 gt.eq \frac4{ee^2}cos[2](\frac2 pi). $

    We have thus shown that $|ee^z-1|$ is bounded below by a positive constant 
$ min \cbraces{1-ee^{-2},\frac2{ee}cos(\frac2 pi)}>0 $
 for all $z in cup_{n=1}^infinity partial D (0,(2n+1)pi)$ (and hence
    $\frac1{|ee^z-1|}$ is bounded). Therefore, from
    @eq:riemannzetafunction_functionalequation_contourintegralbound we have
    that $|F_{(2n+1)pi}(s)|-> 0$ as $n -> infinity$ for $Re s<0$.
    Hence, we may deduce that for $Re s<0$, 
$ -F_epsilon(s)=4 pi ii cos (\frac pi2(s-1))(2 pi)^{s-1}sum_{k=1}^nk^{s-1}=4 pi ii cos (\frac pi2(s-1))(2 pi)^{s-1}zeta(1-s). $

    The left-hand side can be simplified by
    @eq:riemannzetafunction_analyticcontinuationcontourintegral to give
    
$
sin(pi s)Gamma(s)zeta(s) & =cos (\frac pi2(s-1))(2 pi)^{s}zeta(1-s)=sin (\frac pi2s)(2 pi)^{s}zeta(1-s) \\ 2 sin (\frac pi2s)cos (\frac pi2s)(2 pi)^{-s} & =sin(\frac{pi}2s)zeta(1-s),
$

    which we now extend to all of $CC^*$ by analytic continuation.]

#remark[Suppose that 
$ xi(s)=\frac12s(s-1)pi^{-\frac s2}Gamma (\frac s2)zeta(s). $

    Then the functional equation can simply be rewritten as $xi(1-s)=xi(s)$.]

#proposition[The only zeros of the Riemann $zeta$-function in.not the set defined by ${z in CC | 0 lt.eq Re z lt.eq 1}$ occur at the negative even integers $-2,-4,-6,dots$.] <prop:riemannzetafunction_trivialzeros>

#proof[By the Euler Product Formula (@thm:riemannzetafunction_infiniteproduct), $zeta$ has no zeros for $Re s>1$. Now by the functional equation
    (@thm:riemannzetafunction_functionalequation), we have that
    
$ zeta(1-s)=2 zeta(s)Gamma(s)cos (\frac pi2s)(2 pi)^{-s}. $
 for $Re s>1$. On this range, $zeta$, $Gamma$, and $(2 pi)^{-s}$
    are all nonzero. The $cos$ function vanishes only at odd multiples of
    $\frac pi2$, or when $s=1+2n$ for $n in NN$. Therefore, the only
    zeros of $zeta(1-s)$ for $Re s>1$ occur at $s=3,5,7,dots$, or when
    $1-s=-2,-4,dots$, completing the proof.]

The zeros at the negative even integers are known as the _trivial zeros_ of the Riemann $zeta$-function. The other zeros, known as the _non-trivial zeros_, all lie within the _critical strip_ defined by $0<Re s<1$.

There exists a long-standing conjecture relating to the distribution of the
non-trivial zeros of the Riemann $zeta$-function, known as the
_Riemann Hypothesis_:
\begin{quote}
    All non-trivial zeros of the Riemann $zeta$-function lie on the _critical line_ defined by $Re s=\frac12$.
\end{quote}
Results have already shown that an infinite number of zeros lie on this line. For the purpose of our discussion, we proceed to show that $zeta$ has no zeros in ${z in CC | Re z=0 \lor Re z=1}$.

#definition[Define the _von Mangoldt function_ to be
    
$ Lambda(n)= cases(log p & n=p^k " for some prime "p and k in NN, ,
 0 & "otherwise".) $ <eq:vonmangoldtfunction>]

#proposition[For $Re s>1$, 
$ sum_{n=2}^infinity (Lambda(n))/(n^s)=-(zeta'(s))/(zeta(s)). $] <prop:riemannzetafunction_logarithmicderivativezetavonmangoldt>

#proof[By the logarithmic differentiation of the Euler Product Formula
    (@thm:riemannzetafunction_infiniteproduct), we have that
    
$
-(zeta'(s))/(zeta(s)) & =-\dv{s}(sum_{p " prime"}log \qty(1-ee^{-s log p}))=sum_{p " prime"}(ee^{-s log p}log p)/(1-ee^{-s log p}) \\ & =sum_{p " prime"}log p sum_{k=1}^infinity ee^{-s log p^k}=sum_{n=2}^infinity Lambda(n)ee^{-s log n},
$

    where the interchange of the order of summation is justified by the absolute convergence of the series for $Re s>1$.]

#proposition[If $Phi$ is holomorphic on a neighborhood of a point $a in RR$ on which $Phi equiv.not 0$ such that $Phi(a)=0$, then 
$ Re \qty((Phi'(s))/(Phi(s)))>0 $
 for $s in RR_{>a}$ near $a$.] <prop:positivelogarithmicderivativerealpart>

#proof[By assumption, $Phi$ has the local Taylor expansion 
$ Phi(s)=(s-a)^n phi.alt(s) $
 for some $n in NN$ and holomorphic $phi.alt$ (non-vanishing near
    $a$). Hence 
$ Phi'(s)=n(s-a)^(n-1)phi.alt(s)+(s-a)^n phi.alt'(s)=> Re \qty((Phi'(s))/(Phi(s)))=Re \qty((n)/(s-a)+(phi.alt'(s))/(phi.alt(s)))>0 $
 for $s>a$ sufficiently close to $a$.]

#theorem[The Riemann $zeta$-function has no zeros on the lines defined by $Re s=0$ and $Re s=1$.] <thm:riemannzetafunction_nozerosoncriticalstripboundary>

#proof[Without loss of generality, we restrict our consideration to the line $Re s=1$ (the other line follows from the functional equation). Suppose that there exists some $a=1+ii t$ for $t in RRwithout \cbraces{0}$ such that $zeta(a)=0$.

    By @prop:positivelogarithmicderivativerealpart, $exists epsilon>0$
    such that
    
$ Re \qty((Phi'(sigma))/(Phi(sigma)))>0, forall 1<sigma<1+epsilon, $ <eq:riemannzetafunction_nolinesofzeros_reallinepositivity>
 where we define $Phi(s)$ to be holomorphic on the real line (dependent on $t$) via 
$ Phi(s)=zeta^3(s)zeta^4 (s+ii t)zeta(s+2 ii t), $
 since the triple pole at $s=1$ of $zeta^3$ is cancelled by the (at least)
    quadruple zero of $zeta^4(s+ii t)$ at $s=1$.

    Now a manual calculation of the quantity in
    @eq:riemannzetafunction_nolinesofzeros_reallinepositivity gives
    
$
(Phi'(sigma))/(Phi(sigma)) & =(3 zeta^2(sigma)zeta'(sigma))/(zeta^3(sigma))+(4 zeta^3(sigma+ii t)zeta'(sigma+ii t))/(zeta^4(sigma+ii t))+(zeta'(sigma+2 ii t))/(zeta(sigma+2 ii t)) \\ & =(3 zeta'(sigma))/(zeta(sigma))+(4 zeta'(sigma+ii t))/(zeta(sigma+ii t))+(zeta'(sigma+2 ii t))/(zeta(sigma+2 ii t)) \\ & =sum_{n=2}^infinity Lambda(n)(-3 ee^{-sigma log n}-4 ee^{-(s+ii t)log n}-ee^{(sigma+2 ii t)log n})
$

    where the last equality follows from @prop:riemannzetafunction_logarithmicderivativezetavonmangoldt. Taking the real part, we have
    
$
Re \qty((Phi'(sigma))/(Phi(sigma))) & =sum_{n=2}^infinity Lambda(n)ee^{-sigma log n}(-3-4 cos(t log n)-cos(2t log n)) \\ & =-2 sum_{n=2}^infinity Lambda(n)ee^{-sigma log n}(cos(t log n)+1)^2<0.
$

    This is in direct contradiction with @eq:riemannzetafunction_nolinesofzeros_reallinepositivity.]
