# frozen_string_literal: true
# Hash#group_by
p({ a: 1, b: 2 }.group_by { |_k, v| v.odd? })
a030 = { a: 1, b: 2 }; p(a030.group_by { |_k, v| v.odd? })
a031 = { a: 1, b: 2 }; c031 = (a031.group_by { |_k, v| v.odd? }); p c031
p({ a: 1, b: 2, c: 3, d: 4 }.group_by { |_k, v| v.even? })
za901 = { a: 1, b: 2, c: 3, d: 4 }; zb901 = (za901.group_by { |_k, v| v.even? }); p zb901
p({}.group_by { |_k, v| v.even? })
za902 = {}; zb902 = (za902.group_by { |_k, v| v.even? }); p zb902

# group by value parity, then map each group's pairs back to keys (passes)
zh903 = { a: 1, b: 2, c: 3, d: 4 }; zg903 = zh903.group_by { |_k, v| v % 2 }.transform_values { |pairs| pairs.map(&:first) }; p zg903.sort.to_h
# a group value is an array of [k,v] pairs; converting one back to a Hash
zh904 = { a: 1, b: 2, c: 3, d: 4 }; zg904 = zh904.group_by { |_k, v| v.even? }; zr904 = (zg904[true].to_h rescue $!.class); p zr904

# On a Hash returned by a seedless Array#reduce.
a82gb = { n: 1, s: { x: 2 } }
h82gb = [a82gb].reduce { |acc82gb, l82gb| acc82gb }
r82gb = (h82gb.group_by { |k82gb, v82gb| k82gb } rescue $!.class); p r82gb
