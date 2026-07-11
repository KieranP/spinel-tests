# frozen_string_literal: true
# Hash#partition
p({ a: 1, b: 2 }.partition { |_k, v| v.odd? })
a052 = { a: 1, b: 2 }; p(a052.partition { |_k, v| v.odd? })
a053 = { a: 1, b: 2 }; c053 = (a053.partition { |_k, v| v.odd? }); p c053
p({ a: 1, b: 2, c: 3 }.partition { |_k, v| v > 0 })
za901 = { a: 1, b: 2, c: 3 }; zb901 = (za901.partition { |_k, v| v > 0 }); p zb901
p({ a: 1, b: 2, c: 3 }.partition { |_k, v| v > 10 })
za902 = { a: 1, b: 2, c: 3 }; zb902 = (za902.partition { |_k, v| v > 10 }); p zb902
p({}.partition { |_k, v| v.odd? })
za903 = {}; zb903 = (za903.partition { |_k, v| v.odd? }); p zb903

# destructured, matched/rejected each reachable
zh904 = { a: 1, b: 2, c: 3, d: 4 }; zev904, zod904 = zh904.partition { |_k, v| v.even? }; p zev904; p zod904
# converting a partition sub-array (array of [k,v] pairs) back to a Hash
zh905 = { a: 1, b: 2, c: 3, d: 4 }; zpr905 = zh905.partition { |_k, v| v.even? }; zr905 = (zpr905[0].to_h rescue $!.class); p zr905

# On a Hash returned by a seedless Array#reduce.
a82pt = { n: 1, s: { x: 2 } }
h82pt = [a82pt].reduce { |acc82pt, l82pt| acc82pt }
r82pt = (h82pt.partition { |k82pt, v82pt| k82pt == :n } rescue $!.class); p r82pt
