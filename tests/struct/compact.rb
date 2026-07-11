# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#compact (Enumerable)
p(Nums.new(3, 1, 2).compact)
cp1 = Nums.new(3, 1, 2).compact; p(cp1)
