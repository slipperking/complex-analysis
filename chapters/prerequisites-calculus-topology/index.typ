#import "/lib.typ": *
#show: docs-chapter.with(
  title: [Prerequisites],
  route: "prerequisites-calculus-topology",
  children: [
    #include "topology/index.typ"
    #include "calculus/index.typ"
  ],
)
