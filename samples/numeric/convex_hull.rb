# frozen_string_literal: true
# Convex hull of 2D integer points via Andrew's monotone chain.
# Inference: points as Array([x, y]) sorted lexicographically, an integer cross
# product, and two passes building lower/upper hulls with a stack.

def cross(o, a, b)
  (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])
end

def convex_hull(points)
  pts = points.sort_by { |p| [p[0], p[1]] }.uniq
  return pts if pts.length < 3

  lower = []
  pts.each do |p|
    lower.pop while lower.length >= 2 && cross(lower[-2], lower[-1], p) <= 0
    lower << p
  end

  upper = []
  pts.reverse_each do |p|
    upper.pop while upper.length >= 2 && cross(upper[-2], upper[-1], p) <= 0
    upper << p
  end

  (lower[0...-1] + upper[0...-1])
end

points = [[0, 0], [1, 1], [2, 2], [2, 0], [0, 2], [1, 0], [0, 1], [2, 1]]
hull = convex_hull(points)
puts "input points: #{points.length}"
puts "hull vertices: #{hull.sort.inspect}"
puts "hull size: #{hull.length}"

# signed area (shoelace) x2
area2 = hull.each_index.sum do |i|
  a = hull[i]
  b = hull[(i + 1) % hull.length]
  a[0] * b[1] - b[0] * a[1]
end
puts "twice area: #{area2.abs}"

triangle = convex_hull([[0, 0], [4, 0], [2, 3]])
puts "triangle hull: #{triangle.sort.inspect}"
puts "collinear: #{convex_hull([[0, 0], [1, 1], [2, 2]]).sort.inspect}"
p cross([0, 0], [1, 0], [0, 1])
p convex_hull([[0, 0], [1, 0]]).length
