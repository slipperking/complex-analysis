#import "/lib.typ": *
#show: docs-chapter.with(
  title: [Introduction to Complex Functions],
  route: "introduction-to-complex-functions",
  children: [
    #include "extended-plane-sphericality/index.typ"
    #include "complex-differentiation/index.typ"
    #include "complex-power-series/index.typ"
    #include "conformality-of-holomorphic-mapping/index.typ"
    #include "elementary-functions/index.typ"
  ],
)
