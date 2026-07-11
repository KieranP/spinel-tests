# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#cycle (Enumerable)
Nums.new(3, 1, 2).cycle(2) { |v| print v }; puts
c1 = Nums.new(3, 1, 2).cycle(2) { |v| print v }; puts; p(c1)
