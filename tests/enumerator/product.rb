# frozen_string_literal: true
# Enumerator.product
p(Enumerator.product([1, 2], [3, 4]).to_a)
v054 = Enumerator.product([1, 2], [3, 4]); p(v054.to_a)
a054 = [1, 2]; b054 = [3, 4]; p(Enumerator.product(a054, b054).to_a)
p(Enumerator.product([1, 2], [3, 4]).size)
# the block form yields each tuple and returns nil
Enumerator.product([1, 2], [3]) { |a100, b100| p [a100, b100] }
p(Enumerator.product([1, 2], [3]) { |a101, b101| p [a101, b101] })
# p(Enumerator.product([1, 2]).to_a)                     # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# p(Enumerator::Product.new([1, 2], [3, 4]).to_a)        # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# p(Enumerator::Product.new([1, 2], [3, 4]).size)        # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
