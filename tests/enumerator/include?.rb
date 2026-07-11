# frozen_string_literal: true
# Enumerator#include?
p([1, 2, 3].each.include?(2))
v001 = [1, 2, 3].each.include?(9); p(v001)
a002 = [1, 2, 3]; b002 = 3; p(a002.each.include?(b002))
p((1..5).each.include?(4))
# p([1, 2, 3].lazy.include?(2))                           # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
