#import "/lib.typ": *

=== Topology, Partitions of Unity, and the Existence of Bump Functions <sec:partitions_of_unity>

#definition("Topological Space")[
  A _topological space_ is a pair $(X, tau)$, where $X$ is a set and $tau$ is a collection of subsets of $X$ satisfying the following properties:

  1. $emptyset in tau$ and $X in tau$.
  2. The union of any (possibly infinite) collection of sets in $tau$ is also in $tau$.
  3. The intersection of any finite collection of sets in $tau$ is also in $tau$.

  The collection $tau$ is called a _topology_ on $X$, and its elements are referred to as _open sets_ under the topology $tau$.
]

Obviously the statement "let $X$ be a topological space" itself has little meaning. However, when the topology is implicitly obvious or the space is describable without it, then it may be verbally elided.

The implied topology of a subspace $A$ of $(X, tau)$ is given by the intersection of each set in $tau$ with $A$.

#definition[
  A subset $A$ of a topological space $X$ is _closed_ iff $X without A$ is open.
]

It is immediate from definition that the trivial sets $X$ and $emptyset$ are always closed. It is equally trivial from definition that the union of finitely many closed sets is closed, and the intersection of any collection of closed sets is closed.

If $exists U in tau$ such that $x in U$, then $U$ is an (open) _neighborhood_ of $x$. If $forall x, y in X$ (different) have disjoint neighborhoods, then $X$ is a _Hausdorff space_.

The following discussions involved with topological spaces here will always be of Hausdorff spaces, although making such distinction is important for future extensibility.

#definition[
  A topological space $X$ is _compact_ iff every open cover has a finite subcover. For a topological space $X$, a set $A subset.eq X$ is _compact_ iff every open cover has a finite subcover.
]

#proposition[
  Suppose $X$ is a Hausdorff topological space and let $A subset.eq X$ be compact. Then $A$ is closed in $X$.
] <prop:compactinhausdorffclosed>

#proof[
  Let $x in X without A$ be fixed. For each $a in A$, since $X$ is Hausdorff, there exist disjoint neighborhoods $U_a$ and $V_a$ with $x in U_a$ and $a in V_a$. The set
  $ union.big_(a in A) V_a supset.eq A $
  covers $A$, which by assumption, has a finite subcover
  $ union.big_(k = 1)^n V_(a_k) supset.eq A, quad forall k in NN_(<= n), a_k in A. $

  Moreover, the intersection
  $ U_x = inter.big_(k = 1)^n U_(a_k) $
  is an open neighborhood of $x$ and by construction, it is disjoint from the finite subcover. Since it is disjoint from a superset of $A$, it lies entirely in $X without A$.

  For each $x in X without A$, construct open $U_x$ accordingly. Then we obtain
  $ X without A subset.eq union.big_(x in X without A) U_x subset.eq X without A, $
  where the sandwiched union is open. Therefore, $A$ is closed.
]

#proposition[
  If $X$ is a compact space and $A subset.eq X$ is closed, then $A$ is compact.
] <prop:closedincompactspacecompactset>

#proof[
  Let $cal(U)$ be an open cover of $A$ in $X$. Since $X without A$ is open, the set
  $ {U union (X without A) : U in cal(U)} $
  openly covers $X$. Then a finite subcover
  $ {U_k union (X without A)}_(k in NN_(<= n)) $
  exists and covers $X$. The refinement ${U_k}_(k in NN_(<= n))$ then covers $A$.
]

#definition[
  A point $a$ is an accumulation point of a set $A$ in a topological space $X$ iff any open $U$ with $a in U$ implies that $U inter A$ contains a point other than $a$.
]

#proposition[
  A set $A$ in a topological space $X$ is closed iff it contains all its accumulation points.
] <prop:closedsetcontainsaccumulationpoints>

#proof[
  We first prove the forward implications under the assumption that $A$ is closed. Since $X without A$ is open, and suppose for contradiction, that $a in X without A$. Then for $a in U = X without A$ open, $U inter A = emptyset$ (and hence $a$ cannot be an accumulation point by contradiction of definition).

  Assume the converse assumption that $A$ contains all its accumulation points. Let $x in X without A$ be arbitrary. By assumption, $x$ is not an accumulation point of $A$. Hence, for some open set $U supset.eq {x}$, $U inter A$ does not contain a point other than $x$ (which it also cannot contain), implying that $U inter A = emptyset$, and hence $U subset.eq X without A$.

  For each $x in X without A$, we hence construct some open neighborhood fully contained in $X without A$. Together, they must union (by the definition of a topology) to an open set, being $X without A$. Therefore, $A$ is closed.
]

