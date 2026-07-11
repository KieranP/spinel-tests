# frozen_string_literal: true
Nums = Struct.new(:a, :b, :c)

# Struct#values
p(Nums.new(3, 1, 2).values)
v1 = Nums.new(3, 1, 2).values; p(v1)

# heterogeneous member values captured then iterated
HetV = Struct.new(:i, :s, :arr)
hv1 = HetV.new(1, "hi", [4, 5]).values; p(hv1)
HetV.new(2, "y", [9]).values.each { |x| p x }
