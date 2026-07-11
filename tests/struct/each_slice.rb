# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#each_slice (Enumerable)
p(Nums.new(3, 1, 2).each_slice(2).to_a)
es1 = Nums.new(3, 1, 2).each_slice(2).to_a; p(es1)