A topology allows the definition and general conceptualization of continuity, convergence, and connectivity in a general setting, without necessarily relying on a notion of distance (a metric).

#definition[
  A function $f:X -> Y$ between two topological spaces is said to be _continuous_ if the _pre-image_ of every open set in $Y$,
  $ {x in X : f(x) in Y}, $
  is an open set in $X$.
]

For the case of metric spaces, this generalizes the epsilon--delta notion of continuity.

#example[
  Consider the function $f:RR -> RR$ defined by
  $ f(x) = cases(1 & "if" x gt.eq 0, 0 & "if" x < 0.) $

  We equip both the domain and codomain with the standard topology on $RR$. Let $V = (.5, 1.5) subset.eq RR$. Then the pre-image of $V$ is
  $ f^(-1)(V) = {x in RR : f(x) in V} = RR_(>= 0), $
  which is not an open set in the standard topology on $RR$. Thus, $f$ is not continuous.
]

For two topological spaces $X$ and $Y$, a function $f:X -> Y$ is a _homeomorphism_ (also known as a _bicontinuous function_) if it is a bijection such that both $f$ and $f^(-1)$ are continuous. If such a function exists, then $X$ and $Y$ are _homeomorphic_.

The function $f:[0, 2 uppi) -> S^1$ with $f(t) = (cos(t), sin(t))$ is indeed continuous, but the inverse $f^(-1)(x_1, x_2)$ is discontinuous at $(x_1, x_2) = (1, 0)$.

#proposition[
  Let $(X, tau_1), (Y, tau_2)$ be two topological spaces. Then for $f:X -> Y$, the following conditions are equivalent:

  + $f$ is continuous.<itm:topologicalcontinuityequivalents_cont>
  + If $A subset.eq Y$ is closed, then the pre-image $f^(-1)(A)$ is closed.<itm:topologicalcontinuityequivalents_closed>
  + If $a in X$ and $A in tau_2$ is an open neighborhood of $f(a)$ in $Y$, then there is some $U in tau_1$ that is a neighborhood of $a$ such that $f(U) subset.eq A$.<itm:topologicalcontinuityequivalents_fitopenset>

] <prop:topologicalcontinuityequivalents>

#proof[
  We first show that @itm:topologicalcontinuityequivalents_cont implies @itm:topologicalcontinuityequivalents_closed. By continuity, for $A subset.eq Y$ closed, $Y without A in tau_2$, then
  $ f^(-1)(Y without A) = {x in X : f(x) in Y without A} = X without f^(-1)(A). $

  Assume the conditions of @itm:topologicalcontinuityequivalents_closed for the converse. Let $U in tau_2$ be open, $Y without U$ closed, then $f^(-1)(Y without U)$ is closed. Similar logic shows
  $ f^(-1)(Y without U) = X without f^(-1)(U), $
  which implies $f^(-1)(U)$ is open.

  Next we aim to show that continuity implies @itm:topologicalcontinuityequivalents_fitopenset. By assumption, the pre-image of any open $A subset.eq Y$ is $f^(-1)(A)$ and open and $a in f^(-1)(A)$. The property is complete under $U = f^(-1)(A)$.

  Assume the conditions of @itm:topologicalcontinuityequivalents_fitopenset for the converse. Let $A in tau_2$ be arbitrary. We aim to show that $f^(-1)(A) in tau_1$. If $f^(-1)(A) = emptyset$, then the conclusion is satisfied trivially. Hence, assume that $exists a in f^(-1)(A)$. For any such $a$, there exists a neighborhood $U_a in tau_1$ such that $f(U_a) subset.eq A$. Hence $U_a subset.eq f^(-1)(A)$ for any $a in f^(-1)(A)$. Therefore, we obtain
  $
    union.big_(a in f^(-1)(A)) U_a subset.eq f^(-1)(A),\
    union.big_(a in f^(-1)(A)) U_a supset.eq union.big_(a in f^(-1)(A)) {a} = f^(-1)(A)
    ==> union.big_(a in f^(-1)(A)) U_a = f^(-1)(A).
  $
  By the definition of topologies,
  $ union.big_(a in f^(-1)(A)) U_a in tau_1. #qedhere $
]

