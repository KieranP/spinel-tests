# frozen_string_literal: true
# Hash#value?
p({ a: 1 }.value?(1))
a001 = { a: 1 }; p(a001.value?(1))
a002 = { a: 1 }; b002 = 1; p(a002.value?(b002))
a003 = { a: 1 }; b003 = 1; c003 = (a003.value?(b003)); p c003
p({ a: 1, b: 2 }.value?(2))
p({ a: 1, b: 2 }.value?(9))
p({ "x" => "one", "y" => "two" }.value?("two"))
p({ "x" => "one", "y" => "two" }.value?("nope"))
p({ 1 => 1.5, 2 => 2.5 }.value?(2.5))
p({ 1 => 1.5, 2 => 2.5 }.value?(3.5))
p({}.value?(1))
a004 = { a: 1, b: 2, c: 3 }; p(a004.value?(3))
a005 = { "k" => 9 }; b005 = 9; p(a005.value?(b005))
a006 = { "k" => 9 }; b006 = 8; c006 = (a006.value?(b006)); p c006
a007 = { a: nil }; c007 = (a007.value?(nil)); p c007
a008 = { a: [1, 2], b: [3, 4] }; c008 = (a008.value?([1, 2])); p c008

# On a Hash returned by a seedless Array#reduce.
a82vq = { n: 1, s: { x: 2 } }
h82vq = [a82vq].reduce { |acc82vq, l82vq| acc82vq }
r82vq = (h82vq.value?(1) rescue $!.class); p r82vq

# a splatted argument list held in a variable
sv160 = [1]
p({ a: 1 }.value?(*sv160))
vv160 = { a: 1 }.value?(*sv160); p vv160
# control: the same argument positionally, and a literal array splatted in place
p({ a: 1 }.value?(1))
p({ a: 1 }.value?(*[1]))
