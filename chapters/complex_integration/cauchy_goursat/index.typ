#import "/lib.typ": *

== The Cauchy--Goursat Theorem
It is important to know the differential 2-forms even for a single variable complex function. Consider $z=x+ii y$ and $overline(z)=x-ii y$. We can then define their corresponding differentials:

$ dz = dx + ii dy, quad dif overline(z) = dx - ii dy. $

The antisymmetric properties of differential forms still hold in complex space. By taking the wedge product of the two basis complex differential forms, we get

$
  dif overline(z) and dz & =(dx - ii dy) and (dx + ii dy) \
                         & =2 ii dx and dy.
$

Analogous to the real case, a 0-form is defined as a scalar-valued function in the form $f (z, overline(z))$, a 1-form in the form $omega_0 dz + omega_1 dif overline(z)$, and a 2-form as $omega_0 dz and dif overline(z)$. The exterior differential operator for this one-dimensional case is defined as $partial + overline(partial)$, where $partial = dz and pdv(, z)$ and $overline(partial) = dif overline(z) and pdv(, overline(z))$. Occasionally, one will informally use $partial$ and $overline(partial)$ as an abbreviation for $pdv(, z)$ and $pdv(, overline(z))$ respectively.

#theorem[Lusin Area Theorem][
  For a region $U subset CC$ and $f:U -> CC$ univalent, the area of the image $f(U)$ is equal to
  $ integral_U abs(f'(z))^2 dif A. $
] <thm:lusinarea>

#proof[
  We aim to find
  $ integral_(f(U)) dif A. $

  By the properties above,

  $
    integral_(f(U)) dif u and dif v & =(ii) / 2 integral_(f(U)) dif w and dif overline(w) = (ii) / 2 integral_U dif f(z) and dif overline(f(z)) \
    & =(ii) / 2 integral_U [f'(z) dz] and [overline(f'(z)) dif overline(z)] = integral_U abs(f'(z))^2 dx and dy,
  $

  as desired.
]

#remark[
  The Jacobian determinant of $u,v$ with respect to $x,y$, for a holomorphic function $f(z)=u(x,y)+ii v(x,y)$ is equal to
  $
    mat(delim: "|", u'_x, u'_y; v'_x, v'_y) = pdv(u, x) pdv(v, y) - pdv(u, y) pdv(v, x) = (pdv(u, x))^2 + (pdv(u, y))^2 = abs(f'(z))^2
  $
  by @eq:holomorphic_derivative_decomposition.
]
#theorem[Green's Theorem, Complex Form][
  Let $U subset CC$ be bounded with a piecewise smooth boundary $partial U$. For two scalar functions $omega_1=omega_1 (z,overline(z))$ and $omega_2=omega_2 (z,overline(z))$ satisfying $omega_1,omega_2 in C^1 (overline(U))$, define the 1-form $omega=omega_1 dz + omega_2 dif overline(z)$. Then,

  $ integral_(partial U)omega=integral_U dif omega. $ <eq:complex_green>
] <thm:complex_green>

#proof[
  For real-valued functions $xi_1,xi_2,eta_1,eta_2$, let
  $ omega_1=xi_1+ii eta_1 space.quad text("and let") space.quad omega_2=xi_2+ii eta_2. $

  Then,

  $
    omega & =(xi_1 + ii eta_1) dz + (xi_2 + ii eta_2) dif overline(z) \
          & =(xi_1 + ii eta_1) (dx + ii dy) + (xi_2 + ii eta_2) (dx - ii dy) \
          & =xi_1 dx + ii eta_1 dx + ii xi_1 dy - eta_1 dy + xi_2 dx + ii eta_2 dx - ii xi_2 dy + eta_2 dy \
          & =[(xi_1 + xi_2) dx + (eta_2 - eta_1) dy] + ii [(eta_1 + eta_2) dx + (xi_1 - xi_2) dy]
  $ <eq:complex_green_real_and_complex_dx_dy_intermediate>

  Each of $xi_1, xi_2, eta_1, eta_2$ are real-valued functions that can be represented with a domain of $RR^2$. By definition,

  $
    dif omega & =(partial + overline(partial)) (xi_1 + ii eta_1) dz + (partial + overline(partial)) (xi_2 + ii eta_2) dif overline(z) \
    & =(pdv(xi_1, overline(z)) + ii pdv(eta_1, overline(z))) dif overline(z) and dz + (pdv(xi_2, z) + ii pdv(eta_2, z)) dz and dif overline(z) \
    & =2 (ii pdv(xi_1, overline(z)) - pdv(eta_1, overline(z)) - ii pdv(xi_2, z) + pdv(eta_2, z)) dx and dy \
    & =(ii pdv(xi_1, x) - pdv(xi_1, y) - pdv(eta_1, x) - ii pdv(eta_1, y) - ii pdv(xi_2, x) - pdv(xi_2, y) + pdv(eta_2, x) - ii pdv(eta_2, y)) dx and dy \
    & =(pdv(eta_2, x) - pdv(xi_1, y) - pdv(eta_1, x) - pdv(xi_2, y)) dif A + ii (pdv(xi_1, x) - pdv(eta_1, y) - pdv(xi_2, x) - pdv(eta_2, y)) dif A.
  $<eq:complex_green_exterior_derivative_result>

  From @eq:complex_green_real_and_complex_dx_dy_intermediate, we can apply @thm:real_green. For the real component of $omega$, we obtain

  $
    integral.cont_(partial U)(xi_1+xi_2)dx+(eta_2-eta_1)dy=integral.double_U (pdv(eta_2, x)-pdv(xi_1, y)-pdv(eta_1, x)-pdv(xi_2, y))dx dy,
  $

  and for the imaginary component,

  $
    integral.cont_(partial U)(eta_1+eta_2)dx+(xi_1-xi_2)dy=integral.double_U (pdv(xi_1, x)-pdv(eta_1, y)-pdv(xi_2, x)-pdv(eta_2, y))dx dy,
  $

  and the integrands on the right side both match those of @eq:complex_green_exterior_derivative_result.
]

The theorem above is only a specific case of the Stokes--Cartan Theorem (@thm:stokescartan). However, it proves the validity of the treatment of the $partial$ and $overline(partial)$ operators, and the generalization to forms with basis $dz$ and $dif overline(z)$.

#theorem[Cauchy--Pompeiu][
  Let $U subset CC$ be bounded with a piecewise $C^1$ boundary $partial U$. Let $f(z)in C^1 (overline(U))$. Then $forall z in U without partial U$,

  $
    f(z)=1/taui (integral.cont_(partial U)(f(zeta))/(zeta-z)dzeta-integral_U pdv(f(zeta), overline(zeta))(dif overline(zeta) and dzeta)/(zeta-z)).
  $
] <thm:pompeiu>