#definition("Basis for a Topology")[
  Let $X$ be a set. A _basis_ for a topology on $X$ is a collection $frak(B)$ of subsets of $X$ satisfying

  1. $union.big_(B in frak(B)) B = X$.
  2. For any $B_1, B_2 in frak(B)$ and any point $x in B_1 inter B_2$, there exists a set $B_3 in frak(B)$ such that
    $ x in B_3 subset.eq B_1 inter B_2. $

  The topology generated by $frak(B)$ is the collection of all unions of elements of $frak(B)$.
]

#definition[
  A _metric space_ is a pair $(X, d)$, where $X$ is a set and $d$ is a function from $X times X$ to $RR_(>= 0)$, called a _metric_, such that for all $x, y, z in X$ the following properties hold:

  1. $d(x, y) gt.eq 0$ and $d(x, y) = 0$ iff $x = y$ (positivity).
  2. $d(x, y) = d(y, x)$ (symmetry).
  3. $d(x, z) <= d(x, y) + d(y, z)$ (triangle inequality).
]

This in turn implies the reverse triangle inequality:
$
  d(x, z) <= d(x, y) + d(y, z) ==> d(x, y) gt.eq d(x, z) - d(y, z),
$
and similarly,
$
  d(y, z) <= d(x, y) + d(x, z) ==> d(x, y) gt.eq d(y, z) - d(x, z).
$

#definition[
  Let $(X, d)$ be a metric space. The _metric topology induced by $d$_ is the topology $tau_d$ generated by the basis
  $ {B(x, r) : x in X, r > 0} $
  comprising the balls
  $ B(x, r) = {y in X : d(x, y) < r}. $

  The pair $(X, tau_d)$ is the _topological space induced by the metric $d$_.
]

We now justify a claim whose triviality we have taken for granted.

#proposition[
  Let $(X, d)$ be a metric space under the induced metric topology. Then for any open set $U subset.eq X$, any point $x in U$, there exists a ball $B(x, delta)$ ($delta > 0$) in $U$.
]

#proof[
  By definition, $U$ lies in the topology for $X$ and is the union of (possibly infinitely many) balls. There then exists some ball $B(x_0, delta')$ in $U$ that contains $x$. Let
  $ delta = delta' - d(x_0, x). $
  Since $d(x_0, x) < delta'$, for any $y in B(x, delta)$, we have
  $ d(x_0, y) <= d(x_0, x) + d(x, y) <= delta'. $
  Hence, the open ball $B(x, delta)$ centered at $x$ lies within $B(x_0, delta')$.
]

#theorem[
  Let $(X, d_x), (Y, d_y)$ be two metric spaces under the metric topology. Then a function $f:X -> Y$ is topologically continuous iff it is epsilon--delta continuous.
]

#proof[
  We first imply that topological continuity implies epsilon--delta continuity. For any $x in X$, $forall epsilon > 0$, the ball $B(f(x), epsilon)$ is an open set (it is in the basis) in $Y$. By @itm:topologicalcontinuityequivalents_fitopenset of @prop:topologicalcontinuityequivalents, there is some open neighborhood $U$ of $x$ in $X$ such that $f(U) subset B(f(x), epsilon)$. By the previous proposition, there is a ball $B(x, delta) subset.eq U$. This is equivalent to
  $ epsilon > 0, x in X ==> exists delta = delta_x > 0: y in B(x, delta) ==> f(y) in B(f(x), epsilon). $

  Conversely, assume $f$ is $epsilon$--$delta$ continuous. Let $V subset.eq Y$ be open and $x in f^(-1)(V)$. Since $V$ is open in the metric topology, there exists $epsilon > 0$ such that
  $ B(f(x), epsilon) subset.eq V. $
  By epsilon--delta continuity, there exists $delta > 0$ such that
  $ d_x(x, y) < delta ==> d_y(f(x), f(y)) < epsilon, $
  or that
  $ y in B(x, delta) ==> f(y) in B(f(x), epsilon) subset.eq V. $
  Thus, the ball $B(x, delta_x)$ is an open neighborhood of $x$ in $X$ such that
  $
    B(x, delta_x) subset.eq f^(-1)(V) ==> f^(-1)(V) subset.eq union.big_(x in f^(-1)(V)) B(x, delta_x) subset.eq f^(-1)(V).
  $
  Since the union of open sets is open, the pre-image of any open set is open, and hence $f$ is topologically continuous.
]

