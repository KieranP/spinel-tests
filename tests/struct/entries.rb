# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#entries (Enumerable)
p(Nums.new(3, 1, 2).entries)
e1 = Nums.new(3, 1, 2).entries; p(e1)
