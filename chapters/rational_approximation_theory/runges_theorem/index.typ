#import "/lib.typ": *

== Runge's Theorem

In the earliest formulation by Carl Runge in 1885, he provided the sufficiency of the holomorphy of $f$ on $K$ (in effect, a neighborhood of $K$).

The proof can be well-organized through the use of the results that we will now introduce. In essence, it involves applying Cauchy--Goursat to $f$ and the subsequent use of Riemann sums to approximate the complex line integral.

#proposition[
  Let $K subset.eq CC$ be compact and suppose $U supset K$ is a neighborhood of $K$ that is relatively compact in $CC$. Let $f:U -> CC$ be an arbitrary holomorphic function. Then for fixed $epsilon > 0$, there exists a rational function $psi(z)$ with only simple poles (all of which lie in $CC without K$) such that
  $
    lim_(z -> oo) psi(z) = 0, quad sup_(z in K) abs(f(z) - psi(z)) < epsilon.
  $
] <prop:rungesimplepolesandremovablesingularityatinfinity>

#figure-wrapper([
  #figure(
    cetz.canvas({
      import cetz.draw: *

      let filled-cells(grid) = {
        let cells = ()
        for (x, col) in grid.enumerate() {
          for (y, v) in col.enumerate() {
            if v { cells.push((x, y)) }
          }
        }
        cells
      }

      let boundary-edges(grid) = {
        let set_ = (:)
        let rows = grid.len()
        let cols = if rows > 0 { grid.at(0).len() } else { 0 }

        let filled(x, y) = {
          if x < 0 or y < 0 or x >= rows or y >= cols { false } else { grid.at(x).at(y) }
        }

        for (x, col) in grid.enumerate() {
          for (y, v) in col.enumerate() {
            if not v { continue }
            let edges = (
              ((x, y), (x + 1, y)),
              ((x, y + 1), (x + 1, y + 1)),
              ((x, y), (x, y + 1)),
              ((x + 1, y), (x + 1, y + 1)),
            )
            let neighbours = (
              filled(x, y - 1),
              filled(x, y + 1),
              filled(x - 1, y),
              filled(x + 1, y),
            )
            for (i, edge) in edges.enumerate() {
              if not neighbours.at(i) {
                let k = repr(edge)
                set_.insert(k, edge)
              }
            }
          }
        }
        set_.values()
      }

      let adjacency(edges) = {
        let adj = (:)
        for (a, b) in edges {
          let ka = repr(a)
          let kb = repr(b)
          adj.insert(ka, adj.at(ka, default: ()) + (b,))
          adj.insert(kb, adj.at(kb, default: ()) + (a,))
        }
        adj
      }

      let trace-polygon(start, adj) = {
        let poly = (start,)
        let prev = none
        let cur = start

        while true {
          let nexts = adj.at(repr(cur))
          let next = none
          for n in nexts {
            if n != prev {
              next = n
              break
            }
          }
          if next == none or next == start { break }
          poly.push(next)
          prev = cur
          cur = next
        }
        poly
      }

      let draw-grid-shape(
        grid,
        cell: 1,
        dot-stroke: (thickness: 0.3pt, dash: ("dot", "dot")),
        poly-stroke: (thickness: 0.9pt),
      ) = {
        if dot-stroke != none {
          for (x, col) in grid.enumerate() {
            for (y, v) in col.enumerate() {
              if v {
                let x0 = cell * x
                let y0 = cell * y
                line(
                  (x0, y0),
                  (x0 + cell, y0),
                  (x0 + cell, y0 + cell),
                  (x0, y0 + cell),
                  close: true,
                  stroke: dot-stroke,
                )
              }
            }
          }
        }
        let edges = boundary-edges(grid)
        let adj = adjacency(edges)

        let start = if edges.len() > 0 { edges.at(0).at(0) } else { none }
        if start == none { return }

        let poly-grid = trace-polygon(start, adj)

        let pts = poly-grid.map(((gx, gy)) => (cell * gx, cell * gy))
        line(..pts, close: true, stroke: poly-stroke)
      }
      let my-grid = {
        let g = ()
        for x in range(8) {
          let col = ()
          for y in range(8) {
            col.push(
              if x == 0 { y == 0 } else if x == 1 { y != 2 and y != 4 and y != 5 } else if x == 2 {
                y != 0 and y != 7
              } else if x == 3 { y != 0 } else if x == 4 { true } else if x == 5 { y != 7 } else if x == 6 {
                y != 2 and y != 7
              } else { y == 3 or y == 5 or y == 6 },
            )
          }
          g.push(col)
        }
        g
      }

      draw-grid-shape(my-grid, cell: 0.8)
      catmull(
        (6.08, 4.8),
        (3.52, 4.16),
        (5.92, 2.72),
        (3.68, 3.36),
        (5.28, 0.32),
        (3.36, 0.8),
        (3.84, 1.28),
        (1.92, 0.96),
        (0.48, 0.48),
        (2.56, 1.92),
        (1.28, 2.72),
        (2.4, 3.84),
        (0.96, 5.76),
        (2.72, 4.96),
        (3.36, 6.24),
        (3.68, 5.12),
        close: true,
        tension: 0.5,
        stroke: 0.9pt,
      )

      catmull(
        (0, -0.32),
        (0.32, 6.4),
        (6.4, 6.24),
        (6.24, 0),
        close: true,
        tension: 0.5,
        stroke: 0.9pt,
      )

      content((3.2, 3.2), $K$, anchor: "east")
      content((4.8, 6.4), $partial tilde(K)$, anchor: "north")
      content((3.2, 7.2), $partial U$, anchor: "south", padding: 3pt)
    }),
    caption: [The elements of $cal(G)$, relative to $K$ and its neighborhood, $U$.],
  ) <fig:runge_simple_poles_and_removable_singularity_at_infinity_grid>
])

