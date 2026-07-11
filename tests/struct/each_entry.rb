# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#each_entry (Enumerable)
Nums.new(3, 1, 2).each_entry { |v| print v }; puts
p(Nums.new(3, 1, 2).each_entry.to_a)
ee1 = Nums.new(3, 1, 2).each_entry.to_a; p(ee1)
