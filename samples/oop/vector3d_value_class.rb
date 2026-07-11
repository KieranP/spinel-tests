# frozen_string_literal: true
# 3-D vector math over a small value class.
# Inference: every method returns a Float or a fresh Vec built from Floats;
# arithmetic must keep the three components typed across dot/cross/normalize.

class Vec
  attr_reader :x, :y, :z
  def initialize(x, y, z)
    @x = x.to_f
    @y = y.to_f
    @z = z.to_f
  end

  def +(other) = Vec.new(@x + other.x, @y + other.y, @z + other.z)
  def -(other) = Vec.new(@x - other.x, @y - other.y, @z - other.z)
  def *(k) = Vec.new(@x * k, @y * k, @z * k)
  def dot(other) = @x * other.x + @y * other.y + @z * other.z
  def cross(other)
    Vec.new(@y * other.z - @z * other.y,
            @z * other.x - @x * other.z,
            @x * other.y - @y * other.x)
  end
  def length = Math.sqrt(dot(self))
  def to_s = "(#{@x.round(3)}, #{@y.round(3)}, #{@z.round(3)})"
end

u = Vec.new(1, 2, 3)
v = Vec.new(4, 5, 6)

puts (u + v).to_s
puts (u - v).to_s
puts (u * 2).to_s
p u.dot(v)
puts u.cross(v).to_s
p u.length.round(4)
p (u + v).length.round(4)
