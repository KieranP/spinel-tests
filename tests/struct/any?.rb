# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#any? (Enumerable)
p(Nums.new(3, 1, 2).any? { |v| v > 2 })
a1 = Nums.new(3, 1, 2).any? { |v| v > 2 }; p(a1)
