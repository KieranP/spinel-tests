# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#partition (Enumerable)
p(Nums.new(3, 1, 2).partition { |v| v > 1 })
p1 = Nums.new(3, 1, 2).partition { |v| v > 1 }; p(p1)
