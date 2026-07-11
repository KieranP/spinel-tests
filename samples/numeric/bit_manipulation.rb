# frozen_string_literal: true
# Bit-twiddling utilities over Fixnum-range Integers.
# Inference: Integer bitwise operators (& | ^ ~ << >>), Integer#[] bit access,
# bit_length, and popcount via to_s(2).

def popcount(n)
  n.to_s(2).count("1")
end

def set_bit(n, i) = n | (1 << i)
def clear_bit(n, i) = n & ~(1 << i)
def toggle_bit(n, i) = n ^ (1 << i)
def bit_at(n, i) = n[i]

puts "popcount(255): #{popcount(255)}"
puts "popcount(1024): #{popcount(1024)}"
puts "set_bit(0, 3): #{set_bit(0, 3)}"
puts "clear_bit(15, 1): #{clear_bit(15, 1)}"
puts "toggle_bit(5, 0): #{toggle_bit(5, 0)}"
puts "bits of 13: #{(0..3).map { |i| bit_at(13, i) }.inspect}"

# XOR swap
a = 12
b = 25
a ^= b
b ^= a
a ^= b
puts "xor swap: a=#{a} b=#{b}"

# find powers of two
powers = (1..64).select { |n| n & (n - 1) == 0 }
puts "powers of two <= 64: #{powers.inspect}"

# bit_length
puts "bit_lengths: #{[1, 7, 8, 255, 256].map(&:bit_length).inspect}"

# reconstruct a number from its bits
bits = [1, 0, 1, 1]
val = bits.each_with_index.reduce(0) { |acc, (bit, i)| acc | (bit << i) }
puts "from bits #{bits.inspect}: #{val}"
p 0xFF & 0x0F
p 5.to_s(2)