#theorem[
  Let $X$ be a compact topological space and let $Y$ be a Hausdorff space. If $f:X -> Y$ is a continuous bijection, then $f$ is a homeomorphism.
]

#proof[
  If $A subset.eq X$ is compact, then the pre-images of any open cover $cal(U)$ of $f(A)$ cover $A$. Hence, there is a finite subcover
  $ {f^(-1)(U_k) : U_k in cal(U), k in NN_(<= n)} $
  covering $A$. Then
  $ {U_k : U_k in cal(U), k in NN_(<= n)} $
  covers $f(A)$, and hence $f(A)$ is compact.

  For any closed $C subset.eq X$, @prop:closedincompactspacecompactset implies $C$ is compact. Hence, $f(C)$ is compact. By @prop:compactinhausdorffclosed, $f(C)$ is closed. Hence, $f$ maps closed sets to closed sets, and the pre-image of any closed set is closed under $f^(-1)$. Hence, @prop:topologicalcontinuityequivalents implies $f^(-1)$ is continuous, thus $f$ is a homeomorphism.
]

It is worth noting some motivating examples for which the conclusion fails when certain hypotheses are not satisfied.

#example[
  Let $I = [0, 2 uppi)$ be a topological space with a metric $abs(dot)$ under the standard topology (the subspace topology induced by the basis formed with open "balls" or symmetric intervals around each point). Equip the unit circle
  $ S^1 = {z in CC : abs(z) = 1} $
  generated by the metric defined by arc-length $(d_(S^1))$. Then the continuous bijection $f:I -> S^1$ defined by $f(t) = ee^(ii t)$ is not a homeomorphism.
]

#proof[
  The non-continuity of $f^(-1):S^1 -> I$ is easy to visually see, both topologically and by epsilon--delta. Topologically, select the _relatively_ open interval $[0, uppi)$ in $I$. The pre-image of this set under $f^(-1)$ is $ee^(ii [0, uppi))$, which is clearly not an open set. This proves that $f^(-1)$ is not continuous (by definition).

  For continuity to hold by epsilon--delta, any $epsilon$ would yield the existence of some $delta$ such that $forall a, b in S^1$ with $d_(S^1)(a, b) < delta$, $abs(f^(-1)(a) - f^(-1)(b)) < epsilon$.

  Let $epsilon = uppi / 2$. For any $0 < delta < 2 uppi$, the points
  $ a = ee^(-ii delta / 4), b = ee^(ii delta / 4) $
  satisfy
  $ d_(S^1)(a, b) = delta / 2 < delta. $
  However,
  $ f^(-1)(a) = 2 uppi - delta / 4, quad f^(-1)(b) = delta / 4, $
  and
  $ abs(f^(-1)(a) - f^(-1)(b)) = 2 uppi - delta / 2 > uppi > epsilon. $
  This contradicts the previous statement.
]

We now provide a formal definition of the connectivity of sets:

#definition[
  A topological space $X$ is _disconnected_ if it can be written as the union of two nonempty disjoint open sets. Otherwise, it is _connected_.
]

In a topological space $X$, a subset can be open, closed (the complement of some open set), both (clopen), or neither. The only clopen sets that exist in any topological space $X$ are $emptyset$ and $X$ iff $X$ is connected. A technique pertinent to many future proofs relies on the following fact:

#theorem("Connectivity Argument")[
  A topological space $X$ is _connected_ if and only if $X$ and $emptyset$ are the only clopen subsets of $X$.
] <thm:connectedtopologicalspaceclopensets>

#proof[
  Suppose $X$ is connected and let $A subset.eq X$ be clopen. Then $A$ and $X without A$ are both open in $X$, disjoint, and their union is $X$. Thus, either $A = emptyset$ or $X without A = emptyset$ (i.e. $A = X$).

  Conversely, suppose $X$ is disconnected. Then there exist nonempty open sets $U, V subset.eq X$ such that $U inter V = emptyset$ and $U union V = X$. Thus,
  $ U = X without V $
  and
  $ V = X without U $
  are both clopen, contradicting the assumption that $X$ and $emptyset$ are the only clopen subsets. Hence, $X$ must be connected.
]

