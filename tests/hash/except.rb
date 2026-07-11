# frozen_string_literal: true
# Hash#except
p({ a: 1, b: 2, c: 3 }.except(:b))
a018 = { a: 1, b: 2, c: 3 }; p(a018.except(:b))
a019 = { a: 1, b: 2, c: 3 }; b019 = :b; p(a019.except(b019))
a020 = { a: 1, b: 2, c: 3 }; b020 = :b; c020 = (a020.except(b020)); p c020
p({ "a" => 1, "b" => 2, "c" => 3 }.except("a", "c"))
a021 = { "a" => 1, "b" => 2, "c" => 3 }; p(a021.except("a", "c"))
a022 = { "a" => 1, "b" => 2, "c" => 3 }; c022 = (a022.except("a", "c")); p c022
p({ a: 1 }.except(:nonexistent))
p({ a: 1, b: 2 }.except)
a023 = { a: 1, b: 2 }; p(a023.except)
p({ "k1" => [1, 2], "k2" => [3, 4] }.except("k1"))
a024 = { x: 10, y: 20, z: 30 }; c024 = (a024.except(:x, :y)); p c024
p({ 1 => "x", 2 => "y", 3 => "z" }.except(2))
a025 = { 1 => "x", 2 => "y" }; c025 = (a025.except(1)); p c025

# On a Hash returned by a seedless Array#reduce.
a82ex = { n: 1, s: { x: 2 } }
h82ex = [a82ex].reduce { |acc82ex, l82ex| acc82ex }
r82ex = (h82ex.except(:n) rescue $!.class); p r82ex

# A splatted key list emits ill-typed C with Symbol keys, and only warns (then
# removes nothing) with String keys.
# Kept commented: the compile abort takes down the whole file.
ks840 = [:a]; p({ a: 1, b: 2 }.except(*ks840))
ks841 = ["a"]; e841 = { "a" => 1, "b" => 2 }.except(*ks841); p e841
# Control: the same keys spread positionally compile and match.
p({ a: 1, b: 2 }.except(:a))
e842 = { "a" => 1, "b" => 2 }.except("a"); p e842
# absent keys, no keys, and every key
p({ a: 1, b: 2 }.except(:z))
e843 = { a: 1, b: 2 }.except(:z); p e843
p({ a: 1, b: 2 }.except)
e844 = { a: 1, b: 2 }.except; p e844
p({ a: 1, b: 2 }.except(:a, :b))
e845 = { a: 1, b: 2 }.except(:a, :b); p e845
# the receiver is not mutated
h846 = { a: 1, b: 2 }; h846.except(:a); p h846
