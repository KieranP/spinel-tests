# frozen_string_literal: true
# Convert integers to and from arbitrary bases (2..16) via digit tables.
# Inference: Integer -> String through a digit lookup, and String -> Integer by
# folding characters against a Hash{String=>Integer}; round-trips must agree.

DIGITS = "0123456789abcdef"

def to_base(n, base)
  return "0" if n == 0
  neg = n < 0
  n = -n if neg
  out = ""
  while n > 0
    out = DIGITS[n % base] + out
    n /= base
  end
  neg ? "-" + out : out
end

VALUES = {}
DIGITS.each_char.with_index { |ch, i| VALUES[ch] = i }

def from_base(str, base)
  neg = str.start_with?("-")
  body = neg ? str[1..] : str
  n = body.each_char.reduce(0) { |acc, ch| acc * base + VALUES[ch] }
  neg ? -n : n
end

[255, 42, 1024, 0, -17].each do |n|
  [2, 8, 16].each do |base|
    s = to_base(n, base)
    puts "#{n} base #{base} = #{s} (round #{from_base(s, base)})"
  end
end
