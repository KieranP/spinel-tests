# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#drop_while (Enumerable)
p(Nums.new(3, 1, 2).drop_while { |v| v > 1 })
dw1 = Nums.new(3, 1, 2).drop_while { |v| v > 1 }; p(dw1)
