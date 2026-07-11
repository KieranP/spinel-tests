# frozen_string_literal: true
# Range#bsearch
p((1..10).bsearch { |x| x >= 4 })
v112 = ((1..10).bsearch { |x| x >= 4 }); p(v112)
# find-minimum mode (block returns a number/nil, not a boolean):
p((1..100).bsearch { |x| x * x >= 50 ? x * x - 50 : nil })
v112b = ((1..100).bsearch { |x| x * x >= 50 ? x * x - 50 : nil }); p(v112b)
# no match -> nil
p((1..10).bsearch { |x| x > 100 })
v112c = ((1..10).bsearch { |x| x > 100 }); p(v112c)
# exclusive range
p((1...10).bsearch { |x| x >= 4 })
a112 = (1..10); c112 = (a112.bsearch { |x| x >= 7 }); p c112
# float range find-minimum
p((0.0..10.0).bsearch { |x| x * x - 4 >= 0 ? x * x - 4 : nil })

# find-any mode (block returns -1 / 0 / 1)
p((1..10).bsearch { |x113| 4 <=> x113 })
v113 = ((1..10).bsearch { |x113b| 4 <=> x113b }); p v113
p((1..10).bsearch { |x114| 0 <=> x114 })
a115 = (1..100); v115 = (a115.bsearch { |x115| 42 <=> x115 }); p v115
p((0.0..10.0).bsearch { |x116| x116 >= 3.5 })
p((1...10).bsearch { |x117| x117 >= 9 })
p((5..1).bsearch { |x118| x118 >= 2 })
