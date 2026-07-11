# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Point#tap
a010 = Point.new(1, 2); p(a010.tap { |o| o }.equal?(a010))
a011 = Point.new(1, 2); v011 = a011.tap { |o| o }; p(v011.equal?(a011))
