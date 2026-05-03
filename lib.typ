#import sym: *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/diverential:0.3.0": *
#import "@preview/cetz:0.5.0": *
#import "@preview/cetz-plot:0.1.3": *
#import "@preview/physica:0.9.8": *
#import "@preview/physica:0.9.8": vb as _vb
#import "@preview/headcount:0.1.0": *
#import "@preview/equate:0.3.2": equate

#let _is-html = sys.inputs.at("html", default: "false") == "true"

#let reset-chapter-counters(include-theorems: false) = {
  counter(footnote).update(0)
  counter(math.equation).update(0)
  if include-theorems {
    for id in (
      "theorem",
      "lemma",
      "proposition",
      "corollary",
      "definition",
      "remark",
      "example",
    ) {
      counter(figure.where(kind: "thm-" + id)).update(0)
    }
  }
}

// use the non-abbreviated terms for no upright.
#let vb(x) = _vb(math.upright(x))
#let vu(x) = _vu(math.upright(x))
#let va(x) = _va(math.upright(x))

#let _html-thm(identifier, head, css-class) = {
  let thm-kind = "thm-" + identifier
  let fmt-num() = context {
    let chap = counter(heading).get().at(0)
    let n = counter(figure.where(kind: thm-kind)).get().first()
    str(chap) + "." + str(n)
  }
  (..args, body) => {
    let name = if args.pos().len() > 0 { args.pos().first() } else { none }
    figure(
      kind: thm-kind,
      supplement: head,
      outlined: false,
      numbering: (..nums) => [#counter(heading).get().at(0).#nums.at(0)],
      html.elem("div", attrs: (class: "thm-box " + css-class), {
        html.elem("p", attrs: (class: "thm-head"), {
          html.elem("strong", [#head #fmt-num()])
          if name != none [ (#name)]
          [.]
        })
        body
      }),
    )
  }
}

#let _html-proof(head) = {
  (..args, body) => {
    html.elem("div", attrs: (class: "thm-proof"), {
      html.elem("p", attrs: (class: "proof-head"), html.elem("em", [#head.]))
      body
      html.elem("p", attrs: (class: "qed"), [□])
    })
  }
}

#let theorem = if _is-html {
  _html-thm("theorem", "Theorem", "thm-theorem")
} else {
  thmplain("theorem", "Theorem", titlefmt: strong, inset: (top: 0em, left: 0em, right: 0em), namefmt: x => emph(
    smallcaps([(#x)]),
  ))
}

#let lemma = if _is-html {
  _html-thm("lemma", "Lemma", "thm-lemma")
} else {
  thmplain("lemma", "Lemma", titlefmt: strong, inset: (top: 0em, left: 0em, right: 0em), namefmt: x => emph(smallcaps(
    [(#x)],
  )))
}

#let proposition = if _is-html {
  _html-thm("proposition", "Proposition", "thm-proposition")
} else {
  thmplain("proposition", "Proposition", titlefmt: strong, inset: (top: 0em, left: 0em, right: 0em), namefmt: x => emph(
    smallcaps([(#x)]),
  ))
}

#let corollary = if _is-html {
  _html-thm("corollary", "Corollary", "thm-corollary")
} else {
  thmplain(
    "corollary",
    "Corollary",
    base: "theorem",
    titlefmt: strong,
    inset: (top: 0em, left: 0em, right: 0em),
    namefmt: x => emph(smallcaps([(#x)])),
  )
}

#let definition = if _is-html {
  _html-thm("definition", "Definition", "thm-definition")
} else {
  thmplain("definition", "Definition", titlefmt: strong, inset: (top: 0em, left: 0em, right: 0em))
}

#let remark = if _is-html {
  _html-thm("remark", "Remark", "thm-remark")
} else {
  thmplain("remark", "Remark", inset: (top: 0em, left: 0em, right: 0em)).with(numbering: none)
}

#let example = if _is-html {
  _html-thm("example", "Example", "thm-example")
} else {
  thmplain("example", "Example", titlefmt: strong, inset: (top: 0em, left: 0em, right: 0em), namefmt: x => emph(
    smallcaps([(#x)]),
  ))
}

#let proof = if _is-html {
  _html-proof("Proof")
} else {
  thmproof("proof", "Proof", base: "theorem", inset: (top: 0em, left: 0em, right: 0em))
}

#let dx = $dif x$
#let dy = $dif y$
#let dz = $dif z$
#let dzeta = $dif zeta$
#let dt = $dif t$
#let dr = $dif r$

#let supp = math.op("supp")
#let diam = math.op("diam")
#let Log = math.op("Log")
#let logp = math.op($log^+$)
#let arg = math.op("arg")
#let Arg = math.op("Arg")
#let Aut = math.op("Aut")
#let Res = math.op("Res", limits: true)
#let Re = math.op($frak(R) e$)
#let Im = math.op($frak(I) m$)
#let oint = $integral.cont$

#let extcomplex = $hat(CC)$
#let length = $op("length")$
#let jinterior = $op("int")$
#let jexterior = $op("ext")$
#let uppi = $upright(pi)$

#let ee = $upright(e)$
#let ii = $upright(i)$
#let taui = $2 uppi ii$

#let abs(x) = $lr(| #x |)$
#let ceil(x) = $lr(⌈ #x ⌉)$
#let floor(x) = $lr(⌊ #x ⌋)$
#let interior(x) = $attach(limits(#x), t: circle)$

#let doubletilde(x) = $tilde(tilde(#x))$

#let halflength-arrow(start, end, scalar: 0, ..args) = {
  let diff = vector.scale(vector.norm(vector.sub(start, end)), scalar)
  let offset = matrix.mul-vec(((0, 1), (-1, 0)), diff)

  let pstart = vector.add(start, offset)
  let pend = vector.add(end, offset)
  draw.line(
    (pstart, 25%, pend),
    (pstart, 75%, pend),
    ..args,
    mark: (end: ">>", fill: black),
  )
}

#let add-vectors(..vectors) = {
  vectors.pos().fold((0, 0, 0), vector.add)
}

#let directional_points(offset: (0, 0), angle: 0, length: 1e-6, n: 10) = {
  let vec = matrix.mul4x4-vec3(matrix.transform-rotate-z(angle), (length, 0, 0)).slice(0, 2)
  let out = ()

  for i in range(n + 1) {
    out.push(vector.add(vector.scale(vec, i / n), offset))
  }
  out
}

#let quick-plot(body, extra-plot: none, canvas-args: none, ..args) = {
  canvas(..canvas-args, {
    import draw: *
    plot.plot(
      size: (6, 6),
      axis-style: "school-book",
      x-min: -1,
      x-max: 6,
      y-min: -1,
      y-max: 6,
      x-tick-step: none,
      y-tick-step: none,
      ..args.named(), // can override defaults
      {
        plot.add(x => 0, domain: (0, 0))
        extra-plot
        plot.annotate({
          body
        })
      },
    )
  })
}

// this must be used around any normal figure to show in html
#let figure-wrapper(..items, columns: auto, inset: 0em) = {
  let figures = items.pos()
  let column-count = if columns == auto { figures.len() } else { columns }

  place(
    alignment.top,
    scope: "parent",
    float: true,
    grid(
      columns: column-count,
      inset: inset,
      ..figures.map(item => grid.cell([#item])),
    ),
  )
}
