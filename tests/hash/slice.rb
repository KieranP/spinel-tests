# frozen_string_literal: true
# Hash#slice
p({ a: 1, b: 2, c: 3 }.slice(:a, :b))
a060 = { a: 1, b: 2, c: 3 }; p(a060.slice(:a, :b))
a061 = { a: 1, b: 2, c: 3 }; b061 = :a; p(a061.slice(b061, :b))
a062 = { a: 1, b: 2, c: 3 }; b062 = :a; c062 = (a062.slice(b062, :b)); p c062
# slice a single present key
p({ a: 1, b: 2, c: 3 }.slice(:b))
sa01 = { a: 1, b: 2, c: 3 }; sb01 = (sa01.slice(:b)); p sb01
# slice with a missing key (ignored)
p({ a: 1, b: 2 }.slice(:a, :z))
sa02 = { a: 1, b: 2 }; sb02 = (sa02.slice(:a, :z)); p sb02
# String keys
p({ "a" => 1, "b" => 2 }.slice("a"))
sa03 = { "a" => 1, "b" => 2 }; sb03 = (sa03.slice("a")); p sb03
p({ 1 => "x", 2 => "y" }.slice(1))
sa04 = { 1 => "x", 2 => "y" }; sb04 = (sa04.slice(1)); p sb04
# zero-argument slice
p({ a: 1, b: 2 }.slice)

# On a Hash returned by a seedless Array#reduce.
a82sc = { n: 1, s: { x: 2 } }
h82sc = [a82sc].reduce { |acc82sc, l82sc| acc82sc }
r82sc = (h82sc.slice(:n) rescue $!.class); p r82sc
