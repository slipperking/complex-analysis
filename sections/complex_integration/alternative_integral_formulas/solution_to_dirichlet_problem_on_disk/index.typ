#import "../../../../lib.typ": *

=== Solution to the Dirichlet Problem on a Disk
A fundamental problem in the theory of partial differential equations is to find a function $u$ that is continuous on the closed disk $overline(D(0,R))$, harmonic on the open disk $D(0,R)$, and identically equal to a given boundary function on $partial D(0,R)$. This is known as the _Dirichlet problem_ (for Laplace's equation) on a disk.

#theorem[For a continuous function $phi.alt in C^0(partial D(0,R))$, the unique real-valued solution $u in C^0 \qty(overline(D(0,R)))$ that solves 
$ \laplacian u(z)=0 forall z in D(0,R), u(z)=phi.alt(z) forall z in partial D(0,R) $
 is given by the Poisson integral formula:
    
$ u(z)=integral_0^{2 pi}phi.alt(zeta)P(zeta,z)dif tau, $ <eq:dirichletproblemwithlaplaceequationsolution>

    where $zeta=R ee^{ii tau}$.] <thm:dirichletproblemwithlaplaceequationsolution>

#proof[Since $P(zeta,z)=(1)/(4 pi)((zeta+z)/(zeta-z)+(overline(zeta)+overline(z))/(overline(zeta)-overline(z)))$, from @eq:laplaciancomplexform, we have that $\laplacian_z P(zeta,z)=4 pdv(P(zeta,z), z){overline(z)}=0$ (since each term is independent of either $z$ or $overline(z)$). Then by @thm:leibnizintegralrule, @eq:dirichletproblemwithlaplaceequationsolution becomes 
$ \laplacian u(z)=\laplacian integral_0^{2 pi}phi.alt(zeta)P(zeta,z)dif tau=integral_0^{2 pi}\laplacian [phi.alt(zeta)P(zeta,z)]dif tau=0. $

    Our goal is to show that for fixed $xi=R ee^{ii theta.alt}in partial D(0,R)$,
    
$ \lim_{\substack{z -> xi\\z in D(0,R)}}u(z)=phi.alt(xi). $ <eq:dirichletproblemwithlaplaceequationsolution_limittoboundary>

    Let $0<rho<R$ and $z=rho ee^{ii theta}$. Then,
    
$ |phi.alt(xi)-u(z)|=|phi.alt (R ee^{ii theta.alt})-u (rho ee^{ii theta})|=|phi.alt (R ee^{ii theta.alt})-integral_0^{2 pi}P(zeta,z)phi.alt (zeta)dif tau|. $

    For a constant harmonic function identically equal to 1, we get $integral_0^{2 pi}P(zeta,z)dif tau=1$ from @eq:poissonintegralformula2. Hence, 
$ |phi.alt(xi)-u(z)|=|integral_0^{2 pi}P(zeta,z)(phi.alt \qty(R ee^{ii theta.alt})-phi.alt(zeta))dif tau|. $

    By the continuity of $phi.alt$, $forall epsilon.alt>0$, $exists delta>0$ such that $forall \qty|theta.alt-tau|<delta<(pi)/(2)$, we have that $|phi.alt(R ee^{ii theta.alt})-phi.alt(zeta)|<epsilon.alt$. Therefore,
    
$
|phi.alt(xi)-u(z)| & =\abs{(integral_{|theta.alt-tau|<delta}+integral_{|theta.alt-tau|>delta})P(zeta,z)(phi.alt (R ee^{ii theta.alt})-phi.alt(zeta))dif tau} \\&=|I_1+I_2|lt.eq |I_1|+|I_2|.
$

    Since the Poisson kernel is non-negative, 
$ \qty|I_1|<epsilon.alt integral_{|theta.alt-tau|<delta}P(zeta,z)dif tau<epsilon.alt. $

    \begin{figure}
        \centering
        \begin{tikzpicture}
            \coordinate (zeta) at (4.924, 0.868);
            \coordinate (z) at (2.2, 4.2);
            \coordinate (xi) at (0.868, 4.924);
            \coordinate (auxiliary1) at ($(0,0)!0.948!(zeta)$);

            \draw[-{Stealth}, thick] (-0.5, 0) -- (5.5, 0);
            \draw[-{Stealth}, thick] (0, -0.5) -- (0, 5.5);
            \draw[thin] (5,0) arc[start angle=0, end angle=90, radius=5];
            \draw[thin] (0, 0) -- (zeta);
            \draw[thin] (0, 0) -- (xi);
            \draw[thin] (0, 0) -- (z);
            \draw[thin] (z) -- (xi);
            \draw[thin] (z) -- (auxiliary1);
            \draw[dashed, thin] (z) -- (zeta);
            \draw[thin] ($(0,0)!0.08!(zeta)$) arc[start angle=10, end angle=62.35, radius=0.4];
            \draw[thin] ($(0,0)!0.3!(zeta)$) arc[start angle=10, end angle=80, radius=1.5];
            \draw[thin] (2,0) arc[start angle=0, end angle=10, radius=2];
            \draw[thin] (1,0) arc[start angle=0, end angle=80, radius=1];
            \draw[dashed] (z) arc[start angle=-27.65, end angle=-100, radius=1.516];
            \draw[dotted] (z) arc[start angle=62.35, end angle=80, radius=4.741];

            \node[anchor=west] at (zeta) {$zeta$};
            \node[anchor=north] at ([yshift=-3pt] z) {$z$};
            \node[anchor=south] at (xi) {$xi$};
            \node[anchor=south] at ($(0,0)!0.5!(zeta)$) {$rho$};
            \node[anchor=north] at ($(z)!0.5!(xi)$) {\small$eta^-$};
            \node[anchor=west] at ($(0,0)!0.5!(xi)$) {$R$};
            \node[anchor=west] at ($(z)!0.5!(0,0)$) {$rho$};
            \node[anchor=north] at (0.57,0.75) {\small $(delta)/(2)^+$};
            \node[anchor=north] at (0.95,0.95) {\small$theta.alt$};
            \node[anchor=north] at (1.25,1.55) {\small$delta^+$};
            \node[anchor=north] at (2.2,0.4) {$tau$};
            \node[anchor=east] at ([yshift=-6pt, xshift=-2pt] $(z)!0.5!(zeta)$) {$|zeta-z|^-$};
        \end{tikzpicture}
        \caption{$zeta$, $xi$, and $z$ when $|theta.alt-tau|>delta$, with angles and distances marked. The use of $+$ and $-$ denote a value more or less (respectively) than the preceding value.}
        
    \end{figure}By continuity of $phi.alt$ compact set $partial D(0,R)$, by @thm:heinecantor, it is bounded and $M=sup_{\qty|zeta|=R}|phi.alt(zeta)|$ is finite. The Poisson kernel can be rewritten as 
