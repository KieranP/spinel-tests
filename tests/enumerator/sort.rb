# frozen_string_literal: true
# Enumerator#sort
p([3, 1, 2].each.sort)
v001 = [3, 1, 2].each.sort; p(v001)
a002 = [5, 9, 2]; p(a002.each.sort)
p([3, 1, 2].each.sort { |x003, y003| y003 <=> x003 })
p(Enumerator.new { |y| y << 3; y << 1 }.sort)
