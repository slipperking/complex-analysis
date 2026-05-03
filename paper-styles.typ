#import "/lib.typ": *

#let paper-styles(doc) = {
  set par(justify: true)
  set heading(numbering: "1.1")

  show: equate.with(number-mode: "label")
  set math.equation(supplement: none, numbering: dependent-numbering("(1.1)", levels: 2))
  show heading: reset-counter(counter(math.equation), levels: 2)
  show: thmrules.with(qed-symbol: $square$)
  set figure(placement: alignment.top)
  show figure.caption: it => context [
    *#it.supplement~#it.counter.display()#it.separator*#it.body
  ]
  doc
}

#let html-show-rules(doc) = {
  show heading: it => context {
    if _is-html != true { return it }
    let level = calc.min(it.level, 4)
    let tag = ("h1", "h2", "h3", "h4").at(level - 1)
    let num-display = if it.numbering != none {
      if level == 1 {
        [Chapter ] + counter(heading).display() + [ — ]
      } else if level <= 3 {
        counter(heading).display() + [ ]
      }
    }
    let label-id = if it.has("label") { str(it.label) } else { none }
    let content = [#num-display#it.body]
    if label-id != none {
      html.elem(tag, attrs: (id: label-id), content)
    } else {
      html.elem(tag, content)
    }
    if level == 1 {
      reset-chapter-counters(include-theorems: true)
    }
  }

  show math.equation.where(block: false): it => context {
    if _is-html == true {
      box(html.frame(it))
    } else {
      it
    }
  }

  show math.equation.where(block: true): it => context {
    if _is-html == true {
      html.frame(it)
    } else {
      it
    }
  }

  show grid: it => context {
    if _is-html == true {
      html.frame(block(width: 42em, it))
    } else {
      it
    }
  }

  doc
}

#let chapter-section(id, body) = context {
  if _is-html == true {
    html.elem("section", attrs: (class: "chapter", id: id), body)
  } else {
    body
  }
}

#let part-marker(id, title) = context {
  if _is-html == true {
    html.elem("section", attrs: (class: "part", id: id), {
      html.elem("h1", attrs: (class: "part-title"), title)
    })
  }
}
