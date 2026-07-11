# frozen_string_literal: true
# Longest common subsequence length and reconstruction via 2D DP.
# Inference: a 2D Integer DP grid over two String#chars, a max recurrence, and a
# backtrack that walks the grid to rebuild the subsequence String.

def lcs(a, b)
  ca = a.chars
  cb = b.chars
  m = ca.length
  n = cb.length
  dp = Array.new(m + 1) { Array.new(n + 1, 0) }

  (1..m).each do |i|
    (1..n).each do |j|
      dp[i][j] = if ca[i - 1] == cb[j - 1]
                   dp[i - 1][j - 1] + 1
                 else
                   [dp[i - 1][j], dp[i][j - 1]].max
                 end
    end
  end

  # backtrack
  result = []
  i = m
  j = n
  while i > 0 && j > 0
    if ca[i - 1] == cb[j - 1]
      result << ca[i - 1]
      i -= 1
      j -= 1
    elsif dp[i - 1][j] >= dp[i][j - 1]
      i -= 1
    else
      j -= 1
    end
  end
  result.reverse.join
end

pairs = [
  ["ABCBDAB", "BDCAB"],
  ["AGGTAB", "GXTXAYB"],
  ["abc", "abc"],
  ["abc", "xyz"],
  ["", "abc"],
]

pairs.each do |a, b|
  sub = lcs(a, b)
  puts "#{a.inspect}, #{b.inspect} -> #{sub.inspect} (#{sub.length})"
end

total = pairs.sum { |a, b| lcs(a, b).length }
puts "total lcs length: #{total}"

# lcs is a subsequence of both
a, b = "AGGTAB", "GXTXAYB"
sub = lcs(a, b)
puts "is subsequence: #{sub.length <= [a.length, b.length].min}"
p lcs("banana", "atana")
p lcs("xmjyauz", "mzjawxu").length
