# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Point#instance_of?
p(Point.new(1, 2).instance_of?(Point))
p(Point.new(1, 2).instance_of?(String))
a018 = Point.new(1, 2); p(a018.instance_of?(Point))
a019 = Point.new(1, 2); v019 = a019.instance_of?(String); p v019
