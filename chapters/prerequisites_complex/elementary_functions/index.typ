#import "/lib.typ": *

== Elementary Functions

Functions of one complex variable that are formed by compositions, sums, products, and powers of finitely many functions of the following form are known as _elementary functions_:

1. Power functions including polynomials, rational functions, and their inverses.
2. Trigonometric functions, hyperbolic functions, and their inverses.
3. Exponential functions and their inverses.

Power functions are easily extendable to the complex plane by simply changing the real variable to a complex variable. The other two classes of functions have to be redefined and reinterpreted for the complex plane. It is well known that the exponential function can be expanded as
$
  ee^x & = x^0 / 0! + x^1 / 1! + x^2 / 2! + x^3 / 3! + dots \
       & = x^0 / (0! ii^0) + ii x^1 / (1! ii^1) - x^2 / (2! ii^2) - ii x^3 / (3! ii^3) + dots \
       & = cos(x / ii) + ii sin(x / ii).
$
This is better written as
$ ee^(ii x) = cos(x) + ii sin(x), $ <eq:eulers_formula>
which is the famous _Euler formula_. Then for any complex number $z = x + ii y$,
$ ee^z = ee^(x + ii y) = ee^x (cos(y) + ii sin(y)). $
Then trigonometric functions and exponential functions can be written in terms of each other:
$
  sin(z) &= (ee^(ii z) - ee^(-ii z)) / (2 ii), &
  cos(z) &= (ee^(ii z) + ee^(-ii z)) / 2, &
  tan(z) &= (ee^(ii z) - ee^(-ii z)) / (ii (ee^(ii z) + ee^(-ii z))) \
  sinh(z) &= (ee^z - ee^(-z)) / 2, &
  cosh(z) &= (ee^z + ee^(-z)) / 2, &
  tanh(z) &= (ee^z - ee^(-z)) / (ee^z + ee^(-z)).
$
Hence, the following relationships are derived:
$ sin(z) = -ii sinh(ii z), quad cos(z) = cosh(ii z), quad tan(z) = -ii tanh(ii z). $

The complex logarithm, denoted $w = log(z)$, is the solution to $z = ee^w$. We can then define the inverse trigonometric and hyperbolic functions.

We can also define the power function for non-integer powers with $w = z^alpha = ee^(alpha log(z))$. Then power functions can all be written in terms of exponential functions and logarithms. Letting $x = uppi$ in @eq:eulers_formula yields $ee^(ii uppi) = -1$. Furthermore, we can see that exponentiation with an imaginary number is a rotation:

#theorem("De Moivre")[
  $forall x in RR$, $forall n in NN$,
  $ (cos(x) + ii sin(x))^n = cos(n x) + ii sin(n x). $
] <thm:de_moivre>

Since all elementary functions can be written in terms of exponential functions and complex logarithms, we will first study the exponential function.

1. The exponential function $ee^z$ never vanishes as $abs(ee^z) = ee^x > 0$.
2. Since $ee^(taui) = 1$, it is periodic over $taui$.
3. It is also an entire function with $(ee^z)' = ee^z$.

Write $ee^z = ee^(x + ii y) = ee^x (cos(y) + ii sin(y))$ where $x, y in RR$. Let $u(x, y) = Re(ee^z) = ee^x cos(y)$ and $v(x, y) = Im(ee^z) = ee^x sin(y)$. The first order derivatives are respectively
$ pdv(u, x) = ee^x cos(y), quad pdv(u, y) = -ee^x sin(y), $
and
$ pdv(v, x) = ee^x sin(y), quad pdv(v, y) = ee^x cos(y), $
and indeed, the condition described by @thm:holomorphy_condition is satisfied.

4. For any two complex numbers $z_1$ and $z_2$, $ee^(z_1) ee^(z_2) = ee^(z_1 + z_2)$.

In fact, most real exponentiation rules are identical to those in the complex number field. Previously we claimed the periodic properties of $ee^z$. For $U subset.eq CC$, a holomorphic function $f: U -> CC$ is _univalent_ over $U$ if it is injective over $U$. This means that the solutions $z_1$ and $z_2$ satisfying $f(z_1) = f(z_2)$ will also always satisfy $z_1 = z_2$.

