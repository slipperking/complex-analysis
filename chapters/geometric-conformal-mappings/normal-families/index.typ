#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Normal Families],
  route: "normal-families",
)
A collection of functions is better known as a _family_ of functions. One important distinguishing property of families of functions, as opposed to sequences, is that families may be uncountable and may not be indexed by the natural numbers. We will now introduce the following classification of families of functions:

#lbl(
  definition[Normal Family][
    A family of holomorphic functions $cal(F)$ defined on a region $U subset.eq CC$ is said to be _normal_ if every sequence of functions in $cal(F)$ has a locally uniformly (compactly) convergent subsequence on $U$.
  ],
  <def:normalsubfamily>,
)

The following notion was introduced and formalized by the Italian mathematicians Cesare Arzelà and Giulio Ascoli to formulate a clear distinction in how uniformity is applied.

#lbl(
  definition[Equicontinuity][
    A family of functions $cal(F)$ defined on a region $U subset.eq CC$ is said to be _equicontinuous_ at a point $z_0 in U$ if for every $epsilon > 0$, there exists a $delta > 0$ (that may depend on $z_0$) such that for all $f in cal(F)$ and all $z in U$ with $abs(z - z_0) < delta$, we have $abs(f(z) - f(z_0)) < epsilon$.
  ],
  <def:equicontinuity>,
)

In contrast, the uniform continuity of a function $f$ guarantees that $delta$ may be chosen independently of $z_0$. In the case of (pointwise) equicontinuity, it is chosen independently of $f in cal(F)$. A family of functions is said to be _uniformly equicontinuous_ on $U$ if $delta$ can be chosen independently of both $z_0$ and $f in cal(F)$ (in other words, it attains a positive infimum in $U$). Similar to @thm:heine-cantor

#lbl(
  theorem[
    A family of functions $cal(F)$ that is pointwise equicontinuous on every point $z in K subset CC$ for a compact set $K$ is uniformly equicontinuous on $K$.
  ],
  <thm:heine_cantor_family>,
)

#proof[
  Fix $z in K$. By pointwise equicontinuity, $forall epsilon > 0$, $exists delta_z > 0$ such that $forall f in cal(F)$, $forall zeta in D(z, delta_z) inter K$,
  #lbl(
    $
      abs(f(zeta) - f(z)) < epsilon / 2.
    $,
    <eq:heine_cantor_family_equicontinuityconsequence>,
  )

  The collection ${D(z, delta_z / 2)}_(z in K)$ forms an open cover of $K$, and by the Heine--Borel Theorem, it admits a finite subcover ${D(z_k, delta_(z_k) / 2)}_(k in NN_(<= n))$ for some finite $n in NN$. Let $delta = min_(k in NN_(<= n)) (delta_(z_k) / 2)$.

  For any $z, w in K$ such that $abs(z - w) < delta$, $exists j in NN_(<= n)$ such that $z in D(z_j, delta_(z_j) / 2)$. Evidently,
  $
    abs(z_j - w) <= abs(z_j - z) + abs(z - w) < delta_(z_j) / 2 + delta <= delta_(z_j).
  $
  Therefore, from @eq:heine_cantor_family_equicontinuityconsequence, we have $forall f in cal(F)$,
  $
    abs(f(z_j) - f(w)) < epsilon / 2, quad abs(f(z_j) - f(z)) < epsilon / 2.
  $
  Hence, $forall f in cal(F)$, we have
  $
    abs(f(z) - f(w)) <= abs(f(w) - f(z_j)) + abs(f(z_j) - f(z)) < epsilon,
  $
  which proves the uniform equicontinuity of $cal(F)$.
]

The following theorem is important in many areas of mathematical analysis and has a plethora of generalizations. It was first introduced by Ascoli (who proved the sufficiency of compactness) and later formalized by Arzelà, who proved the necessity of uniform equicontinuity and uniform boundedness.

#lbl(
  theorem[Arzelà--Ascoli][
    Let $cal(F)$ be a family of complex continuous functions defined on a compact subset $K subset.eq CC$. Then, $cal(F)$ is uniformly bounded and uniformly equicontinuous on $K$ iff $cal(F)$ is normal on $K$.
  ],
  <thm:arzela_ascoli>,
)

