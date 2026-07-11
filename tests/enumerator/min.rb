# frozen_string_literal: true
# Enumerator#min
p([3, 1, 2].each.min)
v001 = [3, 1, 2].each.min; p(v001)
a002 = [5, 9, 2]; p(a002.each.min)
p([3, 1, 2].each.min(2))
p(Enumerator.new { |y| y << 4; y << 7 }.min)
# p([1, 2, 3].lazy.min)                                   # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
