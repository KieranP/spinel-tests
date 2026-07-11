# frozen_string_literal: true
# Hash#count
p({ a: 1, b: 2 }.count { |_k, v| v.odd? })
a011 = { a: 1, b: 2 }; p(a011.count { |_k, v| v.odd? })
a012 = { a: 1, b: 2 }; c012 = (a012.count { |_k, v| v.odd? }); p c012
p({ a: 1, b: 2, c: 3 }.count)
a301 = { a: 1, b: 2, c: 3 }; c301 = (a301.count); p c301
p({ x: "a", y: "bb", z: "ccc" }.count { |_k, v| v.length > 1 })
a302 = { x: "a", y: "bb", z: "ccc" }; c302 = (a302.count { |_k, v| v.length > 1 }); p c302
p({ 1 => 10, 2 => 20, 3 => 30 }.count { |k, _v| k.even? })
a303 = { 1 => 10, 2 => 20, 3 => 30 }; c303 = (a303.count { |k, _v| k.even? }); p c303
emptyh_c = {}; p(emptyh_c.count { |_k, v| v > 0 })
p({ a: 1, b: 2 }.count { |pair| pair[1].odd? })
# heterogeneous values: count nils and count by class predicate
zh501 = { a: 1, b: "x", c: nil, d: [1] }; zr501 = zh501.count { |_k, v| v.nil? }; p zr501
zh502 = { a: 1, b: "x", c: nil, d: [1] }; zr502 = zh502.count { |_k, v| v.is_a?(Integer) }; p zr502

# count takes its argument with == rather than ===, so a Class argument counts
# nothing; both agree.
p({ a: 1 }.count(Array))
a682 = { a: 1 }; c682 = (a682.count(Array)); p c682
p({ a: 1, b: 1 }.count([:a, 1]))
b682 = { a: 1, b: 1 }; d682 = (b682.count([:a, 1])); p d682
