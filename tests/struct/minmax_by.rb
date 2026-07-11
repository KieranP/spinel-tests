# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#minmax_by (Enumerable)
p(Nums.new(3, 1, 2).minmax_by { |v| -v })
mb1 = Nums.new(3, 1, 2).minmax_by { |v| -v }; p(mb1)
