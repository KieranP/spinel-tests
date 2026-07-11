# frozen_string_literal: true
# Matrix operations using nested arrays: transpose, multiply, mutate.
a = [[1, 2, 3], [4, 5, 6]]
b = [[7, 8], [9, 10], [11, 12]]

# transpose
p a.transpose

# matrix multiply a (2x3) * b (3x2)
result = Array.new(a.size) { Array.new(b.first.size, 0) }
a.each_with_index do |row, i|
  b.transpose.each_with_index do |col, j|
    result[i][j] = row.zip(col).sum { |x, y| x * y }
  end
end
p result

# nested mutation
grid = Array.new(3) { Array.new(3, 0) }
grid[1][1] = 5
grid[0][2] = 9
p grid

# row sums and column sums
p grid.map { |r| r.sum }
p grid.transpose.map { |c| c.sum }

# flatten and stats
flat = a.flatten
puts "sum=#{flat.sum} max=#{flat.max} min=#{flat.min}"
