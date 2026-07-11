# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#collect (Enumerable)
p(Nums.new(3, 1, 2).collect { |v| v * 2 })
c1 = Nums.new(3, 1, 2).collect { |v| v * 2 }; p(c1)
