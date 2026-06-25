#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [The Riemann $zeta$-Function],
  route: "riemann-zeta-function",
)
The $zeta$-function was first studied by Euler in the 18th century, who investigated its values at positive integers and informally discovered its connection to prime numbers through what is currently known as the _Euler Product Formula_. In the 19th century, Bernhard Riemann extended the function to complex arguments. Riemann also primarily used the related $Pi(z)=Gamma(z+1)$ and $xi(z)$-functions, to express the $zeta$-function's analytic continuation and functional equation more elegantly. While his original notations have largely been deprecated, his contributions are a fundamental part of analytic number theory.

Following Riemann's personal convention, denote the primary variable with
$s=sigma+ii t$.

#lbl(
  definition[
    For $s=sigma+ii t$, define the Riemann $zeta$-function by the series
    $ zeta(s)=sum_(n=1)^oo 1/(n^s), quad sigma=Re s>1. $
  ],
  <def:riemann-zeta-function>,
)

Let $alpha in RR_(> 1)$ be arbitrary. It is well known that $zeta(alpha)$ absolute converges by integral comparison. Therefore, $forall s=sigma+ii t:sigma>=alpha$,
$ abs(sum_(n=1)^oo 1/(n^s)) <= sum_(n=1)^oo 1/(n^sigma) <= sum_(n=1)^oo 1/(n^alpha). $
Hence, $zeta(s)$ is uniformly and absolutely convergent on ${ s in CC : Re(s)>=alpha }$ by the Weierstrass $M$--Test (@thm:weierstrass-m-test). The Weierstrass Theorem (@thm:weierstrass-convergence) gives the analyticity of $zeta$ thereon. We will now explain the simple connection between $zeta$ and the prime numbers. Let $p_1=2,p_2=3,p_3=5,dots$ be the sequence of all prime numbers
in increasing order.

#lbl(
  theorem[Euler Product Formula][
    For $Re(s)=sigma>1$, we have
    #lbl(
      $
        1/(zeta(s))=product_(n=1)^oo (1-1/(p_n^s)),
      $,
      <eq:riemann-zeta-function_infiniteproduct>,
    )
    where $p_n$ is the $n$-th prime number.
  ],
  <thm:riemann-zeta-function_infiniteproduct>,
)

#proof[
  Since $sum_(n=1)^oo abs(p_n^(-s))=sum_(n=1)^oo 1/(p_n^sigma)<sum_(n=1)^oo 1/(n^sigma)$ is an absolutely convergent sequence, it follows from @sec:construction-of-entire-and-meromorphic-functions that the infinite product in @eq:riemann-zeta-function_infiniteproduct is absolutely convergent. Because
  $
    zeta(s)(1-1/(2^s))=sum_(n=1)^oo 1/(n^s)-sum_(n=1)^oo 1/((2n)^s)=sum_(2 divides.not n)1/(n^s).
  $
  Consequently,
  $
    zeta(s)(1-1/(2^s))(1-1/(3^s))=sum_(2,3 divides.not n)1/(n^s).
  $
  Repeating this process for up to the $n$-th prime (by the Sieve of
  Eratosthenes), we have
  $
    abs(zeta(s) product_(k=1)^n (1-1/(p_k^s))-1) &<= sum_(p_1,dots,p_n divides.not n \ n>=2)1/(n^sigma) <= sum_(k=p_n+1)^oo 1/(n^sigma) \ &< integral_(p_n)^oo dx/(x^sigma)=1/((sigma-1) p_n^(sigma-1)) -> 0
  $
  as $n -> oo$. This completes the proof.
]

#lbl(
  theorem[
    Let $s in CC$ with $Re(s)>1$. Then
    $
      Gamma(s) zeta(s)=integral_0^oo x^(s-1)/(ee^x-1) dx.
    $
  ],
  <thm:riemann-zeta-functiongammaintegral>,
)

#proof[
  Starting from the Euler integral for the Gamma function and rewriting the exponential factor,
  $
    Gamma(s)=integral_0^oo ee^(-x) x^(s-1) dx=integral_0^oo ee^(-x n) x^(s-1) n^s (dx)/(n^s),
  $
  so for each fixed $n>=1$ one has
  $
    Gamma(s)=n^s integral_0^oo ee^(-x n) x^(s-1) dx.
  $
  Multiplying by $n^(-s)$ and summing over $n>=1$ yields
  $
    Gamma(s) zeta(s)=sum_(n=1)^oo integral_0^oo ee^(-x n) x^(s-1) dx.
  $
  By Fubini's theorem, the summation and integral may be interchanged:
  $
    Gamma(s) zeta(s) & =integral_0^oo x^(s-1) sum_(n=1)^oo ee^(-x n) dx \
                     & =integral_0^oo x^(s-1) (ee^(-x))/(1-ee^(-x)) dx=integral_0^oo x^(s-1)/(ee^x-1) dx. #qedhere
  $
]

