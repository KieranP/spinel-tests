# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct#sum
Coll141 = Struct.new(:x, :y)
p(Coll141.new(1, 2).sum)
v022 = Coll141.new(1, 2).sum; p(v022)
