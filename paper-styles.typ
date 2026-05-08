#import "/lib.typ": *

#let paper-styles(doc) = {
  set par(justify: true)
  set heading(numbering: "1.1")
  set page(numbering: "1", margin: 1.75in)

  show: equate.with(number-mode: "label")
  set math.equation(numbering: scoped-equation-numbering)
  show: thmrules.with(qed-symbol: $square$)

  set figure(placement: alignment.top)
  show figure.caption: it => context [
    *#it.supplement~#it.counter.display()#it.separator*#it.body
  ]
  show heading: it => context {
    if target() != "html" { return [#it#heading-reset-marker(it.level)] }
    let level = calc.min(it.level, 4)
    let tag = ("h1", "h2", "h3", "h4").at(level - 1)
    let num-display = if it.numbering != none {
      if level == 1 {
        [Chapter ] + counter(heading).display() + [: ]
      } else if level <= 3 {
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
      if (measure(it).width <= 480pt) {
        // to maintain centering
        html.frame(block(it))
      } else {
        html.frame(block(width: 480pt, it))
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
