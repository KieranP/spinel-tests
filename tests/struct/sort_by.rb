# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#sort_by (Enumerable)
p(Nums.new(3, 1, 2).sort_by { |v| -v })
sb1 = Nums.new(3, 1, 2).sort_by { |v| -v }; p(sb1)
