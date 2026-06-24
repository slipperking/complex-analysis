#import "@preview/cetz:0.5.2"
#let myblock = {
  import cetz.draw: *
  let A = (0, 0)
  let E = (2.7, 0)
  let F = (1.8, 2)
  line(A, F, E)
  for (i, points) in ((A, F, E), (F, A, E)).enumerate(start: 1) {
    let result = (0,0)
    content(result, [$Delta_#i$], anchor: "center")
  }
}
#panic("The type of myblock is " + repr(type(myblock)))