#figure-wrapper(
  lbl(
    figure(
      {
        quick-plot(
          x-min: -1.2,
          x-max: 4.8,
          y-min: -1.2,
          y-max: 1.2,
          scale: 1,
          _canvas: {
            import cetz.draw: *
            let var-delta = 0.25
            let var-epsilon = 0.6
            let var-meet-angle = calc.asin(var-delta / var-epsilon)
            let var-ext = 3.2
            let var-label-ext = 3.6
            let var-x = calc.sqrt(var-epsilon * var-epsilon - var-delta * var-delta)

            merge-path(
              {
                line(
                  (var-ext, var-delta),
                  (var-x, var-delta),
                )
                arc(
                  (var-x, var-delta),
                  start: var-meet-angle,
                  stop: 360deg - var-meet-angle,
                  radius: var-epsilon,
                  name: "C-epsilon-arc",
                )

                line(
                  (var-x, -var-delta),
                  (var-ext, -var-delta),
                )
              },
              mark: (end: arrow-populate(10, offset01: 0.6)),
            )

            line(
              (var-label-ext, var-delta),
              (var-label-ext, -var-delta),
              stroke: 0.5pt,
              mark: (start: "|", end: "|"),
            )
            content("C-epsilon-arc.65%", anchor: "north-east", $C_(epsilon,delta)$)
            content(
              (var-x / 2 + var-ext / 2, -var-delta),
              anchor: "north",
              math-rect($Gamma^-_(epsilon,delta)$),
              padding: 4pt,
            )
            content(
              (var-x / 2 + var-ext / 2, var-delta),
              anchor: "south",
              math-rect($Gamma^+_(epsilon,delta)$),
              padding: 4pt,
            )
            content(
              ((var-label-ext, var-delta), 50%, (var-label-ext, -var-delta)),
              anchor: "west",
              padding: 3pt,
              math-rect($2 delta$),
            )
            line((var-x, -0.1), (var-x, 0.1), stroke: 0.7pt)
            content((var-x, 0), math-rect($tilde(delta)$), anchor: "north", padding: 3pt)
          },
        )
      },
      caption: [A Hankel contour.],
    ),
    <fig:hankelcontour>,
  ),

  lbl(
    figure(
      {
        quick-plot(
          x-min: -1.5,
          x-max: 1.5,
          y-min: -1.5,
          y-max: 1.5,
          scale: 1,
          _canvas: {
            import cetz.draw: *

            let var-r = 0.6
            let var-R = 1.3
            let var-offset = 0.2
            let var-angle = calc.asin(var-offset / var-r)
            let var-Angle = calc.asin(var-offset / var-R)
            let var-x = calc.sqrt(var-r * var-r - var-offset * var-offset)
            let var-X = calc.sqrt(var-R * var-R - var-offset * var-offset)

            merge-path(
              {
                arc(
                  (var-x, -var-offset),
                  start: 360deg - var-angle,
                  stop: var-angle,
                  radius: var-r,
                )

                line(
                  (var-x, var-offset),
                  (var-X, var-offset),
                )

                arc(
                  (var-X, var-offset),
                  start: var-Angle,
                  stop: 360deg - var-Angle,
                  radius: var-R,
                )
              },
              close: true,
              mark: (end: arrow-populate(10, offset01: 0.6)),
              name: "gamma",
            )
            content("gamma.50%", math-rect($gamma$))
          },
        )
      },
      caption: [A keyhole contour.],
    ),
    <fig:keyholecontour>,
  ),
)

Now consider the _Hankel contour_, which consists of an arc and two rays oriented as in @fig:hankelcontour (note that this contour is not actually closed):
$
  C_(epsilon,delta)={ epsilon ee^(ii theta) : arcsin(delta/epsilon)<=theta<=2 uppi-arcsin(delta/epsilon) } \ Gamma^(plus.minus)_(epsilon,delta)={ x plus.minus ii delta : sqrt(epsilon^2-delta^2)<=x<oo }.
