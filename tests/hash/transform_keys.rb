# frozen_string_literal: true
# Hash#transform_keys
p({ a: 1 }.transform_keys(&:to_s))
a069 = { a: 1 }; p(a069.transform_keys(&:to_s))
a070 = { a: 1 }; c070 = (a070.transform_keys(&:to_s)); p c070
p({ a: 1, b: 2, c: 3 }.transform_keys(a: :x, b: :y))
p({ a: 1, b: 2, c: 3 }.transform_keys({ a: :x }) { |k| k.to_s })
a223 = { a: 1, b: 2, c: 3 }; c223 = (a223.transform_keys({ a: :x }) { |k| k.to_s }); p c223
p({ a: 1, b: 2 }.transform_keys { |k| k.to_s })
b069 = { a: 1, b: 2 }; c169 = (b069.transform_keys { |k| k.to_s }); p c169
p({ "a" => 1, "b" => 2 }.transform_keys(&:upcase))
b070 = { "a" => 1, "b" => 2 }; c170 = (b070.transform_keys(&:upcase)); p c170
p({ 1 => "x", 2 => "y" }.transform_keys { |k| k * 10 })
b071 = { 1 => "x", 2 => "y" }; c171 = (b071.transform_keys { |k| k * 10 }); p c171
emptyh_k = {}; p(emptyh_k.transform_keys { |k| k.to_s })

# On a Hash returned by a seedless Array#reduce.
a82tj = { n: 1, s: { x: 2 } }
h82tj = [a82tj].reduce { |acc82tj, l82tj| acc82tj }
r82tj = (h82tj.transform_keys(&:to_s).size rescue $!.class); p r82tj
