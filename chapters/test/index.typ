#import "/lib.typ": *
= Test
$ T_0(r,f) = integral_0^r A(t,f) / t dt = integral_0^r A(t,F) / t dt = T_0(r,F).#tag[(a)] $
$ T_0(r,f) = integral_0^r A(t,f) / t dt = integral_0^r A(t,F) / t dt = T_0(r,F).#tag(move: true)[(a)] $
#lorem(600)
$
  T_0(r,f) = integral_0^r A(t,f) / t dt = integral_0^r A(t,F) / t dt = T_0(r,F) + 0+ 0+ 0+ 0+ 0+ 0.#tag(move: false)[(0+)]
$
$
  T_0(r,f) = integral_0^r A(t,f) / t dt & = integral_0^r A(t,F) / t dt = T_0(r,F) + 0+ 0+ 0+ 0 #tag[(a)] \
                                        & = integral_0^r A(t,F) / t dt = T_0(r,F) + 0+ 0+ 0+ 0+ 0+ 0 \
                                        & =0+ 0+ 0+ 0+0+ 0+ 0+ 0+0+ 0+ 0+ 0 #tag[(b)] \
                                        & = 2 #tag[$(#sym.dagger.triple)$]
$
