# frozen_string_literal: true
# Hash#entries
p({ a: 1, b: 2 }.entries)
en_a = { a: 1, b: 2 }; p(en_a.entries)
en_b = { a: 1, b: 2 }; en_r = (en_b.entries); p en_r

# symbol keys, string values
p({ a: "x", b: "y" }.entries)
ens_a = { a: "x", b: "y" }; ens_r = (ens_a.entries); p ens_r

# string keys, integer values
p({ "x" => 1, "y" => 2 }.entries)
enk_a = { "x" => 1, "y" => 2 }; enk_r = (enk_a.entries); p enk_r

# integer keys, string values
p({ 1 => "one", 2 => "two" }.entries)
eni_a = { 1 => "one", 2 => "two" }; eni_r = (eni_a.entries); p eni_r

# float values
p({ a: 1.1, b: 2.2 }.entries)
enf_a = { a: 1.1, b: 2.2 }; enf_r = (enf_a.entries); p enf_r

# single-entry hash
p({ a: 1 }.entries)
en1_a = { a: 1 }; en1_r = (en1_a.entries); p en1_r

# On a Hash returned by a seedless Array#reduce.
a82en = { n: 1, s: { x: 2 } }
h82en = [a82en].reduce { |acc82en, l82en| acc82en }
r82en = (h82en.entries rescue $!.class); p r82en
