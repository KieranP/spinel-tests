# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct#size
Coll141 = Struct.new(:x, :y)
p(Coll141.new(1, 2).size)
v021 = Coll141.new(1, 2).size; p(v021)
