# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#chain (Enumerable)
p(Nums.new(3, 1, 2).chain([4, 5]).to_a)
c1 = Nums.new(3, 1, 2).chain([4, 5]); p(c1.to_a)
