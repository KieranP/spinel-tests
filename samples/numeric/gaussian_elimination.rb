# frozen_string_literal: true
# Solve a linear system Ax=b via Gaussian elimination with partial pivoting.
# Inference: a 2D Array(Array(Float)) augmented matrix mutated in place, row
# swaps, and back-substitution producing a Float solution vector.

def solve(matrix, b)
  n = matrix.length
  aug = matrix.each_with_index.map { |row, i| row + [b[i]] }

  (0...n).each do |col|
    # partial pivot: find row with largest absolute value in this column
    pivot = (col...n).max_by { |r| aug[r][col].abs }
    aug[col], aug[pivot] = aug[pivot], aug[col]

    (col + 1...n).each do |r|
      factor = aug[r][col] / aug[col][col]
      (col..n).each { |c| aug[r][c] -= factor * aug[col][c] }
    end
  end

  x = Array.new(n, 0.0)
  (n - 1).downto(0) do |i|
    sum = (i + 1...n).sum { |j| aug[i][j] * x[j] }
    x[i] = (aug[i][n] - sum) / aug[i][i]
  end
  x
end

a = [
  [2.0, 1.0, -1.0],
  [-3.0, -1.0, 2.0],
  [-2.0, 1.0, 2.0],
]
b = [8.0, -11.0, -3.0]

solution = solve(a, b)
puts "solution: #{solution.map { |v| v.round(2) }.inspect}"

# verify by plugging back in
check = a.map { |row| row.each_with_index.sum { |coef, j| coef * solution[j] } }
puts "check (should be ~b): #{check.map { |v| v.round(2) }.inspect}"

a2 = [[1.0, 1.0], [1.0, -1.0]]
puts "2x2: #{solve(a2, [5.0, 1.0]).map { |v| v.round(1) }.inspect}"
p solve([[3.0]], [9.0])