#proof[
  Since $z in U without partial U$, $exists epsilon>0$ such that $D(z,epsilon)subset U$. Consider the complex differential form
  $ (f(zeta)dzeta)/(zeta-z) $

  with a singularity at $zeta=z$. Consider the region $U without D(z,epsilon)$. Since $f in C^1 (overline(U))$, by applying Green's Theorem (@thm:complex_green),

  $
    integral_(U without D(z, epsilon)) dif ((f(zeta) dzeta) / (zeta - z)) = integral.cont_(partial U) (f(zeta) dzeta) / (zeta - z) - integral.cont_(partial D(z, epsilon)) (f(zeta) dzeta) / (zeta - z).
  $ <eq:pompeiu_directintermediate>

  By properties of $dif$, the expression is equal to

  $
    integral_(U without D(z, epsilon)) (partial + overline(partial)) ((f(zeta)) / (zeta - z)) and dzeta & =integral_(U without D(z, epsilon)) pdv(, zeta) ((f(zeta)) / (zeta - z)) dzeta and dzeta \
    & quad""+ pdv(, overline(zeta)) ((f(zeta)) / (zeta - z)) dif overline(zeta) and dzeta.
  $

  The first term in the integrand vanishes as it contains $dzeta and dzeta$. The second term can be simplified using the fact that $pdv(, overline(zeta))(1 / (zeta - z)) = 0$, leading to

  $ integral_(U without D(z, epsilon)) pdv(f, overline(zeta)) dot (dif overline(zeta) and dzeta) / (zeta - z). $

  The rightmost term in @eq:pompeiu_directintermediate can be parameterized with $zeta = z + epsilon ee^(ii t)$, $t in [0, 2 uppi]$. Then,

  $
    integral.cont_(partial D(z, epsilon)) (f(zeta) dzeta) / (zeta - z) &=integral_0^(2 uppi) (f (z + epsilon ee^(ii t))) / (epsilon ee^(ii t)) dot ii epsilon ee^(ii t) dt \
    &=ii integral_0^(2 uppi) f(z + epsilon ee^(ii t)) dt \
    &=ii integral_0^(2 uppi) (f (z + epsilon ee^(ii t)) - f(z)) dt + ii integral_0^(2 uppi) f(z) dt.
  $

  Because $f in C^1 (overline(U))$, by @prop:c1_lipschitz, $f$ is Lipschitz continuous on $overline(U)$, and $exists M in RR_(>0)$ such that $forall z_0, z_1 in overline(U)$, $abs(f(z_1) - f(z_0)) <= M abs(z_1 - z_0)$. On $partial D(z,epsilon)$, we get that $abs(f(z + epsilon ee^(ii t)) - f(z)) <= M epsilon$. Therefore,
  $
    abs(integral_0^(2 uppi) [f(z + epsilon ee^(ii t)) - f(z)] dt) <= integral_0^(2 uppi) abs(f(z + epsilon ee^(ii t)) - f(z)) dt <= 2 M uppi epsilon,
  $
  which approaches 0 as $epsilon ->0$. Taking this limit, we obtain

  $
    taui f(z) = integral.cont_(partial U) (f(zeta) dzeta) / (zeta - z) - integral_U pdv(f, overline(zeta)) (dif overline(zeta) and dzeta) / (zeta - z) + lim_(epsilon -> 0) integral_(D(z, epsilon)) pdv(f, overline(zeta)) (dif overline(zeta) and dzeta) / (zeta - z).
  $ <eq:pompeiu_epsilonlimitintermediate>

  We then aim to prove that

  $
    lim_(epsilon -> 0) integral_(D(z, epsilon)) pdv(f, overline(zeta)) dot (dif overline(zeta) and dzeta) / (zeta - z) = 0.
  $ <eq:pompeiu_areadiskstatement>

  Notice that since $f in C^1 (overline(U))$, by @thm:continuous_function_bounded_on_compact, $exists M' in RR_(>0)$ such that $forall zeta in overline(U)$, $abs(pdv(f, overline(zeta))) <= M'$. Then,

  $
    lim_(epsilon -> 0) abs(integral_(D(z, epsilon)) pdv(f, overline(zeta)) dot (dif overline(zeta) and dzeta) / (zeta - z)) <= M' lim_(epsilon -> 0) abs(integral_(D(z, epsilon)) 1 / (zeta - z) dif overline(zeta) and dzeta).
  $

  By a change of variables to a polar coordinate system centered at $z$, we obtain

  $
    M' lim_(epsilon -> 0) abs(integral_(D(z, epsilon)) 1 / (r ee^(ii theta)) dif (z + r ee^(-ii theta)) and dif (z + r ee^(ii theta))),
  $
  and by expansion of the wedge product,

  $
    M' lim_(epsilon -> 0) abs(integral_(D(z, epsilon)) (2 ii) / (ee^(ii theta)) dr and dif theta) & = 2 M' lim_(epsilon -> 0) abs(integral_(D(z, epsilon)) 1 / (ee^(ii theta)) dr and dif theta) \
    & = 2 M' lim_(epsilon -> 0) abs(integral_0^(2 uppi) integral_0^epsilon ee^(-ii theta) dr dif theta) \
    & = 0.
  $

  Then from rearranging @eq:pompeiu_epsilonlimitintermediate, we obtain:

  $
    f(z) = 1 / (taui) (integral.cont_(partial U) (f(zeta) dzeta) / (zeta - z) - integral_U pdv(f, overline(zeta)) dot (dif overline(zeta) and dzeta) / (zeta - z)). #qedhere
  $
]

#corollary[Let $f:CC-> CC$ be a continuously differentiable, compactly supported function.
  Then
  $ f(z) = -1 / uppi integral.double_CC pdv(f, overline(zeta)) (dif xi dif eta) / (zeta - z) $
  for all $z in CC$ where $zeta=xi+ii eta$.] <cor:pompeiuwithoutcauchyterm>

#proof[Choose $R>0$ such that $D(0,R)supset op("supp")(f)$. By the Cauchy--Pompeiu Theorem (@thm:pompeiu), we have
  $
    f(z) = 1 / uppi (1 / (2 ii) integral.cont_(partial D(0, R)) (f(zeta) dzeta) / (zeta - z) - integral.double_(D(0, R)) pdv(f, overline(ζ)) (dif xi dif eta) / (zeta - z)).
  $

  Then the proof is complete given that $f$ vanishes on $partial D(0,R)$ and by letting $R -> oo$.]

In complex analysis, when integrating over a region that contains a singularity, it is common to exclude a small disk of radius $epsilon$ around the singularity, perform the integration over the punctured region, and then take the limit as $epsilon ->0$. As in the proof above, the displayed estimate for the integral over the removed disk is still necessary in confirmation, although it is typically tacitly elided.

From the above result, we can directly obtain the following theorem:

#theorem[Cauchy's Integral Formula][
  Let $U subset CC$ be an open region with a piecewise $C^1$ boundary $partial U$, and let $f in C^1 (overline(U))$ be holomorphic on $U$. Then for all $z in U$,

  $
    f(z) = 1 / (taui) integral.cont_(partial U) (f(zeta)) / (zeta - z) dzeta.
  $ <eq:cauchyintegralformula>
] <thm:cauchyintegralformula>

