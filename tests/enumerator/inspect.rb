# frozen_string_literal: true
# Enumerator#inspect (p on an Enumerator object)
p([1, 2, 3].each)
e002 = [1, 2, 3].each; p(e002)
p((1..3).each)
e003 = [1, 2, 3].each_with_index; p(e003)
p("abc".each_char)
p([1, 2, 3].map)
p([1, 2, 3].each_slice(2))
p([1, 2, 3].each.inspect)
v900 = [1, 2, 3].each.inspect; p(v900)
# p([1, 2, 3].lazy)   # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
