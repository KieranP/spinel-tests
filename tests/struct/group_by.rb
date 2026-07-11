# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#group_by (Enumerable)
p(Nums.new(3, 1, 2).group_by { |v| v.odd? })
g1 = Nums.new(3, 1, 2).group_by { |v| v.odd? }; p(g1)
