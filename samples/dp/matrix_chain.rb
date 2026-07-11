# frozen_string_literal: true
# Matrix-chain multiplication: minimum scalar multiplications via interval DP.
# Inference: a 2D Integer DP table filled by increasing chain length, a min over
# split points, and a parenthesization string rebuilt from a split table.

def matrix_chain(dims)
  n = dims.length - 1
  dp = Array.new(n) { Array.new(n, 0) }
  split = Array.new(n) { Array.new(n, 0) }

  (2..n).each do |len|
    (0..n - len).each do |i|
      j = i + len - 1
      dp[i][j] = 1_000_000_000
      (i...j).each do |k|
        cost = dp[i][k] + dp[k + 1][j] + dims[i] * dims[k + 1] * dims[j + 1]
        if cost < dp[i][j]
          dp[i][j] = cost
          split[i][j] = k
        end
      end
    end
  end
  [dp[0][n - 1], split]
end

def parens(split, i, j)
  return "M#{i}" if i == j
  k = split[i][j]
  "(#{parens(split, i, k)}#{parens(split, k + 1, j)})"
end

dims = [40, 20, 30, 10, 30]
cost, split = matrix_chain(dims)
puts "dims: #{dims.inspect}"
puts "min multiplications: #{cost}"
puts "parenthesization: #{parens(split, 0, dims.length - 2)}"

simple = [10, 20, 30]
c2, = matrix_chain(simple)
puts "two matrices cost: #{c2}"

square, s2 = matrix_chain([5, 5, 5, 5])
puts "square chain cost: #{square}, parens: #{parens(s2, 0, 2)}"
p matrix_chain([2, 3, 4])[0]
p matrix_chain([10, 100, 5, 50])[0]
