#import "@preview/ctheorems:1.1.3": *
#import "@preview/diverential:0.3.0": *
#import "@preview/cetz:0.5.0"
#import "@preview/cetz-plot:0.1.3": *
#import "@preview/physica:0.9.8": *
#import "@preview/physica:0.9.8": vb as _vb
#import "@preview/equate:0.3.2": equate

#let cvector = cetz.vector
#let cmatrix = cetz.matrix

#let _is-html = sys.inputs.at("html", default: "false") == "true"

#let theorem-kinds = (
  "theorem",
  "lemma",
  "proposition",
  "corollary",
  "definition",
  "remark",
  "example",
)

#let section-numbering-depth = 2

#let _heading-numbers(depth: section-numbering-depth) = {
  counter(heading).get().slice(0, depth)
}

#let _scoped-number(value, depth: section-numbering-depth) = {
  let nums = _heading-numbers(depth: depth)
  let scoped = nums + (value,)
  scoped.map(str).join(".")
}

#let reset-theorem-counters() = {
  for id in theorem-kinds {
    counter(figure.where(kind: "thm-" + id)).update(0)
  }
}

#let reset-heading-scoped-counters(include-theorems: true) = {
  counter(footnote).update(0)
  counter(math.equation).update(0)
  if include-theorems {
    reset-theorem-counters()
  }
}

#let scoped-equation-numbering(..args) = [(#_scoped-number(args.at(0)))]

#let heading-reset-marker(level) = context if level <= section-numbering-depth {
  reset-heading-scoped-counters()
}

// use the non-abbreviated terms for no upright.
#let vb(x) = _vb(math.upright(x))
#let vu(x) = _vu(math.upright(x))
#let va(x) = _va(math.upright(x))

#let _html-thm(identifier, head, css-class, numbered: true) = {
  let thm-kind = "thm-" + identifier
  let fmt-num() = context if numbered {
    let n = counter(figure.where(kind: thm-kind)).get().first()
    _scoped-number(n)
  } else {
    none
  }
  (..args, body) => {
    let name = if args.pos().len() > 0 { args.pos().first() } else { none }
    figure(
      kind: thm-kind,
      supplement: head,
      outlined: false,
      numbering: if numbered { (..nums) => [#_scoped-number(nums.at(0))] } else { none },
      html.elem("div", attrs: (class: "thm-box " + css-class), {
        html.elem("p", attrs: (class: "thm-head"), {
          html.elem("strong", if numbered { [#head #fmt-num()] } else { [#head] })
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
      html.elem("p", attrs: (class: "qed"), [$square$])
    })
  }
}

#let scoped-theorem-numbering(..nums) = [(#_scoped-number(nums.at(0)))]

#let theorem = if _is-html {
  _html-thm("theorem", "Theorem", "thm-theorem")
} else {
  thmplain(
    "theorem",
    "Theorem",
    titlefmt: strong,
    inset: (top: 0em, left: 0em, right: 0em),
    namefmt: x => emph(smallcaps([(#x)])),
  ).with(numbering: scoped-theorem-numbering)
}

#let lemma = if _is-html {
  _html-thm("lemma", "Lemma", "thm-lemma")
} else {
  thmplain(
    "lemma",
    "Lemma",
    titlefmt: strong,
    inset: (top: 0em, left: 0em, right: 0em),
    namefmt: x => emph(smallcaps([(#x)])),
  ).with(numbering: scoped-theorem-numbering)
}

#let proposition = if _is-html {
  _html-thm("proposition", "Proposition", "thm-proposition")
} else {
  thmplain(
    "proposition",
    "Proposition",
    titlefmt: strong,
    inset: (top: 0em, left: 0em, right: 0em),
    namefmt: x => emph(smallcaps([(#x)])),
  ).with(numbering: scoped-theorem-numbering)
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
  ).with(numbering: scoped-theorem-numbering)
}

#let definition = if _is-html {
  _html-thm("definition", "Definition", "thm-definition")
} else {
  thmplain(
    "definition",
    "Definition",
    titlefmt: strong,
    inset: (top: 0em, left: 0em, right: 0em),
  ).with(numbering: scoped-theorem-numbering)
}

#let remark = if _is-html {
  _html-thm("remark", "Remark", "thm-remark", numbered: false)
} else {
  thmplain("remark", "Remark", inset: (top: 0em, left: 0em, right: 0em)).with(numbering: none)
}

#let example = if _is-html {
  _html-thm("example", "Example", "thm-example")
} else {
  thmplain(
    "example",
    "Example",
    titlefmt: strong,
    inset: (top: 0em, left: 0em, right: 0em),
    namefmt: x => emph(smallcaps([(#x)])),
  ).with(numbering: scoped-theorem-numbering)
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
#let Re = math.op($frak(Re)$)
#let Im = math.op($frak(Im)$)
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
#let interior(x) = $attach(limits(#x), t: circle.small)$

#let doubletilde(x) = $tilde(tilde(#x))$

#let halflength-arrow(start, end, scalar: 0, ..args) = {
  let diff = cvector.scale(cvector.norm(cvector.sub(start, end)), scalar)
  let offset = cmatrix.mul-vec(((0, 1), (-1, 0)), diff)

  let pstart = cvector.add(start, offset)
  let pend = cvector.add(end, offset)
  cetz.draw.line(
    (pstart, 25%, pend),
    (pstart, 75%, pend),
    ..args,
    mark: (end: ">>", fill: black),
  )
}

#let add-vectors(..vectors) = {
  vectors.pos().fold((0, 0, 0), cvector.add)
}

#let directional_points(offset: (0, 0), angle: 0, length: 1e-6, n: 10) = {
  let vec = cmatrix.mul4x4-vec3(cmatrix.transform-rotate-z(angle), (length, 0, 0)).slice(0, 2)
  let out = ()

  for i in range(n + 1) {
    out.push(cvector.add(cvector.scale(vec, i / n), offset))
  }
  out
}

#let quick-plot(body, extra-plot: none, canvas-args: none, ..args) = {
  cetz.canvas(..canvas-args, {
    import cetz.draw: *
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
#let figure-wrapper(..items, columns: auto) = {
  let figures = items.pos()
  let column-count = if columns == auto { figures.len() } else { columns }
  let body = grid(
    columns: column-count, gutter: 1fr,
    inset: 1em,
    ..figures.map(item => grid.cell([#item])),
  )

  if _is-html {
    body
  } else {
    place(
      alignment.top,
      float: true,
      body,
    )
  }
}

#let dot-tiling(pattern_dist: 2pt, radius: 0.4pt) = tiling(
  size: (pattern_dist, pattern_dist),
  relative: "parent",
  place(
    circle(
      radius: radius,
      fill: black,
    ),
  ),
)

#let arc-center(
  center,
  ..args,
) = {
  let start = args.at("start", default: auto)
  let start-angle = if start == auto {
    let stop = args.at("stop", default: auto)
    let delta = args.at("delta", default: auto)
    if stop != auto and delta != auto { stop - delta } else { 0deg }
  } else { start }

  let radius = args.at("radius", default: 1)
  let (rx, ry) = if type(radius) == array { radius } else { (radius, radius) }
  let (cx, cy, cz) = if center.len() == 2 {
    center.push(0)
    center
  } else { center }

  let start-pos = (
    cx + rx * calc.cos(start-angle),
    cy + ry * calc.sin(start-angle),
    cz,
  )

  cetz.draw.arc(start-pos, ..args)
}
