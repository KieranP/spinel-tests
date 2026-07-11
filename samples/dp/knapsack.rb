# frozen_string_literal: true
# 0/1 knapsack via bottom-up dynamic programming.
# Inference: a 2D Array(Array(Integer)) DP table built with Array.new nesting,
# indexed and mutated in nested loops, and a backtrack that reads the table.

def knapsack(weights, values, capacity)
  n = weights.length
  dp = Array.new(n + 1) { Array.new(capacity + 1, 0) }

  (1..n).each do |i|
    (0..capacity).each do |w|
      if weights[i - 1] <= w
        take = values[i - 1] + dp[i - 1][w - weights[i - 1]]
        skip = dp[i - 1][w]
        dp[i][w] = [take, skip].max
      else
        dp[i][w] = dp[i - 1][w]
      end
    end
  end

  # backtrack to recover chosen items
  chosen = []
  w = capacity
  n.downto(1) do |i|
    if dp[i][w] != dp[i - 1][w]
      chosen << (i - 1)
      w -= weights[i - 1]
    end
  end

  [dp[n][capacity], chosen.reverse]
end

weights = [2, 3, 4, 5, 9]
values = [3, 4, 5, 8, 10]
best, items = knapsack(weights, values, 20)
puts "best value: #{best}"
puts "chosen items: #{items.inspect}"
puts "chosen weights: #{items.map { |i| weights[i] }.inspect}"
puts "total weight: #{items.sum { |i| weights[i] }}"
p knapsack([1, 2, 3], [6, 10, 12], 5)
