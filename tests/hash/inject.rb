# frozen_string_literal: true
# Hash#inject
p({ a: 1, b: 2 }.inject(0) { |s, (_k, v)| s + v })
ij_a = { a: 1, b: 2 }; p(ij_a.inject(0) { |s, (_k, v)| s + v })
ij_b = { a: 1, b: 2 }; ij_r = (ij_b.inject(0) { |s, (_k, v)| s + v }); p ij_r

# String keys, sum values with nonzero init
p({ "a" => 1, "b" => 2, "c" => 3 }.inject(10) { |s, (_k, v)| s + v })
ijs_a = { "a" => 1, "b" => 2, "c" => 3 }; ijs_r = (ijs_a.inject(10) { |s, (_k, v)| s + v }); p ijs_r

# product of values
p({ a: 2, b: 3, c: 4 }.inject(1) { |s, (_k, v)| s * v })
ijp_a = { a: 2, b: 3, c: 4 }; ijp_r = (ijp_a.inject(1) { |s, (_k, v)| s * v }); p ijp_r

# accumulate keys into an array
p({ a: 1, b: 2, c: 3 }.inject([]) { |s, (k, _v)| s << k })
ijk_a = { a: 1, b: 2, c: 3 }; ijk_r = (ijk_a.inject([]) { |s, (k, _v)| s << k }); p ijk_r

# Float values
p({ x: 1.5, y: 2.5 }.inject(0.0) { |s, (_k, v)| s + v })
ijf_a = { x: 1.5, y: 2.5 }; ijf_r = (ijf_a.inject(0.0) { |s, (_k, v)| s + v }); p ijf_r

# single-entry hash
p({ a: 5 }.inject(100) { |s, (_k, v)| s - v })
ij1_a = { a: 5 }; ij1_r = (ij1_a.inject(100) { |s, (_k, v)| s - v }); p ij1_r

# On a Hash returned by a seedless Array#reduce.
a82ij = { n: 1, s: { x: 2 } }
h82ij = [a82ij].reduce { |acc82ij, l82ij| acc82ij }
r82ij = (h82ij.inject(0) { |m82ij, _p82ij| m82ij + 1 } rescue $!.class); p r82ij

# inject with a Symbol operator and no block is refused before any C is emitted.
# Kept commented: the front-end reject takes down the whole file.
p({ a: 1 }.inject(:+))
a477 = { a: 1 }; c477 = (a477.inject(:+)); p c477
# Control: the block form over the same receiver compiles and matches.
p({ a: 1, b: 2 }.inject(0) { |m478, (_k478, v478)| m478 + v478 })
b478 = { a: 1, b: 2 }; c478 = (b478.inject(0) { |m, (_k, v)| m + v }); p c478
