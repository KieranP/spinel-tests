# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#minmax (Enumerable)
p(Nums.new(3, 1, 2).minmax)
mm1 = Nums.new(3, 1, 2).minmax; p(mm1)
