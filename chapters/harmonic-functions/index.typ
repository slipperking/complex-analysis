#import "/lib.typ": *
#show: docs-chapter.with(
  title: [Harmonic Functions],
  route: "harmonic-functions",
  children: [
    #include "properties-of-harmonic-functions/index.typ"
    #include "harnacks-principle/index.typ"
    #include "subharmonic-functions/index.typ"
    #include "perron-method-and-the-solution-to-the-dirichlet-problem/index.typ"
    #include "biholomorphisms-between-annuli/index.typ"
  ],
)
We have already seen that the real and imaginary parts of a holomorphic function are harmonic, as well as the rigidity in this formulation (the existence of harmonic conjugates for these parts).

This existence (if realized) of a conjugate is also unique. Indeed, on an open set, if there are two holomorphic functions $f_1,f_2$ with the same real part, then $f_1-f_2$ is a holomorphic function that is purely imaginary, and thus constant by @prop:real-valued-holomorphic-function-constant (more generally by @thm:open-mapping). Thus, the two holomorphic functions differ by a constant, and their imaginary parts differ by the same constant. Therefore, the harmonic conjugate of a harmonic function is unique up to an additive constant.

The most basic definition of a harmonic function requires $C^2$. By a phenomenon known as elliptic regularity, harmonic functions are infinitely differentiable (in @thm:harmonic-elliptic-regularity); thus, the condition of $C^2$ itself is not truly of great importance, except for establishing the initial definition.
