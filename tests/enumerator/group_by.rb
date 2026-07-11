# frozen_string_literal: true
# Enumerator#group_by
p([1, 2, 3, 4].each.group_by { |x001| x001 % 2 })
v002 = [1, 2, 3, 4].each.group_by { |x002| x002 % 2 }; p(v002)
a003 = [1, 2, 3]; p(a003.each.group_by { |x003| x003 > 1 })
p((1..4).each.group_by { |x004| x004 % 3 })
