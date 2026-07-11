# frozen_string_literal: true
# Hash#transform_values!
# Symbol keys, Integer values -> *10 (value type stays Integer)
p({ a: 1, b: 2 }.transform_values! { |v| v * 10 })
tvi_a = { a: 1, b: 2 }; tvi_a.transform_values! { |v| v * 10 }; p tvi_a
tvi_b = { a: 1, b: 2 }; tvi_r = tvi_b.transform_values! { |v| v * 10 }; p tvi_r

# String keys, Integer values -> +100
p({ "a" => 1, "b" => 2 }.transform_values! { |v| v + 100 })
tvs_a = { "a" => 1, "b" => 2 }; tvs_a.transform_values! { |v| v + 100 }; p tvs_a

# Integer keys, String values -> upcase (value type stays String)
p({ 1 => "x", 2 => "y" }.transform_values!(&:upcase))
tvu_a = { 1 => "x", 2 => "y" }; tvu_a.transform_values!(&:upcase); p tvu_a
tvu_b = { 1 => "x", 2 => "y" }; tvu_r = tvu_b.transform_values!(&:upcase); p tvu_r

# Integer values -> to_s (value type changes Integer -> String)
p({ a: 1, b: 2, c: 3 }.transform_values!(&:to_s))
tvc_a = { a: 1, b: 2, c: 3 }; tvc_a.transform_values!(&:to_s); p tvc_a

# Float values
p({ x: 1.5, y: 2.5 }.transform_values! { |v| v * 2 })
tvf_a = { x: 1.5, y: 2.5 }; tvf_a.transform_values! { |v| v * 2 }; p tvf_a

# single-entry hash
p({ a: 10 }.transform_values! { |v| v / 2 })
tv1_a = { a: 10 }; tv1_a.transform_values! { |v| v / 2 }; p tv1_a