#proof[
  By assumption of relative compactness, $sigma = op("dist")(partial U, partial K)$, or the distance (infimum) between $K$ and $CC without U$, is positive and finite. More concretely, let
  $
    sigma = inf({abs(z_1 - z_2) : z_1 in K, z_2 in CC without U}) > 0.
  $
  The longest distance between two points in any square is the length of the diagonal. Hence, any square $Q$ that intersects $partial K$ with a side length less than $sigma sqrt(2) / 2$ will lie completely within $U$.

  Choose $m in NN$ to satisfy $2^(1 - m) < sigma$ and consider the grid generated by compact squares in the form of
  $
    {x + ii y : j / 2^m <= x <= (j + 1) / 2^m, k / 2^m <= y <= (k + 1) / 2^m}
  $
  (where $j$ and $k$ are integers) and let $cal(G)$ be the collection of all such squares in this grid that intersect $K$, and it follows that $tilde(K) = union.big_(Q in cal(G)) Q subset U$ (refer to @fig:runge_simple_poles_and_removable_singularity_at_infinity_grid).

  As a consequence of Cauchy--Goursat (@thm:cauchygoursatformula), we have
  $
    1 / (2 uppi ii) integral.cont_(partial tilde(K)) (f(zeta) dzeta) / (zeta - z) = f(z)
  $ <eq:rungesimplepolesandremovablesingularityatinfinity_cauchygoursat>
  in the case that $z in tilde(K)$. The boundary $partial tilde(K)$ may be written as the union of $n$ lines parameterized by $0 <= t <= 1$; more concretely, we have $partial tilde(K) = union.big_(j in NN_(<= n)) gamma_j ([0, 1])$. Hence we have in equivalent formulation,
  $
    f(z) = 1 / (2 uppi ii) sum_(j = 1)^n integral_(gamma_j ([0, 1])) (f(zeta)) / (zeta - z) dzeta = 1 / (2 uppi ii) sum_(j = 1)^n integral_0^1 (f(gamma_j (t)) gamma'_j (t)) / (gamma_j (t) - z) dt.
  $
  The distance between $K$ and $partial tilde(K)$ is strictly positive. Suppose instead that the distance were zero. Then some point of $K$ would lie on the boundary of a square $Q in cal(G)$ that intersects $partial tilde(K)$. If this point lies on an edge of $Q$ (but not at a vertex), then the square adjacent along that edge must also intersect $K$, and hence belong to $cal(G)$, contradicting the assumption that the point lies on $partial tilde(K)$. If the point lies at a vertex of $Q$, then all three adjacent squares also intersect $K$, so they too belong to $cal(G)$, leading to the same contradiction. Thus, the distance must be positive.

  Hence, each integrand as defined in @eq:rungesimplepolesandremovablesingularityatinfinity_cauchygoursat is jointly continuous for $t in [0, 1]$ and $z in K$. By compactness of the product, it is in fact uniformly continuous by Heine--Cantor (@thm:heinecantor).

  Hence, $forall epsilon > 0$, $exists delta > 0$ such that $forall z in K$, $forall 1 <= j <= n$ (uniform in $j$ as we can take the minimum of each $delta_j$), and $forall t_1, t_2 in [0, 1]$ satisfying $abs(t_1 - t_2) < delta$,
  $
    abs((f(gamma_j (t_1)) gamma'_j (t_1)) / (gamma_j (t_1) - z) - (f(gamma_j (t_2)) gamma'_j (t_2)) / (gamma_j (t_2) - z)) < epsilon / n.
  $
  Partition $[0, 1]$ by $0 = t_0 < t_1 < dots < t_m = 1$ such that $forall 0 <= k < m$, $Delta t_k = t_(k + 1) - t_k < delta$. It follows that
  $
    &abs(f(z) - 1 / (2 uppi ii) sum_(j = 1)^n sum_(k = 0)^(m - 1) (f(gamma_j (t_k)) gamma'_j (t_k)) / (gamma_j (t_k) - z) Delta t_k) \
    &quad""= 1 / (2 uppi) abs(sum_(j = 1)^n sum_(k = 0)^(m - 1) integral_(t_k)^(t_(k + 1)) [(f(gamma_j (t)) gamma'_j (t)) / (gamma_j (t) - z) - (f(gamma_j (t_k)) gamma'_j (t_k)) / (gamma_j (t_k) - z)] dt) \
    &wide""<= 1 / (2 uppi) sum_(j = 1)^n sum_(k = 0)^(m - 1) integral_(t_k)^(t_(k + 1)) abs((f(gamma_j (t)) gamma'_j (t)) / (gamma_j (t) - z) - (f(gamma_j (t_k)) gamma'_j (t_k)) / (gamma_j (t_k) - z)) dt \
    &wide quad ""<= epsilon / (2 n uppi) sum_(j = 1)^n sum_(k = 0)^(m - 1) Delta t_k = epsilon / (2 uppi) < epsilon
  $
  uniformly in $z in K$. The summation
  $
    psi(z) = 1 / (2 uppi ii) sum_(j = 1)^n sum_(k = 0)^(m - 1) (f(gamma_j (t_k)) gamma'_j (t_k)) / (gamma_j (t_k) - z) Delta t_k
  $
  defines a rational function with simple poles at each $gamma_j (t_k) in partial tilde(K)$, which is disjoint from $K$.
]

In its full generality, we will now apply a technique to push a pole to a prescribed point, while ensuring that the resulting function remains uniformly approximated outside of a given connected compact set that contains both the original and target pole locations.

#lemma("Pole-Pushing Lemma")[
  Let $alpha, beta in CC$ and let $f(z)$ be a rational function with a single singularity, a pole at $z = alpha$, whose Laurent expansion consists solely of its principal part. Then $forall r > abs(alpha - beta)$, $forall epsilon > 0$, there exists a rational function $psi(z)$ whose only singularity is a pole at $z = beta$ such that
  $
    sup_(z in extcomplex without D(beta, r)) abs(f(z) - psi(z)) < epsilon.
  $
] <lem:simplepolepushing>

#proof[
  By assumption, $f$ can be expressed as a polynomial of
  $
    (z - alpha)^(-1) = (z - beta)^(-1) 1 / ((z - alpha) (z - beta)^(-1)) = (z - beta)^(-1) 1 / (1 - (alpha - beta) (z - beta)^(-1)) \
    = (z - beta)^(-1) sum_(k = 0)^oo ((alpha - beta) / (z - beta))^k.
  $
  This series locally uniformly converges on
  $
    {z in extcomplex : abs(alpha - beta) abs(z - beta)^(-1) < 1} = extcomplex without overline(D(beta, abs(alpha - beta)))
  $
  and uniformly converges on $extcomplex without D(beta, r)$. Hence, for $m in NN$, we have
  $
    f(z) = sum_(j = 1)^m a_(-j) (((z - beta)^(-1) sum_(k = 0)^oo ((alpha - beta) / (z - beta))^k))^j.
  $
  For fixed $j$ (where $a_(-j) != 0$), we aim to prove the existence of an $N in NN$ such that $forall n > N$, we have at least
  $
    abs([(z - beta)^(-1) sum_(k = 0)^oo ((alpha - beta) / (z - beta))^k]^j - [(z - beta)^(-1) sum_(k = 0)^n ((alpha - beta) / (z - beta))^k]^j) < epsilon / (m abs(a_(-j))),
  $ <eq:simple_pole_pushing_uniform_bound_assumption>
  where $z in extcomplex without D(beta, r)$. Since $abs(1 / (z - beta)) < 1 / r$, we can restrict @eq:simple_pole_pushing_uniform_bound_assumption further with
  $
    abs((sum_(k = 0)^oo ((alpha - beta) / (z - beta))^k)^j - (sum_(k = 0)^n ((alpha - beta) / (z - beta))^k)^j) < r^j epsilon / (m abs(a_(-j))).
  $
  Additionally, the difference on the left-hand side is also equal to
  $
    abs(sum_(k = n + 1)^oo ((alpha - beta) / (z - beta))^k) abs(sum_(l = 0)^(j - 1) (sum_(k = 0)^n ((alpha - beta) / (z - beta))^k)^l (sum_(k = 0)^oo ((alpha - beta) / (z - beta))^k)^(j - l - 1)).
  $ <eq:simple_pole_pushing_uniform_bound_assumption2>
  For any $n in NN$, we have
  $
    abs(sum_(k = 0)^n ((alpha - beta) / (z - beta))^k) <= sum_(k = 0)^n abs((alpha - beta) / (z - beta))^k <= sum_(k = 0)^oo abs(alpha - beta / r)^k <= 1 / (1 - abs(alpha - beta / r)).
  $
  Since the dominating sequence of partial sums are monotonically increasing, it follows that the sequence of partial sums is uniformly bounded by
  $
    M = r / (r - abs(alpha - beta))
  $
  on $extcomplex without D(beta, r)$. Thus, @eq:simple_pole_pushing_uniform_bound_assumption2 is bounded by $M^(j - 1) j abs(sum_(k = n + 1)^oo ((alpha - beta) / (z - beta))^k)$, and we apply further restriction by setting this to be bounded by $r^j epsilon / (m abs(a_(-j)))$. By uniform convergence, for any $epsilon > 0$, $exists N_j in NN$ such that $forall n > N_j$,
  $
    abs(sum_(k = n + 1)^oo ((alpha - beta) / (z - beta))^k) < r^j epsilon / (M^(j - 1) j m abs(a_(-j))).
  $
  For $n > N_j$, @eq:simple_pole_pushing_uniform_bound_assumption is satisfied, and $forall n > max_(j = 1 \ a_(-j) != 0)^m (N_j)$, $z in extcomplex without D(beta, r)$, we have
  $
    abs(f(z) - sum_(j = 1)^m a_(-j) ((1 / (z - beta) sum_(k = 0)^n ((alpha - beta) / (z - beta))^k)^j)) \
    <= sum_(j = 1 \ a_(-j) != 0)^m abs(a_(-j)) abs((sum_(k = 0)^oo ((alpha - beta) / (z - beta))^k)^j - (sum_(k = 0)^n ((alpha - beta) / (z - beta))^k)^j) \
    <= sum_(j = 1 \ a_(-j) != 0)^m abs(a_(-j)) epsilon / (m abs(a_(-j))) <= epsilon,
  $
  which completes the proof as
  $
    psi(z) = sum_(j = 1)^m a_(-j) ((z - beta)^(-1) sum_(k = 0)^n ((alpha - beta) / (z - beta))^k)^j
  $
  is rational with a pole at $z = beta$.
]

#lemma("Generalized Pole-Pushing Lemma")[
  Let $K subset.eq CC$ be compact and choose $a in CC without K$. Let $U$ be the connected component of $extcomplex without K$ containing $a$. Then $forall epsilon > 0$, $forall zeta in U$, there exists a rational function $psi$ with a pole only at $zeta$ such that
  $
    sup_(z in K) abs(1 / (z - a) - psi(z)) < epsilon.
  $
] <lem:generalpolepushing>