$
Define the auxiliary function
$
  F_(epsilon, delta) (s)=integral_(C_(epsilon,delta) union {Gamma^(plus.minus)_epsilon}) ((-z)^(s-1))/(ee^z-1) dz=(integral_(C_(epsilon,delta))+integral_(Gamma^+_(epsilon,delta))+integral_(Gamma^-_(epsilon,delta))) ((-z)^(s-1))/(ee^z-1) dz
$
for $Re(s)>1$, where the integrand is $(exp[(s-1)Log(-z)])/(e^z - 1)$, where we take $Log$ to be the principal branch with a branch cut on $RR_(<=0)$ (corresponding to $RR_(>=0)$ in terms of $z$). It is important to note that $F_(epsilon, delta)$ is independent of $epsilon>=delta$. To see this, suppose that $delta<=epsilon_1<epsilon_2<2 uppi$ is arbitrarily chosen. Then we have
$
  F_(epsilon_2, delta) (s)-F_(epsilon_1, delta) (s) &= (integral_(C_(epsilon_2, delta))-integral_(C_(epsilon_1,delta))+integral_(Gamma^+_(epsilon_2,delta))+integral_(Gamma^-_(epsilon_2,delta))-integral_(Gamma^+_(epsilon_1,delta))-integral_(Gamma^-_(epsilon_1,delta)))\ & wide ((-z)^(s-1) dz)/(ee^z-1) \
  &= integral.cont_gamma ((-z)^(s-1) dz)/(ee^z-1),
$
where $gamma$ is a closed _keyhole countour_ (@fig:keyholecontour) around the positive real axis. Since $((-z)^(s-1))/(ee^z-1)$ is holomorphic on and inside $gamma$, Cauchy--Goursat (@thm:cauchy-goursat-theorem) implies that $integral.cont_gamma ((-z)^(s-1) dz)/(ee^z-1)=0$. Therefore, $F_(epsilon_2, delta) (s)=F_(epsilon_1, delta) (s)$.

For any $epsilon$, define $F_epsilon=lim_(delta -> 0^+) F_(epsilon, delta)$. By the preceding discussion, this value is constant for $epsilon<2pi$.

For brevity, let $theta.alt=arcsin(delta/epsilon)$ and let
$tilde(delta)=sqrt(epsilon^2-delta^2)$. Then
$F_(epsilon, delta)$ can be expanded as
#lbl(
  $
    F_(epsilon, delta) (s) & =integral_(theta.alt)^(2 uppi-theta.alt) ((-epsilon ee^(ii theta))^(s-1))/(ee^(epsilon ee^(ii theta))-1) epsilon ii ee^(ii theta) dif theta\ &wide""+integral_(tilde(delta))^oo ((ii delta-x)^(s-1))/(ee^(-ii delta+x)-1) dx\ & wide wide ""-integral_(tilde(delta))^oo ((-ii delta-x)^(s-1))/(ee^(ii delta+x)-1) dx \
    & = quad #I-num quad + quad #II-num quad + quad #III-num.
  $,
  <eq:riemann-zeta-function_remainingthreeintegralshankelcontour>,
)

By the Maclaurin expansion with respect to $epsilon ee^(ii theta)$, we have
$
  ee^(epsilon ee^(ii theta))-1=epsilon ee^(ii theta)+((epsilon ee^(ii theta))^2)/(2!)+dots.c=epsilon ee^(ii theta)+R(epsilon, theta)
$
(where we have $abs(R(epsilon, theta))=Order(epsilon^2)<c epsilon^2$, where $c>0$ is independent of $theta$) by absolute convergence, which implies that for $epsilon<1/c$ (so that $epsilon-abs(R(epsilon, theta))>0$),
$
  abs(ee^(epsilon ee^(ii theta))-1)=abs(epsilon ee^(ii theta)+R(epsilon, theta))>=epsilon-abs(R(epsilon, theta))>epsilon-c epsilon^2>0.
