# frozen_string_literal: true
# Enumerator#find_index
p([1, 2, 3].each.find_index(3))
v001 = [1, 2, 3].each.find_index(9); p(v001)
a002 = [1, 2, 3]; p(a002.each.find_index { |x002| x002 > 1 })
p((1..5).each.find_index(4))
