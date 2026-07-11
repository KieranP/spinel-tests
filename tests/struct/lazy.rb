# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#lazy (Enumerable)
p(Nums.new(3, 1, 2).lazy.map { |v| v * 2 }.first(2))
lz1 = Nums.new(3, 1, 2).lazy.map { |v| v * 2 }.first(2); p(lz1)