$
Then for $epsilon<1/(2c)$, we have that
$c<1/(2 epsilon)$, and thus $abs(
  ee^(epsilon ee^(ii
  theta))-1
)>epsilon/2$. Therefore,
$
  abs(#I-num) & <=epsilon integral_(theta.alt)^(2 uppi-theta.alt) abs((epsilon ee^(ii theta))^(s-1)/(ee^(epsilon ee^(ii theta))-1)) dif theta<=2 uppi epsilon^(Re(s)) sup_(theta.alt<=theta<=2 uppi-theta.alt) abs(ee^(ii theta (s-1))) / (epsilon/2) \
  & =4 uppi epsilon^(Re(s)-1) sup_theta abs(ee^(theta (ii (Re(s)-1)-Im(s))))=4 uppi epsilon^(Re(s)-1) sup_theta ee^(-theta Im(s)) \
  & <=4 uppi epsilon^(Re(s)-1) ee^(2 uppi abs(Im(s))) -> 0 quad "as" quad epsilon -> 0.
$
On the contrary, for fixed $epsilon$, if we assume that $0<delta<= epsilon sqrt(2)/2$, then it follows that $tilde(delta) > sqrt(2)/2 epsilon$. Then,
#lbl(
  $
    #II-num + #III-num & =integral_(tilde(delta))^oo (ee^(Log(ii delta-x)(s-1)))/(ee^(-ii delta+x)-1) dx-integral_(tilde(delta))^oo (ee^(Log(-ii delta-x)(s-1)))/(ee^(ii delta+x)-1) dx \
    abs(#II-num + #III-num) & <=integral_(tilde(delta))^oo (ee^(Re [Log(ii delta-x)(s-1)]))/(ee^x-1) dx+integral_(tilde(delta))^oo (ee^(Re [Log(-ii delta-x)(s-1)]))/(ee^x-1) dx \
    & <=integral_(tilde(delta))^oo (ee^(Log sqrt(delta^2+x^2)(Re(s)-1)-Arg(ii delta-x) Im(s)))/(ee^x-1) dx \
    & quad +integral_(tilde(delta))^oo (ee^(Log sqrt(delta^2+x^2)(Re(s)-1)-Arg(-ii delta-x) Im(s)))/(ee^x-1) dx \
    & <=integral_(tilde(delta))^oo (ee^(Log sqrt(1+x^2)(Re(s)-1)+uppi Im(s)))/(ee^x-1) dx \
    & quad +integral_(tilde(delta))^oo (ee^(Log sqrt(1+x^2)(Re(s)-1)+uppi Im(s)))/(ee^x-1) dx \
    & <=integral_(sqrt(2)/2 epsilon)^oo (ee^(Log sqrt(1+x^2)(Re(s)-1)+uppi Im(s)))/(ee^x-1) dx \
    & quad +integral_(sqrt(2)/2 epsilon)^oo (ee^(Log sqrt(1+x^2)(Re(s)-1)+uppi Im(s)))/(ee^x-1) dx
  $,
  <eq:riemann-zeta-function_remainingtwointegralshankelcontour>,
)
where the principal branch logarithm gives that $Arg(z) in (-uppi, uppi]$.  It is trivial to see that the bounding integrals (now independent of $delta$, as the integration bounds depend only on $epsilon$) are convergent for fixed $s$. Then Lebesgue's Dominated Convergence Theorem applies to @eq:riemann-zeta-function_remainingtwointegralshankelcontour as $delta -> 0^+$, resulting in
#lbl(
  $
    #II-num + #III-num & ->integral_epsilon^oo (ee^((s-1)[log(x)+ii uppi]))/(ee^x-1) dx-integral_(tilde(delta))^oo (ee^((s-1)[log(x)-ii uppi]))/(ee^x-1) dx \
    & =integral_epsilon^oo (x^(s-1) ee^(ii uppi (s-1)))/(ee^x-1) dx-integral_epsilon^oo (x^(s-1) ee^(-ii uppi (s-1)))/(ee^x-1) dx \
    & =(ee^(-ii uppi s)-ee^(ii uppi s)) integral_epsilon^oo (x^(s-1) dx)/(ee^x-1)=-2 ii sin(uppi s) integral_epsilon^oo (x^(s-1) dx)/(ee^x-1).
  $,
  <eq:riemann-zeta-function_remainingtwointegralslimit>,
)
Now under the limiting operations $delta -> 0^+$ and $epsilon -> 0^+$, we have
#lbl(
  $
    F(s)&=F_epsilon (s)("constant for all" epsilon<2 uppi)=lim_(epsilon -> 0^+) F_epsilon (s)=lim_(epsilon -> 0) lim_(delta -> 0) #I-num + #II-num + #III-num \ & =-2 ii sin(uppi s) Gamma(s) zeta(s)
  $,
  <eq:riemann-zeta-functionthreeintegralslimit>,
)
by virtue of @thm:riemann-zeta-functiongammaintegral. The integral $#I-num + #II-num + #III-num$ for any $epsilon$ and $delta$ defines an entire function of $s$---by expressing each integral in its parametric form as in @eq:riemann-zeta-function_remainingthreeintegralshankelcontour, a simple calculation yields that $dv(F_epsilon (s), overline(s)) equiv 0$ (either through differentiation under the integral sign, or by Lebesgue's Dominated Convergence) and hence the entireness of each $F_epsilon$ follows.

