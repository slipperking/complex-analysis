#import "/lib.typ": *

== Gaussian Curvature of a Surface<sec:gaussiancurvatureofsurface>
We will give a brief introduction to the curvature of a surface for heuristic intuition.

Suppose $U subset.eq RR^2$ is a region, and let $(u,v)in U$. Consider a surface parameterized via 
$ \va{r}(u,v)=(x(u,v),y(u,v),z(u,v))in RR^3, $
 where $x,y,z in C^2 (U)$. If $\va{r}'_u times \va{r}'_v$ never vanishes for $(u,v)in U$, then $\va{r}(U)$ defines a smooth surface $Sigma$. For a fixed $(u,v)in U$, the vectors $\va{r}'_u$ and $\va{r}'_v$ form the basis of the tangent space (a plane) of $Sigma$ at $P=\va{r}(u,v)$, denoted by $T_P Sigma=upright("span")(\va{r}'_u(P),\va{r}'_v(P))$.

The square of the length of the vector infinitesimal $\dd{\va{r}}=\va{r}'_u dif u+\va{r}'_v dif v$, or

$ upright("I")=dif s^2=E dif u^2+2F dif udif v+G dif v^2, $ <eq:firstfundamentalform>
 is known as the _first fundamental form_ of $Sigma$, where $E=\va{r}'_u dot.c \va{r}'_u$, $F=\va{r}'_u dot.c \va{r}'_v$, and $G=\va{r}'_v dot.c \va{r}'_v$.

Let $Q=\va{r}(u+Delta u,v+Delta v)$ be near $P$. It follows that $\overrightarrow{PQ}=\va{r}(u+Delta u,v+Delta v)-\va{r}(u,v)$. The distance between $Q$ and $T_P Sigma$ is $\overrightarrow{PQ}dot.c \vu{n}$, where $\vu{n}=\frac{\va{r}'_{u}times \va{r}'_v}{\norm{\va{r}'_{u}times \va{r}'_v}}$. By application of the multivariate Taylor's Theorem, we have

$
\overrightarrow{PQ} & =\va{r}'_u Delta u+\va{r}'_v Delta v+(1)/(2)(\va{r}''_{uu}Delta u^2+2 \va{r}''_{uv}Delta u Delta v+\va{r}''_{vv}Delta v^2)+cal(O)(Delta u^3+Delta v^3),
$

and therefore, 
$ \overrightarrow{PQ}dot.c \vu{n}=(1)/(2)(\va{r}''_{uu}dot.c \vu{n}Delta u^2+2 \va{r}''_{uv}dot.c \vu{n}Delta u Delta v+\va{r}''_{vv}dot.c \vu{n}Delta v^2)+cal(O)(3)dot.c \vu{n}. $
 The first two linear terms vanish by properties of the triple scalar product. The _second fundamental form_ of $Sigma$ is defined as

$ \mathrm{I\!I}=L dif u^2+2M dif udif v+N dif v^2, $ <eq:secondfundamentalform>
 where $L=\va{r}''_{uu}dot.c \vu{n}$, $M=\va{r}''_{uv}dot.c \vu{n}$, and $N=\va{r}''_{vv}dot.c \vu{n}$. Since $\va{r}'_u dot.c \vu{n}=0$ and $\va{r}'_v dot.c \vu{n}=0$, by differentiation, we have

$
\va{r}''_{uu}dot.c \vu{n}+\va{r}'_u dot.c \vu{n}'_u & =0, & \va{r}''_{uv}dot.c \vu{n}+\va{r}'_u dot.c \vu{n}'_v & =0, \\ \va{r}''_{uv}dot.c \vu{n}+\va{r}'_v dot.c \vu{n}'_u & =0, & \va{r}''_{vv}dot.c \vu{n}+\va{r}'_v dot.c \vu{n}'_v & =0.
$

It follows that $L=-\va{r}'_u dot.c \vu{n}'_u$, $M=-\va{r}'_u dot.c \vu{n}'_v=-\va{r}'_v dot.c \vu{n}'_u$, and $N=-\va{r}'_v dot.c \vu{n}'_v$. Because $\dd{\vu{n}}=\vu{n}'_u dif u+\vu{n}'_v dif v$, 
$ \mathrm{I\!I}=-\dd{\va{r}}dot.c \dd{\vu{n}}. $

