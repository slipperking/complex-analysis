#import "/lib.typ": *
#show: docs-chapter.with(
  title: [Prerequisites],
  route: "prerequisites_calc_top",
  children: [
    #include "topology/index.typ"
    #include "calculus/index.typ"
  ],
)
