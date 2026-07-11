# frozen_string_literal: true
# Enumerator::Lazy#grep_v
# p((1..10).lazy.grep_v(3..8).to_a)                       # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# v001 = (1..10).lazy.grep_v(3..8).to_a; p(v001)          # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# the reject-based equivalent over the same source works
p((1..10).lazy.reject { |x| (3..8).cover?(x) }.to_a)
v002 = (1..10).lazy.reject { |x| (3..8).cover?(x) }.to_a; p(v002)
