# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#none? (Enumerable)
p(Nums.new(3, 1, 2).none? { |v| v > 5 })
n1 = Nums.new(3, 1, 2).none? { |v| v > 5 }; p(n1)
