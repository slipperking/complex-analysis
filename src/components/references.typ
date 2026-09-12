#import "math.typ": *
#import "theorems.typ": theorem-reference

#let pdf-scope-label = <pdf-scope>
#let web-scope-label = <web-scope>

#let legacy-label-routing = sys.inputs.at("legacy-label-routing", default: "false") == "true"
#let secondary-label-assignment-counter = state("secondary-label-assignment", 0)
#let secondary-label-assignment-map = state("secondary-label-assignment-map", (:))

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

#let paged-link-with-html-indicator(base, html-link) = {
  $#base^#text(link(html-link, $dagger.triple$ * 3), size: 0.8em)$
}

#let _target-selector(target) = if type(target) == label { selector(target) } else { target }
#let _target-matches(target) = query(_target-selector(target))

#let _retarget-ref(reference, target) = {
  ref(target, supplement: reference.supplement, form: reference.form)
}

#let _legacy-reference-route(target, mode) = {
  let labels = secondary-label-assignment-map.final().at(str(target), default: ())
  let targets = labels
    .map(candidate => {
      let matches = _target-matches(candidate)
      if matches.len() > 0 {
        (label: candidate, location: matches.first().location())
      } else {
        none
      }
    })
    .filter(target => target != none)
  if targets.len() == 0 {
    return none
  }

  (
    local: if mode == "web" { targets.last().label } else { targets.first().label },
    element: none,
    links: targets.map(target => target.location),
    html: if targets.len() > 1 { targets.last().location } else { none },
  )
}

#let _selector-reference-route(reference, mode) = {
  let current-scope = if mode == "web" { web-scope-label } else { pdf-scope-label }
  let current-element = reference.element
  if current-element == none {
    let current-matches = _target-matches(
      selector(reference.target).within(current-scope),
    )
    current-element = if mode == "web" {
      current-matches.last(default: none)
    } else {
      current-matches.first(default: none)
    }
  }

  let counterpart-scope = if mode == "web" { pdf-scope-label } else { web-scope-label }
  let counterpart-matches = _target-matches(
    selector(reference.target).within(counterpart-scope),
  )
  let counterpart = if mode == "web" {
    counterpart-matches.first(default: none)
  } else {
    counterpart-matches.last(default: none)
  }
  let pdf-element = if mode == "web" { counterpart } else { current-element }
  let web-element = if mode == "web" { current-element } else { counterpart }
  let links = (pdf-element, web-element).filter(element => element != none).map(element => element.location())

  (
    local: none,
    element: current-element,
    links: links,
    html: if web-element != none { web-element.location() } else { none },
  )
}

#let _reference-route(reference, mode) = {
  if type(reference.target) != label {
    return none
  }
  if legacy-label-routing {
    _legacy-reference-route(reference.target, mode)
  } else {
    let route = _selector-reference-route(reference, mode)
    if route.links.len() == 0 and reference.element == none { none } else { route }
  }
}

#let _reference-element(reference, route) = {
  if reference.element != none {
    return reference.element
  }
  if route != none and route.element != none {
    return route.element
  }

  let matches = if route != none and route.local != none {
    _target-matches(route.local)
  } else {
    _target-matches(reference.target)
  }
  if matches.len() == 1 { matches.first() } else { none }
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
    for target in targets {
      // The browser code only consumes the href. A direct link avoids creating
      // two additional references (and running their show rules) per source ref.
      html.elem("mtext", link(target, [link]), attrs: (class: "typst-multi-label"))
    }
  },
  attrs: (class: "typst-multi-label-list"),
)

#let show-reference(reference, mode) = context {
  // Resolve and format once here so theorem, equation, and enum behavior does
  // not depend on a chain of later `show ref` rules seeing another ref element.
  let route = _reference-route(reference, mode)
  let target = _reference-element(reference, route)
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
