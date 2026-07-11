# frozen_string_literal: true
# 2D/3D vector math with Math functions
def dot(a, b)
  a.zip(b).map { |x, y| x * y }.inject(0, :+)
end

def magnitude(v)
  Math.sqrt(dot(v, v))
end

def normalize(v)
  m = magnitude(v)
  v.map { |x| (x / m).round(6) }
end

v1 = [3.0, 4.0]
v2 = [1.0, 2.0, 2.0]

puts "dot(v1,v1)=#{dot(v1, v1)}"
puts "|v1|=#{magnitude(v1).round(6)}"
puts "|v2|=#{magnitude(v2).round(6)}"
p normalize(v1)
p normalize(v2)

# angle between vectors
a = [1.0, 0.0]
b = [1.0, 1.0]
cos_theta = dot(a, b) / (magnitude(a) * magnitude(b))
angle = Math.acos(cos_theta)
puts "angle=#{angle.round(6)} rad"
puts "degrees=#{(angle * 180 / Math::PI).round(4)}"

# hypot and cross product (2d scalar)
puts "hypot(3,4)=#{Math.hypot(3, 4)}"
cross = v1[0] * v2[1] - v1[1] * v2[0]
puts "cross2d=#{cross}"
