# frozen_string_literal: true
# Enumerator::Lazy#grep
# p((1..20).lazy.grep(5..8).to_a)                         # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# v001 = (1..20).lazy.grep(5..8).to_a; p(v001)            # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# p((1..Float::INFINITY).lazy.grep(3..).first(3))         # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# the select-based equivalent over the same source works
p((1..20).lazy.select { |x| (5..8).cover?(x) }.to_a)
v002 = (1..20).lazy.select { |x| (5..8).cover?(x) }.to_a; p(v002)
