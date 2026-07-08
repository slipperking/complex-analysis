#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Alternative Integral Formulas],
  route: "alternative-integral-formulas",
  children: [
    #include "solution-to-dirichlet-problem-on-disk/index.typ"
    #include "poisson-integral-formula-in-harmonic-analysis/index.typ"
  ],
)
As in the Cauchy Integral Formula (@thm:cauchy-goursat-formula), we can write holomorphic functions in terms of an integral representation. We define the _Cauchy kernel_ to be

$ H(zeta, z) = 1 / (taui (zeta - z)). $

Then @thm:cauchy-goursat-formula can be written as

$ f(z) = integral.cont_(partial U) f(zeta) H(zeta, z) dzeta. $

There also exist other integral formulas for functions, varying in the kernel of the expression.

Let $Phi:DD -> RR$ be harmonic such that $Phi$ is continuous on $overline(DD)$. By the mean-value property introduced in @lem:holomorphic-mean-value-property, we have

$ Phi(0) = 1 / (2 uppi) integral_0^(2 uppi) Phi(rho ee^(ii t)) dt, $

where $0 < rho < 1$. By the uniform continuity of $Phi$ on $overline(DD)$ (@thm:heine-cantor), $forall epsilon > 0$, $exists delta > 0$ such that for all $rho in ((1)/(2), 1)$ satisfying $1 - rho < delta$ and all $t in [0, 2 uppi]$,

$ abs(Phi(ee^(ii t)) - Phi(rho ee^(ii t))) < epsilon. $

It then follows that

$
  abs(1 / (2 uppi) integral_0^(2 uppi) Phi(ee^(ii t)) dt - 1 / (2 uppi) integral_0^(2 uppi) Phi(rho ee^(ii t)) dt) < epsilon.
$

Hence,

#lbl(
  $
    lim_(rho -> 1^-) 1 / (2 uppi) integral_0^(2 uppi) Phi(rho ee^(ii t)) dt = 1 / (2 uppi) integral_0^(2 uppi) Phi(ee^(ii t)) dt = Phi(0).
  $,
  <eq:harmonic-function-mean-value-over-boundary-of-unit-disk>,
)

Let $z in DD$ and notice that

$ phi_z (zeta) = (zeta - z) / (1 - overline(z) zeta) in Aut(DD) $

maps $partial DD$ to $partial DD$ bijectively. Let $u$ be harmonic on $DD$ and continuous on $overline(DD)$. Then $u compose phi_(-z)$ is also harmonic on $DD$, and by @eq:harmonic-function-mean-value-over-boundary-of-unit-disk,

$ u(z) = u compose phi_(-z) (0) = 1 / (2 uppi) integral_0^(2 uppi) u compose phi_(-z) (ee^(ii psi)) dif psi. $

By the univalence of $phi_z$, let $ee^(ii psi) = phi_z (ee^(ii t))$. It follows that

#lbl(
  $
    ii ee^(ii psi) dif psi & = ii (1 - overline(z) z) / ((1 - overline(z) ee^(ii t))^2) ee^(ii t) dt \
    dif psi & = (1 - overline(z) z) / ((1 - overline(z) ee^(ii t))^2) (1 - overline(z) ee^(ii t)) / (ee^(ii t) - z) ee^(ii t) dt \
    & = (1 - abs(z)^2) / abs(1 - overline(z) ee^(ii t))^2 dt.
  $,
  <eq:poisson-integral-formula-differential-computation>,
)

Then from @eq:harmonic-function-mean-value-over-boundary-of-unit-disk,

$
  u(z) = 1 / (2 uppi) integral_0^(2 uppi) u(ee^(ii t)) (1 - abs(z)^2) / abs(1 - overline(z) ee^(ii t))^2 dt.
$

Let

$ P(zeta, z) = (1 - abs(z)^2) / (2 uppi abs(1 - overline(z) zeta)^2) = (1 - abs(z)^2) / (2 uppi abs(zeta - z)^2), $

known as the _Poisson kernel_. Then,

#lbl($ u(z) = integral_0^(2 uppi) u(zeta) P(zeta, z) dt, wide abs(z)<1, $, <eq:poisson-integral-formula>)
where $zeta = ee^(ii t)$. @eq:poisson-integral-formula is also known as the _Poisson Integral Formula_.

For all $z in D(0, R)$, where $R > 0$, we can apply the transformation

$ tilde(phi)_z (zeta) = R phi_((z)/(R)) ((zeta)/(R)) $

to extend the automorphism to $D(0, R)$. Let $u$ instead be harmonic on $D(0, R)$ and continuous on $overline(D(0, R))$. Then,

$ u(0) = 1 / (2 uppi) integral_0^(2 uppi) u(R ee^(ii psi)) dif psi. $

It follows that $u compose tilde(phi)_(-z)$ is also harmonic on $D(0, R)$ with

$ u(z) = u compose tilde(phi)_(-z) (0), $

and from the bijectivity of $R ee^(ii psi) = tilde(phi)_z (R ee^(ii t))$,

#lbl(
  $
    dif psi & = (1 - (abs(z)^2)/(R^2)) / (1 - (overline(z))/(R) ee^(ii t))^2 ee^(ii t) ee^(-ii psi) dt \
    & = (1 - (abs(z)^2)/(R^2)) / (1 - (overline(z))/(R) ee^(ii t))^2 (1 - (overline(z))/(R) ee^(ii t)) / (1 - (z)/(R) ee^(-ii t)) dt \
    & = (R^2 - abs(z)^2) / abs(R ee^(ii t) - z)^2 dt.
  $,
  <eq:poisson-integral-formula-2-differential-computation>,
)

