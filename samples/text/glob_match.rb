# frozen_string_literal: true
# Recursive wildcard matcher supporting '*' (any run) and '?' (any one char).
# Inference: recursion over String#chars via index cursors, boolean short-circuit
# branching, and mapping a battery of cases through the matcher.

def match?(pattern, text, pi = 0, ti = 0)
  pat = pattern.chars
  txt = text.chars
  while pi < pat.length
    case pat[pi]
    when "*"
      return true if pi == pat.length - 1
      (ti..txt.length).each do |k|
        return true if match?(pattern, text, pi + 1, k)
      end
      return false
    when "?"
      return false if ti >= txt.length
      pi += 1
      ti += 1
    else
      return false if ti >= txt.length || pat[pi] != txt[ti]
      pi += 1
      ti += 1
    end
  end
  ti == txt.length
end

cases = [
  ["a*b", "aXXXb"],
  ["a*b", "ab"],
  ["a?c", "abc"],
  ["a?c", "ac"],
  ["*.txt", "file.txt"],
  ["*.txt", "file.md"],
  ["h?llo", "hello"],
  ["*", "anything"],
]

cases.each do |pat, txt|
  puts "#{pat.ljust(8)} ~ #{txt.ljust(10)} => #{match?(pat, txt)}"
end

matched = cases.count { |pat, txt| match?(pat, txt) }
puts "matched: #{matched}/#{cases.length}"
puts "empty pattern vs empty: #{match?('', '')}"
puts "star vs empty: #{match?('*', '')}"
p match?("a*c*e", "abcde")
p match?("??", "abc")
