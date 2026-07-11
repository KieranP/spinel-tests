# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#include? (Enumerable)
p(Nums.new(3, 1, 2).include?(2))
i1 = Nums.new(3, 1, 2).include?(2); p(i1)
