# frozen_string_literal: true
# Reflected binary Gray code: generation, conversion, and verification.
# Inference: Integer XOR/shift arithmetic, Array(Integer) generation over a range,
# and each_cons to check the single-bit-change property.

def to_gray(n) = n ^ (n >> 1)

def from_gray(g)
  n = 0
  while g > 0
    n ^= g
    g >>= 1
  end
  n
end

def bits(n, width) = width.downto(0).map { |i| n[i] }.drop_while(&:zero?)

codes = (0...8).map { |n| to_gray(n) }
puts "gray(0..7): #{codes.inspect}"
puts "as binary: #{codes.map { |g| format('%03b', g) }.inspect}"

# round-trip
roundtrip = (0...16).all? { |n| from_gray(to_gray(n)) == n }
puts "roundtrip ok: #{roundtrip}"

# adjacent codes differ by exactly one bit
diffs = codes.each_cons(2).map { |a, b| (a ^ b).to_s(2).count("1") }
puts "adjacent bit diffs: #{diffs.inspect}"
puts "all single-bit: #{diffs.all? { |d| d == 1 }}"

# wrap-around (last to first) is also single-bit for a full cycle
wrap = (codes.last ^ codes.first).to_s(2).count("1")
puts "wrap diff: #{wrap}"
p to_gray(5)
p from_gray(7)
