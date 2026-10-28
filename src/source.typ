#let title = "Notes on Complex Analysis"
#let authors = ("Slipper King",)
#let date = "May 15, 2025"
#let source-url = "https://github.com/slipperking/complex-analysis"

#let join-oxford-commas(v) = {
  if v.len() < 2 { v.at(0, default: "") } else if v.len() == 2 { v.join(" and ") } else {
    v.slice(0, -1).join(", ") + ", and " + v.last()
  }
}
