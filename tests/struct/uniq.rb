# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#uniq (Enumerable)
p(Nums.new(1, 1, 2).uniq)
u1 = Nums.new(1, 1, 2).uniq; p(u1)
