# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#all? (Enumerable)
p(Nums.new(3, 1, 2).all? { |v| v > 0 })
a1 = Nums.new(3, 1, 2).all? { |v| v > 0 }; p(a1)
