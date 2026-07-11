# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#grep (Enumerable)
p(Nums.new(3, 1, 2).grep(2..3))
g1 = Nums.new(3, 1, 2).grep(2..3); p(g1)
