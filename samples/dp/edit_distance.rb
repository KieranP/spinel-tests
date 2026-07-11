# frozen_string_literal: true
# Levenshtein edit distance via dynamic programming.
# Inference: a 2D Integer DP grid, String#chars indexing, and a 3-way min over
# insert/delete/substitute costs.

def edit_distance(a, b)
  m = a.length
  n = b.length
  dp = Array.new(m + 1) { Array.new(n + 1, 0) }

  (0..m).each { |i| dp[i][0] = i }
  (0..n).each { |j| dp[0][j] = j }

  ca = a.chars
  cb = b.chars
  (1..m).each do |i|
    (1..n).each do |j|
      cost = ca[i - 1] == cb[j - 1] ? 0 : 1
      dp[i][j] = [
        dp[i - 1][j] + 1,
        dp[i][j - 1] + 1,
        dp[i - 1][j - 1] + cost,
      ].min
    end
  end
  dp[m][n]
end

pairs = [
  ["kitten", "sitting"],
  ["flaw", "lawn"],
  ["", "abc"],
  ["same", "same"],
  ["sunday", "saturday"],
]

pairs.each do |a, b|
  puts "#{a.inspect} -> #{b.inspect}: #{edit_distance(a, b)}"
end

total = pairs.sum { |a, b| edit_distance(a, b) }
puts "total distance: #{total}"
p edit_distance("abc", "yabd")
