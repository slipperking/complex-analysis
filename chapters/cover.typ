#import "/src/components/index.typ": docs-cover
#import "/src/components/styles.typ": pdf-heading-label, pdf-heading-prefix, pdf-page-margin
#import "/src/source.typ" as source

#let abstract = [
  Notes on complex analysis covering complex differentiation, integration, Weierstrass theory, geometric and conformal mappings, rational approximation, harmonic functions, differential geometry, multivariable complex analysis, special classes of holomorphic functions, connections to number theory, Riemann surfaces, and Nevanlinna theory.
]

#let web-view-recommendation = [
  For the best web viewing experience, we recommend using a Mozilla-based browser such as Firefox. This will be subject to change as browsers improve their MathML support. (For instance, displayed overlines will not stretch)
]

#let web-cover(href, show-pdf: true) = {
  html.elem("section", attrs: (class: "cover"), {
    html.elem("h1", source.title)
    html.elem(
      "p",
      attrs: (class: "authors"),
      [by #source.join-oxford-commas(source.authors.map(smallcaps))],
    )
    html.elem("p", attrs: (class: "date"), source.date)
    html.elem("div", attrs: (class: "abstract"), abstract)
    html.elem("div", attrs: (class: "recommendation"), web-view-recommendation)
    if show-pdf {
      html.elem("p", attrs: (class: "download"), {
        html.elem("a", attrs: (class: "button", href: href("pdf/notes.pdf")), [View PDF])
      })
    }
  })
}

#let pdf-cover(outline-target: heading) = [
  #set document(
    title: source.title,
    author: source.join-oxford-commas(source.authors),
  )
  #set page(
    numbering: none,
    margin: pdf-page-margin,
    background: none,
  )
  #set align(center)

  #v(1.5fr)
  #text(size: 3em, weight: "bold")[#smallcaps(source.title)]

  #v(0.8fr)
  #text(size: 1.2em)[by #source.join-oxford-commas(source.authors.map(smallcaps))]

  #v(1.2fr)
  #block(width: 72%)[
    #set par(justify: false, leading: 0.75em)
    #text(size: 0.9em)[#abstract]
  ]

  #v(1fr)
  #text(size: 0.85em)[#source.date]
  #v(1.5fr)

  #pagebreak()
  #set page(
    numbering: "1",
    margin: pdf-page-margin,
    background: none,
  )
  #set align(left)
  #show outline.entry: it => context {
    let item = it.element
    let number = if item.numbering == none {
      none
    } else {
      numbering(item.numbering, ..counter(heading).at(item.location()))
    }
    let label = pdf-heading-prefix(item.level, item.numbering, number)
    let entry-body = if label == none {
      it.body()
    } else {
      pdf-heading-label(label, it.body())
    }
    let inner = [
      #entry-body#box(width: 1fr, it.fill)#it.page()
    ]

    let rendered = link(
      item.location(),
      it.indented(none, inner, gap: 0pt),
    )
    if item.level == 1 {
      v(0.65em)
      strong(rendered)
    } else {
      rendered
    }
  }
  #outline(title: [Contents], target: outline-target, indent: 1.2em)
  #pagebreak()
]

#docs-cover(
  title: "Home",
  route: none,
  description: "Comprehensive notes for an introductory course on complex function theory.",
  web-cover: web-cover,
  pdf-cover: pdf-cover,
)[]
