# frozen_string_literal: true
# Determinant by recursive Laplace (cofactor) expansion.
# Inference: an Array(Array(Integer)) recursively reduced to smaller minors; the
# recursion's Integer return type must resolve before the nested-array element type.

def minor(matrix, skip_row, skip_col)
  matrix.each_index.reject { |r| r == skip_row }.map do |r|
    matrix[r].each_index.reject { |c| c == skip_col }.map { |c| matrix[r][c] }
  end
end

def determinant(matrix)
  n = matrix.length
  return matrix[0][0] if n == 1
  return matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0] if n == 2
  total = 0
  n.times do |col|
    sign = col.even? ? 1 : -1
    total += sign * matrix[0][col] * determinant(minor(matrix, 0, col))
  end
  total
end

m3 = [[6, 1, 1], [4, -2, 5], [2, 8, 7]]
m4 = [[1, 0, 2, -1], [3, 0, 0, 5], [2, 1, 4, -3], [1, 0, 5, 0]]

p determinant([[5]])
p determinant([[1, 2], [3, 4]])
p determinant(m3)
p determinant(m4)
