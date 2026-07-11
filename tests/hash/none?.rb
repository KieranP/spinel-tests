# frozen_string_literal: true
# Hash#none?
p({ a: 1, b: 2 }.none? { |_k, v| v > 5 })
a301 = { a: 1, b: 2 }; c301 = (a301.none? { |_k, v| v > 5 }); p c301
p({ a: 3, b: 4 }.none? { |_k, v| v > 2 })
a302 = { a: 3, b: 4 }; c302 = (a302.none? { |_k, v| v > 2 }); p c302
p({ x: "a", y: "bb" }.none? { |_k, v| v.length > 5 })
a303 = { x: "a", y: "bb" }; c303 = (a303.none? { |_k, v| v.length > 5 }); p c303
p({ 1 => 10, 2 => 20 }.none? { |k, _v| k > 5 })
a304 = { 1 => 10, 2 => 20 }; c304 = (a304.none? { |k, _v| k > 5 }); p c304
p({ a: 1 }.none?)
a215 = { a: 1 }; c215 = (a215.none?); p c215
b215 = {}; p(b215.none?)
emptyh_n = {}; p(emptyh_n.none? { |_k, v| v > 0 })

# On a Hash returned by a seedless Array#reduce, a two-parameter block fails to
# compile, so the probe is kept commented out — it would take the whole file down.
a82nn = { n: 1, s: { x: 2 } }
h82nn = [a82nn].reduce { |acc82nn, l82nn| acc82nn }
r82nn = (h82nn.none? { |k82nn, v82nn| false } rescue $!.class); p r82nn
# the destructured form compiles and runs
p(h82nn.none? { |(k82nnb, v82nnb)| false })

# A Class pattern argument matches every entry in Ruby (each entry is a
# two-element Array) but answers true here.
p({ a: 1 }.none?(Array))
a682 = { a: 1, b: 2 }; c682 = (a682.none?(Array)); p c682
b682 = { "a" => 1 }; d682 = (b682.none?(Array)); p d682
# Control: a value pattern over the same receiver is right.
p({ a: 1 }.none?([:a, 1]))
e682 = { a: 1 }; f682 = (e682.none?([:b, 2])); p f682
# Control: an empty Hash is vacuously true for any pattern.
p({}.none?(Array))
g682 = {}; h682 = (g682.none?(Array)); p h682
