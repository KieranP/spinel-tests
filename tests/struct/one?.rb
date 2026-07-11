# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#one? (Enumerable)
p(Nums.new(3, 1, 2).one? { |v| v > 2 })
o1 = Nums.new(3, 1, 2).one? { |v| v > 2 }; p(o1)
