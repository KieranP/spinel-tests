# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#filter_map (Enumerable)
p(Nums.new(3, 1, 2).filter_map { |v| v * 2 if v > 1 })
fm1 = Nums.new(3, 1, 2).filter_map { |v| v * 2 if v > 1 }; p(fm1)
