# frozen_string_literal: true
# Enumerator#find
p([1, 2, 3].each.find { |x001| x001 > 1 })
v002 = [1, 2, 3].each.find { |x002| x002 > 5 }; p(v002)
a003 = [1, 2, 3]; p(a003.each.find { |x003| x003.even? })
p((1..5).each.find { |x004| x004 % 4 == 0 })