#proof[
  By @eq:wirtingerderivative2, for $f (zeta,overline(zeta))$, $pdv(f, overline(zeta))=0$. Applying the Cauchy--Pompeiu Theorem (@thm:pompeiu), the area integral vanishes, and @eq:cauchyintegralformula consequently follows.
]

#theorem[Cauchy's Integral Theorem][
  Let $U subset CC$ be an open region with piecewise $C^1$ boundary $partial U$. For a function $f(z)in C^1 (overline(U))$ holomorphic over $U$,
  $ integral.cont_(partial U) f(zeta) dzeta = 0. $
] <thm:cauchyintegraltheorem>

#proof[
  Let $z in U$ be fixed, and suppose $psi(zeta)=(zeta-z) f(zeta)$. Applying @thm:cauchyintegralformula on $psi(zeta)$, we obtain
  $
    0 = 1 / (taui) integral.cont_(partial U) (psi(zeta)) / (zeta-z) dzeta = 1 / (taui) integral.cont_(partial U) f (zeta) dzeta.
  $

  Alternatively, we can use Green's Theorem (@thm:complex_green) with $omega=f(zeta)dzeta$:

  $
    integral.cont_(partial U) f(zeta) dzeta = integral.cont_(partial U) omega = integral_U dif omega = integral_U pdv(f, overline(zeta)) dif overline(zeta) and dzeta = 0. #qedhere
  $]

#theorem[Solution to the one-dimensional $overline(partial)$-problem][
  For a compactly supported function $psi(z)in C^1 (CC)$, a solution satisfying $u(z)in C^1 (CC)$ to the non-homogeneous Cauchy--Riemann equation
  $ pdv(u(z), overline(z))=psi(z) $
  is

  $
    u(z) = -1 / taui integral_CC (psi(zeta)) / (zeta - z) dif overline(zeta) and dzeta.
  $ <eq:one_dimensional_partial_conjugate_solution>
] <thm:one_dimensional_partial_conjugate_solution>

#proof[Split $CC$ into $CC without D (z, epsilon)$ and $overline(D (z, epsilon))$. For all $epsilon > 0$, the integral
  $ -1 / (taui) integral_(CC without D (z, epsilon)) (psi(zeta)) / (zeta - z) dif overline(zeta) and dzeta $
  is continuous. Since $psi(zeta)$ is compactly supported over $CC$ and continuous, by @thm:continuous_function_bounded_on_compact, it is bounded. Then the limit
  $
    lim_(epsilon -> 0) (-1 / (taui) integral_(D(z, epsilon)) (psi(zeta)) / (zeta - z) dif overline(zeta) and dzeta) = 0.
  $

  Therefore, @eq:one_dimensional_partial_conjugate_solution is continuous. A trivial substitution can be used to rewrite
  $ u(z) = 1 / (taui) integral_CC (psi(zeta + z)) / zeta dif zeta and dif overline(zeta) $
  Then,

  $
    (u(z + Delta z) - u (z)) / (Delta z) = 1 / (taui) integral_CC (psi(zeta + z + Delta z) - psi (zeta + z)) / (Delta z zeta) dif zeta and dif overline(zeta).
  $ <eq:one_dimensional_partial_conjugate_solution_differenceexpr>

  For a fixed $z$, the value of
  $ (psi(zeta + z + Delta z) - psi (zeta + z)) / (Delta z) $
  tends to $pdv(psi (zeta + z), zeta)$ as $Delta z -> 0$. Because $zeta mapsto psi(zeta + z)$ has compact support and is $C^1$, by @prop:c1_lipschitz, it is Lipschitz continuous for a constant $M$. Let $abs(Delta z) < 1$ and let $K = {w in CC : inf_(zeta in op("supp") psi) abs(w - zeta) <= 1}$ be a neighborhood of the support of $psi$. Then,
  $ abs((psi(zeta + z + Delta z) - psi(zeta + z)) / (Delta z)) <= M, $
  and specifically, when $zeta + z in.not K$,
  $ (psi(zeta+z+Delta z)-psi (zeta+z))/(Delta z)=0. $

  As shown above, the integrand is uniformly bounded by $M$, which has a convergent integral of $integral_K M dif zeta and dif overline(zeta)$, the limit $Delta z ->0$ may commute with the integral in @eq:one_dimensional_partial_conjugate_solution_differenceexpr. Let $zeta=xi+ii eta$. From the real axis,

  $
    pdv(u, x)(z) = 1 / taui integral_CC pdv(psi, xi) (zeta + z) (dzeta and dzetabar) / zeta = 1 / taui integral_CC pdv(psi(zeta), xi) (dzeta and dzetabar) / (zeta - z).
  $ <eq:one_dimensional_partial_conjugate_solution_differenceexpr_realaxisderivative>

  From the imaginary axis,

  $
    pdv(u, y)(z) = 1 / taui integral_CC pdv(psi, eta) (zeta + z) (dzeta and dzetabar) / zeta = 1 / taui integral_CC pdv(psi(zeta), eta) (dzeta and dzetabar) / (zeta - z).
  $ <eq:one_dimensional_partial_conjugate_solution_differenceexpr_imaginaryaxisderivative>

  Since $psi in C^1 (CC)$ and has Lipschitz constant $M$, @eq:one_dimensional_partial_conjugate_solution_differenceexpr_realaxisderivative, @eq:one_dimensional_partial_conjugate_solution_differenceexpr_imaginaryaxisderivative are both continuous (by the same argument for the continuity of $u(z)$). Thus, $u in C^1(CC)$. It follows from the two equations that
  $
    pdv(u, overline(z)) = 1 / (taui) integral_CC pdv(psi, overline(zeta)) dot 1 / (zeta - z) dzeta and dif overline(zeta) = 1 / (taui) integral_K pdv(psi, overline(zeta)) dot 1 / (zeta - z) dzeta and dif overline(zeta).
  $

  By @cor:pompeiuwithoutcauchyterm,
  $ pdv(u, overline(z))=psi(z). #qedhere $
]

#remark[In the first part, we established that a function $psi(z)in C^0(CC)$ with compact support satisfies
  $ u(z) = -1 / (taui) integral_CC (psi(zeta)) / (zeta - z) dif overline(zeta) and dzeta in C^0(CC). $

  If $psi(z)in C^1(CC)$, then the first order derivatives of $u(z)$ can be written in the same form (@eq:one_dimensional_partial_conjugate_solution_differenceexpr_realaxisderivative, @eq:one_dimensional_partial_conjugate_solution_differenceexpr_imaginaryaxisderivative) since $pdv(psi, xi),pdv(psi, eta)in C^0(CC)$ and are also compactly supported. Then they too are continuous functions, and $u(z)in C^1(CC)$.

  Then using the same argument, In general, for $psi(z)in C^k (CC)$, the same process can be used recursively to find that $u(z)in C^k (CC)$ as well.

  If the support of $psi(z)$ is the union of infinitely many or finitely many disjoint compact sets, then the integral in @eq:one_dimensional_partial_conjugate_solution can be split into a sum of integrals over each compact set, and the same argument applies to each term.]

