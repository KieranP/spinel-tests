# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#reject (Enumerable)
p(Nums.new(3, 1, 2).reject { |v| v > 1 })
r1 = Nums.new(3, 1, 2).reject { |v| v > 1 }; p(r1)
