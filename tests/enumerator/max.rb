# frozen_string_literal: true
# Enumerator#max
p([1, 3, 2].each.max)
v001 = [1, 3, 2].each.max; p(v001)
a002 = [5, 9, 2]; p(a002.each.max)
p([1, 3, 2].each.max(2))
p(Enumerator.new { |y| y << 4; y << 7 }.max)
# p([1, 2, 3].lazy.max)                                   # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
