# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#to_set (Enumerable)
p(Nums.new(3, 1, 2).to_set)
ts1 = Nums.new(3, 1, 2).to_set; p(ts1)
