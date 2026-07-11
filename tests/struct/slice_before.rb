# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#slice_before (Enumerable)
p(Nums.new(3, 1, 2).slice_before { |v| v == 1 }.to_a)
sb1 = Nums.new(3, 1, 2).slice_before { |v| v == 1 }.to_a; p(sb1)
