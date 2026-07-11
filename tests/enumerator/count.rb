# frozen_string_literal: true
# Enumerator#count
p([1, 2, 3].each.count)
v001 = [1, 2, 3].each.count; p(v001)
a002 = [1, 2, 3, 4]; p(a002.each.count { |x002| x002.even? })
p((1..5).each.count)
p(Enumerator.new { |y| y << 1; y << 2 }.count)
# p([1, 2, 3].lazy.count)                                 # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
