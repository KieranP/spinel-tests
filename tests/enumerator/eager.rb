# frozen_string_literal: true
# Enumerator::Lazy#eager
# p([1, 2, 3].lazy.map { |x| x * 2 }.eager.class)         # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# p([1, 2, 3].lazy.map { |x| x * 2 }.eager.to_a)          # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# v001 = (1..4).lazy.select { |x| x.even? }.eager.to_a; p(v001)   # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# the eager equivalents that DO work
p([1, 2, 3].lazy.map { |x| x * 2 }.to_a)
v002 = (1..4).lazy.select { |x| x.even? }.force; p(v002)
