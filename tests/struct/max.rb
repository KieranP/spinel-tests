# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#max (Enumerable)
p(Nums.new(3, 1, 2).max)
m2 = Nums.new(3, 1, 2).max; p(m2)
