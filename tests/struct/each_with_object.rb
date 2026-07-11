# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#each_with_object (Enumerable)
p(Nums.new(3, 1, 2).each_with_object([]) { |v, acc| acc << v * 2 })
eo1 = Nums.new(3, 1, 2).each_with_object([]) { |v, acc| acc << v * 2 }; p(eo1)
