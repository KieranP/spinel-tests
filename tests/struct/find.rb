# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#find (Enumerable)
p(Nums.new(3, 1, 2).find { |v| v > 1 })
f1 = Nums.new(3, 1, 2).find { |v| v > 1 }; p(f1)
