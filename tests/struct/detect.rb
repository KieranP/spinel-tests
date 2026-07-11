# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#detect (Enumerable)
p(Nums.new(3, 1, 2).detect { |v| v > 1 })
d1 = Nums.new(3, 1, 2).detect { |v| v > 1 }; p(d1)
