# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#count (Enumerable)
p(Nums.new(3, 1, 2).count)
c1 = Nums.new(3, 1, 2).count; p(c1)
p(Nums.new(3, 1, 2).count { |v| v > 1 })
c2 = Nums.new(3, 1, 2).count { |v| v > 1 }; p(c2)
