#import "/lib.typ": *
#show: docs-chapter.with(
  title: "Test",
  route: "test",
  description: "Test",
)

1. #lorem(20)
+ #lorem(19)

  #lorem(18)
+ #lorem(23)
  $ F = m a $
  #enum-lbl(<itm:test>)

#lorem(20)
$ T_0(r,f) = integral_0^r A(t,f) / t dt = integral_0^r A(t,F) / t dt = T_0(r,F).#tag[(a)] $
$ T_0(r,f) = integral_0^r A(t,f) / t dt = integral_0^r A(t,F) / t dt = T_0(r,F).#tag(move: true)[(a)] $
#lorem(600)
$
  T_0(r,f) = integral_0^r A(t,f) / t dt = integral_0^r A(t,F) / t dt = T_0(r,F) + 0+ 0+ 0+ 0+ 0+ 0.#tag(move: false)[(0+)]
$
#lbl(
  $
    T_0(r,f) = integral_0^r A(t,f) / t dt & = integral_0^r A(t,F) / t dt = T_0(r,F) + 0+ 0+ 0+ 0 #tag[(a)] \
                                          & = integral_0^r A(t,F) / t dt = T_0(r,F) + 0+ 0+ 0+ 0+ 0+ 0 \
                                          & =0+ 0+ 0+ 0+0+ 0+ 0+ 0+0+ 0+ 0+ 0 #tag[(b)] \
                                          & = 2 #tag[$(#sym.dagger.triple)$]
  $,
  <eq:test-large>,
)
#lorem(85) @eq:test and @eq:test-large and @itm:test
#lbl(
  $
    E = m c^2
  $,
  <eq:test>,
)
#lorem(90)
