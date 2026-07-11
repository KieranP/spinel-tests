# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#tally (Enumerable)
p(Nums.new(3, 1, 2).tally)
t1 = Nums.new(3, 1, 2).tally; p(t1)
