# frozen_string_literal: true
# Knuth-Morris-Pratt substring search with a prefix-function failure table.
# Inference: Integer failure array built over String#chars, index cursors across
# text and pattern, and all match positions collected into an Array.

def failure_table(pattern)
  pat = pattern.chars
  table = Array.new(pat.length, 0)
  k = 0
  (1...pat.length).each do |i|
    k -= 1 while k > 0 && pat[k] != pat[i]
    k += 1 if pat[k] == pat[i]
    table[i] = k
  end
  table
end

def kmp(text, pattern)
  return [] if pattern.empty?
  t = text.chars
  pat = pattern.chars
  table = failure_table(pattern)
  matches = []
  k = 0
  t.each_index do |i|
    k = table[k - 1] while k > 0 && pat[k] != t[i]
    k += 1 if pat[k] == t[i]
    if k == pat.length
      matches << i - k + 1
      k = table[k - 1]
    end
  end
  matches
end

puts "failure(ABABAC): #{failure_table('ABABAC').inspect}"
puts "matches of 'ab' in 'abcababab': #{kmp('abcababab', 'ab').inspect}"
puts "matches of 'aa' in 'aaaaa': #{kmp('aaaaa', 'aa').inspect}"
puts "no match: #{kmp('hello', 'xyz').inspect}"
puts "full match: #{kmp('abc', 'abc').inspect}"

count = kmp("mississippi", "issi").length
puts "'issi' in 'mississippi': #{count} times at #{kmp('mississippi', 'issi').inspect}"
p failure_table("aabaabaaa")
p kmp("abababab", "abab")