$ P(zeta,z)=(R^2-rho^2)/(2 pi \qty|zeta-z|^2), $

    where $zeta=R ee^{ii tau}$ and $z=rho ee^{ii theta}$, with $|theta.alt-tau|>delta$. Then $exists eta>0$ such that $forall z$ with $|xi-z|<eta$,
    
$ |theta-tau|>(delta)/(2), $ <eq:dirichletproblemwithlaplaceequationsolution_constraint1>
 and
    
$ rho>(R)/(2)==> eta lt.eq (R)/(2) $ <eq:dirichletproblemwithlaplaceequationsolution_constraint2>
 (these can be arbitrarily chosen for different resulting bounds) as in @fig:dirichletproblemwithlaplaceequationsolution_secondintegral. Then, 
$ |zeta-z|^2>4 rho^2 sin[2]((delta)/(4))>(1)/(2)R^2 \qty(1-cos((delta)/(2))). $

    We aim to prove that $|I_2|<epsilon.alt$. Since $|phi.alt (R ee^{ii theta.alt})-phi.alt(zeta)|<2M$, the condition is satisfied if $integral_{|theta.alt-tau|>delta}(R^2-rho^2)/(pi R^2 \qty(1-cos((delta)/(2))))dif tau<2 (R^2-rho^2)/(R^2 \qty(1-cos((delta)/(2))))<(epsilon.alt)/(2M)$, and from rearrangement, we can tighten the constraint with:
    
$ R^2-rho^2<(epsilon.alt)/(4M)R^2 (1-cos((delta)/(2)))\Longleftarrow R-rho<(epsilon.alt)/(8M)R (1-cos((delta)/(2))). $ <eq:dirichletproblemwithlaplaceequationsolution_constraint3>

    From @fig:dirichletproblemwithlaplaceequationsolution_secondintegral, it is evident that $R-rho<|xi-z|<eta$. In order for @eq:dirichletproblemwithlaplaceequationsolution_constraint1 to be true, we can enforce that $|theta.alt-theta|<(delta)/(2)$. In other words $|xi-z|^2<R^2+rho^2-2R rho cos((delta)/(2))$.

    Obviously, this is satisfied if $|xi-z|^2<(R^2)/(2)(1-cos((delta)/(2)))<2 rho^2 \qty(1-cos((delta)/(2)))$. This can be rearranged into $|xi-z|<(R sqrt(2))/(2)sqrt(1-cos((delta)/(2)))=R sin ((delta)/(4))$. Therefore, we can choose 
$ eta=min [(epsilon.alt)/(8M)R (1-cos((delta)/(2))),R sin ((delta)/(4)),(R)/(2)]>0, $
 under which @eq:dirichletproblemwithlaplaceequationsolution_constraint1, @eq:dirichletproblemwithlaplaceequationsolution_constraint2, @eq:dirichletproblemwithlaplaceequationsolution_constraint3 are satisfied.

    Hence, $forall epsilon.alt>0$, $exists eta>0$ such that $forall z$ with $0<|xi-z|<eta$, we have $|phi.alt(xi)-u(z)|<2 epsilon.alt$. Then @eq:dirichletproblemwithlaplaceequationsolution_limittoboundary follows.

    We will now show that $u(z)$ is unique. Assume that $v \not equiv u$ on $overline(D(0,R))$ also solves the problem. Then $u-v$ is harmonic and vanishes on $partial D(0,R)$. By the Poisson Integral Formula (@eq:poissonintegralformula2), $u(z)-v(z)=integral_0^{2 pi}P(zeta,z)[u(zeta)-v(zeta)]dif tau=0$ for all $z in D(0,R)$. Since $u-v$ vanishes, we have a contradiction.] <fig:dirichletproblemwithlaplaceequationsolution_secondintegral>
