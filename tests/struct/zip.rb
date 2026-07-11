# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#zip (Enumerable)
p(Nums.new(3, 1, 2).zip([9, 8, 7]))
z1 = Nums.new(3, 1, 2).zip([9, 8, 7]); p(z1)