5. The function $ee^z$ is univalent over any horizontal strip of height $2 uppi$.

Let $z_1 = x_1 + ii y_1$ and $z_2 = x_2 + ii y_2$, with $x_1, y_1, x_2, y_2 in RR$, and assume $ee^(z_1) = ee^(z_2)$. Then
$ ee^(x_1) ee^(ii y_1) = ee^(x_2) ee^(ii y_2). $
The moduli are equal, and therefore $x_1 = x_2$. By the periodic nature of exponentiation of imaginary numbers, $y_1 - y_2 = 2 uppi k$, where $k in ZZ$. To satisfy univalence over a region $U$, we must exclude distinct points whose imaginary parts differ by an integer multiple of $2 uppi$. Thus, we may select $U$ to be any horizontal strip
$ 2 uppi k <= Im(z) < 2 uppi (k + 1) $
or
$ 2 uppi k < Im(z) <= 2 uppi (k + 1). $
Similar to the exponential function, any belt region with thickness $2 uppi$ is a region over which $log$ is univalent.

Next we examine the complex logarithm.

1. From the periodicity of $z = ee^w$, $log$ is a multi-valued function.
2. Let $z = r ee^(ii theta)$ and $w = u + ii v$, where $r, theta, u, v in RR$. Then
  $ r ee^(ii theta) = ee^(u + ii v), $
  and $ee^u = r$, meaning that $u = log(r)$ and $v = theta + 2 uppi k$, where $k in ZZ$. Then
  $ w = log(r) + ii (theta + 2 uppi k), $
  and using modulus-argument notation,
  $ log(z) = log abs(z) + ii arg(z), $
  where $arg(z)$ is the multi-valued argument function. We denote the principal branch of the argument function by
  $ Arg: CC without {0} -> (-uppi, uppi]. $
  The principal branch of $log(z)$, or $Log(z)$, can be defined such that $Im(Log(z)) in (-uppi, uppi]$.

The functions $sin$ and $cos$, through their exponential form, still satisfy the familiar properties such as their derivatives, periodicity of $2 uppi$, parity, sum and difference formulas, and the fundamental identities
$ sin^2(z) + cos^2(z) = 1, quad sin(z) = cos(uppi / 2 - z). $
However, due to the extension, some properties do not hold. For instance, $sin(z)$ and $cos(z)$ are unbounded, as along the imaginary axis they resemble their hyperbolic counterparts, which are unbounded along the real line.

We now examine the regions over which they are univalent. Consider
$ cos(z) = (ee^(ii z) + ee^(-ii z)) / 2. $
Define the auxiliary functions
$ xi(z) = ii z, quad zeta(xi) = ee^xi, quad w(zeta) = (zeta + 1 / zeta) / 2. $
Then
$ cos(z) = (w compose zeta compose xi)(z). $

$xi$ is clearly univalent on $CC$, as it is a linear map, specifically, a rotation by $uppi / 2$ radians followed by scaling. The function $zeta$ is univalent on any domain $U subset.eq CC$ such that for all $xi_1, xi_2 in U$, $xi_1 - xi_2 != taui k$ for any $k in ZZ$. If $xi_1 = ii z_1$ and $xi_2 = ii z_2$, then this translates to $z_1 - z_2 != 2 uppi k$ for $k in ZZ$. The function
$ w(zeta) = (zeta + 1 / zeta) / 2 $
is univalent on regions excluding pairs $(zeta_1, zeta_2)$ such that $zeta_1 = 1 / zeta_2$. In terms of $z$, this condition becomes $ee^(ii z_1) ee^(ii z_2) != 1$, or equivalently, $z_1 + z_2 != 2 uppi k$ for any $k in ZZ$.

Combining these constraints, we conclude that $cos(z)$ is univalent on any vertical strip in the complex plane of width $uppi$, such as a region of the form
$ {z in CC : k uppi < Re(z) < (k + 1) uppi, k in ZZ}. $
Let us now consider the specific region $ {z in CC : 0 < Re(z) < uppi}, $ and analyze how it is mapped under $cos(z)$.

