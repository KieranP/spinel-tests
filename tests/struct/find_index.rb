# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#find_index (Enumerable)
p(Nums.new(3, 1, 2).find_index(2))
fi1 = Nums.new(3, 1, 2).find_index(2); p(fi1)
