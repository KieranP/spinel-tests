# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct#select
Coll141 = Struct.new(:x, :y)
p(Coll141.new(1, 2).select { |v| v > 1 })
v020 = Coll141.new(1, 2).select { |v| v > 1 }; p(v020)
