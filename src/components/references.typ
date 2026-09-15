#import "math.typ": *
#import "theorems.typ": theorem-reference

#let pdf-scope-label = <pdf-scope>
#let web-scope-label = <web-scope>

#let legacy-label-routing = sys.inputs.at("legacy-label-routing", default: "false") == "true"
#let secondary-label-assignment-counter = state("secondary-label-assignment", 0)
#let secondary-label-assignment-map = state("secondary-label-assignment-map", (:))

#let reference-pass-through = metadata("reference-pass-through")
#let reference-html-indicator = metadata("reference-html-indicator")

#let explicit-label(..args, prefix: "") = {
  let args = args.pos()
  if args.len() == 0 {
    panic("No explicit-label parameters were given")
  } else if args.len() == 1 {
    return args.first()
  }

  let (a, b) = args.slice(0, 2)
  let (body, original-label) = if type(b) == str or type(b) == label {
    (a, b)
  } else if type(a) == str or type(a) == label {
    (b, a)
  } else {
    panic("One of the explicit-label parameters must be a string or label.")
  }

  let direct-label = label(prefix + str(original-label))
  if not legacy-label-routing {
    return [#body#direct-label]
  }

  secondary-label-assignment-counter.update(c => c + 1)
  context {
    let counter = secondary-label-assignment-counter.get()
    let unique-label = label(prefix + str(original-label) + str(counter))
    [#body#unique-label]
    secondary-label-assignment-map.update(map => {
      let labels = map.at(str(original-label), default: ())
      map.insert(str(original-label), labels + (unique-label,))
      map
    })
  }
}

#let _tagged-ref(target, tag: reference-pass-through, supplement: auto, form: "normal") = {
  set bibliography(title: tag)
  ref(target, supplement: supplement, form: form)
}

#let paged-link-with-html-indicator(base, html-target) = {
  if legacy-label-routing {
    return $#base^#text(link(html-target, $dagger.triple$ * 3), size: 0.8em)$
  }
  $#base^#text(_tagged-ref(html-target, tag: reference-html-indicator), size: 0.8em)$
}

#let _retarget-ref(reference, target) = {
  _tagged-ref(
    target,
    supplement: reference.supplement,
    form: reference.form,
  )
}

#let _legacy-reference-route(target, mode) = {
  let labels = secondary-label-assignment-map.final().at(str(target), default: ())
  if labels.len() == 0 {
    return none
  }

  (
    local: if mode == "web" { labels.last() } else { labels.first() },
    links: labels,
    html: if labels.len() > 1 { labels.last() } else { none },
  )
}

#let _selector-reference-route(reference) = {
  (
    local: none,
    links: (
      selector(reference.target).within(pdf-scope-label),
      selector(reference.target).within(web-scope-label),
    ),
    html: selector(reference.target).within(web-scope-label),
  )
}

#let _reference-route(reference, mode) = {
  if type(reference.target) != label {
    return none
  }
  if legacy-label-routing {
    _legacy-reference-route(reference.target, mode)
  } else if reference.element == none {
    // bibliography citations have label targets but no referenced document
    // element, leave entirely to typst's native citation handling.
    none
  } else {
    _selector-reference-route(reference)
  }
}

#let _equation-reference(target) = {
  let number = counter(math.equation).at(target.location()).at(0) + 1
  link(target.location(), [(#_scoped-number(number, loc: target.location()))])
}

#let _enum-label(target) = target.func() == metadata
and type(target.value) == dictionary
and target.value.at("type", default: none) == "typst-enum-item-label"

#let _format-reference(reference, target) = {
  if target == none {
    none
  } else if target.func() == math.equation {
    _equation-reference(target)
  } else if target.func() == figure and target.kind == "thm-env" {
    theorem-reference(reference, target)
  } else if _enum-label(target) {
    link(target.location(), [Part~#numbering("1.1", ..counter("typst-enum").at(target.location()))])
  } else {
    none
  }
}

#let _reference-link-list(targets) = html.elem(
  "math",
  {
    set bibliography(title: reference-pass-through)
    for target in targets {
      html.elem("mtext", ref(target), attrs: (class: "typst-multi-label"))
    }
  },
  attrs: (class: "typst-multi-label-list"),
)

#let show-reference(reference, mode) = context {
  if bibliography.title == reference-pass-through {
    let formatted = _format-reference(reference, reference.element)
    if formatted != none {
      return formatted
    }
    if reference.element == none {
      return none
    }
    return reference
  }
  if bibliography.title == reference-html-indicator {
    if reference.element == none {
      return none
    }
    return link(reference.element.location(), $dagger.triple$ * 3)
  }

  let route = _reference-route(reference, mode)
  let target = reference.element
  let formatted = _format-reference(reference, target)
  let visible = if formatted != none {
    formatted
  } else if route != none and route.local != none {
    _retarget-ref(reference, route.local)
  } else {
    reference
  }

  if route == none {
    return visible
  }
  if mode == "web" {
    visible + _reference-link-list(route.links)
  } else if route.html != none {
    paged-link-with-html-indicator(visible, route.html)
  } else {
    visible
  }
}
