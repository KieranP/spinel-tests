# frozen_string_literal: true
# In-place style matrix rotations and spiral traversal.
# Inference: nested Integer arrays reshaped via transpose + reverse, and a
# spiral walk that mutates bounds while collecting into a flat Array.

def rotate_cw(m)
  m.transpose.map(&:reverse)
end

def rotate_ccw(m)
  m.map(&:reverse).transpose
end

def spiral(m)
  result = []
  top = 0
  bottom = m.length - 1
  left = 0
  right = m[0].length - 1
  while top <= bottom && left <= right
    (left..right).each { |c| result << m[top][c] }
    top += 1
    (top..bottom).each { |r| result << m[r][right] }
    right -= 1
    if top <= bottom
      right.downto(left) { |c| result << m[bottom][c] }
      bottom -= 1
    end
    if left <= right
      (bottom).downto(top) { |r| result << m[r][left] }
      left += 1
    end
  end
  result
end

grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
puts "original: #{grid.inspect}"
puts "cw:  #{rotate_cw(grid).inspect}"
puts "ccw: #{rotate_ccw(grid).inspect}"
puts "spiral: #{spiral(grid).inspect}"

wide = [[1, 2, 3, 4], [5, 6, 7, 8]]
puts "wide spiral: #{spiral(wide).inspect}"

double_rot = rotate_cw(rotate_cw(grid))
puts "180: #{double_rot.inspect}"
p spiral([[1]])
p rotate_cw(grid).flatten.sum
