# frozen_string_literal: true
# Deterministic finite automaton recognizing binary strings divisible by 3.
# Inference: a Symbol-keyed transition table (Hash of Hash), state threaded
# through a fold over the input characters, membership check against a Set.

require "set"

TRANSITIONS = {
  s0: { "0" => :s0, "1" => :s1 },
  s1: { "0" => :s2, "1" => :s0 },
  s2: { "0" => :s1, "1" => :s2 },
}.freeze

ACCEPTING = Set[:s0]

def accepts?(input)
  final = input.chars.reduce(:s0) { |state, ch| TRANSITIONS[state][ch] }
  ACCEPTING.include?(final)
end

def to_binary(n)
  n.to_s(2)
end

(0..12).each do |n|
  b = to_binary(n)
  ok = accepts?(b)
  expected = (n % 3 == 0)
  puts "#{n} (#{b}): #{ok}#{ok == expected ? "" : " MISMATCH"}"
end

divisible = (0..30).select { |n| accepts?(to_binary(n)) }
puts "divisible by 3: #{divisible.inspect}"
p accepts?("1100")
p accepts?("1011")
