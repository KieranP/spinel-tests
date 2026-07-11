# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#chunk (Enumerable)
p(Nums.new(3, 1, 2).chunk { |v| v.odd? }.to_a)
ch1 = Nums.new(3, 1, 2).chunk { |v| v.odd? }.to_a; p(ch1)