#proof[
  Define the set
  $
    S = {zeta in U without {oo} :
      (forall epsilon > 0) (exists psi) mat(
        delim: "[",
        psi " is rational,";
        psi(CC without {zeta}) subset.eq CC and psi(zeta) = oo, ;
        sup_(z in K) abs(1 / (z - a) - psi(z)) < epsilon
      )
    }.
  $
  Since $a in U$ satisfies the condition with $psi(z) = 1 / (z - a)$, it follows that $a in S$, ensuring that $S$ is nonempty.

  Consider $zeta in S$, where $zeta$ lies in the complement of $K$. The distance from $zeta$ to $K$, denoted $op("dist")(zeta, K)$, is positive, and the open disk $D(zeta, op("dist")(zeta, K))$ is disjoint from $K$. Let $zeta'$ be an arbitrary point in this disk. By the definition of $S$, for every $epsilon > 0$, there exists a rational function $psi$ with a pole only at $zeta$ such that
  $
    sup_(z in K) abs(1 / (z - a) - psi(z)) < epsilon / 2.
  $
  By @lem:simplepolepushing, there exists a rational function $phi.alt$ with a pole only at $zeta'$ such that
  $
    sup_(z in extcomplex without D(zeta, op("dist")(zeta, K))) abs(phi.alt(z) - psi(z)) < epsilon / 2,
  $
  which implies
  $
    sup_(z in K) abs(phi.alt(z) - psi(z)) < epsilon / 2.
  $
  Thus,
  $
    sup_(z in K) abs(1 / (z - a) - phi.alt(z)) <= sup_(z in K) abs(1 / (z - a) - psi(z)) + sup_(z in K) abs(psi(z) - phi.alt(z)) < epsilon,
  $
  and by definition, $zeta' in S ==> D(zeta, op("dist")(zeta, K)) subset.eq S$. Hence, $S$ is relatively open in $U without {oo}$.

  Now, consider $zeta in U without (S union {oo})$. Suppose there exists $zeta' in D(zeta, op("dist")(zeta, K)) inter S$. By repeated application of the preceding argument, this would imply $zeta in S$, contradicting the assumption that $zeta in U without (S union {oo})$. Therefore, no such $zeta'$ exists, and $S$ is relatively closed in $U without {oo}$.

  Since $U without {oo}$ is connected and $S$ is both relatively open and closed in $U without {oo}$, it follows from @thm:connectedtopologicalspaceclopensets that $S = U without {oo}$, completing the proof under the assumption that $oo in.not U$.

  Now suppose $oo in U$. In essence, we pole push to a point outside a disk on which we can make approximations by Taylor polynomials. Let $R > 0$ satisfy $K subset D(0, R)$ and let $b in U without ({oo} union overline(D(0, R)))$ be an arbitrary point. By @lem:simplepolepushing, there exists some rational function $tilde(psi) (z)$ with a pole at $b$ such that
  $
    sup_(z in K) abs(tilde(psi) (z) - 1 / (z - a)) < epsilon / 2.
  $
  Since $tilde(psi)$ is holomorphic on some neighborhood of $overline(D(0, R))$, we have
  $
    tilde(psi) (z) = sum_(k = 0)^oo a_k z^k quad "on" quad overline(D(0, R)),
  $
  and it uniformly converges on $overline(D(0, R))$. Hence, $exists N in NN$ such that
  $
    sup_(z in overline(D(0, R))) abs(tilde(psi) (z) - sum_(k = 0)^N a_k z^k) < epsilon / 2.
  $
  Since polynomials have poles at $oo$, we have
  $
    sup_(z in overline(D(0, R))) abs(1 / (z - a) - sum_(k = 0)^N a_k z^k) &<= sup_(z in overline(D(0, R))) abs(1 / (z - a) - tilde(psi) (z)) \
    &quad""+ sup_(z in overline(D(0, R))) abs(tilde(psi) (z) - sum_(k = 0)^N a_k z^k) < epsilon. #qedhere
  $
]

