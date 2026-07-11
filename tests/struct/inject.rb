# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#inject (Enumerable)
p(Nums.new(3, 1, 2).inject(:+))
j1 = Nums.new(3, 1, 2).inject(:+); p(j1)
