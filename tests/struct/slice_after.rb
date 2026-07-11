# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#slice_after (Enumerable)
p(Nums.new(3, 1, 2).slice_after { |v| v == 1 }.to_a)
sa1 = Nums.new(3, 1, 2).slice_after { |v| v == 1 }.to_a; p(sa1)