#proof[
  We will first prove the sufficiency of uniform boundedness and uniform equicontinuity. Let ${f_n}_(n in NN)$ be any sequence in $cal(F)$. By the uniform boundedness of $cal(F)$, there exists a constant $M > 0$ such that $abs(f_n (z)) <= M$ for all $z in K$ and all $n in NN$.

  Let ${zeta_k}_(k in NN)$ be a countably dense subset of $K$. By the Bolzano--Weierstrass Theorem (@thm:bolzano-weierstrass), there exists a subsequence of ${f_n}_(n in NN)$, namely ${f_(n_(1,j))}_(j in NN)$, such that ${f_(n_(1,j)) (zeta_1)}_(j in NN)$ is convergent. The set ${f_(n_(1,j)) (zeta_2)}_(j in NN)$ is also bounded by $M$, and hence, by the Bolzano--Weierstrass Theorem, it too has a convergent subsequence ${f_(n_(2,j)) (zeta_2)}_(j in NN)$. Similarly, there exists a subsequence of ${f_(n_(2,j))}_(j in NN)$, namely ${f_(n_(3,j))}_(j in NN)$, such that ${f_(n_(3,j)) (zeta_3)}_(j in NN)$ is convergent.

  By the method of construction, we have:
  #lbl(
    $
      n_(1,1) < n_(1,2) < dots.c < n_(1,j) < dots.c \
      n_(2,1) < n_(2,2) < dots.c < n_(2,j) < dots.c \
      dots.v \
      n_(k,1) < n_(k,2) < dots.c < n_(k,j) < dots.c \
      dots.down,
    $,
    <eq:arzela_ascoli_indexsequences>,
  )
  and furthermore, the sequence in each row is a subsequence of the previous row. As a result, we have
  #lbl(
    $
      n_(1,1) <= n_(2,1) <= dots.c <= n_(k,1) <= dots.c \
      n_(1,2) <= n_(2,2) <= dots.c <= n_(k,2) <= dots.c \
      dots.v \
      n_(1,j) <= n_(2,j) <= dots.c <= n_(k,j) <= dots.c \
      dots.down.
    $,
    <eq:arzela_ascoli_indexsequencestransposed>,
  )
  We will now invoke a diagonalization argument. Since the sequences above in @eq:arzela_ascoli_indexsequences are strictly increasing and from the results of @eq:arzela_ascoli_indexsequencestransposed, it follows that ${n_(j,j)}_(j in NN)$ is strictly increasing. Let $n_(j,j)$ be denoted by $n'_j$. Since $cal(F)$ is uniformly equicontinuous on $K$, $forall epsilon > 0$, $exists delta = delta(epsilon) > 0$ such that $forall z, z' in K$ satisfying $abs(z - z') < delta$, $forall j in NN$, we have
  #lbl(
    $
      abs(f_(n'_j) (z) - f_(n'_j) (z')) < epsilon / 3.
    $,
    <eq:arzela_ascoli_uniform_equicontinuity_direct_consequence>,
  )
  Since each ${f_(n_(k,j))}_(j in NN)$ is convergent at $zeta_k$ (for a fixed $k$) by construction, and since ${n'_j}_(j >= k)$ is a subsequence of ${n_(k,j)}_(j in NN)$, it is evident that ${f_(n'_j)}_(j in NN)$ is convergent at each $zeta_k$. We then have that $forall k in NN$, $exists N = N(epsilon, k) in NN$ such that $forall i, j > N$,
  $
    abs(f_(n'_i) (zeta_k) - f_(n'_j) (zeta_k)) < epsilon / 3.
  $
  For the fixed value of $epsilon$, the collection ${D(zeta_k, delta)}_(k in NN)$ forms an open cover of $K$, and by the Heine--Borel Theorem (@thm:heine-borel), it admits finite subcovering ${D(zeta_k, delta)}_(k in {1, dots, l})$ for some finite $l = l(epsilon) in NN$.

  Hence, $exists k = k(epsilon) <= l$ such that any point $z in K$ lies in $D(zeta_k, delta)$. By @eq:arzela_ascoli_uniform_equicontinuity_direct_consequence, we have that
  $
    abs(f_(n'_j) (z) - f_(n'_j) (zeta_k)) < epsilon / 3, quad abs(f_(n'_i) (z) - f_(n'_i) (zeta_k)) < epsilon / 3.
  $
  Letting $tilde(N) = tilde(N)(epsilon) = max{N(epsilon, 1), dots, N(epsilon, l(epsilon))}$, we have that $forall i, j > tilde(N)$, $forall z in K$,
  $
    abs(f_(n'_j) (z) - f_(n'_i) (z)) & <= abs(f_(n'_j) (z) - f_(n'_j) (zeta_k)) + abs(f_(n'_j) (zeta_k) - f_(n'_i) (zeta_k)) \ & wide"" + abs(f_(n'_i) (zeta_k) - f_(n'_i) (z)) \
    & = epsilon / 3 + epsilon / 3 + epsilon / 3 = epsilon.
  $
  Hence, the sequence is uniformly convergent on $K$ by the Cauchy Criterion (@thm:cauchy-criterion-uniform-convergence).

  For the proof of the necessity, we will first assume the normality of $cal(F)$ in $K$.

  For the sake of contradiction, assume that $cal(F)$ is not uniformly bounded. Then $forall n in NN$, $exists f_n in cal(F)$ and $exists z_n in K$ such that $abs(f_n (z_n)) > n$. By assumption, this sequence has a subsequence ${f_(n_k)}_(k in NN)$ that uniformly converges. Hence, $exists N in NN$ such that $forall k > N$, $forall z in K$, $abs(f_(n_k) (z) - f(z)) < 1$. By the reverse triangle inequality, it follows that $abs(f_(n_k) (z)) < abs(f(z)) + 1$. Since $f$ is continuous on $K$ by @thm:uniform-limit, it is bounded by some $M_1$ (@thm:continuous-function-bounded-on-compact). Let $M_2 = max_(k in NN_(<= N)) sup_(z in K) abs(f_(n_k) (z))$. It follows that this subsequence is uniformly bounded by $max{M_1 + 1, M_2}$. However, since $abs(f_(n_k) (z_(n_k))) > n_k -> oo$ for any $k$, this subsequence cannot be uniformly bounded, and hence we have a contradiction.

  We will now assume that $cal(F)$ is not pointwise equicontinuous at some arbitrary point $z_0 in K$. In other words, $exists epsilon > 0$ such that $forall delta > 0$, $exists f in cal(F)$, $exists z in K$ such that $abs(z - z_0) < delta$ satisfying
  $
    abs(f(z) - f(z_0)) > epsilon.
  $
  Let us define sequences ${f_n}_(n in NN) subset.eq cal(F)$ and ${z_n}_(n in NN) subset.eq K$ such that $abs(z_n - z_0) < 1 / n$ and
  $
    abs(f_n (z_n) - f_n (z_0)) > epsilon.
  $
  Since $cal(F)$ is assumed to be normal, the sequence ${f_n}_(n in NN)$ has a uniformly convergent subsequence ${f_(n_k)}_(k in NN)$ converging to a continuous function $f$. In particular, since uniform convergence preserves continuity (@thm:uniform-limit), the limit $f$ is continuous at $z_0$, and hence,
  $
    f_(n_k) (z_0) - f(z_0) -> 0, quad f(z_0) - f(z_(n_k)) -> 0, quad f_(n_k) (z_(n_k)) - f(z_(n_k)) -> 0,
  $
  where the rightmost inequality is derived from the fact that $f_(n_k) arrows.rr f$ on $K$. Thus,
  $
    abs(f_(n_k) (z_(n_k)) - f_(n_k) (z_0)) -> 0,
  $
  which contradicts the result that $abs(f_(n_k) (z_(n_k)) - f_(n_k) (z_0)) > epsilon$ for all $k$.

  Hence, by contradiction, $cal(F)$ is pointwise equicontinuous on all of $K$. By @thm:heine_cantor_family, $cal(F)$ must be uniformly equicontinuous on $K$.
]

