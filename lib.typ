#import sym: *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/diverential:0.3.0": *
#import "@preview/cetz:0.5.0": *
#import "@preview/cetz-plot:0.1.3": *
#import "@preview/physica:0.9.8": *
#import "@preview/physica:0.9.8": vb as _vb
#import "@preview/headcount:0.1.0": *

// use the non-abbreviated terms for no upright.
#let vb(x) = _vb(math.upright(x))
#let vu(x) = _vu(math.upright(x))
#let va(x) = _va(math.upright(x))

#let theorem = thmplain(
  "theorem",
  "Theorem",
  titlefmt: strong,
  inset: (top: 0em, left: 0em, right: 0em),
  namefmt: x => emph(smallcaps([(#x)])),
)
#let proposition = thmplain(
  "proposition",
  "Proposition",
  titlefmt: strong,
  inset: (top: 0em, left: 0em, right: 0em),
  namefmt: x => emph(smallcaps([(#x)])),
)
#let lemma = thmplain("lemma", "Lemma", titlefmt: strong, inset: (top: 0em, left: 0em, right: 0em), namefmt: x => emph(
  smallcaps([(#x)]),
))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong,
  inset: (top: 0em, left: 0em, right: 0em),
  namefmt: x => emph(smallcaps([(#x)])),
)
#let definition = thmplain(
  "definition",
  "Definition",
  titlefmt: strong,
  inset: (top: 0em, left: 0em, right: 0em),
)
#let example = thmplain(
  "example",
  "Example",
  titlefmt: strong,
  inset: (top: 0em, left: 0em, right: 0em),
  namefmt: x => emph(smallcaps([(#x)])),
)
#let proof = thmproof("proof", "Proof", inset: (top: 0em, left: 0em, right: 0em))
#let remark = thmplain("remark", "Remark", inset: (top: 0em, left: 0em, right: 0em)).with(numbering: none)

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
      ..args.named(),
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