When Cauchy formalized @thm:cauchyintegralformula, @thm:cauchyintegraltheorem, he included the necessary condition that $f(z)in C^1 (overline(U))$. It was later shown that all such holomorphic functions had holomorphic derivatives, and this condition was thus later dropped by Goursat:

#lemma[
  Let $f:G -> CC$ be a continuous function defined for a region $G subset.eq CC$. Let $Gamma subset G$ be a rectifiable piecewise smooth curve. Then $forall epsilon > 0$, there exists a polygonal chain $P subset G$ inscribing $Gamma$ (each vertex lies on $Gamma$) where
  $ abs(integral_Gamma f(z) dz - integral_P f(z) dz) < epsilon. $
] <lem:integralpiecewisesmoothtopolygonalchain>

#proof[
  Because $f in C^0(G)$, there is a compact set $D subset.eq G$ enclosing $Gamma$ and is the closure of some open set. By @thm:heinecantor, $forall epsilon > 0$, $exists delta > 0$ such that $forall z', z'' in D$ satisfying $abs(z'' - z') < delta$, $abs(f (z'') - f (z')) < epsilon$. Partition $Gamma$ into $n in NN$ curves $gamma_0, gamma_1, dots, gamma_(n - 1)$ between points $z_0, z_1, dots z_n$ such that $forall k in {0, 1, dots, n - 1}$ the length of $gamma_k$ is less than $delta$. For all $k in {0, 1, dots, n - 1}$, let $l_k$ denote the straight line segment connecting $z_k$ and $z_(k + 1)$. The length of $l_k$ is less than $delta$ as well. Then let
  $ P=union.big_(k=0)^(n-1)l_k. $
  Over the partition formed with $gamma_k$, the integral

  $ integral_Gamma f(z)dz $
  can be approximated with the Riemann sum
  $ S=sum_(k=0)^(n-1)f (z_k)Delta z_k $
  where
  $ Delta z_k=z_(k + 1)-z_k=integral_(gamma_k)dz=integral_(l_k)dz. $

  Then the sum above can be written as
  $ S=sum_(k=0)^(n-1)integral_(gamma_k)f (z_k)dz=sum_(k=0)^(n-1)integral_(l_k)f (z_k)dz, $
  and it follows that
  $
    abs(integral_Gamma f(z) dz - S) = abs(sum_(k=0)^(n-1) integral_(gamma_k) [f(z) - f (z_k)] dz) < epsilon dot length(Gamma)
  $
  and
  $
    abs(integral_P f(z) dz - S) = abs(sum_(k=0)^(n-1) integral_(l_k) [f(z) - f (z_k)] dz) < epsilon dot length(P) < epsilon dot length(Gamma)
  $
  where $length(Gamma)$ is the length of $Gamma$ and $length(P)$ is the length of $P$. Then,
  $
    abs(integral_Gamma f(z) dz - integral_P f(z) dz) & <= abs(integral_Gamma f(z) dz - S) + abs(integral_P f(z) dz - S) \
                                                     & <= 2 epsilon dot length(Gamma). #qedhere
  $
]

#lemma(
  "Goursat",
)[
  Given a holomorphic function $f(z)$ on a simply connected region $U subset.eq CC$, for any piecewise $C^1$ closed curve $Gamma subset U$,

  $
    integral.cont_Gamma f(zeta)dzeta=0.
  $ <eq:cauchyintegraltheoremoversimplyconnectedset_statement>
] <lem:cauchyintegraltheoremoversimplyconnectedset>
#figure-wrapper(
  [
    #figure(
      cetz.canvas({
        import cetz.draw: *
        let A = (0, 2)
        let B = (2.3, 0.5)
        let C = (4, 1)
        let D = (5, 3.5)
        let E = (2, 4)

        line(A, B, C, D, E, stroke: 1pt, close: true)
        line(B, E, stroke: 1pt)
        line(C, E, stroke: 1pt)

        for pts in ((B, E), (E, B), (E, A), (B, C), (A, B), (C, E), (E, C), (D, E), (C, D)) {
          halflength-arrow(..pts, scalar: 0.15)
        }

        content(A, [$A$], anchor: "east", padding: .15cm)
        content(B, [$B$], anchor: "north", padding: .15cm)
        content(C, [$C$], anchor: "west", padding: .15cm)
        content(D, [$D$], anchor: "south", padding: .15cm)
        content(E, [$E$], anchor: "south", padding: .15cm)
      }),
      caption: [Closed triangulated polygonal chain],
    )
    <fig:cauchy_integral_theorem_over_simply_connected_set_closed_polygonal_chain_triangulation>
  ],
  [
    #figure(
      cetz.canvas({
        let A = (0, 0)
        let E = (2.7, 0)
        let F = (1.8, 2)
        let C = cvector.add(E, cvector.sub(E, A))
        let D = cvector.add(F, cvector.sub(E, A))
        let B = cvector.add(F, cvector.sub(F, A))

        cetz.draw.line(A, F, E, stroke: 1pt, close: true)
        cetz.draw.line(B, D, F, stroke: 1pt, close: true)
        cetz.draw.line(C, D, E, stroke: 1pt, close: true)

        for (i, points) in ((A, F, E), (B, D, F), (C, D, E), (F, D, E)).enumerate(start: 1) {
          let result = cvector.scale(points.fold((0, 0), cvector.add), 1 / (points.len()))
          cetz.draw.content(result, [$Delta_#i$], anchor: "center")
        }

        for pts in (
          (F, A),
          (B, F),
          (D, E),
          (E, D),
          (E, F),
          (D, B),
          (C, D),
          (F, E),
          (A, E),
          (E, C),
          (F, D),
          (D, F),
        ) {
          halflength-arrow(
            ..pts,
            scalar: 0.15,
          )
        }

        let AE = (A, .5, E)
        let AF = (A, .5, F)
        let FD = (F, .5, D)
        let BF = (B, .5, F)
        let EC = (E, .5, C)
      }),
      caption: [Quadrisection of $jinterior Delta$],
    )<fig:cauchy_integral_theorem_over_simply_connected_set_triangle_quadrisection>
  ],
)
#proof[
  By @lem:integralpiecewisesmoothtopolygonalchain, $forall epsilon > 0$, there is a closed polygonal chain $P$ where

  $
    abs(integral.cont_Gamma f(z) dz - integral.cont_P f(z) dz) < epsilon.
  $ <eq:cauchyintegraltheoremoversimplyconnectedset_chaindefinition>
  The statement we aim to prove is equivalent to proving that

  $ integral.cont_P f(z)dz=0. $ <eq:cauchyintegraltheoremoversimplyconnectedset_chainvanishingstatement>

  Since $P$ is a closed polygonal chain, we can triangulate the interior. For example, consider @fig:cauchy_integral_theorem_over_simply_connected_set_closed_polygonal_chain_triangulation, where
  $
    integral.cont_(penta A B C D E) f(z) dz & =(integral_sray(A B) + integral_sray(B C) + integral_sray(C D) + integral_sray(D E) + integral_sray(E A)) f(z) dz \
    & quad""+(integral_sray(B E) + integral_sray(E B) + integral_sray(C E) + integral_sray(E C)) f(z) dz \
    & =integral.cont_(Delta A B E) f(z) dz + integral.cont_(Delta B C E) f(z) dz + integral.cont_(Delta C D E) f(z) dz.
  $
  Thus, if the integral over every triangle in $U$ vanishes, then @eq:cauchyintegraltheoremoversimplyconnectedset_statement follows. Consider a triangle in $U$ with boundary $Delta$. Then define $M$ to be
  $ M = abs(integral.cont_(Delta) f(z) dz). $

  We can quadrisect the triangle bounded by $Delta$ into four triangles with boundaries $Delta_1,Delta_2,Delta_3,Delta_4$ as in @fig:cauchy_integral_theorem_over_simply_connected_set_triangle_quadrisection. Then one of $Delta_1$, $Delta_2$, $Delta_3$, or $Delta_4$ (denote this to be $Delta^1$) satisfy

  $ abs(integral.cont_(Delta^1) f(z) dz) >= M / 4, $

  and recursively, choose

  $
    abs(integral.cont_(Delta^2) f(z) dz) >= M / 4^2, dots, abs(integral.cont_(Delta^n) f(z) dz) >= M / 4^n.
  $ <eq:cauchyintegraltheoremoversimplyconnectedset_trianglelowerbound>

  Let $L$ denote the perimeter of $Delta$. Then, the perimeters of $Delta^1,Delta^2,dots$ respectively are $(L)/(2),(L)/(2^2),dots$. As $n -> oo$, $Delta_n$ shrinks to a single point $z_0$. Then, $forall n in NN$, $z_0 in Delta^n$.

  By the definition of holomorphy, $forall epsilon > 0$, $exists delta > 0$ such that $forall z in D(z_0, delta)$,
  $ abs((f(z) - f(z_0)) / (z - z_0) - f'(z_0)) < epsilon, $

  $ abs(f(z) - f(z_0) - f'(z_0) (z - z_0)) < epsilon abs(z - z_0), $
  and $exists N in NN$ such that $forall n in NN_(>N)$, $Delta^n subset D (z_0, delta)$. By @thm:cauchyintegraltheorem, since the functions $z -> 1$ and $z -> z$ are both entire,
  $ integral.cont_(Delta^n)dz=0, wide integral.cont_(Delta^n)z dz=0. $
  Then

  $
    integral.cont_(Delta^n) f(z) dz & = integral.cont_(Delta^n) f(z) dz - f (z_0) integral.cont_(Delta^n) dz - f'(z_0) (integral.cont_(Delta^n) z dz - z_0 integral.cont_(Delta^n) dz) \
    & = integral.cont_(Delta^n) [f(z) - f (z_0) - f'(z_0) (z - z_0)] dz.
  $

  Because the distance between any two points in the interior of a triangle is always less than its perimeter, using the triangle inequality for complex integrals,
  $
    abs(integral.cont_(Delta^n) [f(z) - f (z_0) - f'(z_0) (z - z_0)] dz) &<= epsilon integral.cont_(Delta^n) abs(z - z_0) abs(dz) \ &= (epsilon L) / 2^n integral.cont_(Delta^n) abs(dz) = (epsilon L^2) / 4^n.
  $

  Comparing the above equation with @eq:cauchyintegraltheoremoversimplyconnectedset_trianglelowerbound,
  $ M / 4^n < epsilon L / 4^n, quad M < epsilon L. $
  Since $Delta$ is rectifiable, $L$ is finite, and letting $epsilon ->0$, we find that $M ->0$. Then, for every triangle in $U$, the integral vanishes, and @eq:cauchyintegraltheoremoversimplyconnectedset_chainvanishingstatement, @eq:cauchyintegraltheoremoversimplyconnectedset_chaindefinition follow.
]
#theorem[Cauchy--Goursat][
  Let $U subset CC$ be an open region bounded with boundary $partial U$. Let $f:U -> CC$ be a holomorphic function continuous on $overline(U)$. Then,
  $ integral.cont_(partial U) f(zeta) dzeta = 0. $
] <thm:cauchygoursattheorem>
#figure-wrapper(
  [
    #figure(
      {
        import cetz.draw: *
        let maxx = 6
        let maxy = 6
        let width = 4
        let height = 3
        let slantoffset = 0.7
        let primeoffset = 0.7
        let numoffset = 0.9

        let M = (1, 1.5)
        let P = cvector.add(M, (0, height))
        let N = cvector.add(M, (width, slantoffset))
        let Q = cvector.add(N, (0, height))
        let (Mp, Np) = (M, N).map(point => cvector.add(point, (0, primeoffset)))
        let (Pp, Qp) = (P, Q).map(point => cvector.add(point, (0, -primeoffset)))

        quick-plot(canvas: {
          let MNpoints = offset => {
            (
              ..directional_points(angle: -90deg),
              (width * .25, slantoffset * .3),
              (width * .4, -slantoffset * .2),
              (width * .7, slantoffset * .2),
              (width * .85, slantoffset * .1),
              ..directional_points(offset: (width, slantoffset), angle: -90deg).rev(),
            ).map(point => cvector.add(offset, point))
          }

          let PQpoints = offset => {
            (
              ..directional_points(angle: 90deg),
              (width * .25, slantoffset * .2),
              (width * .4, slantoffset * .2),
              (width * .6, slantoffset * 1.2),
              (width * .8, slantoffset * 1.1),
              ..directional_points(offset: (width, slantoffset), angle: 90deg).rev(),
            ).map(point => cvector.add(offset, point))
          }

          let arrowed_mark_start = (start: (symbol: ">>", pos: 50%, shorten-to: none, fill: black))
          let arrowed_mark_end = (end: (symbol: ">>", pos: 50%, shorten-to: none, fill: black))

          line(M, P, mark: arrowed_mark_start)
          line(N, Q, mark: arrowed_mark_end)
          hobby(..MNpoints(M), name: "MN", mark: arrowed_mark_end)
          hobby(..PQpoints(P), name: "PQ", mark: arrowed_mark_start)

          hobby(..MNpoints(Mp), stroke: 0.5pt, name: "M'N'", mark: arrowed_mark_end)
          hobby(..PQpoints(Pp), stroke: 0.5pt, name: "P'Q'", mark: arrowed_mark_start)

          hide({
            line((M.at(0) + numoffset, 0), (M.at(0) + numoffset, maxy), name: "left_vertical_test_line")
            line((N.at(0) - numoffset, 0), (N.at(0) - numoffset, maxy), name: "right_vertical_test_line")
          })

          let sort = (ctx, intersections) => {
            intersections.map(i => if (0 < i.at(1) and i.at(1) < maxy) { i }).filter(e => e != none)
          }

          intersections("left_vertical_intersections_MN", "left_vertical_test_line", "MN", sort: sort)
          intersections("right_vertical_intersections_MN", "right_vertical_test_line", "MN", sort: sort)
          intersections("left_vertical_intersections_PQ", "left_vertical_test_line", "PQ", sort: sort)
          intersections("right_vertical_intersections_PQ", "right_vertical_test_line", "PQ", sort: sort)

          let M1 = "left_vertical_intersections_MN.0"
          let N1 = "right_vertical_intersections_MN.0"
          let P1 = "left_vertical_intersections_PQ.0"
          let Q1 = "right_vertical_intersections_PQ.0"

          let M1p = (rel: (0, primeoffset), to: M1)
          let N1p = (rel: (0, primeoffset), to: N1)
          let P1p = (rel: (0, -primeoffset), to: P1)
          let Q1p = (rel: (0, -primeoffset), to: Q1)

          line((M1, "|-", (0, 0)), M1, stroke: (thickness: 0.5pt, dash: "dashed"))
          line((N1, "|-", (0, 0)), N1, stroke: (thickness: 0.5pt, dash: "dashed"))

          line(M, (M, "|-", (0, 0)), stroke: (thickness: 0.5pt, dash: "dashed"))
          line(N, (N, "|-", (0, 0)), stroke: (thickness: 0.5pt, dash: "dashed"))

          line(M1, P1, stroke: 0.5pt, mark: arrowed_mark_start)
          line(N1, Q1, stroke: 0.5pt, mark: arrowed_mark_end)

          let content_groups = (
            ((M, M1, N1, N), ([$M$], [$M_1$], [$N_1$], [$N$]), 215deg),
            ((Mp, M1p, N1p, Np), ([$M'$], [$M'_1$], [$N'_1$], [$N'$]), 215deg),
            ((P, P1, Q1, Q), ([$P$], [$P_1$], [$Q_1$], [$Q$]), 210deg),
            ((Pp, P1p, Q1p, Qp), ([$P'$], [$P'_1$], [$Q'_1$], [$Q'$]), 210deg),
          )
          let anchors_list = ("east", none, "north-east", "west")
          for (vars, labels, second_anchor) in content_groups {
            for i in range(4) {
              let anchor = if i == 1 { second_anchor } else { anchors_list.at(i) }
              content(vars.at(i), labels.at(i), anchor: anchor, padding: .05cm)
              for j in range(4) { circle(vars.at(j), radius: 0.04cm, fill: black) }
            }
          }
          for vars in ((M, Mp, "east"), (N, Np, "west"), (P, Pp, "east"), (Q, Qp, "west")) {
            content((vars.at(0), 50%, vars.at(1)), [$eta$], anchor: vars.at(2), padding: .05cm)
          }

          content((M.at(0), 0), [$a$], anchor: "north", padding: .1cm)
          content((N.at(0), 0), [$b$], anchor: "north", padding: .1cm)
          content((M.at(0) + numoffset, 0), [$a+epsilon$], anchor: "north", padding: .1cm)
          content((N.at(0) - numoffset, 0), [$b-epsilon$], anchor: "north", padding: .1cm)
        })
      },
      kind: auto,
      caption: [A simplified region containing two vertical lines and two continuous, rectifiable curves.],
    ) <fig:cauchy_goursat_theorem_simplified_region>
  ],
)
#proof[
  Since $partial U inter U=emptyset$ and $f(z)$ is not necessarily holomorphic over $overline(U)$, we cannot directly apply @lem:cauchyintegraltheoremoversimplyconnectedset.

  First assume $U$ has the shape of $M N Q P$ in @fig:cauchy_goursat_theorem_simplified_region. That is, $U$ consists of $x = a$, $x = b$ for $a < b$, and two rectifiable $C^0$ curves $ray(M N): y = phi.alt(x)$ and $ray(Q P): y = psi(x)$ such that $phi.alt(x) < psi(x)$, $forall a <= x <= b$.

  For some $epsilon > 0$, $eta > 0$, construct a new curve $M'_1N'_1Q'_1P'_1 in U$ to be the boundary of the region bounded by $P_1M_1: x = a + epsilon$, $N_1Q_1: x = b - epsilon$, $M'N': phi.alt(x) + eta$, and $Q'P': psi(x) - eta$ such that $M'_1N'_1Q'_1P'_1$ remains simple. By @lem:cauchyintegraltheoremoversimplyconnectedset,
  $ integral.cont_(M'_1N'_1Q'_1P'_1)f(z)dz=0. $

  By @thm:heinecantor, $f(z)$ is uniformly continuous over $overline(U)$, and therefore $forall epsilon' > 0$, we can choose $eta > 0$ so that $forall z in ray(M'_1 N'_1)$, $abs(f(z) - f(z - eta)) < epsilon'$ is satisfied. Letting $eta -> 0$ with $epsilon' -> 0$ and fixing $epsilon > 0$, we get that

  $
    abs(integral_sray(M'_1 N'_1) f(z) dz - integral_sray(M_1 N_1) f(z) dz) & <= integral_sray(M'_1 N'_1) abs(f(z) - f(z - eta)) abs(dz) \
    & < epsilon' integral_sray(M'_1 N'_1) abs(dz) -> 0,
  $

  and consequently,

  $
    integral_sray(M'_1 N'_1) f(z) dz -> integral_sray(M_1 N_1) f(z) dz.
  $ <eq:cauchygoursattheorem_innerinnerhorizontaltoouterinnerhorizontal1>

  Under the same limit, we get

  $
    integral_sray(Q'_1 P'_1) f(z) dz -> integral_sray(Q_1 P_1) f(z) dz.
  $ <eq:cauchygoursattheorem_innerinnerhorizontaltoouterinnerhorizontal2>
  By the continuity of $f(z)$ over a compact set,

  $
    integral_sray(P'_1 M'_1) f(z) dz -> integral_sray(P_1 M_1) f(z) dz, integral_sray(N'_1 Q'_1) f(z) dz -> integral_sray(N_1 Q_1) f(z) dz.
  $ <eq:cauchygoursattheorem_innerinnerverticaltoouterinnervertical>

  Then letting $epsilon -> 0$, for the same reason as @eq:cauchygoursattheorem_innerinnerverticaltoouterinnervertical, @eq:cauchygoursattheorem_innerinnerhorizontaltoouterinnerhorizontal1, @eq:cauchygoursattheorem_innerinnerhorizontaltoouterinnerhorizontal2 yield
  $
    integral_sray(M_1 N_1) f(z) dz -> integral_sray(M N) f(z) dz, integral_sray(Q_1 P_1) f(z) dz -> integral_sray(Q P) f(z) dz.
  $

  We are left to show the subsequent limits of the results from @eq:cauchygoursattheorem_innerinnerverticaltoouterinnervertical. For the left integral, let $y_(phi.alt) = max(phi.alt(a), phi.alt(a + epsilon))$ and $y_psi = max(psi(a), psi(a + epsilon))$.

  Then,
  $
    integral_sray(P M) f(z) dz = ii integral_(psi(a))^(phi.alt(a)) f(a + ii y) dy = ii (integral_(psi(a))^(y_(phi.alt)) + integral_(y_(phi.alt))^(y_psi) + integral_(y_psi)^(phi.alt(a))) f(a + ii y) dy.
  $

  Similarly,
  $
    integral_sray(P_1 M_1) f(z) dz = ii (integral_(psi(a + epsilon))^(y_(phi.alt)) + integral_(y_(phi.alt))^(y_psi) + integral_(y_psi)^(phi.alt(a + epsilon))) f(a + epsilon + ii y) dy.
  $

  The difference $(integral_sray(P M) - integral_sray(P_1 M_1)) f(z) dz$ between the two is then equal to

  $
    ii integral_(y_(phi.alt))^(y_psi) (f(a + ii y) - f(a + epsilon + ii y)) dy + ii (integral_(psi(a))^(y_(phi.alt)) + integral_(y_psi)^(phi.alt(a))) f(a + ii y) \
    ""- ii (integral_(psi(a + epsilon))^(y_(phi.alt)) + integral_(y_psi)^(phi.alt(a + epsilon))) f(a + epsilon + ii y).
  $

  The first term vanishes by uniform continuity, through the same argument used for $M'_1N'_1 -> M_1N_1$, and the remaining four integrals all tend to $0$ because they are taken over degenerating intervals. As $epsilon -> 0$, $y_(phi.alt) -> phi.alt(a)$ and $y_psi -> psi(a)$ because $phi.alt, psi in C^0$. Therefore,
  $ integral_sray(P_1 M_1) f(z) dz -> integral_sray(P M) f(z) dz, $

  and through similar logic,
  $ integral_sray(N_1 Q_1) f(z) dz -> integral_sray(N Q) f(z) dz. $
  Therefore,
  $ integral.cont_(M N Q P) f(z) dz = 0. $

  Any open region $U subset CC$ with a simple closed boundary can be broken up into smaller regions with the same form as $M N Q P$ with finitely many auxiliary lines. Then the conclusion follows.]

