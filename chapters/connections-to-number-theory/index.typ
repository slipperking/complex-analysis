#import "/lib.typ": *
#show: docs-chapter.with(
  title: [Precise Connections to Number Theory],
  route: "connections-to-number-theory",
  children: [
    #include "gamma-function/index.typ"
    #include "riemann-zeta-function/index.typ"
    #include "prime-number-theorem/index.typ"
  ],
)
The Riemann $zeta$-function is one of the most important functions in analytic number theory due to its connection with the distribution of prime numbers. We will also introduce one of the most profound theorems in number theory on the distribution of prime numbers. To formulate more insightful conclusions on $zeta$, we first observe the $Gamma$-function in the complex plane.
