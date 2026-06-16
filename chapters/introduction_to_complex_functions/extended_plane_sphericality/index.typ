#import "/lib.typ": *

== The Extended Complex Plane and its Spherical Representation <sec:extended-plane-and-sphericality>

All complex numbers form a field that extends the real number field. A complex number $alpha + ii beta$ can be visualized on a rectangular plane as the point $(alpha, beta)$, with two axes: the real axis and the imaginary axis. It is well known that any complex number also has the polar form $r ee^(ii theta) = r (cos theta + ii sin theta)$.

The point at infinity, $oo$, extends $CC$ to
$ extcomplex = CC union {oo}. $
The following arithmetic operations are defined: for all $a in CC$,
$ a + oo = oo + a = oo, $
and for all $b in CC without {0}$,
$ b dot.c oo = oo dot.c b = oo, quad a / oo = 0. $

Let
$ S^2 = {(x_1, x_2, x_3) in RR^3 : x_1^2 + x_2^2 + x_3^2 = 1}. $
There exists a _stereographic projection_ of $S^2$ onto $extcomplex$. For every point other than $(0, 0, 1)$, there is a corresponding complex number
$ z = (x_1 + ii x_2) / (1 - x_3). $ <eq:extcomplexformula1>
This correspondence between $CC$ and $S^2 without {(0, 0, 1)}$ is injective. In fact, the inverse can be solved for:
$ abs(z)^2 = (1 - x_3^2) / (1 - x_3)^2 = (1 + x_3) / (1 - x_3), $
which results in
$ x_3 = (abs(z)^2 - 1) / (abs(z)^2 + 1), $
and consequently,
$
  x_1 = Re(z) (1 - x_3) = (z + overline(z)) / (abs(z)^2 + 1),
$
$
  x_2 = Im(z) (1 - x_3) = (z - overline(z)) / (ii abs(z)^2 + ii).
$
By letting $oo$ correspond to $(0, 0, 1)$, the bijection is complete. The sphere $S^2$ is also called the _Riemann sphere_. The region given by the disk $abs(z) < 1$ corresponds to $x_3 < 0$, and the region $abs(z) > 1$ corresponds to $x_3 > 0$.

We will now give a geometric visualization of this projection. Let $z = x + ii y$. Then we obtain
$ x = x_1 / (1 - x_3) quad "and" quad y = x_2 / (1 - x_3). $
Therefore,
$ x : y : 1 = x_1 : x_2 : 1 - x_3. $
It follows that the points $(0, 0, 0)$, $(x, y, 1)$, and $(x_1, x_2, 1 - x_3)$ are collinear in $RR^3$. Under the linear map
$ vb(v) mapsto vb(v) mat(1, 0, 0; 0, 1, 0; 0, 0, -1) + (0, 0, 1), $
we get that $(0, 0, 1)$, $(x, y, 0)$, and $(x_1, x_2, x_3)$ are collinear. In other words, this correspondence is a central projection with center $(0, 0, 1)$, projecting the points from $S^2 without (0, 0, 1)$ onto $CC$. Let this center correspond to $oo$. In this representation, $oo in extcomplex$ is no longer considered to be "special".

It is worth noting that in several geometric contexts, an alternative paradigm exists where we let $S$ be the sphere centered at $(0, 0, 1 / 2)$ of diameter $1$, and project points from the north pole $(0, 0, 1)$ onto the horizontal plane of tangency. The corresponding equations are then
$
  x_1 = Re(z) / (abs(z)^2 + 1), quad x_2 = Im(z) / (abs(z)^2 + 1), quad x_3 = abs(z)^2 / (abs(z)^2 + 1).
$
The forward projection remains unchanged. Lastly, we define the upper half-plane; for the following sections, let
$ HH^+ = {z in CC : Im(z) > 0} $
