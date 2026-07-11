# frozen_string_literal: true
# Grid transforms: transpose, rotate 90, flatten with coordinates.
# Inference: Array(Array(Integer)) reshaped by transpose / zip / rotate; the
# nested element type must be preserved through each rebuild.

def transpose(grid) = grid.transpose
def rotate90(grid) = grid.transpose.map(&:reverse)

grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

transpose(grid).each { |row| p row }
puts "---"
rotate90(grid).each { |row| p row }
puts "---"
p grid.flatten.sum
p grid.map(&:sum)
p grid.map { |row| row.max }
p (0...grid.length).sum { |i| grid[i][i] }         # diagonal sum
p (0...grid.length).map { |i| grid[i][i] }         # main diagonal
p (0...grid.length).map { |i| grid[i][grid.length - 1 - i] }  # anti-diagonal
