#import "@preview/ctheorems:1.1.3": *
#import "/itemize/lib.typ" as itemize
#import "@preview/cetz:0.5.0"
#import "@preview/cetz-plot:0.1.3": *
#import "@preview/physica:0.9.8": *
#import "@preview/physica:0.9.8": vb as _vb, va as _va, vu as _vu
#import "@preview/fancy-tiling:1.0.0": *

#let cvector = cetz.vector
#let cmatrix = cetz.matrix

#let _is-html = sys.inputs.at("html", default: "false") == "true" // target() == "html"

#let theorem-kinds = (
  "theorem",
  "lemma",
  "proposition",
  "corollary",
  "definition",
  "remark",
  "example",
)

// #let equate-eq = equate.with(number-mode: "label")
#let section-numbering-depth = 2

#let _heading-numbers(depth: section-numbering-depth, loc: none) = {
  let arr = if loc != none {
    counter(heading).at(loc)
  } else {
    counter(heading).get()
  }
  arr.slice(0, calc.min(depth, arr.len()))
}

#let _scoped-number(value, depth: section-numbering-depth, loc: none) = {
  let nums = _heading-numbers(depth: depth, loc: loc)
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
#let vu(x) = _vu(vb(x))
#let va(x) = _va(vb(x))

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

#let scoped-theorem-numbering(..nums) = nums.pos().map(str).join(".")

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
#let dtheta = $dif theta$
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
#let Ind = math.op("Ind")
#let oint = $integral.cont$

#let extcomplex = $hat(CC)$
#let length = $op("length")$
#let jinterior = $op("int")$
#let jexterior = $op("ext")$
#let uppi = $upright(pi)$

#let ee = $upright(e)$
#let ii = $upright(i)$
#let taui = $2 uppi ii$

#let nothing = sym.diameter
#let emptyset = sym.diameter
#let abs(x) = $lr(| #x |)$
#let ceil(x) = $lr(⌈ #x ⌉)$
#let floor(x) = $lr(⌊ #x ⌋)$
#let interior(x) = $attach(limits(#x), t: circle.small)$

#let doubletilde(x) = $tilde(tilde(#x))$

#let halflength-arrow(start, end, scalar: 0, mark: (end: ">>", fill: black), ..args) = {
  let stripped-start = start.slice(0, 2)
  let stripped-end = end.slice(0, 2)

  let diff = cvector.scale(cvector.norm(cvector.sub(stripped-start, stripped-end)), scalar)
  let offset = cmatrix.mul-vec(
    ((0, 1), (-1, 0)),
    diff,
  )

  let pstart = cvector.add(stripped-start, offset)
  let pend = cvector.add(stripped-end, offset)
  cetz.draw.line(
    (pstart, 25%, pend),
    (pstart, 75%, pend),
    ..args,
    mark: mark,
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

#let quick-plot(
  canvas: none,
  extra-plot: none,
  canvas-args: none,
  scale: 1.4,
  x-min: -1,
  x-max: 6,
  y-min: -1,
  y-max: 6,
  ..args,
) = {
  let x-range = x-max - x-min
  let y-range = y-max - y-min
  let size = (x-range * scale, y-range * scale)

  cetz.canvas(..canvas-args, {
    import cetz.draw: *
    plot.plot(
      size: size,
      axis-style: "school-book",
      x-min: x-min,
      x-max: x-max,
      y-min: y-min,
      y-max: y-max,
      x-tick-step: none,
      y-tick-step: none,
      ..args.named(),
      {
        plot.add(x => 0, domain: (0, 0))
        extra-plot
        plot.annotate({
          canvas
        })
      },
    )
  })
}
// this must be used around any normal figure to show in html
#let figure-wrapper(..items, columns: auto) = context {
  let figures = items.pos()
  let column-count = if columns == auto { figures.len() } else { columns }
  let body = grid(
    columns: column-count, gutter: 1fr,
    inset: 1em,
    align: alignment.center,
    ..figures.map(item => grid.cell([#item])),
  )

  if target() == "html" {
    body
  } else {
    place(
      alignment.top + alignment.center,
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


#let math-rect(snippet, ..args) = {
  box(
    math.equation(numbering: none, block: true, $ inline(#snippet) $),
    fill: luma(100%, 80%),
    outset: 1pt,
    ..args,
  )
}

#if _is-html {
  qedhere = none
}

#let citation(width: 55%, author, body) = {
  if _is-html {
    html.elem("blockquote", attrs: (class: "epigraph"), {
      html.elem("p", body)
      html.elem("footer", author)
    })
  } else {
    align(right, block(width: width, inset: 0em)[
      #set text(style: "italic", size: 0.95em)
      #align(left, body)
      #align(right, author)
    ])
  }
}


#let chapter-section(id, depth: auto, body) = context {
  if _is-html == true {
    let nav-depth = if depth == auto { none } else { str(depth) }
    let attrs = if nav-depth == none {
      (class: "chapter", id: id)
    } else {
      (class: "chapter", id: id, "data-nav-depth": nav-depth)
    }
    html.elem("section", attrs: attrs, body)
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
