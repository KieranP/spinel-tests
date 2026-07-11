# frozen_string_literal: true
# A tiny stack-based bracket/expression validator with running state.
# Inference: a Hash mapping closing→opening brackets, an Array used as a stack
# mutated across each_char, and a boolean fold with early exit.

PAIRS = { ")" => "(", "]" => "[", "}" => "{" }.freeze
OPENERS = PAIRS.values.freeze

def balanced?(str)
  stack = []
  str.each_char do |ch|
    if OPENERS.include?(ch)
      stack.push(ch)
    elsif PAIRS.key?(ch)
      return false if stack.empty? || stack.pop != PAIRS[ch]
    end
  end
  stack.empty?
end

def max_depth(str)
  depth = 0
  best = 0
  str.each_char do |ch|
    if OPENERS.include?(ch)
      depth += 1
      best = depth if depth > best
    elsif PAIRS.key?(ch)
      depth -= 1
    end
  end
  best
end

tests = ["()", "([])", "([)]", "((()))", "(]", "{[()]}", "abc(d[e]f)g"]
tests.each do |t|
  puts "#{t.ljust(10)} balanced=#{balanced?(t)} depth=#{max_depth(t)}"
end

valid_count = tests.count { |t| balanced?(t) }
puts "valid: #{valid_count}/#{tests.length}"
p balanced?("{{[[(())]]}}")
p max_depth("(((x)))")
