# frozen_string_literal: true
# Hash#all?
p({ a: 1, b: 2 }.all? { |_k, v| v > 0 })
a215 = { a: 1, b: 2 }; p(a215.all? { |_k, v| v > 0 })
a216 = { a: 1, b: 2 }; c216 = (a216.all? { |_k, v| v > 0 }); p c216
p({ a: 1 }.all?)
b215 = { a: 1 }; d215 = (b215.all?); p d215
p({ a: 1, b: -2 }.all? { |_k, v| v > 0 })
a301 = { a: 3, b: 4 }; p(a301.all? { |_k, v| v > 2 })
a302 = { a: 3, b: 4 }; c302 = (a302.all? { |_k, v| v > 2 }); p c302
p({ x: "ab", y: "cd" }.all? { |_k, v| v.length == 2 })
a303 = { x: "ab", y: "cde" }; c303 = (a303.all? { |_k, v| v.length == 2 }); p c303
p({ 1 => 10, 2 => 20 }.all? { |k, _v| k > 0 })
a304 = { 1 => 10, 2 => 20 }; c304 = (a304.all? { |k, _v| k > 0 }); p c304
emptyh_a = {}; p(emptyh_a.all? { |_k, v| v > 0 })
p({ a: 1 }.all?([:a, 1]))
p({ a: 1, b: 2 }.all? { |pair| pair[1] > 0 })

# A Class pattern argument matches every entry in Ruby (each entry is a
# two-element Array) but answers false here.
p({ a: 1 }.all?(Array))
a682 = { a: 1, b: 2 }; c682 = (a682.all?(Array)); p c682
b682 = { "a" => 1 }; d682 = (b682.all?(Array)); p d682
# Control: a value pattern over the same receiver is right.
e682 = { a: 1 }; f682 = (e682.all?([:a, 1])); p f682
# Control: an empty Hash is vacuously true for any pattern.
p({}.all?(Array))
g682 = {}; h682 = (g682.all?(Array)); p h682
