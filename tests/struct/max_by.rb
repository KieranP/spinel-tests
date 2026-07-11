# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#max_by (Enumerable)
p(Nums.new(3, 1, 2).max_by { |v| -v })
mb2 = Nums.new(3, 1, 2).max_by { |v| -v }; p(mb2)

# max_by with a symbol-to-proc naming a member called `bytes`
Bytes3 = Struct.new(:ip, :bytes)
all3 = [Bytes3.new("a", 10), Bytes3.new("b", 20)]
p all3.max_by(&:bytes)
v3 = all3.max_by(&:bytes); p v3
