# frozen_string_literal: true
# Hash#any?
p({ a: 1, b: 2 }.any? { |_k, v| v > 1 })
a004 = { a: 1, b: 2 }; p(a004.any? { |_k, v| v > 1 })
a005 = { a: 1, b: 2 }; c005 = (a005.any? { |_k, v| v > 1 }); p c005
p({ a: 1 }.any?)
a215 = { a: 1 }; c215 = (a215.any?); p c215
p({ a: 1 }.any?([:a, 1]))
p({ a: 1, b: 2 }.any? { |_k, v| v > 5 })
a301 = { a: 1, b: 2 }; p(a301.any? { |_k, v| v > 5 })
a302 = { a: 1, b: 2 }; c302 = (a302.any? { |_k, v| v > 5 }); p c302
p({ x: "ab", y: "cde" }.any? { |_k, v| v.length > 2 })
a303 = { x: "ab", y: "cde" }; c303 = (a303.any? { |_k, v| v.length > 2 }); p c303
p({ 1 => 10, 2 => 20 }.any? { |k, _v| k > 1 })
a304 = { 1 => 10, 2 => 20 }; c304 = (a304.any? { |k, _v| k > 1 }); p c304
b301 = { a: 1, b: 2 }; d301 = (b301.any?([:a, 1])); p d301
emptyh_y = {}; p(emptyh_y.any? { |_k, v| v > 0 })
p({ a: 1, b: 2 }.any? { |pair| pair[1] > 1 })

# A Class pattern argument matches every entry in Ruby (each entry is a
# two-element Array) but answers false here.
p({ a: 1 }.any?(Array))
a682 = { a: 1, b: 2 }; c682 = (a682.any?(Array)); p c682
b682 = { 1 => "x" }; d682 = (b682.any?(Array)); p d682
# Control: a value pattern over the same receiver is right.
p({ a: 1 }.any?([:a, 1]))
e682 = { a: 1 }; f682 = (e682.any?([:a, 1])); p f682
# Control: an empty Hash matches nothing.
p({}.any?(Array))
g682 = {}; h682 = (g682.any?(Array)); p h682