#remark[
  The theorem is also valid for any multiply connected region (in which case its boundary will consist of multiple curves of differeng orientations) as a multiply connected region is equal to the union of several simply connected regions with vertical auxiliary lines between.

  Additionally, if $U subset CC$ is simply connected and $f$ is holomorphic on $U$, then for any two points $z,z_0 in U$, the integral
  $ integral_(z_0)^z f(zeta)dzeta $
  is well-defined and independent of the path taken from $z_0$ to $z$. In this sense, holomorphic functions behave analogously to potential fields.
]

#theorem[Cauchy--Goursat][
  Let $U subset CC$ be an open region bounded with a simple closed boundary $partial U$, and let $f:U -> CC$ be a holomorphic function continuous on $overline(U)$. Then for all $z in U$,

  $
    f(z) = 1 / (taui) integral.cont_(partial U) (f(zeta)) / (zeta - z) dzeta.
  $ <eq:cauchygoursatformula>
] <thm:cauchygoursatformula>

#proof[
  By the Cauchy--Goursat Theorem (@thm:cauchygoursattheorem),
  $
    integral_(partial (U without D(z, epsilon))) (f(zeta)) / (zeta - z) dzeta = integral.cont_(partial U) (f(zeta)) / (zeta - z) dzeta - integral.cont_(partial D(z, epsilon)) (f(zeta)) / (zeta - z) dzeta = 0.
  $

  From rearrangement,
  $
    integral.cont_(partial U) (f(zeta)) / (zeta - z) dzeta = taui f(z) + ii integral_0^(2 uppi) [f (z + epsilon ee^(ii t)) - f(z)] dt.
  $

  Since $f in C^0(partial D(z,epsilon))$, as $epsilon ->0$,

  $
    abs(integral_0^(2 uppi) [f (z + epsilon ee^(ii t)) - f(z)] dt) & <= integral_0^(2 uppi) abs(f (z + epsilon ee^(ii t)) - f(z)) dt \
    & <= 2 uppi max_(t in [0, 2 uppi]) abs(f (z + epsilon ee^(ii t)) - f(z)) -> 0.
  $

  By rearrangement,
  $ f(z) = 1 / (taui) integral.cont_(partial U) (f(zeta)) / (zeta - z) dzeta. #qedhere $]

