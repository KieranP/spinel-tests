# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#slice_when (Enumerable)
p(Nums.new(3, 1, 2).slice_when { |a, b| a > b }.to_a)
sw1 = Nums.new(3, 1, 2).slice_when { |a, b| a > b }.to_a; p(sw1)
