# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#chunk_while (Enumerable)
p(Nums.new(3, 1, 2).chunk_while { |a, b| a < b }.to_a)
cw1 = Nums.new(3, 1, 2).chunk_while { |a, b| a < b }.to_a; p(cw1)