\begin{figure}
    \centerline{\includesvg[width=0.75\linewidth]{build/svg/second_fundamental_form.svg}}
    \caption{$Q$ has a greater heuristic distance to $T_P Sigma$ for a more curved surface.}<fig:secondfundamentalform>
\end{figure}The second fundamental form, in a rough sense, measures the curvature of the surface $Sigma$ at $P$ (refer to @fig:secondfundamentalform). Both the first and second fundamental forms are geometric invariants; they are independent of the parameterization $\va{r}$ of $Sigma$. The first fundamental form is also referred to as the _intrinsic metric_ (we will not delve into the metric tensor here) of $Sigma$, and the second fundamental form is an _extrinsic_ property of $Sigma$ as it is invariant up to the orientation of the surface (consequent direction of the normal vector).

Let $gamma subset Sigma$ be a curve parameterized by arc length, $\va{r}(s)=\va{r}(u(s),v(s))$. Then the unit tangent vector at $P=\va{r}(s)$ is 
$ \va{T}(s)=\dv{\va{r}}{s}=\va{r}'_u dv(u, s)+\va{r}'_v dv(v, s). $

Consequently, 
$ \va{T}'(s)=\va{r}''_{uu}(dv(u, s))^2+2 \va{r}''_{uv}(dv(u, s))(dv(v, s))+\va{r}''_{vv}(dv(v, s))^2+\va{r}'_u \dv[2]{u}{s}+\va{r}'_v \dv[2]{v}{s}, $

where the last two terms are in $T_P Sigma$. Because $\norm{\va{T}(s)}=1$ for all $s$ by the arc-length parameterization, we have 
$ 0=\dv{s}(\norm{\va{T}(s)}^2)=\dv{s}(\va{T}(s)dot.c \va{T}(s))=2 \va{T}(s)dot.c \va{T}'(s). $

Hence, $\va{T}(s)$ and $\va{T}'(s)$ are orthogonal and $\va{T}'(s)$ is a normal to the curve $gamma$. Let $\vu{n}=\tfrac{\va{r}'_{u}times \va{r}'_v}{\norm{\va{r}'_{u}times \va{r}'_v}}$ be the unit normal to $Sigma$ at $P$. The _normal curvature_ of $gamma$ at $P$ in $Sigma$ is defined as 
$ kappa_n=\va{T}'(s)dot.c \vu{n}=[\va{r}''_{uu}(dv(u, s))^2+2 \va{r}''_{uv}(dv(u, s))(dv(v, s))+\va{r}''_{vv}(dv(v, s))^2]dot.c \vu{n}. $

The quotient 
$ kappa_n=(\mathrm{I\!I})/(upright("I"))=(L dif u^2+2M dif udif v+N dif v^2)/(E dif u^2+2F dif udif v+G dif v^2), $
 varies depending on the curve traversing $Sigma$ (and ultimately, depending on the direction induced by $dif u$ and $dif v$). On $gamma$, the two representations are equivalent since $upright("I")=dif s^2$. The maximum and minimum values of $kappa_n$ are known as the _principal curvatures_ $kappa_1$ and $kappa_2$ of $Sigma$ at $P$, achieved along the _principal directions_ of the (unit) tangent vectors at $P$.

The _mean curvature_ of $Sigma$ at $P$ is defined to be $H=(kappa_1+kappa_2)/(2)$. Let $r_1,r_2$ be the radii of curvature corresponding to $kappa_1$ and $kappa_2$. The product of the two principal curvatures is known as the _Gaussian curvature_ of $Sigma$ at $P$, denoted by $K=kappa_1 kappa_2$. We will now heuristically derive the explicit formulas for $H$ and $K$ in terms of $E,F,G,L,M,N$.

Suppose $p in Sigma$. Adopt the matrix notation of $bold(I)$, $bold(I\!I)$ as in 
$ bold(I)=\mqty(E&F\\F&G), bold(I\!I)=\mqty(L&M\\M&N), $
 to reduce to the optimization problem of 
$ kappa_n=(\va{v}^\top bold(I\!I)\va{v})/(\va{v}^\top bold(I)\va{v}), \va{v}in T_p Sigma. $

We may restrict $\va{v}=(v_1,v_2)$ so that the denominator is always $1$, aiming to optimize the numerator. By the method of Lagrange multipliers, we write 
$ cal(L)(\va{v},lambda)=\va{v}^\top bold(I\!I)\va{v}-lambda (\va{v}^\top bold(I)\va{v}-1). $

