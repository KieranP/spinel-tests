# frozen_string_literal: true
# Hash#values_at
p({ a: 1, b: 2, c: 3 }.values_at(:a, :c))
a075 = { a: 1, b: 2, c: 3 }; p(a075.values_at(:a, :c))
a076 = { a: 1, b: 2, c: 3 }; b076 = :a; p(a076.values_at(b076, :c))
a077 = { a: 1, b: 2, c: 3 }; b077 = :a; c077 = (a077.values_at(b077, :c)); p c077
p({ a: 1, b: 2, c: 3 }.values_at(:z))
za901 = { a: 1, b: 2, c: 3 }.values_at(:z); p za901
p({ a: 1, b: 2, c: 3 }.values_at(:x, :y))
za902 = { a: 1, b: 2, c: 3 }.values_at(:x, :y); p za902
p({ a: 1, b: 2, c: 3 }.values_at(:a, :a))
za903 = { a: 1, b: 2, c: 3 }.values_at(:a, :a); p za903
p({ a: 1, b: 2, c: 3 }.values_at)
za904 = { a: 1, b: 2, c: 3 }.values_at; p za904
p(Hash.new(0).values_at(:x, :y))
za905 = Hash.new(0).values_at(:x, :y); p za905

# On a Hash returned by a seedless Array#reduce.
a82va = { n: 1, s: { x: 2 } }
h82va = [a82va].reduce { |acc82va, l82va| acc82va }
r82va = (h82va.values_at(:n) rescue $!.class); p r82va
