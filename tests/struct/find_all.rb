# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#find_all (Enumerable)
p(Nums.new(3, 1, 2).find_all { |v| v > 1 })
fa1 = Nums.new(3, 1, 2).find_all { |v| v > 1 }; p(fa1)
