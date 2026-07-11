# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#reduce (Enumerable)
p(Nums.new(3, 1, 2).reduce(:+))
r1 = Nums.new(3, 1, 2).reduce(:+); p(r1)
p(Nums.new(3, 1, 2).reduce(10) { |s, v| s + v })
r2 = Nums.new(3, 1, 2).reduce(10) { |s, v| s + v }; p(r2)
