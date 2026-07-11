# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#each_with_index (Enumerable)
Nums.new(3, 1, 2).each_with_index { |v, i| print "#{i}:#{v} " }; puts
e1 = Nums.new(3, 1, 2).each_with_index { |v, i| print "#{i}:#{v} " }; puts; p(e1.class)
