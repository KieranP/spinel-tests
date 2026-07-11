# frozen_string_literal: true
# Longest palindromic substring via expand-around-center.
# Inference: String#chars index arithmetic, a helper returning a [start, length]
# pair, and a fold picking the best window across all centers.

def expand(chars, left, right)
  while left >= 0 && right < chars.length && chars[left] == chars[right]
    left -= 1
    right += 1
  end
  [left + 1, right - left - 1]
end

def longest_palindrome(str)
  return "" if str.empty?
  chars = str.chars
  best_start = 0
  best_len = 1
  (0...chars.length).each do |center|
    [expand(chars, center, center), expand(chars, center, center + 1)].each do |start, len|
      if len > best_len
        best_start = start
        best_len = len
      end
    end
  end
  str[best_start, best_len]
end

def palindrome?(s) = s == s.reverse

words = ["babad", "cbbd", "racecar", "abcde", "aaaa", "forgeeksskeegfor"]
words.each do |w|
  lp = longest_palindrome(w)
  puts "#{w} -> #{lp} (#{lp.length})#{palindrome?(lp) ? '' : ' NOT PALINDROME'}"
end

total = words.sum { |w| longest_palindrome(w).length }
puts "total palindrome length: #{total}"
puts "all palindromic: #{words.map { |w| longest_palindrome(w) }.all? { |p| palindrome?(p) }}"
p longest_palindrome("a")
p palindrome?("abba")
