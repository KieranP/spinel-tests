# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#filter (Enumerable)
p(Nums.new(3, 1, 2).filter { |v| v > 1 })
f1 = Nums.new(3, 1, 2).filter { |v| v > 1 }; p(f1)
