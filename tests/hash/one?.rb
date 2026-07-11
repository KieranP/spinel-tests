# frozen_string_literal: true
# Hash#one?
# block form: exactly one entry matches
p({ a: 1, b: 2 }.one? { |_k, v| v > 1 })
on_a = { a: 1, b: 2 }; p(on_a.one? { |_k, v| v > 1 })
on_b = { a: 1, b: 2 }; on_r = (on_b.one? { |_k, v| v > 1 }); p on_r

# block form: more than one matches -> false
p({ a: 2, b: 3, c: 4 }.one? { |_k, v| v > 1 })
onm_a = { a: 2, b: 3, c: 4 }; onm_r = (onm_a.one? { |_k, v| v > 1 }); p onm_r

# block form: zero match -> false
p({ a: 1, b: 2 }.one? { |_k, v| v > 5 })
onz_a = { a: 1, b: 2 }; onz_r = (onz_a.one? { |_k, v| v > 5 }); p onz_r

# String keys, match on key
p({ "a" => 1, "b" => 2 }.one? { |k, _v| k == "b" })
ons_a = { "a" => 1, "b" => 2 }; ons_r = (ons_a.one? { |k, _v| k == "b" }); p ons_r

# Integer keys
p({ 1 => 10, 2 => 20, 3 => 30 }.one? { |k, _v| k > 2 })
oni_a = { 1 => 10, 2 => 20, 3 => 30 }; oni_r = (oni_a.one? { |k, _v| k > 2 }); p oni_r

# blockless: single entry -> true
p({ a: 1 }.one?)
on1_a = { a: 1 }; on1_r = (on1_a.one?); p on1_r

# blockless: multiple entries -> false
p({ a: 1, b: 2 }.one?)
on2_a = { a: 1, b: 2 }; on2_r = (on2_a.one?); p on2_r

# A Class pattern argument matches every entry in Ruby (each entry is a
# two-element Array) but answers false here.
p({ a: 1 }.one?(Array))
a682 = { a: 1 }; c682 = (a682.one?(Array)); p c682
b682 = { 1 => "x" }; d682 = (b682.one?(Array)); p d682
# Control: a value pattern over the same receiver is right.
p({ a: 1 }.one?([:a, 1]))
e682 = { a: 1 }; f682 = (e682.one?([:a, 1])); p f682
# Control: two entries never satisfy one? with a matching pattern.
p({}.one?(Array))
g682 = {}; h682 = (g682.one?(Array)); p h682
