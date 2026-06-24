#import "/lib.typ": *
#show: docs-chapter.with(
  title: [Precise Connections to Number Theory],
  route: "connections_to_number_theory",
  children: [
    #include "gamma_function/index.typ"
    #include "riemann_zeta_function/index.typ"
    #include "prime_number_theorem/index.typ"
  ],
)
The Riemann $zeta$-function is one of the most important functions in analytic number theory due to its connection with the distribution of prime numbers. We will also introduce one of the most profound theorems in number theory on the distribution of prime numbers. To formulate more insightful conclusions on $zeta$, we first observe the $Gamma$-function in the complex plane.