1. $xi(z) = ii z$ maps the region ${z in CC : 0 < Re(z) < uppi}$ to ${xi in CC : 0 < Im(xi) < uppi}$.
2. $zeta(xi) = ee^xi$ maps this region to the upper half-plane $Im(zeta) > 0$ since $0 < Arg(zeta) < uppi$ and $0 < abs(zeta)$.
3. $w(zeta) = (zeta + 1 / zeta) / 2$ maps $Im(zeta) > 0$ to $CC without ((-oo, -1] union [1, oo))$.

Thus, the composition $cos(z) = w compose zeta compose xi$ is univalent on the strip
$ {z in CC : 0 < Re(z) < uppi}, $
and the image of this strip under $cos$ is
$ CC without ((-oo, -1] union [1, oo)). $
We will now analyze the inverse cosine function, denoted $arccos(z)$. Consider
$ z = (ee^(ii w) + ee^(-ii w)) / 2. $
Then
$
  (ee^(ii w))^2 + 1 & = 2 z ee^(ii w) \
          ee^(ii w) & = (2 z plus.minus sqrt(4 z^2 - 4)) / 2 \
                  w & = -ii log(z plus.minus sqrt(z^2 - 1)).
$
Then $arccos$ is also a multi-valued function. We can also define
$ arcsin(z) = uppi / 2 - arccos(z). $

Lastly, we will examine the power function. Let $alpha = u + ii v$ where $u, v in RR$. Then
$ z^alpha = exp(alpha log(z)) = exp((u + ii v) (log abs(z) + ii arg(z))), $
and in polar form,
$ z^alpha = exp(u log abs(z) - v arg(z)) exp(ii (v log abs(z) + u arg(z))). $
Let
$ r_k = exp(u log abs(z) - v arg(z)) $
and
$ theta_k = v log abs(z) + u arg(z). $
Then $z^alpha = r_k ee^(ii theta_k)$, where $k in ZZ$. Analyzing the coefficient of $v$ in the exponent of $r_k$, $z^alpha$ is multi-valued if $v != 0$.

Then assuming $v = 0$, we have
$ z^alpha = abs(z)^u exp(ii u arg(z)). $
Doing casework on $alpha$,

1. If $alpha = u in ZZ$, then $u$ can be absorbed into $k$, and $z^alpha$ is single-valued.
+ If $alpha = u in QQ$ with reduced fractional form $p / q$, where $p, q in ZZ$, $q > 0$, and $gcd(p, q) = 1$, then the multi-valued function $z^alpha$ is given by
  $
    z^alpha & = abs(z)^(p / q) exp(ii (p / q) (Arg(z) + 2 uppi k)) \
            & = abs(z)^(p / q) exp(ii (p / q) Arg(z)) exp(taui (p / q) k),
  $
  for $k in ZZ$. These values are periodic with period $q$, since
  $ exp(taui (p / q) (k + q)) = exp(taui (p / q) k), $
  as $exp(taui p) = 1$ for integer $p$. To prove there are exactly $q$ distinct values, consider $k = 0, 1, 2, dots, q - 1$. The exponential factors are $exp(taui (p / q) k)$. These are distinct if, for $0 <= j < k <= q - 1$,
  $ exp(taui (p / q) j) != exp(taui (p / q) k), $
  which holds unless $(p / q) (k - j) in ZZ$, or equivalently unless $q$ divides $p(k - j)$. Since $gcd(p, q) = 1$, $q$ must divide $k - j$, but $abs(k - j) < q$ and $k - j != 0$, a contradiction. Thus, $z^alpha$ has exactly $q$ distinct values.
+ If $alpha = u in RR without QQ$, then $z^alpha$ is infinite-valued.

Lastly, there exist series representations of functions using power functions, namely Taylor series, and trigonometric functions, namely Fourier series. There does not exist another distinct representation using exponential functions, as trigonometric functions can be written in terms of them.
