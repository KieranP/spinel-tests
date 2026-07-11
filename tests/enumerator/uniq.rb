# frozen_string_literal: true
# Enumerator#uniq / Enumerator::Lazy#uniq
# eager form on an external Enumerator works:
p([1, 1, 2, 3, 3, 3].each.uniq)
v001 = [1, 1, 2, 3, 3, 3].each.uniq; p(v001)
a001 = [5, 5, 6, 7, 7]; p(a001.each.uniq)
b001 = [1, 2, 2, 1].each; v002 = b001.uniq; p(v002)
p([1, 1, 2, 3, 3].lazy.uniq.to_a)
v003 = [1, 1, 2, 3, 3].lazy.uniq.to_a; p(v003)
# uniq over an infinite lazy source
# p((1..Float::INFINITY).lazy.map { |x900| x900 % 3 }.uniq.first(3))   # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