Thus @eq:riemann-zeta-functionthreeintegralslimit defines an analytic
continuation of $zeta(s)$ by
#lbl(
  $
    zeta(s)=(lim_(epsilon -> 0^+) F_epsilon (s))/(-2 ii sin(uppi s) Gamma(s)),
  $,
  <eq:riemann-zeta-function_analytic-continuationcontour-integral>,
)
whose singularities lie within $ZZ$ (the $Gamma$-function never vanishes since $1/Gamma$ is entire by its Weierstrass factorization in @thm:gamma-function_weierstrassformula). By the series definition, the singularities at $s in NN_(>=2)$ are removable and hence unimportant to our consideration, while the simple zeros of the $sin(uppi s)$ function at each $s in ZZ_(<=0)$ cancel with the simple poles of the $Gamma$-function and hence those are removable singularities of $zeta$ as well. Our final consideration is of the singularity at $s=1$:

#theorem[
  The Riemann $zeta$-function is holomorphic on $CC without {1}$. The singularity at $s=1$ is a simple pole with a residue of $1$.
]

#proof[
  Our previous characterizations of the removable singularities in $ZZ without {1}$ allow for its analytic continuation to $CC without {1}$. Hence we are left to show the nature of the singularity at $s=1$.

  The $#II-num$ and $#III-num$ integrals vanish at $s=1$ since $sin(uppi)=0$ (in @eq:riemann-zeta-function_remainingtwointegralslimit). Now because
  $
    #I-num ->integral.cont_(partial D(0, epsilon)) dz/(ee^z-1)=taui Res_(z=0) 1/(ee^z-1)
  $
  as $delta -> 0^+$, the integrand has a simple pole at $z=0$. Its residue, calculated via @eq:residue-at-pole, is equal to
  $
    Res_(z=0) 1/(ee^z-1)=lim_(z -> 0) z/(ee^z-1)=lim_(z -> 0) 1/(ee^z)=1.
  $
  Hence, $F(1)=taui$. Now the expression
  $zeta(1)=-(uppi)/(sin(uppi) Gamma(1))$ shows that the singularity at
  $s=1$ is a simple pole (contributed from the simple zero of $sin$). By
  @eq:residue-at-pole once more, the residue at $s=1$ is equal to
  $
    Res_(s=1) zeta(s) & =lim_(s -> 1) (s-1) zeta(s)=lim_(s -> 1) (1-s) ((F_epsilon (s))/(2 ii sin(uppi s) Gamma(s))) \
    & =taui/(2 ii Gamma(1)) lim_(s -> 1) (1-s)/(sin(uppi s))=-uppi lim_(s -> 1) 1/(uppi cos(uppi s))=1. #qedhere
  $
]

The functional equation as provided by Riemann in his original paper gives a more advanced characterization of the $zeta$-function's continuation:

#lbl(
  theorem[Riemann's Reflection Formula][
    For any $s eq.not 0$, we have
    #lbl(
      $
        zeta(1-s)=2 zeta(s) Gamma(s) cos(uppi/2 s) (2 uppi)^(-s).
      $,
      <eq:riemann-zeta-function_functionalequation>,
    )
  ],
  <thm:riemann-zeta-function_functionalequation>,
)

