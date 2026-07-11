# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#drop (Enumerable)
p(Nums.new(3, 1, 2).drop(1))
d1 = Nums.new(3, 1, 2).drop(1); p(d1)
