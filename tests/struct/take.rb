# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#take (Enumerable)
p(Nums.new(3, 1, 2).take(2))
t1 = Nums.new(3, 1, 2).take(2); p(t1)