#example[
  The topological space $RR$ under the standard topology has only two clopen sets: $RR$ and $emptyset$.

  Now consider
  $ X = union.big_(n in 2 ZZ) (n, n + 1), $
  equipped with the topology $tau$ generated by the basis
  $ {(n, n + 1) : n in 2 ZZ}. $
  This space is disconnected. For instance, $(0, 1) subset X$ is open (as it is in $tau$) and closed (since its complement in $X$ is
  $ union.big_(n in (2 ZZ without {0})) (n, n + 1) in tau). $
  In fact, every set in $tau$ is clopen.
]

#proposition[
  The interval $[0, 1]$ (under the subspace topology induced by $RR$) is connected.
] <prop:unitintervalconnectivity>

#proof[
  Assume, for contradiction, that there exist two disjoint nonempty open sets $U, V subset [0, 1]$ such that
  $ U union V = [0, 1]. $
  Without loss of generality, assume $0 in U$ (otherwise switch $U$ and $V$). Let
  $ a = inf V. $

  Since $U, V$ are also closed in $[0, 1]$, either $a in V$ or $a$ is an accumulation point. Either way, $a$ is contained in $V$ by @prop:closedsetcontainsaccumulationpoints. Assume that $a != 0$. Then by openness, there exists some $0 < delta < a$ such that
  $ (a - delta, a) subset.eq (a - delta, a + delta) inter [0, 1] subset.eq V. $
  In particular,
  $ a - delta / 2 in V, $
  which contradicts $a$ being a lower bound of $V$.

  Therefore, $a = 0$. However, since $[0, delta)$ lies in $U$ for some $delta > 0$, $a gt.eq delta > 0$. Thus, we arrive at a contradiction, and thus $V$ is the empty set. This then shows that $[0, 1]$ is connected.
]

Connectivity intuitively means that a space cannot be split into two disjoint open subsets, but is not meaningful in terms of how points within the space relate to each other. In many geometric situations, the notion of _path-connectivity_ requires that any two points be joined by a continuous path. We will see that this more concrete condition forces the space to be topologically connected.

#definition[
  A topological space $X$ is said to be _path-connected_ iff for any two points $a, b in X$, there is a continuous function $f:[0, 1] -> X$, where $[0, 1]$ is equipped with the metric topology and $f(0) = a, f(1) = b$.
]

#theorem[
  A path-connected topological space $X$ is connected.
] <thm:pathconnectivityimpliesconnectivity>

#proof[
  Assume path-connectivity and suppose $X$ is disconnected. Then two open nonempty disjoint components $U, V subset X$ can be found. Let $u in U, v in V$ be two arbitrary points. Then there exists $f:[0, 1] -> X$ such that $f(0) = u$, $f(1) = v$. By continuity, the pre-images of $U$ and $V$, namely $f^(-1)(U)$ and $f^(-1)(V)$ respectively, are disjoint open subsets of $[0, 1]$. Moreover, the pre-image are nonempty as they contain $0$ and $1$ respectively. This contradicts the connectivity of $[0, 1]$ in @prop:unitintervalconnectivity.
]

#definition("Exhaustion by Compact Sets")[
  For a topological space $X$, an _exhaustion by compact sets_ is a nested sequence of compact sets ${K_n}_(n in NN) subset.eq X$ such that $K_n subset interior(K_(n + 1))$ for all $n in NN$ and
  $ X = union.big_(n in NN) K_n. $
] <def:exhaustionbycompactsets>

#lemma[
  Let $Omega subset.eq CC$ be an open set and let $frak(B)$ be a basis for the topology on $Omega$. Then there exists a collection of sets ${U_n}_(n in NN) subset.eq frak(B)$ such that

  + $union.big_(n in NN) U_n = Omega$.<itm:locally_finite_open_cover_existence_cover>
  + For every compact $K subset Omega$, $K$ intersects only finitely many sets in ${U_n}_(n in NN)$.<itm:locally_finite_open_cover_existence_localfiniteness>

] <lem:locally_finite_open_cover_existence>

