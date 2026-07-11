# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#sort (Enumerable)
p(Nums.new(3, 1, 2).sort)
s1 = Nums.new(3, 1, 2).sort; p(s1)