#proof[
  We restrict our consideration to $s eq.not 0,-1,-2,dots$ (and the usage of limits suffices to extend the relation to all of $CC^*$). The integrand $((-z)^(s-1))/(ee^z-1)$ (as a function of $z$) has a branch cut singularity on $RR_(>=0)$ (in terms of $z$) (a region excluded by all Hankel contours and thus irrelevant to our interest). The denominator vanishes (simply) when $ee^z=1$ or when $z in 2 uppi ii ZZ$ and thus has simple poles at these points.

  Suppose that $Re s<0$. Now the Residue Theorem (@thm:residue-theorem) gives that
  $
    F_((2n+1) uppi) (s)-F_epsilon (s) = lim_(delta -> 0^+) integral.cont_gamma ((-z)^(s-1))/(ee^z-1) dz = lim_(delta -> 0^+) taui sum_(z in 2 uppi ii ZZ \ z in jinterior gamma) Res_z ((-z)^(s-1))/(ee^z-1)
  $
  where $gamma$ is the keyhole contour in @fig:keyholecontour with a larger radius of $(2n+1) uppi$ and a smaller one of $epsilon < 2pi$ whose lateral segments are $2delta$ apart from each other. Since $delta<epsilon<2pi$, the choice of $gamma$ does not affect the enclosed singularities. Then we have, by virtue of @eq:residue-at-pole:
  $
    & 1/taui (F_((2n+1) uppi) (s)-F_epsilon (s)) = sum_(k=-n \ k eq.not 0)^n lim_(zeta -> 2 uppi ii k) ((zeta-2 uppi ii k)(-zeta)^(s-1))/(ee^zeta-1) \
    &wide quad= sum_(k=-n \ k eq.not 0)^n lim_(zeta -> 2 uppi ii k) (2 uppi ii k (s-1) (-zeta)^(s-2)+s (-zeta)^(s-1))/(ee^zeta) \
    &wide quad= sum_(k=-n \ k eq.not 0)^n [2 uppi ii k (s-1) (-2 uppi ii k)^(s-2)+s (-2 uppi ii k)^(s-1)]=sum_(k=-n \ k eq.not 0)^n (-2 uppi ii k)^(s-1),
  $
  where by definition, uses the principal branch:
  $
    F_((2n+1) uppi) (s)&-F_epsilon (s) =taui sum_(k=1)^n [ee^(Log(2 uppi ii k)(s-1))+ee^(Log(-2 uppi ii k)(s-1))] \
    & =taui sum_(k=1)^n [ee^(Log(2 uppi k)(s-1)) ee^(Log(ii)(s-1))+ee^(Log(2 uppi k)(s-1)) ee^(Log(-ii)(s-1))] \
    & =taui sum_(k=1)^n (2 uppi k)^(s-1) [ee^(ii uppi (s-1)/2)+ee^(-ii uppi (s-1)/2)] \
    & =4 uppi ii cos(uppi (s-1)/2) sum_(k=1)^n (2 uppi k)^(s-1).
  $
  Now as $n -> oo$,
  #lbl(
    $
      abs(F_((2n+1) uppi) (s)) & <=abs(integral.cont_(partial D(0, R)) ((-z)^(s-1) dz)/(ee^z-1))\ &quad""+2 abs(sin(uppi s) integral_R^oo (x^(s-1) dx)/(ee^x-1)), quad "where" R=(2n+1) uppi \
      & <=2 uppi R^(Re s) sup_(theta in [0, 2 uppi]) abs((-ee^(ii theta))^(s-1)) sup_(z in partial D(0, R)) 1/(abs(ee^z-1))\ & quad""+2 abs(sin(uppi s) integral_R^oo (x^(s-1) dx)/(ee^x-1)).
    $,
    <eq:riemann-zeta-function_functionalequation_contour-integralbound>,
  )
  As $n -> oo$, the second integral vanishes by the definition of convergent improper integrals. Now observe that $(-ee^(ii theta))^(s-1)$ depends only on $s$ and $theta$ and is independent of $n$, and hence is insignificant. We now aim to prove that $1/(abs(ee^z-1))$ is above by a positive constant for all $z in union.big partial D(0, R)$. Observe that
  $
    abs(ee^z-1)^2 & =ee^(2x)-2 ee^x cos y+1=2 ee^x (cosh x-cos y) \
                  & =2 ee^x (2 sinh^2(x/2)+2 sin^2(y/2))=4 ee^x (sinh^2(x/2)+sin^2(y/2)),
  $
  (by the double argument/angle formulas) where $x^2+y^2=R^2$ for some $R=(2n+1) uppi$. Now we observe two cases:

  1. If $abs(x)>=2$, then
    $ abs(ee^z-1)>=abs(abs(ee^z)-1)=abs(ee^x-1)>=1-ee^(-2). $

  2. If $abs(x)<2$, then $ee^x>ee^(-2)$. Assume, without loss of generality, that $y>0$ ($y<0$ gives the same conclusion since $sin^2(y/2)$ is even, and $y=0$ cannot happen for the given range of $x$). Since
    $
      sin(y/2)=sin(xi-eta)=sin xi cos eta-sin eta cos xi quad xi=R/2,eta=xi-y/2.
    $
    Because $xi=n uppi+uppi/2$, we deduce that
    $
      sin(y/2)=(-1)^n cos eta ==> sin^2(y/2)=cos^2 eta=cos^2[R/2 (1-sqrt(1-x^2/R^2))].
    $
    Since $abs(x)<2$, we have that $0<=x^2/R^2<4/R^2<1$, which implies that
    $
      sqrt(1-x^2/R^2)>=1-x^2/R^2
    $
    (since concavity of $sqrt(1-t)$ for $t in (0, 1)$ suffices to ensure that the tangent line at $0$ is an over-approximation). Therefore, we have
    $
      1-sqrt(1-x^2/R^2)<=x^2/R^2 ==> R/2 (1-sqrt(1-x^2/R^2))<=x^2/(2R)<=2/R<=2/uppi
    $
    since $R>=uppi$. On this range $cos$ is decreasing and we hence obtain
    $
      sin^2(y/2)=cos^2 eta>=cos^2(2/uppi) ==> abs(ee^z-1)^2>=4/(ee^2) cos^2(2/uppi).
    $

  We have thus shown that $abs(ee^z-1)$ is bounded below by a positive constant
  $
    min { 1-ee^(-2), 2/ee cos(2/uppi) }>0
  $
  for all $z in union.big_(n=1)^oo partial D(0, (2n+1) uppi)$ (and hence $1/(abs(ee^z-1))$ is bounded). Therefore, from @eq:riemann-zeta-function_functionalequation_contour-integralbound we have that $abs(F_((2n+1) uppi) (s))->0$ as $n -> oo$ for $Re s<0$. Hence, we may deduce that for $Re s<0$,
  $
    -F_epsilon (s) & =4 uppi ii cos(uppi/2 (s-1))(2 uppi)^(s-1) sum_(k=1)^n k^(s-1) \
                   & =4 uppi ii cos(uppi/2 (s-1))(2 uppi)^(s-1) zeta(1-s).
  $
  The left-hand side can be simplified by @eq:riemann-zeta-function_analytic-continuationcontour-integral to give
  $
    sin(uppi s) Gamma(s) zeta(s) =cos(uppi/2 (s-1))(2 uppi)^s zeta(1-s)=sin(uppi/2 s)(2 uppi)^s zeta(1-s) \
    2 sin(uppi/2 s) cos(uppi/2 s)(2 uppi)^(-s) =sin(uppi/2 s) zeta(1-s),
  $
  which we now extend to all of $CC^*$ by analytic continuation.
]

