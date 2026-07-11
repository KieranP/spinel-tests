# frozen_string_literal: true
# Enumerator#cycle
p((1..3).each.cycle(2).to_a)
v001 = (1..3).each.cycle(2).to_a; p(v001)
a002 = (1..2); p(a002.each.cycle(3).to_a)
p((1..2).each.cycle(2) { |x003| p x003 })
p([1, 2, 3].each.cycle(2).to_a)
