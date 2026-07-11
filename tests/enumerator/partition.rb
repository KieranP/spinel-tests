# frozen_string_literal: true
# Enumerator#partition
p([1, 2, 3, 4].each.partition { |x001| x001.odd? })
v002 = [1, 2, 3, 4].each.partition { |x002| x002.odd? }; p(v002)
a003 = [1, 2, 3]; p(a003.each.partition { |x003| x003 > 1 })
p((1..5).each.partition { |x004| x004.even? })
