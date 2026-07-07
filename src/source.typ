#let title = "Notes on Complex Analysis"
#let course = none
#let authors = "Slipper King"
#let date = "May 15, 2025"
#let abstract = [
  Notes on complex analysis covering complex differentiation, integration, Weierstrass theory, geometric and conformal mappings, rational approximation, harmonic functions, differential geometry, multivariable complex analysis, special classes of holomorphic functions, connections to number theory, Riemann surfaces, and Nevanlinna theory.
]

#let web-view-recommendation = [
  For the best web viewing experience, we recommend using a Mozilla-based browser such as Firefox. This will be subject to change as browsers improve their MathML support.
]

#let source-url = "https://github.com/slipperking/complex-analysis"

#let web-cover(href) = {
  html.elem("section", attrs: (class: "cover"), {
    html.elem("h1", title)
    html.elem("p", attrs: (class: "authors"), [by #smallcaps[Slipper King]])
    html.elem("p", attrs: (class: "date"), date)
    html.elem("div", attrs: (class: "abstract"), abstract)
    html.elem("div", attrs: (class: "recommendation"), web-view-recommendation)
    html.elem("p", attrs: (class: "download"), {
      html.elem("a", attrs: (class: "button", href: href("pdf/notes.pdf")), [Download PDF])
    })
  })
}

#let pdf-cover(outline-target: heading) = [
  #set document(
    title: "Notes on Complex Analysis",
    author: "Slipper King",
  )
  #set page(background: rotate(30deg, {
    let f(n) = {
      if n <= 1 {
        $#box($script(integral)$)$
      } else {
        let prev = f(n - 1)
        $#prev _(#prev)^(#prev)$
      }
    }

    text(fill: black.transparentize(70%))[$#f(8)$]
  }))
  #align(center)[
    #v(2cm)
    #text(size: 24pt, weight: "bold")[Notes on Complex Analysis]

    #text(size: 13pt)[#smallcaps[Slipper King]]

    #text(size: 11pt)[May 15, 2025]

    `Source: https://github.com/slipperking/complex-analysis`
  ]

  #block(inset: 10pt)[#abstract]
  #outline(target: outline-target)
  #set page(background: none)
]
