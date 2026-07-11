# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct#deconstruct_keys
Coll141 = Struct.new(:x, :y)
p(Coll141.new(1, 2).deconstruct_keys([:x]))
v015 = Coll141.new(1, 2).deconstruct_keys([:x]); p(v015)

# nil argument returns all members
p(Coll141.new(1, 2).deconstruct_keys(nil))
vall = Coll141.new(1, 2).deconstruct_keys(nil); p(vall)
# pattern-match hash form drives deconstruct_keys
Dk = Struct.new(:x, :y)
case Dk.new(1, 2)
in { x:, y: }
  p([:matched, x, y])
end
mres = (case Dk.new(3, 4); in { x: } then x; end); p mres