#theorem("Runge")[
  Let $K subset.eq CC$ be compact such that $extcomplex without K$ has finitely many connected components and suppose $f$ is holomorphic on a neighborhood of $K$. Let $E$ be a subset of $extcomplex without K$ containing one point from each of its connected components. Then $forall epsilon > 0$, there is a rational function $psi$ whose poles lie in $E$ such that
  $
    sup_(z in K) abs(f(z) - psi(z)) < epsilon.
  $
] <thm:runge>

#proof[
  By @prop:rungesimplepolesandremovablesingularityatinfinity, there is a rational function $phi.alt$ with simple poles in $CC without K$ satisfying $phi.alt(oo) = 0$ such that
  $
    sup_(z in K) abs(f(z) - phi.alt(z)) < epsilon / 2.
  $ <eq:runge_intermediate1>
  Let the poles of $phi.alt$ be ${beta_k}_(k in NN_(<= n)) subset.eq CC without K$, and as a consequence, we have $phi.alt(z) = sum_(k = 1)^n a_k / (z - beta_k) + phi(z)$ where $phi(z)$ is entire. Since $phi.alt(oo) = 0$, we have $phi equiv 0$ by Liouville's Theorem (@thm:liouville). By @lem:generalpolepushing, there exist rational functions ${psi_k}_(k in NN_(<= n))$ whose only poles lie in $E$ such that $forall k$,
  $
    sup_(z in K) abs(1 / (z - beta_k) - psi_k (z)) < epsilon / (2 n abs(a_k))
  $
  and it follows that
  $
    sup_(z in K) abs(phi.alt(z) - sum_(k = 1)^n a_k psi_k (z)) <= sup_(z in K) sum_(k = 1)^n abs(a_k / (z - beta_k) - a_k psi_k (z)) < epsilon / 2.
  $
  Let $psi(z) = sum_(k = 1)^n a_k psi_k (z)$. From @eq:runge_intermediate1, we have
  $
    sup_(z in K) abs(f(z) - psi(z)) <= sup_(z in K) abs(f(z) - phi.alt(z)) + sup_(z in K) abs(phi.alt(z) - psi(z)) < epsilon. #qedhere
  $
]