#proof[
  Let ${K_n}_(n in NN) subset Omega$ be an exhaustion by compact sets with $K_0 = emptyset$ and $K_n subset.eq interior(K_(n + 1))$ for all $n in NN$. For each $n in NN$, define
  $ W_n = interior(K_(n + 1)) without K_(n - 2), quad V_n = K_n without interior(K_(n - 1)), $
  where $K_(-1) = emptyset$. Each $W_n$ is open and each $V_n$ is compact, with $V_n subset.eq W_n$ and
  $ union.big_(n in NN) V_n = Omega. $

  For each $n in NN$ and each $z in V_n$, since $W_n$ is open and contains $z$, there exists $U_(z, n) in frak(B)$ such that
  $ z in U_(z, n) subset.eq W_n. $
  The collection
  $ {U_(z, n) : z in V_n} $
  is an open cover of the compact set $V_n$, so by Heine--Borel (@thm:heineborel) it admits a finite subcover, there exist finitely many points $z_(n, 1), dots, z_(n, k_n) in V_n$ such that
  $ V_n subset union.big_(i = 1)^(k_n) U_(z_(n, i), n) subset.eq W_n. $
  Enumerate all such $U_(z_(n, i), n)$ over $n in NN$ and $i = 1, dots, k_n$ to obtain a countable collection ${U_j}_(j in NN) subset.eq frak(B)$. Then
  $ union.big_(j in NN) U_j = Omega, $
  proving @itm:locally_finite_open_cover_existence_cover.

  For 2, let $K subset Omega$ be compact. There exists $N in NN$ such that
  $ K subset interior(K_N), $
  so $K$ is disjoint from $V_n$ for all $n > N + 1$. Since each $V_n$ intersects only finitely many $U_j$, $K$ intersects only finitely many $U_j$. Thus the collection is locally finite.
]

#figure-wrapper([#figure(
    cetz.canvas({
      import cetz.draw: *
      import cetz.decorations: brace

      catmull(
        (-3.3, -0.8),
        (-0.5, -2.5),
        (1.5, -1.6),
        (3.5, 0.2),
        (2.0, 4.2),
        (-1.5, 4.0),
        (-2.3, 2.4),
        (-3.2, 0.2),
        close: true,
        tension: 0.5,
        stroke: (thickness: 0.35pt),
        name: "vn+1",
      )

      catmull(
        (-3.0, -0.8),
        (-0.5, -2.1),
        (1.5, -1.2),
        (2.8, 0.5),
        (1.8, 3.5),
        (-0.8, 3.7),
        (-1.9, 2.4),
        (-2.8, 0.2),
        close: true,
        tension: 0.5,
        stroke: (thickness: 0.5pt),
        name: "vn",
      )

      catmull(
        (-2.5, -0.8),
        (-0.5, -1.8),
        (1.5, -0.8),
        (2.5, 1.3),
        (1.5, 2.9),
        (-0.5, 3.2),
        (-1.5, 2.2),
        (-2.5, 0.2),
        close: true,
        tension: 0.5,
        stroke: (thickness: 0.65pt),
        name: "vn-1",
      )

      catmull(
        (-2.3, -0.3),
        (-0.5, -1.3),
        (1.0, -0.4),
        (1.7, 0.9),
        (1.9, 2.2),
        (-0.5, 2.7),
        (-1.0, 2.2),
        (-1.5, 1.2),
        close: true,
        tension: 0.5,
        stroke: (thickness: 1pt),
        name: "kn-2",
      )

      // dotted subcovers remain the same
      let subcover_arrays = (
        ((1.9, 2.5), (2.0, 3.6), (0.2, 3.9), (0.0, 2.8), (1.0, 2.9)),
        ((-1.3, 2.2), (-1.8, 2.7), (-1.3, 3.6), (-0.9, 3.9), (0.2, 3.8), (-0.1, 3.0), (-1.0, 2.6)),
        ((-1.3, 2.2), (-1.8, 2.7), (-1.3, 3.6), (-0.9, 3.9), (0.2, 3.8), (-0.1, 3.0), (-1.0, 2.6)),
        ((-3.0, 0.2), (-2.7, 1.2), (-1.9, 2.8), (-1.0, 2.5), (-1.8, 1.2), (-2.3, 0.2), (-2.5, -0.6)),
        ((-2.5, -1.3), (-0.3, -2.4), (-0.5, -1.7), (-1.5, -1.3), (-2.5, -0.5), (-2.8, 0.2), (-3.0, 0.2), (-3.2, -0.6)),
        ((-0.5, -1.6), (1.0, -1.0), (1.5, -0.1), (2.7, -0.1), (1.0, -1.7), (-0.7, -2.2)),
        ((1.5, -0.6), (1.8, 0.4), (3.0, 1.2), (3.1, 0.2)),
        ((3.0, 0.6), (2.3, 0.7), (2.1, 2.0), (1.7, 2.6), (1.9, 3.0), (2.4, 3.1)),
      )
      for points in subcover_arrays {
        catmull(..points, close: true, tension: 0.5, stroke: 0.5pt, fill: dot-tiling())
      }

      hide({
        line((0, 0), (2, 10), name: "brace_test_line")
        line((0, 0), (.5, 10), name: "label_test_line")
      })

      intersections("label_sect_kn-2", "kn-2", "label_test_line")
      intersections("label_sect_vn-1", "vn-1", "label_test_line")
      intersections("label_sect_vn", "vn", "label_test_line")
      intersections("label_sect_vn+1", "vn+1", "label_test_line")

      intersections("brace_sects", "kn-2", "vn+1", "brace_test_line")

      content(
        ("label_sect_kn-2.0", 50%, "label_sect_vn-1.0"),
        box(
          outset: 1pt,
          fill: luma(100%, 80%),
          math.equation(numbering: none, block: true, $ inline(V_(n-1)) $),
        ),
        anchor: "center",
      )
      content(
        ("label_sect_vn-1.0", 50%, "label_sect_vn.0"),
        box(
          outset: 1pt,
          fill: luma(100%, 80%),
          math.equation(numbering: none, block: true, $ inline(V_n) $),
        ),
        anchor: "center",
      )
      content(
        ("label_sect_vn.0", 50%, "label_sect_vn+1.0"),
        box(
          outset: 1pt,
          fill: luma(100%, 80%),
          math.equation(numbering: none, block: true, $ inline(V_(n+1)) $),
        ),
        anchor: "center",
      )

      content((0.0, 1.0), $K_(n-2)$, anchor: "north")
      brace(
        ("brace_sects.0", 2%, "brace_sects.1"),
        ("brace_sects.0", 98%, "brace_sects.1"),
        name: "wn-brace",
        amplitude: 7pt,
        stroke: (thickness: 1pt),
        flip: true,
      )
      content("wn-brace.content", box(outset: 1pt, fill: luma(100%, 80%), math.equation(
        numbering: none,
        block: true,
        $ inline(W_n) $,
      )))
    }),
    caption: [Geometry of the finite subcover of $V_n subset W_n$ for some $n in NN$.],
  ) <fig:locally_finite_open_cover_existence>
])
#remark[
  The property of local finiteness of an open collection $S$ in $Omega$ is commonly stated as: for every $z in Omega$, there exists an open neighborhood of $z$ that intersects only finitely many sets in $S$.

  This is equivalent to @itm:locally_finite_open_cover_existence_localfiniteness in @lem:locally_finite_open_cover_existence. Indeed, if every point has such a neighborhood, then any compact $K subset Omega$ admits a finite subcover of these neighborhoods by Heine--Borel (@thm:heineborel), so $K$ intersects finitely many sets in $S$. Conversely, for any $z in Omega$, take an open neighborhood $V$ with $z in V$ and with relatively compact closure in $Omega$; then $overline(V)$ intersects finitely many sets in $S$, and so does $V$.
]

