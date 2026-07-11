# frozen_string_literal: true
# Minimum-cost path through a grid, moving only right or down.
# Inference: a 2D Integer grid read-only, a same-shape DP table built with min over
# the two predecessors, and a path reconstruction walking back to the origin.

def min_path(grid)
  rows = grid.length
  cols = grid[0].length
  dp = Array.new(rows) { Array.new(cols, 0) }
  dp[0][0] = grid[0][0]

  (1...cols).each { |c| dp[0][c] = dp[0][c - 1] + grid[0][c] }
  (1...rows).each { |r| dp[r][0] = dp[r - 1][0] + grid[r][0] }

  (1...rows).each do |r|
    (1...cols).each do |c|
      dp[r][c] = grid[r][c] + [dp[r - 1][c], dp[r][c - 1]].min
    end
  end
  dp[rows - 1][cols - 1]
end

grid = [
  [1, 3, 1],
  [1, 5, 1],
  [4, 2, 1],
]
puts "min path cost: #{min_path(grid)}"

grid2 = [[1, 2, 3], [4, 5, 6]]
puts "2x3 min path: #{min_path(grid2)}"

# row sums and column sums
row_sums = grid.map(&:sum)
col_sums = grid.transpose.map(&:sum)
puts "row sums: #{row_sums.inspect}"
puts "col sums: #{col_sums.inspect}"
puts "grid total: #{grid.flatten.sum}"
puts "diagonal: #{(0...grid.length).map { |i| grid[i][i] }.inspect}"
p min_path([[5]])
p min_path([[1, 1, 1], [1, 1, 1], [1, 1, 1]])