#remark[
  In the proof of @thm:pompeiu, we used Lipschitz continuity for a smooth function, which was a stronger condition than necessary. The true necessity of smoothness was to be able to apply Green's Theorem (@thm:complex_green).
]

This profound theorem is extremely important and helpful in complex integration and essential in the evaluation of integrals, as demonstrated below.

#example[
  Evaluate the integral $integral.cont_(partial D(0, 2)) dz / (z^n - 1)$, where $n in NN_(>= 2)$.
] <ex:cauchygoursatformulazeroofunity>

#solution[to @ex:cauchygoursatformulazeroofunity][
  Since $z^n - 1 = product_(k = 0)^(n - 1) (z - omega_n^k)$, where $omega_n^k = ee^(taui k / n)$, the integrand has singularities at every $n$-th root of unity. Then the integral is equal to:

  $
    integral.cont_(partial D(0, 2)) dz / (product_(j = 0)^(n - 1) (z - omega_j)) = integral.cont_(partial D(0, 2)) sum_(j = 0)^(n - 1) (c_j) / (z - omega_j) dz,
  $ <eq:cauchygoursatformulazerosofunity>

  where $c_j$ are the coefficients of the partial fraction decomposition. By the Cauchy--Goursat Formula (@thm:cauchygoursatformula), @eq:cauchygoursatformulazerosofunity becomes:
  $ sum_(k = 0)^(n - 1) integral.cont_(partial D(0, 2)) (c_k) / (z - omega_k) dz = taui sum_(k = 0)^(n - 1) c_k. $

  Observe that $sum_(k = 0)^(n - 1) c_k = lim_(z -> oo) sum_(k = 0)^(n - 1) (z c_k) / (z - omega_k) = lim_(z -> oo) z / (z^n - 1) = 0$ since $n >= 2$. Therefore,
  $ integral.cont_(partial D(0, 2)) dz / (z^n - 1) = 0. #qedhere $
]