The equation $\grad cal(L)=bold(0)$ for $\textstyle \grad{}=(\pdv{v_1},\pdv{v_2},\pdv{lambda})$ can then be decomposed into (where $\va{v}=(v_1,v_2)$):

$
2Lv_1+2Mv_2-lambda (2Ev_1+2Fv_2)=0,\\ 2Mv_1+2Nv_2-lambda (2Fv_1+2Gv_2)=0,\\ (\va{v}^\top bold(I)\va{v}=1).
$

The first two equations can be written as

$ \mqty(L-lambda E&M-lambda F\\M-lambda F&N-lambda G)\va{v}=bold(0). $ <eq:gaussiancurvaturelambdarootsmatrixvectorvanish>

Let the matrix on the left be denoted by $bold(M)$. In order for non-trivial ($bold(v)eq.not bold(0)$) to exist, we must have $det bold(M)=0$. That is,

$ (L-lambda E)(N-lambda G)-(M-lambda F)^2=lambda^2 (EG-F^2)+lambda(2MF-EN-GL)+LN-M^2=0. $

This is a quadratic giving two solutions for $lambda$. From 
$ \grad (\va{v}^\top bold(I\!I)\va{v})=lambda \grad (\va{v}^\top bold(I)\va{v}) $
 it is apparent that the roots $lambda_1,lambda_2 in RR$. Moreover, from @eq:gaussiancurvaturelambdarootsmatrixvectorvanish we have 
$ bold(I\!I)\va{v}=lambda bold(I)\va{v}=> lambda=(\va{v}^\top bold(I\!I)\va{v})/(\va{v}^\top bold(I)\va{v}). $

Hence, the two roots $lambda_1,lambda_2$ are precisely the principal curvatures. Vieta's formulas give that 
$ K=lambda_1 lambda_2=(LN-M^2)/(EG-F^2), H=(EN+GL-2MF)/(2EG-2F^2). $

Now, assume a parameterization of $Sigma$ by $\va{r}(u,v)$ (thrice continuously differentiable) such that 
$ upright("I")(u,v)=rho^2 dif u^2+rho^2 dif v^2=rho^2 (dif u^2+dif v^2) $
 (which we will later formalize as a _conformal metric_). Then there is an alternate representation of the Gaussian curvature in terms of $rho$.

By definition, $E equiv G equiv rho^2$ while $F equiv 0$. Moreover,

$
LN&=(\va{r}''_{uu}dot.c \frac{\va{r}'_u times \va{r}'_v}{\norm{\va{r}'_u times \va{r}'_v}})(\va{r}''_{vv}dot.c \frac{\va{r}'_u times \va{r}'_v}{\norm{\va{r}'_u times \va{r}'_v}})=\frac{det \mqty(\va{r}''_{uu}&\va{r}'_u&\va{r}'_v)det \mqty(\va{r}''_{vv}&\va{r}'_u&\va{r}'_v)}{\norm{\va{r}'_u}^2 \norm{\va{r}'_v}^2-(\va{r}'_u dot.c \va{r}'_v)^2}\\ &=(det \mqty(\va{r}''_{uu}&\va{r}'_u&\va{r}'_v)det \mqty(\va{r}''_{vv}&\va{r}'_u&\va{r}'_v))/(EG-F^2)=(1)/(rho^4)det \mqty(\va{r}''_{vv}dot.c \va{r}''_{uu}&\va{r}''_{vv}dot.c \va{r}'_u&\va{r}''_{vv}dot.c \va{r}'_v\\\va{r}'_u dot.c \va{r}''_{uu}&\va{r}'_u dot.c \va{r}'_u&\va{r}'_u dot.c \va{r}'_v\\\va{r}'_v dot.c \va{r}''_{uu}&\va{r}'_v dot.c \va{r}'_u&\va{r}'_v dot.c \va{r}'_v).
$

Similarly,

$
M^2&=(1)/(rho^4)det \mqty(\va{r}''_{uv}dot.c \va{r}''_{uv}&rho rho'_v&rho rho'_u\\rho rho'_v&rho^2&0\\rho rho'_u&0&rho^2)=(1)/(rho^4)[\va{r}''_{uv}dot.c \va{r}''_{uv}rho^4-rho^4{rho'_v}^2-rho^4{rho'_u}^2]\\ &=\va{r}''_{uv}dot.c \va{r}''_{uv}-{rho'_v}^2-{rho'_u}^2.
$

