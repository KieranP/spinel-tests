# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data#freeze
a001 = Point.new(1, 2)
p(a001.freeze.equal?(a001))
v001 = a001.freeze.equal?(a001); p v001
# explicit freeze is observable
a002 = Point.new(1, 2); a002.freeze; p(a002.frozen?)
