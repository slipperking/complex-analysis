#import "/lib.typ": *

#let paper-styles(doc) = {
  set par(justify: true)
  set heading(numbering: "1.1")
  set page(numbering: "1", margin: 1.75in)

  show: thm-rules.with(qed-symbol: $square$, is-html: _is-html)
  show math.equation: it => {
    if it.fields().keys().contains("label") {
      math.equation(block: true, numbering: scoped-equation-numbering, it)
    } else {
      it
    }
  }

  show ref: it => {
    let el = it.element
    if el != none and el.func() == math.equation {
      let eq-num = counter(math.equation).at(el.location()).at(0) + 1
      link(el.location(), [(#_scoped-number(eq-num, loc: el.location()))])
    } else {
      it
    }
  }

  set figure(placement: alignment.top)
  show figure.caption: it => context [
    *#it.supplement~#it.counter.display()#it.separator*#it.body
  ]
  show heading: it => context {
    if target() != "html" { return [#it#heading-reset-marker(it.level)] }
    let level = calc.min(it.level, 6)
    let tag = ("h1", "h2", "h3", "h4", "h5", "h6").at(level - 1)
    let num-display = if it.numbering != none {
      if level == 1 {
        [Chapter ] + counter(heading).display() + [: ]
      } else if level <= 6 {
        counter(heading).display() + [ ]
      }
    }
    let label-id = if it.has("label") { str(it.label) } else { none }
    let content = [#num-display#it.body]
    let rendered = if label-id != none {
      html.elem(tag, attrs: (id: label-id), content)
    } else {
      html.elem(tag, content)
    }
    [#rendered#heading-reset-marker(it.level)]
  }

  // todo: implement some method to maintain its text for search, etc.
  // edit: will be hopefully solved with mathml in 15.0
  show math.equation.where(block: false): it => context {
    if target() == "html" {
      box(html.frame(it))
    } else {
      it
    }
  }

  show math.equation.where(block: true): it => context {
    if target() == "html" {
      html.elem(
        "div",
        attrs: (
          style: "display: block; margin-left: auto; margin-right: auto; align-self: center; margin-bottom: 16px",
        ),
      )[
        #html.frame(it)
      ]
    } else {
      it
    }
  }

  show grid: it => context {
    if target() == "html" {
      if (measure(it).width <= 360pt) {
        // to maintain centering
        html.frame(block(it))
      } else {
        html.frame(block(width: 360pt, it))
      }
    } else {
      it
    }
  }

  show: itemize.default-enum-list
  show: itemize.config.ref.with(supplement: "Part")
  set enum(numbering: "1")

  doc
}