By differentiation of the equations 
$ \va{r}'_u dot.c \va{r}'_v equiv F equiv 0, \va{r}'_u dot.c \va{r}'_u equiv E equiv G equiv \va{r}'_v dot.c \va{r}'_v equiv rho^2, $

we have

$ \va{r}''_{uu}dot.c \va{r}'_v+\va{r}'_u dot.c \va{r}''_{uv}equiv 0, \va{r}''_{uv}dot.c \va{r}'_v+\va{r}'_u dot.c \va{r}''_{vv}equiv 0, $ <eq:gaussiancurvatureofsurface_conformalzerodifferentiation>

and

$ 2 \va{r}''_{uu}dot.c \va{r}'_u equiv 2 rho rho'_u equiv 2 \va{r}''_{uv}dot.c \va{r}'_v, 2 \va{r}''_{uv}dot.c \va{r}'_u equiv 2 rho rho'_v equiv 2 \va{r}''_{vv}dot.c \va{r}'_v. $ <eq:gaussiancurvatureofsurface_conformalnonzerodifferentiation>

Substituting @eq:gaussiancurvatureofsurface_conformalnonzerodifferentiation into @eq:gaussiancurvatureofsurface_conformalzerodifferentiation then gives 
$ \va{r}''_{uu}dot.c \va{r}'_v=-rho rho'_v, (\va{r}''_{vv}dot.c \va{r}'_u=-rho rho'_u). $

Differentiating these give 
$ \va{r}'''_{uuv}dot.c \va{r}'_v+\va{r}''_{uu}dot.c \va{r}_{vv}=-{rho'_v}^2-rho rho''_{vv}, (\va{r}'''_{vvu}dot.c \va{r}'_u+\va{r}''_{vv}dot.c \va{r}_{uu}=-{rho'_u}^2-rho rho''_{uu}). $

Differentiating the inner two expressions of @eq:gaussiancurvatureofsurface_conformalnonzerodifferentiation, we have 
$ \va{r}'''_{uuv}dot.c \va{r}'_v+\va{r}''_{uv}dot.c \va{r}_{uv}={rho'_u}^2+rho rho''_{uu}, (\va{r}'''_{vvu}dot.c \va{r}'_u+\va{r}''_{uv}dot.c \va{r}_{uv}={rho'_v}^2+rho rho''_{vv}). $

It follows that 
$ \va{r}''_{uv}dot.c \va{r}_{uv}-\va{r}''_{uu}dot.c \va{r}''_{vv}={rho'_u}^2+{rho'_v}^2+rho \laplacian rho, $
 where $\laplacian$ here is $\pdv*[2]{}u+\pdv*[2]{}v$. Then

$
LN&=(1)/(rho^4)det \mqty(\va{r}''_{vv}dot.c \va{r}''_{uu}&-rho rho'_u&rho rho'_v\\rho rho'_u&rho^2&0\\-rho rho'_v&0&rho^2)=(1)/(rho^4)[\va{r}''_{vv}dot.c \va{r}''_{uu}rho^4+rho^4{rho'_u}^2+rho^4{rho'_v}^2]\\ &=\va{r}''_{vv}dot.c \va{r}''_{uu}+{rho'_u}^2+{rho'_v}^2,
$

and

$
M^2&=(1)/(rho^4)det \mqty(\va{r}''_{uv}dot.c \va{r}''_{uv}&rho rho'_v&rho rho'_u\\rho rho'_v&rho^2&0\\rho rho'_u&0&rho^2)=(1)/(rho^4)[\va{r}''_{uv}dot.c \va{r}''_{uv}rho^4-rho^4{rho'_v}^2-rho^4{rho'_u}^2]\\ &=\va{r}''_{uv}dot.c \va{r}''_{uv}-{rho'_v}^2-{rho'_u}^2.
$

Combining the two expressions, we have

$
K&=(LN-M^2)/(EG-F^2)=(\va{r}''_{vv}dot.c \va{r}''_{uu}+2{rho'_u}^2+2{rho'_v}^2-\va{r}''_{uv}dot.c \va{r}''_{uv})/(rho^4)\\ &=({rho'_u}^2+{rho'_v}^2-rho \laplacian rho)/(rho^4)=-(1)/(rho^2)\laplacian(log rho).
$ <eq:gaussiancurvatureofsurface_gaussiancurvatureconformalmetricformula>