#theorem("Partition of Unity")[
  Let $Omega subset.eq CC$ be a nonempty open set and let ${Omega_k}_(k in NN)$ be an open cover of $Omega$. Then there exists a collection of bump functions ${alpha_j}_(j in NN) subset.eq C^oo (CC)$, each with compact support in $Omega$, satisfying:

    + For each $j in NN$, there exists $k in NN$ such that $supp(alpha_j) subset.eq Omega_k$.<itm:partition_of_unity_subordinate>
    + The collection ${supp(alpha_j)}_(j in NN)$ is locally finite.<itm:partition_of_unity_local_finiteness>
    + For each $j in NN$, $0 <= alpha_j <= 1$.<itm:partition_of_unity_nonnegativity>
    + $sum_(j = 1)^infinity alpha_j equiv 1$ on $Omega$.<itm:partition_of_unity_partition_of_unity>
  
  Then ${alpha_j}_(j in NN)$ is called a $C^infinity$ partition of unity subordinate to ${Omega_k}_(k in NN)$.
] <thm:partition_of_unity>

#proof[
  For each $z in Omega$ there exists $r_z > 0$ and $k_z in NN$ such that
  $ overline(D(z, r_z)) subset Omega_(k_z). $
  The collection
  $ {D(z, r) : z in Omega and 0 < r < r_z} $
  is an open basis for $Omega$. By @lem:locally_finite_open_cover_existence there exists a locally finite open cover
  $ {D(z_j, r_(z_j))}_(j in NN) subset.eq frak(B) $
  of $Omega$ with
  $ D(z_j, r_(z_j)) subset overline(D(z_j, r_(z_j))) subset Omega_(k_(z_j)), quad forall j in NN. $

  Define the standard bump function
  $ theta(z) = cases(ee^(1 / (abs(z)^2 - 1)) & "if" abs(z) < 1, 0 & "if" abs(z) gt.eq 1.) $
  For $epsilon > 0$ let
  $ theta_epsilon(z) = theta(z / epsilon), $
  which has support $overline(D(0, epsilon))$.
  Define
  $ beta_j(z) = theta_(r_(z_j))(z - z_j), $
  so
  $ supp(beta_j) = overline(D(z_j, r_(z_j))) subset Omega_(k_(z_j)). $

  By local finiteness of ${D(z_j, r_(z_j))}_(j in NN)$, for each $z in Omega$ there exists an open neighborhood $V$ with $z in V$ intersecting only finitely many $overline(D(z_j, r_(z_j)))$. Thus ${supp(beta_j)}_(j in NN)$ is locally finite on $Omega$. Then the sum
  $ S(z) = sum_(j = 1)^infinity beta_j(z) $
  defined for $z in Omega$ involves only finitely many nonzero terms (by local finiteness) on a neighborhood of every point $z$. Hence $S in C^oo (Omega)$ and $S(z) > 0$ (since ${D(z_j, r_(z_j))}_(j in NN)$ covers $Omega$). Define
  $ alpha_j(z) = beta_j(z) / S(z), quad forall j in NN. $
  Each $alpha_j in C^oo (CC)$ has compact support in $Omega$, $0 <= alpha_j <= 1$, the supports are locally finite, and
  $ sum_(j = 1)^infinity alpha_j(z) = 1 $
  for all $z in Omega$. Moreover
  $ supp(alpha_j) subset.eq Omega_(k_(z_j)), $
  proving subordination.
]

