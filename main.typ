#import "@preview/ctheorems:1.1.3": *
#show: thmrules.with(qed-symbol: $square$)

#set par(justify: true)
#set page(paper: "us-letter", margin: 4cm)
#set heading(numbering: "1.1.1.")

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong,
)
#let definition = thmbox("definition", "Definition")

#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")
#align(center)[
  #v(2cm)
  #text(size: 24pt, weight: "bold")[Notes on Complex Analysis]

  #text(size: 13pt)[Slipper King]
  #v(0cm)
  #text(size: 11pt)[May 15, 2025]
  #v(0.1cm)
  `Source: https://github.com/slipperking/complex-analysis-latex`
  #v(0.3cm)
]
#lorem(200) @charak2009meromorphicvaluedistribution

There now is your insular city of the Manhattoes, belted round by
wharves as Indian isles by coral reefs - commerce surrounds it with
her surf. Right and left, the streets take you waterward. Its extreme
down-town is the battery, where that noble mole is washed by waves,
and cooled by breezes, which a few hours previous were out of sight of
land. Look at the crowds of water-gazers there.

Anyone caught using formulas such as $sqrt(x+y)=sqrt(x)+sqrt(y)$
or $1/(x+y) = 1/x + 1/y$ will fail.

The binomial theorem is
$ (x+y)^n=sum_(k=0)^n binom(n, k) x^k y^(n-k). $

A favorite sum of most mathematicians is
$ sum_(n=1)^oo 1/n^2 = pi^2 / 6. $

Likewise a popular integral is
$ integral_(-oo)^oo e^(-x^2) dif x = sqrt(pi) $

#theorem[
  The square of any real number is non-negative.
]

#proof[
  Any real number $x$ satisfies $x > 0$, $x = 0$, or $x < 0$. If $x = 0$,
  then $x^2 = 0 >= 0$. If $x > 0$ then as a positive time a positive is
  positive we have $x^2 = x x > 0$. If $x < 0$ then $−x > 0$ and so by
  what we have just done $x^2 = (−x)^2 > 0$. So in all cases $x^2 ≥ 0$.
]

= Introduction
This is a new section.
You can use tables like @solids.

#figure(
  table(
    columns: (1fr, auto, auto),
    inset: 5pt,
    align: horizon,
    table.header([], [*Area*], [*Parameters*]),
    [*Cylinder*],
    $ pi h (D^2 - d^2) / 4 $,
    [$h$: height \
      $D$: outer radius \
      $d$: inner radius],

    [*Tetrahedron*], $ sqrt(2) / 12 a^3 $, [$a$: edge length],
  ),
  caption: "Solids",
) <solids>

== Things that need to be done
Prove theorems, such as @thm.

#theorem[The Riemann hypothesis is true.] <thm>

#proof[This is left as an exercise to the reader, given the complexity of the theorem.]

= Background
#lorem(40)

#bibliography("references.bib", full: true)