To understand the motivation for which $dif s^2$ is said to be conformal, consider two curves in the $u-v$ plane, parameterized by $bold(gamma)_1(t)=(u_1(t),v_1(t))$ and $bold(gamma)_2(t)=(u_2(t),v_2(t))$ such that $bold(gamma)_1(0)=bold(gamma)_2(0)=bold(w)_0=(u_0,v_0)$. Their images via $\vb{r}$ are $bold(alpha)_1(t)=bold(r)compose bold(gamma)_1(t)$ and $bold(alpha)_2(t)=bold(r)compose bold(gamma)_2(t)$ so that they intersect at some point $P in Sigma$. Let $bold(gamma)'_1(0)=\vb{v}_1=a bold(e)_u+b bold(e)_v$ and $bold(gamma)'_2(0)=bold(v)_2=c bold(e)_u+d bold(e)_v$ be two tangent vectors. Then the corresponding vectors in $T_P Sigma$ are 
$ dif bold(r)_{bold(w)_0}(bold(v)_1)=a dif bold(r)_{bold(w)_0}(bold(e)_u)+b dif bold(r)_{bold(w)_0}(bold(e)_v), dif bold(r)_{bold(w)_0}(bold(v)_2)=c dif bold(r)_{bold(w)_0}(bold(e)_u)+d dif bold(r)_{bold(w)_0}(bold(e)_v). $

Since#footnote[In more modern formulations of differential geometry, differentials (known as pushforwards) are functions mapping tangent vectors to tangent vectors. The notion came from the realization that ``changes'' of functions are best described in terms of a direction of change. Then basis vectors themselves became partial derivative operators two give the second set of equalities, which is a consequence of the more abstract notion of ``duality.'' For the remaining sections, this structural viewpoint is not considered.] $\textstyle \vb{e}_u=pdv(, u)$, $\textstyle \vb{e}_v=pdv(, v)$ and $\textstyle \dd{\vb{r}}_{bold(w)_0}(pdv(, u))=\eval{pdv(, u)(\vb{r})}_{bold(w)_0}$, $\textstyle \dd{\vb{r}}_{bold(w)_0}(pdv(, v))=\eval{pdv(, v)(\vb{r})}_{bold(w)_0}$. Then

$ dif bold(r)_{bold(w)_0}(bold(v)_1)=a bold(r)'_u (bold(w)_0)+b bold(r)'_v (bold(w)_0), dif bold(r)_{bold(w)_0}(bold(v)_2)=c bold(r)'_u (bold(w)_0)+d bold(r)'_v (bold(w)_0). $

The angle $theta_{uv}$ between $bold(v)_1$ and $bold(v)_2$ on the $u-v$ plane satisfies 
$ cos theta_{uv}=(bold(v)_1 dot.c bold(v)_2)/(norm(bold(v)_1)norm(bold(v)_2))=(ac+bd)/(sqrt(a^2+b^2)sqrt(c^2+d^2)), $

while the angle $theta_Sigma$ between the two tangent vectors in $T_P Sigma$ satisfies 
$ cos theta_Sigma=\mathmakebox[\widthof{\(\eval{((a bold(r)'_u+b bold(r)'_v)dot.c (c bold(r)'_u+d bold(r)'_v))/(norm(a bold(r)'_u+b bold(r)'_v)norm(c bold(r)'_u+d bold(r)'_v))}\)}][l]{\eval{((a bold(r)'_u+b bold(r)'_v)dot.c (c bold(r)'_u+d bold(r)'_v))/(norm(a bold(r)'_u+b bold(r)'_v)norm(c bold(r)'_u+d bold(r)'_v))}_{bold(w)_0}}=\mathmakebox[\widthof{\(\eval{(rho^2 (ac+bd))/(sqrt(a^2 rho^2+b^2 rho^2)sqrt(c^2 rho^2+d^2 rho^2))}\)}][l]{\eval{(rho^2 (ac+bd))/(sqrt(a^2 rho^2+b^2 rho^2)sqrt(c^2 rho^2+d^2 rho^2))}_{bold(w)_0}}=cos theta_{uv}. $