The notions and results introduced have profound implications and uses in the theory of differential equations and harmonic analysis.

In the definition of equicontinuity used in the Arzelà--Ascoli theorem, the distance is taken with respect to the Euclidean metric. However, the theorem continues to hold for other metrics as well, with the proof requiring little modification. We will rely on this formulation in @sec:spherical-generalization-of-normal-families.

Lastly, we will prove Montel's Theorem in preparation of the Riemann Mapping Theorem (@thm:riemann-mapping).

#definition[
  Let $cal(F)$ be a family of functions defined on an open set $U subset.eq CC$. The family $cal(F)$ is said to be _locally uniformly bounded_ if, for every point $z in U$, there exists a neighborhood $V subset.eq U$ of $z$ such that $cal(F)$ is uniformly bounded on $V$. This condition is equivalent to the condition that $cal(F)$ is uniformly bounded on all compact subsets $K$ of $U$.
]

Obviously, the equivalence is established similarly to local finiteness and locally uniform convergence.

#lbl(
  theorem[Montel's Theorem][
    Let $U subset.eq CC$ be open, and suppose that $cal(F)$ is a family of holomorphic functions on $U$. Then, $cal(F)$ is locally uniformly bounded on $U$ iff $cal(F)$ is a normal family.
  ],
  <thm:montel>,
)

