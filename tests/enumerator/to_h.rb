# frozen_string_literal: true
# Enumerator#to_h / Enumerator::Lazy#to_h
p([[1, 2], [3, 4]].each.to_h)
v001 = [[1, 2], [3, 4]].each.to_h; p(v001)
a002 = [[:a, 1], [:b, 2]]; p(a002.each.to_h)
p([1, 2].each.to_h { |x003| [x003, x003 * 2] })
# p([[1, 2], [3, 4]].lazy.to_h)                           # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
