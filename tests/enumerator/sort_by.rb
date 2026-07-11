# frozen_string_literal: true
# Enumerator#sort_by
p([3, 1, 2].each.sort_by { |x001| -x001 })
v002 = [3, 1, 2].each.sort_by { |x002| x002 }; p(v002)
a003 = ["bbb", "a", "cc"]; p(a003.each.sort_by { |x003| x003.length })
p((1..4).each.sort_by { |x004| -x004 })