#proof[
  Obviously, if $cal(F)$ is normal on $U$, for any compact $K subset U$, it follows that $cal(F)$ is normal on $K$, and the uniform boundedness on $K$ follows from the Arzelà--Ascoli Theorem (@thm:arzela_ascoli).

  Conversely, we will first assume that $cal(F)$ is locally uniformly bounded. Let $z in U$ be arbitrary, and choose $R_z > 0$ such that $overline(D(z, R_z)) subset U$. Therefore, it follows that $CC without U$ is closed and disjoint from $overline(D(z, R_z))$ and the distance between them is positive. Let this distance be
  $
    d_z = inf{abs(zeta - zeta') : zeta in CC without U, zeta' in overline(D(z, R_z))}.
  $
  It follows that the disk $V_z = D(z, R_z + d_z / 2)$ is relatively compact in $U$. By @cor:n-th-derivative-bounded-supremum, there exists a finite constant $c'_z > 0$ independent of $f in cal(F)$ such that
  $
    abs(f'(zeta)) < c'_z max_(xi in overline(V_z) \ tilde(f) in cal(F)) abs(tilde(f) (xi)), quad forall zeta in overline(D(z, R_z)), forall f in cal(F)
  $
  where the maximum on the right-hand side is finite by assumption of the locally uniform boundedness of $cal(F)$. For simplicity, let
  $
    c_z = c'_z max_(xi in overline(V_z) \ tilde(f) in cal(F)) abs(tilde(f) (xi)).
  $
  Let $xi, xi' in overline(D(z, R_z))$ be arbitrary and distinct, and let $gamma$ be the straight curve from $xi$ to $xi'$. For an arbitrary function $f in cal(F)$, we have that
  $
    abs(f(xi') - f(xi)) = abs(integral_gamma f'(zeta) dzeta) <= c_z integral_gamma abs(dz) = c_z abs(xi' - xi).
  $
  Therefore, $cal(F)$ is uniformly equicontinuous in $overline(D(z, R_z))$ (and also in $D(z, R_z)$). Indeed, $forall epsilon > 0$, we can choose $delta_z = epsilon / c_z$ and the assertion follows.

  Let $K subset U$ be compact and arbitrary. The collection ${D(z, R_z)}_(z in K)$ forms an open cover of $K$ and by the Heine--Borel Theorem (@thm:heine-borel) admits a finite subcover ${D(z_k, R_(z_k))}_(k in NN_(<= n))$ for some finite $n in NN$. If we let $delta = min_(k in NN_(<= n)) (delta_k)$, it follows that $cal(F)$ is uniformly equicontinuous on $K$. By the Arzelà--Ascoli Theorem (@thm:arzela_ascoli), any sequence ${f_n}_(n in NN) subset.eq cal(F)$ has a uniformly convergent subsequence ${f_(n_k)}_(k in NN)$ on $K$.

  Let ${f_n}_(n in NN) subset.eq cal(F)$ be arbitrary. Let $U$ be exhausted by the compact sets ${K_n}_(n in NN)$. By the argument above, we may extract a subsequence ${f_(n_(1,j))}_(j in NN) subset.eq {f_n}_(n in NN)$ that uniformly converges on $K_1$. By the same argument, there exists a subsequence ${f_(n_(2,j))}_(j in NN) subset.eq {f_(n_(1,j))}_(j in NN)$ that uniformly converges on $K_2$. Let $n'_j = n_(j,j)$.

  We will now invoke the same diagonalization argument as in the proof of the Arzelà--Ascoli Theorem (@thm:arzela_ascoli). Let $K subset U$ be an arbitrary compact set. It follows that for some $k in NN$, $K_k supset.eq K$. Since ${f_(n'_j)}_(j >= k) subset.eq {f_(n_(k,j))}_(j in NN)$ is the subsequence of a sequence that converges on $K$, the assertion follows.
]