#remark[
  Suppose that
  $
    xi(s)=1/2 s(s-1) uppi^(-s/2) Gamma(s/2) zeta(s).
  $
  Then the functional equation can simply be rewritten as $xi(1-s)=xi(s)$.
]

#lbl(
  proposition[
    The only zeros of the Riemann $zeta$-function not in the set defined by ${ z in CC : 0<=Re z<=1 }$ occur at the negative even integers $-2,-4,-6,dots$.
  ],
  <prop:riemann-zeta-function-trivial-zeros>,
)

#proof[
  By the Euler Product Formula (@thm:riemann-zeta-function_infiniteproduct), $zeta$ has no zeros for $Re s>1$. Now by the functional equation
  (@thm:riemann-zeta-function_functionalequation), we have that
  $
    zeta(1-s)=2 zeta(s) Gamma(s) cos(uppi/2 s) (2 uppi)^(-s).
  $
  for $Re s>1$. On this range, $zeta$, $Gamma$, and $(2 uppi)^(-s)$
  are all nonzero. The $cos$ function vanishes only at odd multiples of
  $uppi/2$, or when $s=1+2n$ for $n in NN$. Therefore, the only
  zeros of $zeta(1-s)$ for $Re s>1$ occur at $s=3,5,7,dots$, or when
  $1-s=-2,-4,dots$, completing the proof.
]

The zeros at the negative even integers are known as the _trivial zeros_ of the Riemann $zeta$-function. The other zeros, known as the _non-trivial zeros_, all lie within the _critical strip_ defined by $0<Re s<1$.

There exists a long-standing conjecture relating to the distribution of the non-trivial zeros of the Riemann $zeta$-function, known as the _Riemann Hypothesis_:

#conjecture[Riemann Hypothesis][
  All non-trivial zeros of the Riemann $zeta$-function lie on the _critical line_ defined by $Re s=1/2$.
]

Results have already shown that an infinite number of zeros lie on this line. For the purpose of our discussion, we proceed to show that $zeta$ has no zeros in ${ z in CC : Re z=0 or Re z=1 }$.

#definition[
  Define the _von Mangoldt function_ to be
  #lbl(
    $
      Lambda(n)=cases(
        log p quad & n=p^k "for some prime" p and k in NN\,,
        0 quad & "otherwise".
      )
    $,
    <eq:vonmangoldtfunction>,
  )
]

#lbl(
  proposition[
    For $Re s>1$,
    $
      sum_(n=2)^oo Lambda(n)/(n^s)=-(zeta'(s))/(zeta(s)).
    $
  ],
  <prop:riemann-zeta-function-logarithmic-derivative-zeta-von-mangoldt>,
)