We have also already seen the utility of parameterization via a polar transformation. Many useful identities in classical calculus can also be derived from concepts in its generalization:

#example[
  Prove that $forall n in NN$,
  $ integral_0^(2 uppi) cos^(2n) theta dif theta = 2 uppi product_(k = 1)^n (2k - 1) / (2k). $
]<ex:cosine_power_integral>

#solution[to @ex:cosine_power_integral][
  Consider the integral
  $ integral.cont_(partial bb(D)) (z + 1 / z)^(2n) dz / z. $

  Letting $z = ee^(ii theta)$, we get $integral.cont_(partial bb(D)) (ee^(ii theta) + ee^(-ii theta))^(2n) ee^(-ii theta) dz = 2^(2n) ii integral_0^(2 uppi) cos^(2n) theta dif theta$. Alternatively, we can expand the integrand and get
  $
    integral.cont_(partial bb(D)) sum_(k = 0)^(2n) binom(2n, k) z^(2k - 2n) dz / z = sum_(k = 0)^(2n) integral.cont_(partial bb(D)) binom(2n, k) z^(2k - 2n - 1) dz.
  $

  When $2k - 2n - 1 >= 0$, the integrand is holomorphic. The integral is then equal to
  $
    binom(2n, 0) integral.cont_(partial bb(D)) z^(-2n - 1) dz + binom(2n, 1) integral.cont_(partial bb(D)) z^(-2n + 1) dz + dots.c + binom(2n, n) integral.cont_(partial bb(D)) dz / z = taui binom(2n, n),
  $

  since all the higher order terms vanish:

  $
    integral.cont_(partial bb(D)) z^(2k - 2n - 1) dz = ii integral_0^(2 uppi) ee^(2 ii theta (k - n)) dif theta = cases(
      0 & text("if") k < n\,,
      taui & text("if") k = n.
    )
  $

  Therefore,
  $
    2^(2n) ii integral_0^(2 uppi) cos^(2n) theta dif theta = taui binom(2n, n)
  $
  which gives that
  $
    integral_0^(2 uppi) cos^(2n) theta dif theta = (2 uppi (2n)!) / (2^(2n) (n!)^2) = (2 uppi product_(k = 1)^(2n) k) / (product_(k = 1)^n (2k)^2).
  $

  From simple cancellation, we then have
  $
    2 uppi (product_(k = 1)^n (2k - 1)) / (product_(k = 1)^n (2k)) = 2 uppi product_(k = 1)^n (2k - 1) / (2k). #qedhere
  $]

