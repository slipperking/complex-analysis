#import sym: *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/diverential:0.3.0": *
#import "@preview/droplet:0.3.1": dropcap
#import "@preview/subpar:0.2.2"
#import "@preview/cetz:0.5.0": *
#import "@preview/cetz-plot:0.1.3": *
#import "@preview/physica:0.9.8": *
#import "@preview/physica:0.9.8": vb as _vb
#import "@preview/headcount:0.1.0": *
#import "@preview/equate:0.3.2": equate

#let lang = sys.inputs.at("lang", default: "en")
#let _is-html = sys.inputs.at("html", default: "false") == "true"

#let reset-chapter-counters(include-theorems: false) = {
  counter(footnote).update(0)
  counter(figure.where(kind: image)).update(0)
  counter(figure.where(kind: table)).update(0)
  counter(figure.where(kind: "algorithm")).update(0)
  counter(math.equation).update(0)
  if include-theorems {
    for id in (
      "theorem",
      "lemma",
      "proposition",
      "corollary",
      "definition",
      "theorem_definition",
      "conjecture",
      "invariant",
      "remark",
      "open_question",
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

#let theorem-rules = thmrules.with(qed-symbol: $square$)

#let theorem = if _is-html {
  _html-thm("theorem", "Theorem", "thm-theorem")
} else {
  thmplain("theorem", "Theorem", titlefmt: strong, inset: (top: 0em, left: 0em, right: 0em), namefmt: x => emph(
    smallcaps([(#x)]),
  ))
}

#let appendix_theorem = if _is-html {
  _html-thm("theorem", "Theorem", "thm-theorem")
} else {
  thmplain("theorem", "Theorem", titlefmt: strong, inset: (top: 0em, left: 0em, right: 0em), namefmt: x => emph(
    smallcaps([(#x)]),
  )).with(numbering: "A.1")
}

#let Th = theorem
#let Thm = theorem

#let lemma = if _is-html {
  _html-thm("lemma", "Lemma", "thm-lemma")
} else {
  thmplain("lemma", "Lemma", titlefmt: strong, inset: (top: 0em, left: 0em, right: 0em), namefmt: x => emph(smallcaps(
    [(#x)],
  )))
}

#let appendix_lemma = if _is-html {
  _html-thm("lemma", "Lemma", "thm-lemma")
} else {
  thmplain("lemma", "Lemma", titlefmt: strong, inset: (top: 0em, left: 0em, right: 0em), namefmt: x => emph(smallcaps(
    [(#x)],
  ))).with(numbering: "A.1")
}

#let lemma_break = lemma

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

#let theorem_definition = if _is-html {
  _html-thm("theorem_definition", "Theorem and Definition", "thm-theorem-definition")
} else {
  thmplain("theorem_definition", "Theorem and Definition", titlefmt: strong, inset: (top: 0em, left: 0em, right: 0em))
}

#let th-def = theorem_definition

#let conjecture = if _is-html {
  _html-thm("conjecture", "Conjecture", "thm-conjecture")
} else {
  thmplain("conjecture", "Conjecture", titlefmt: strong, inset: (top: 0em, left: 0em, right: 0em))
}

#let invariant = if _is-html {
  _html-thm("invariant", "Invariant", "thm-invariant")
} else {
  thmplain("invariant", "Invariant", titlefmt: strong, inset: (top: 0em, left: 0em, right: 0em))
}

#let remark = if _is-html {
  _html-thm("remark", "Remark", "thm-remark")
} else {
  thmplain("remark", "Remark", inset: (top: 0em, left: 0em, right: 0em)).with(numbering: none)
}

#let open_question = if _is-html {
  _html-thm("open_question", "Open Question", "thm-open-question")
} else {
  thmplain("open_question", "Open Question", titlefmt: strong, inset: (top: 0em, left: 0em, right: 0em))
}

#let example = if _is-html {
  _html-thm("example", "Example", "thm-example")
} else {
  thmplain("example", "Example", titlefmt: strong, inset: (top: 0em, left: 0em, right: 0em), namefmt: x => emph(
    smallcaps([(#x)]),
  ))
}

#let demonstration = if _is-html {
  _html-proof("Proof")
} else {
  thmproof("demonstration", "Proof", base: "theorem")
}

#let proof = if _is-html {
  _html-proof("Proof")
} else {
  thmproof("proof", "Proof", base: "theorem", inset: (top: 0em, left: 0em, right: 0em))
}

#let demo = demonstration
#let Proof = proof

#let trivial_proof = if _is-html {
  html.elem("div", attrs: (class: "thm-proof"), {
    html.elem("p", [
      #html.elem("em", [Proof:])
      #[ trivial.]
      #html.elem("span", attrs: (class: "qed"), [□])
    ])
  })
} else {
  [*Proof:* trivial. #h(1fr) $square$]
}

#let epigraph(width: 55%, author, body) = {
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

#let drop_cap(word, body) = {
  if _is-html {
    html.elem("p", attrs: (class: "lettrine"), [#smallcaps(word) #body])
  } else {
    dropcap(height: 2, gap: 2pt, overhang: 4pt)[#smallcaps(word) #body]
  }
}

#let fref(lab) = if _is-html { ref(lab) } else { [#ref(lab), #ref(lab, form: "page")] }

#let subfig(..args) = {
  let grid = subpar.grid(
    ..args.named(),
    ..args.pos(),
    numbering: (..num-args) => [#counter(heading).get().at(0).#num-args.at(0)],
    numbering-sub-ref: (..nums, it) => [#counter(heading).get().at(0).#nums.at(0)#numbering("a", it)],
    supplement: [Figure],
    show-sub-caption: (it, body) => {
      set par(justify: true)
      text(size: 10pt, align(left, body))
    },
    grid-styles: (align),
    gutter: 0.2cm,
  )
  if _is-html {
    html.frame(block(width: 42em, grid))
  } else {
    grid
  }
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
