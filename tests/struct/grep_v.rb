# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#grep_v (Enumerable)
p(Nums.new(3, 1, 2).grep_v(2..3))
gv1 = Nums.new(3, 1, 2).grep_v(2..3); p(gv1)
