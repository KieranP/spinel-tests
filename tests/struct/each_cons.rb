# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#each_cons (Enumerable)
p(Nums.new(3, 1, 2).each_cons(2).to_a)
ec1 = Nums.new(3, 1, 2).each_cons(2).to_a; p(ec1)
