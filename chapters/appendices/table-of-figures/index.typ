#import "/lib.typ": *
#import "/src/components/styles.typ": paged-link-with-html-indicator

#show: docs-appendix.with(
  title: "Table of Figures",
  route: "table-of-figures",
)

#let figure-entry-paged(web-fig, pdf-fig) = [
  #link(
    pdf-fig.loc,
    {
      if pdf-fig.fields.keys().contains("label") {
        ref(pdf-fig.label)
      }
      sym.wj
      sym.space.nobreak
      (
        {
          box(width: 0pt)
          box(width: 1fr, repeat[.])
        }
          * 2
      )
      sym.wj
      sym.space.nobreak
      paged-link-with-html-indicator(
        link(
          pdf-fig.loc,
          [#pdf-fig.loc.page()],
        ),
        web-fig.loc,
      )
    },
  )\
]

#let figure-entry-web(web-fig, pdf-fig) = {
  let pdf-link-loc = if pdf-fig == none { web-fig.loc } else { pdf-fig.loc }
  let pdf-page = if pdf-fig == none { [?] } else { pdf-fig.loc.page() }

  html.elem("p", attrs: (class: "theorem-list-entry"), {
    link(web-fig.loc, html.elem("span", attrs: (class: "theorem-list-title"), {
      if web-fig.fields.keys().contains("label") {
        ref(web-fig.label)
      }
      html.elem("span", attrs: (class: "theorem-list-end"), [])
    }))
    html.elem("span", attrs: (class: "theorem-list-dots"), [])
    if pdf-fig.fields.keys().contains("label") {
      link(ref(pdf-fig.label), html.elem("span", attrs: (class: "theorem-list-page"), [#pdf-page]))
    }
  })
}

// #context {
//   let web-figs = typst-stored-figures.get().web
//   let pdf-figs = typst-stored-figures.get().pdf

//   if render-mode.get() == "web" {
//     html.elem("div", attrs: (id: "theorem-list", class: "theorem-list"), {
//       for i in range(web-figs.len()) {
//         let web-fig = web-figs.at(i)
//         let pdf-fig = pdf-figs.at(i, default: none)
//         figure-entry-web(web-fig, pdf-fig)
//       }
//     })
//   } else {
//     for i in range(web-figs.len()) {
//       let web-fig = web-figs.at(i)
//       let pdf-fig = pdf-figs.at(i, default: none)
//       figure-entry-paged(web-fig, pdf-fig)
//     }
//   }
// }
