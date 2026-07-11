# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#flat_map (Enumerable)
p(Nums.new(3, 1, 2).flat_map { |v| [v, v] })
fm1 = Nums.new(3, 1, 2).flat_map { |v| [v, v] }; p(fm1)
