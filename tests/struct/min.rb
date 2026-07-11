# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#min (Enumerable)
p(Nums.new(3, 1, 2).min)
m1 = Nums.new(3, 1, 2).min; p(m1)
