# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#collect_concat (Enumerable)
p(Nums.new(3, 1, 2).collect_concat { |v| [v, v] })
cc1 = Nums.new(3, 1, 2).collect_concat { |v| [v, v] }; p(cc1)
