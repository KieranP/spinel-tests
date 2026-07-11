# frozen_string_literal: true
# Data.define with methods, with, deconstruct
Point = Data.define(:x, :y) do
  def distance_to(other)
    Math.sqrt((x - other.x)**2 + (y - other.y)**2)
  end
  def manhattan
    x.abs + y.abs
  end
end

a = Point.new(0, 0)
b = Point.new(3, 4)
puts a.distance_to(b)
p b.to_h
c = b.with(x: 6)
p c
puts c.manhattan

case b
in Point[x, y]
  puts "x=#{x} y=#{y}"
end

case b
in { x:, y: }
  puts "hash x=#{x} y=#{y}"
end

p [a, b, c].map(&:manhattan)
p a == Point.new(0, 0)
