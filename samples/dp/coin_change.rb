# frozen_string_literal: true
# Coin change: minimum coins and number of ways, via 1D DP.
# Inference: an Integer DP array seeded with a sentinel, nested iteration over
# coin denominations, and min folds across whole-program method calls.

INF = 1_000_000

def min_coins(coins, amount)
  dp = Array.new(amount + 1, INF)
  dp[0] = 0
  (1..amount).each do |a|
    coins.each do |c|
      dp[a] = [dp[a], dp[a - c] + 1].min if c <= a
    end
  end
  dp[amount] >= INF ? -1 : dp[amount]
end

def count_ways(coins, amount)
  dp = Array.new(amount + 1, 0)
  dp[0] = 1
  coins.each do |c|
    (c..amount).each { |a| dp[a] += dp[a - c] }
  end
  dp[amount]
end

coins = [1, 5, 10, 25]
puts "min coins for 63: #{min_coins(coins, 63)}"
puts "ways to make 25: #{count_ways(coins, 25)}"
puts "min coins 0..10: #{(0..10).map { |a| min_coins(coins, a) }.inspect}"

puts "impossible: #{min_coins([5, 10], 3)}"
puts "ways for 100: #{count_ways(coins, 100)}"

odd = [2, 4]
puts "min with even-only for 7: #{min_coins(odd, 7)}"
puts "ways with [1,2] for 4: #{count_ways([1, 2], 4)}"
p min_coins([1, 3, 4], 6)
p count_ways([1], 5)
