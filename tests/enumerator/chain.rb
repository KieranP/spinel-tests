# frozen_string_literal: true
# Enumerator#chain
p([1, 2].each.chain([3, 4]).to_a)
v001 = [1, 2].each.chain([3, 4]).to_a; p(v001)
a002 = [1, 2].each; b002 = [3].each; p(a002.chain(b002).to_a)
p([1, 2].each.chain([3, 4]).class)
# Enumerator::Chain.new over two external Enumerators
# p(Enumerator::Chain.new([1, 2].each, [3, 4].each).to_a)   # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
