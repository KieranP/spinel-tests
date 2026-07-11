# frozen_string_literal: true
# Range#map
p((1..5).map { |n| n * n })
a026 = (1..5); p(a026.map { |n| n * n })
a027 = (1..5); c027 = (a027.map { |n| n * n }); p c027
p(c027.class)
p((1..3).map.with_index { |x, i| [x, i] })
v028 = (1..3).map.with_index { |x, i| [x, i] }; p(v028)
p(v028.class)

grid636 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
s636 = (0...grid636.length).sum { |i636| grid636[i636][i636] }
m636 = (0...grid636.length).map { |i636| grid636[i636][i636] }
p [s636, m636]
