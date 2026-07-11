# frozen_string_literal: true
# Hash#max
# largest [k,v] pair by Array <=> (Symbol keys)
p({ a: 1, b: 2 }.max)
mx_a = { a: 1, b: 2 }; p(mx_a.max)
mx_b = { a: 1, b: 2 }; mx_r = (mx_b.max); p mx_r

# String keys
p({ "a" => 1, "c" => 3, "b" => 2 }.max)
mxs_a = { "a" => 1, "c" => 3, "b" => 2 }; mxs_r = (mxs_a.max); p mxs_r

# Integer keys
p({ 3 => "x", 1 => "y", 2 => "z" }.max)
mxi_a = { 3 => "x", 1 => "y", 2 => "z" }; mxi_r = (mxi_a.max); p mxi_r

# block comparator on the value component
p({ a: 3, b: 1, c: 2 }.max { |p1, p2| p1[1] <=> p2[1] })
mxb_a = { a: 3, b: 1, c: 2 }; mxb_r = (mxb_a.max { |p1, p2| p1[1] <=> p2[1] }); p mxb_r

# single-entry hash
p({ z: 9 }.max)
mx1_a = { z: 9 }; mx1_r = (mx1_a.max); p mx1_r

# empty-hash literal (Ruby: nil)
p({}.max)
mxe_r = ({}.max); p mxe_r
