// TODO: subharmonicity, harnack's principle, perron's method, dirichlet problem, one-hole region to annulus, make sections etc.
#import "/lib.typ": *
#show: docs-chapter.with(
  title: [Harmonic Functions],
  route: "harmonic_functions",
  children: [
    #include "basic_properties_of_harmonic_functions/index.typ"
  ],
)
We have already seen that the real and imaginary parts of a holomorphic function are harmonic, as well as the rigidity in this formulation (the existence of harmonic conjugates for these parts).

This existence (if realized) of a conjugate is also unique. Indeed, on an open set, if there are two holomorphic functions $f_1,f_2$ with the same real part, then $f_1-f_2$ is a holomorphic function that is purely imaginary, and thus constant by @prop:realvaluedholomorphicfunctionconstant (more generally by @thm:open_mapping). Thus, the two holomorphic functions differ by a constant, and their imaginary parts differ by the same constant. Therefore, the harmonic conjugate of a harmonic function is unique up to an additive constant.

The most basic definition of a harmonic function requires $C^2$. By a phenomenon known as elliptic regularity, harmonic functions are infinitely differentiable (in @ to be continued); thus, the condition of $C^2$ itself is not truly of great importance, except for establishing the initial definition. 
