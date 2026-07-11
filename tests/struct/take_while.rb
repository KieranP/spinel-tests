# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#take_while (Enumerable)
p(Nums.new(3, 1, 2).take_while { |v| v > 1 })
tw1 = Nums.new(3, 1, 2).take_while { |v| v > 1 }; p(tw1)