#theorem("Existence of Bump Functions")[
  Let $K subset CC$ be compact and $V subset CC$ an open neighborhood of $K$. Then there exists a compactly supported $phi in C^oo (CC)$ such that
  $ 0 <= phi(z) <= 1 quad forall z in CC, $
  $supp(phi) subset V$, and $phi equiv 1$ on some open neighborhood of $K$.
] <thm:bumpfunctionexistence>

#proof[
  Let
  $ V(K, epsilon) = {z in CC : inf_(zeta in K) abs(z - zeta) < epsilon} $
  denote the open $epsilon$-neighborhood of $K$. Since $V$ is an open neighborhood of $K$, $exists epsilon > 0$ such that
  $ K subset V(K, epsilon) subset V(K, 2 epsilon) subset V, $
  where $A subset B$ means that the closure of $A$ is compact and contained in $B$.

  Define the open sets
  $ Omega_1 = V(K, 2 epsilon), quad Omega_2 = CC without overline(V(K, epsilon)). $
  Then ${Omega_1, Omega_2}$ is an open cover of $CC$.

  By the Partition of Unity Theorem (@thm:partition_of_unity), there exist compactly supported functions ${alpha_j}_(j in NN) subset.eq C^oo (CC)$ forming a partition of unity subordinate to this cover. That is,
  $
    0 <= alpha_j <= 1, quad supp(alpha_j) subset.eq Omega_(i_j) " for some " i_j in {1, 2}, quad sum_(j = 1)^infinity alpha_j equiv 1 quad "on" CC.
  $
  Let
  $ J = {j in NN : supp(alpha_j) subset.eq Omega_1}. $
  Define
  $ phi(z) = sum_(j in J) alpha_j(z). $
  Then $phi in C^oo (CC)$ is compactly supported within $Omega_1$, and since only finitely many $alpha_j$ are nonzero on a neighborhood of each point, $phi in C^oo (CC)$. Moreover,
  $ supp(phi) subset Omega_1 subset V. $

  For $z in V(K, epsilon)$, all functions with support in $Omega_2$ vanish at $z$, so
  $ phi(z) = sum_(j in J) alpha_j(z) = sum_(j = 1)^infinity alpha_j(z) = 1. $
  Hence, $phi equiv 1$ on the open neighborhood $V(K, epsilon)$ of $K$. Outside $V(K, 2 epsilon)$, all terms with support in $Omega_1$ vanish, so $phi(z) = 0$. Finally, $0 <= phi <= 1$ everywhere by construction. Thus $phi$ satisfies all required properties.
]