#proposition[Cauchy--Goursat Formula on the Exterior][
  Let $gamma subset CC$ be a simple closed curve, and suppose that $f:jexterior(gamma)-> CC$ is holomorphic and continuous on $overline(jexterior(gamma))=CC without jinterior(gamma)$, where $jinterior$ and $jexterior$ respectively denote the interior and exterior as in @thm:jordan_curve.

  + If $f$ has a removable singularity at $oo$, or if $w = lim_(z -> oo) f(z)$ exists and is finite, then $forall z in CC without gamma$,
    $
      1 / (taui) integral.cont_gamma (f(zeta)) / (zeta - z) dzeta = cases(
        w quad & "if" z in jinterior(gamma)\,,
        w - f(z) quad & "if" z in jexterior(gamma).
      )
    $
  + If $gamma$ encloses the origin, then $forall z in CC without gamma$,

    $
      1 / (taui) integral.cont_gamma (z f(zeta)) / (z zeta - zeta^2) dzeta = cases(
        0 & text("if") z in jinterior(gamma)\,,
        f(z) & text("if") z in jexterior(gamma).
      )
    $ <eq:cauchy_goursat_formula_exterior_part2_statement>
] <ex:cauchygoursatformulaexterior>

#proof[
  + By the compactness of $gamma$, it can be completely contained within a sufficiently large disk centered at the origin ($gamma subset D(0,R)$). Then by applying @thm:cauchygoursatformula or @thm:cauchygoursattheorem on the set $D(0,R)inter jexterior(gamma)=D(0,R)without overline(jinterior(gamma))$, we get that
    $
      1 / (taui) integral.cont_(partial D(0, R)) (f(zeta)) / (zeta - z) dzeta = 1 / (taui) integral.cont_gamma (f(zeta)) / (zeta - z) dzeta + cases(
        0 & "if" z in jinterior(gamma)\,,
        f(z) & "if" z in D(0, R) inter jexterior(gamma).
      )
    $

    By letting $R -> oo$ and letting $zeta = R ee^(ii theta)$, we get that
    $
      1 / (taui) integral.cont_gamma (f(zeta)) / (zeta - z) dzeta = 1 / (2 uppi) lim_(R -> oo) integral_0^(2 uppi) (f (R ee^(ii theta))) / (1 - z / (R ee^(ii theta))) dif theta - cases(
        0 & text("if") z in jinterior(gamma)\,,
        f(z) & text("if") z in jexterior(gamma).
      )
    $

    By the continuity of $f$ on $partial D(0, R)$, it attains its maximum $M$. For sufficiently large $R$, $abs(1 - z / (R ee^(ii theta)))$ attains a positive minimum. Then the integrand is uniformly bounded in $R$ and $theta$, and hence the order of the limit and the integral may be exchanged. Hence,

    $
      1 / (taui) integral.cont_gamma (f(zeta)) / (zeta - z) dzeta & = 1 / (2 uppi) integral_0^(2 uppi) w / (1 - lim_(R -> oo) z / (R ee^(ii theta))) dif theta - cases(
                                                                      0 & text("if") z in jinterior(gamma)\,,
                                                                      f(z) & text("if") z in jexterior(gamma),
                                                                    ) \
                                                                  & = cases(
                                                                      w & text("if") z in jinterior(gamma)\,,
                                                                      w - f(z) & text("if") z in jexterior(gamma),
                                                                    )
    $
    as expected.
  + Under the partial fraction decomposition of @eq:cauchy_goursat_formula_exterior_part2_statement, we get that

    $
      I & = integral.cont_gamma (z f(zeta)) / (z zeta - zeta^2) dzeta = integral.cont_gamma ((f(zeta)) / zeta - (f(zeta)) / (zeta - z)) dzeta \
      & = integral_0^(2 uppi) (f (R ee^(ii theta)) - (f (R ee^(ii theta))) / (1 - z / (R ee^(ii theta)))) dif theta + cases(
        0 & text("if") z in jinterior(gamma)\,,
        taui f(z) & text("if") z in jexterior(gamma) inter D(0, R),
      )
    $ <eq:cauchy_goursat_formula_exterior_part2_pre_limit_integral>
    when $gamma subset D(0,R)$.
    We will analyze the first integral as $R -> oo$. By the triangle and reverse triangle inequalities,

    $
      abs(integral_0^(2 uppi) (f (R ee^(ii theta)) - (f (R ee^(ii theta))) / (1 - z / (R ee^(ii theta)))) dif theta) & <= integral_0^(2 uppi) abs(z / (R ee^(ii theta) - z)) dif theta \
      & <= integral_0^(2 uppi) abs(z) / (R - abs(z)) dif theta = (2 uppi abs(z)) / (R - abs(z)) -> 0.
    $

    By substituting the result into @eq:cauchy_goursat_formula_exterior_part2_pre_limit_integral, and letting $R -> oo$, we get that
    $
      1 / (taui) integral.cont_gamma (z f(zeta)) / (z zeta - zeta^2) dzeta = cases(
        0 & "if" z in jinterior(gamma)\,,
        f(z) & "if" z in jexterior(gamma),
      )
    $
    as desired. #qedhere
]
