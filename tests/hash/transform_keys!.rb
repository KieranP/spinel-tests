# frozen_string_literal: true
# Hash#transform_keys!
# Integer keys -> *10 (key type stays Integer)
p({ 1 => "x", 2 => "y" }.transform_keys! { |k| k * 10 })
tki_a = { 1 => "x", 2 => "y" }; tki_a.transform_keys! { |k| k * 10 }; p tki_a
tki_b = { 1 => "x", 2 => "y" }; tki_r = tki_b.transform_keys! { |k| k * 10 }; p tki_r

# String keys -> upcase (key type stays String)
p({ "a" => 1, "b" => 2 }.transform_keys!(&:upcase))
tks_a = { "a" => 1, "b" => 2 }; tks_a.transform_keys!(&:upcase); p tks_a
tks_b = { "a" => 1, "b" => 2 }; tks_r = tks_b.transform_keys!(&:upcase); p tks_r

# Symbol keys -> to_s (key type changes Symbol -> String)
p({ a: 1, b: 2 }.transform_keys!(&:to_s))
tkc_a = { a: 1, b: 2 }; tkc_a.transform_keys!(&:to_s); p tkc_a
tkc_b = { a: 1, b: 2 }; tkc_r = tkc_b.transform_keys!(&:to_s); p tkc_r

# single-entry hash
p({ 5 => "v" }.transform_keys! { |k| k + 1 })
tk1_a = { 5 => "v" }; tk1_a.transform_keys! { |k| k + 1 }; p tk1_a