#proof[
  By the logarithmic differentiation of the Euler Product Formula
  (@thm:riemann-zeta-function_infiniteproduct), we have that
  $
    -(zeta'(s))/zeta(s) & =-dv((sum_(p "prime") log(1-ee^(-s log p))), s, style: "large")=sum_(p "prime") (ee^(-s log p) log p)/(1-ee^(-s log p)) \
    & =sum_(p "prime") log p sum_(k=1)^oo ee^(-s log p^k)=sum_(n=2)^oo Lambda(n) ee^(-s log n),
  $
  where the interchange of the order of summation is justified by the absolute convergence of the series for $Re s>1$.
]

#lbl(
  proposition[
    If $Phi$ is holomorphic on a neighborhood of a point $a in RR$ on which $Phi equiv.not 0$ (except for at $a$) such that $Phi(a)=0$, then
    $
      Re((Phi'(s))/Phi(s))>0
    $
    for $s > a$ near $a$.
  ],
  <prop:positivelogarithmicderivativerealpart>,
)

#proof[
  By assumption, $Phi$ has the local Taylor expansion
  $
    Phi(s)=(s-a)^n phi(s)
  $
  for some $n in NN$ and holomorphic $phi$ (non-vanishing near
  $a$). Hence
  $ Phi'(s)=n(s-a)^(n-1) phi(s)+(s-a)^n phi'(s), $ which implies that $ Re((Phi'(s))/Phi(s))=Re(n/(s-a)+(phi'(s))/phi(s))>0 $
  for $s>a$ sufficiently close to $a$.
]

#lbl(
  theorem[
    The Riemann $zeta$-function has no zeros on the lines defined by $Re s=0$ and $Re s=1$.
  ],
  <thm:riemann-zeta-function_nozerosoncriticalstripboundary>,
)

#proof[
  Without loss of generality, we restrict our consideration to the line $Re s=1$ (the other line follows from the functional equation). Suppose that there exists some $a=1+ii t$ for $t in RR without {0}$ such that $zeta(a)=0$.

  By @prop:positivelogarithmicderivativerealpart, $exists epsilon>0$
  such that
  #lbl(
    $
      Re((Phi'(sigma))/Phi(sigma))>0, quad forall 1<sigma<1+epsilon,
    $,
    <eq:riemann-zeta-function_nolinesofzeros_reallinepositivity>,
  )
  where we define $Phi(s)$ to be holomorphic on the real line (dependent on $t$) via
  $
    Phi(s)=zeta(s)^3 zeta(s+ii t)^4 zeta(s+2 ii t),
  $
  since the triple pole at $s=1$ of $zeta^3$ is cancelled by the (at least) quadruple zero of $zeta(s+ii t)^4$ at $s=1$.

  Now a manual calculation of the quantity in
  @eq:riemann-zeta-function_nolinesofzeros_reallinepositivity gives
  $
    (Phi'(sigma))/Phi(sigma) & = (3 zeta(sigma)^2 zeta'(sigma))/zeta(sigma)^3+(4 zeta(sigma+ii t)^3 zeta'(sigma+ii t))/zeta(sigma+ii t)^4+(zeta'(sigma+2 ii t))/zeta(sigma+2 ii t) \
    & =(3 zeta'(sigma))/zeta(sigma)+(4 zeta'(sigma+ii t))/zeta(sigma+ii t)+(zeta'(sigma+2 ii t))/zeta(sigma+2 ii t) \
    & =sum_(n=2)^oo Lambda(n) (-3 ee^(-sigma log n)-4 ee^(-(sigma+ii t) log n)-ee^((sigma+2 ii t) log n))
  $
  where the last equality follows from @prop:riemann-zeta-function-logarithmic-derivative-zeta-von-mangoldt. Taking the real part, we have
  $
    Re((Phi'(sigma))/Phi(sigma)) & =sum_(n=2)^oo Lambda(n) ee^(-sigma log n) (-3-4 cos(t log n)-cos(2 t log n)) \
                                 & = sum_(n=2)^oo Lambda(n) ee^(-sigma log n) (-2-4 cos(t log n)-2cos^2 (2t log n))<0 \
                                 & =-2 sum_(n=2)^oo Lambda(n) ee^(-sigma log n) (cos(t log n)+1)^2<0,
  $
  which is a direct contradiction of @eq:riemann-zeta-function_nolinesofzeros_reallinepositivity.
]
