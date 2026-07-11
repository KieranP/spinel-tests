# frozen_string_literal: true
# Enumerator#minmax
p([3, 1, 2].each.minmax)
v001 = [3, 1, 2].each.minmax; p(v001)
a002 = [5, 9, 2]; p(a002.each.minmax)
p((1..5).each.minmax)
