# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#first (Enumerable)
p(Nums.new(3, 1, 2).first)
f1 = Nums.new(3, 1, 2).first; p(f1)
p(Nums.new(3, 1, 2).first(2))
f2 = Nums.new(3, 1, 2).first(2); p(f2)
