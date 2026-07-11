# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#reverse_each (Enumerable)
Nums.new(3, 1, 2).reverse_each { |v| print v }; puts
r1 = Nums.new(3, 1, 2).reverse_each { |v| print v }; puts; p(r1.class)
