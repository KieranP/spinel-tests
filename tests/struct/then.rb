# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Point#then
a012 = Point.new(1, 2); p(a012.then { |o| o.equal?(a012) })
a013 = Point.new(1, 2); v013 = a013.then { |o| o.equal?(a013) }; p v013