Then because $tilde(phi)_z^(-1) = tilde(phi)_(-z)$,

$
  u(z) = 1 / (2 uppi) integral_0^(2 uppi) u(R ee^(ii t)) (R^2 - abs(z)^2) / abs(R ee^(ii t) - z)^2 dt.
$

The expression

$ P(zeta, z) = (abs(zeta)^2 - abs(z)^2) / (2 uppi abs(zeta - z)^2) $

is a general form of the Poisson kernel. Then with $zeta = R ee^(ii t)$,

#lbl($ u(z) = integral_0^(2 uppi) u(zeta) P(zeta, z) dt. $, <eq:poisson-integral-formula-2>)

The Poisson kernel can also be rewritten as

#lbl(
  $
    P(zeta, z) & = (abs(zeta)^2 - abs(z)^2) / (2 uppi (zeta - z) (overline(zeta) - overline(z))) \
               & = 1 / (4 uppi) ((zeta + z) / (zeta - z) + (overline(zeta) + overline(z)) / (overline(zeta) - overline(z))) \
               & = 1 / (2 uppi) Re((zeta + z) / (zeta - z)).
  $,
  <eq:poisson-kernel-general-form>,
)

Thus, @eq:poisson-integral-formula-2 is equivalent to

$ u(z) = 1 / (2 uppi) integral_0^(2 uppi) u(zeta) Re((zeta + z) / (zeta - z)) dt. $

Since $dzeta = ii zeta dt$, $dt = dzeta / (ii zeta)$, and

$
  u(z) = 1 / taui integral.cont_(partial D(0, R)) (u(zeta)) / zeta Re((zeta + z) / (zeta - z)) dzeta
  = Re(1 / taui integral.cont_(partial D(0, R)) (u(zeta)) / zeta (zeta + z) / (zeta - z) dzeta),
$

where $z in D(0, R)$. Since $R > 0$ and $zeta - z != 0$ for all $zeta in partial D(0, R)$ and $z in D(0, R)$, the function

$ F(z) = 1 / taui integral.cont_(partial D(0, R)) (u(zeta)) / zeta (zeta + z) / (zeta - z) dzeta $

is holomorphic on $D(0, R)$: for each fixed $zeta in partial D(0, R)$, the integrand is holomorphic in $z$, and on compact subsets of $D(0, R)$ we may differentiate under the integral sign. Therefore, $u(z)$ is the real part of a holomorphic function

$ f(z) = 1 / taui integral.cont_(partial D(0, R)) (u(zeta)) / zeta (zeta + z) / (zeta - z) dzeta + ii c, $

where $c in RR$. Since $c in RR$ is holomorphic, by @prop:real-valued-holomorphic-function-constant, $c$ is constant. For $f(z) = u(z) + ii v(z)$,

#lbl(
  $
    v(z) = c + 1 / (2 uppi) integral_0^(2 uppi) u(zeta) Im((zeta + z) / (zeta - z)) dt.
  $,
  <eq:schwarz-integral-formula-imaginary-part>,
)

Letting $z = 0$, the integral vanishes, and we obtain $c = v(0) = Im(f(0))$.

Define the _Schwarz kernel_ to be

$ S(zeta, z) = (zeta + z) / (taui (zeta - z) zeta). $

Then for a holomorphic function $f$ on $D(0, R)$ that is continuous on $overline(D(0, R))$, we obtain the _Schwarz Integral Formula_:

#lbl(
  $ f(z) = integral.cont_(partial D(0, R)) Re(f(zeta)) S(zeta, z) dzeta + ii Im(f(0)). $,
  <eq:schwarz-integral-formula>,
)

The significance of this alternative formula implies that a holomorphic function can be recovered from the real part on the boundary of a disk and the imaginary part at a single point.

From @eq:schwarz-integral-formula-imaginary-part, we can rewrite

#lbl(
  $
    Im((zeta + z) / (zeta - z)) & = Im(1 + (2 z) / (zeta - z)) \
                                & = Im((2 z (overline(zeta) - overline(z))) / abs(zeta - z)^2) \
                                & = (2 Im(z overline(zeta))) / abs(zeta - z)^2.
  $,
  <eq:harmonic-conjugate>,
)

Let

$ Q(zeta, z) = Im(z overline(zeta)) / (uppi abs(zeta - z)^2), $

which is known as the _conjugate Poisson kernel_. Then @eq:schwarz-integral-formula-imaginary-part yields yet another integral representation of harmonic functions:

#lbl($ v(z) = v(0) + integral_0^(2 uppi) u(zeta) Q(zeta, z) dt. $, <eq:conjugate-poisson-integral-formula>)

where $zeta = R ee^(ii t)$. Two harmonic functions are said to be _conjugate_ if they are the real and imaginary parts of a holomorphic function. As seen above, on open disks, any harmonic function will admit a unique conjugate, up to an additive constant $v(0)$. For a harmonic function $u$, we can construct its harmonic conjugate from @eq:harmonic-conjugate.

The Poisson kernel is important in many branches of mathematics. We will introduce two of the important uses below.
