# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#member? (Enumerable)
p(Nums.new(3, 1, 2).member?(2))
m1 = Nums.new(3, 1, 2).member?(2); p(m1)
