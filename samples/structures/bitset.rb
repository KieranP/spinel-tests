# frozen_string_literal: true
# A fixed-size bitset backed by an Array of 64-bit words.
# Inference: Integer bit operations (<<, |, &, ~, []) over an Array(Integer),
# word/bit index via divmod, and population count folded across words.

class Bitset
  WORD = 32

  def initialize(size)
    @size = size
    @words = Array.new((size + WORD - 1) / WORD, 0)
  end

  def set(i)
    @words[i / WORD] |= (1 << (i % WORD))
    self
  end

  def clear(i)
    @words[i / WORD] &= ~(1 << (i % WORD))
    self
  end

  def test(i)
    (@words[i / WORD] >> (i % WORD)) & 1 == 1
  end

  def count
    @words.sum { |w| w.to_s(2).count("1") }
  end

  def to_a
    (0...@size).select { |i| test(i) }
  end
end

bs = Bitset.new(128)
[3, 17, 64, 100, 127].each { |i| bs.set(i) }

puts "set bits: #{bs.to_a.inspect}"
puts "count: #{bs.count}"
puts "test 64: #{bs.test(64)}"
puts "test 65: #{bs.test(65)}"

bs.clear(17)
puts "after clear 17: #{bs.to_a.inspect}"
puts "count now: #{bs.count}"

# a sieve using the bitset
sieve = Bitset.new(30)
(2...30).each { |i| sieve.set(i) }
(2...30).each do |i|
  next unless sieve.test(i)
  (i * 2...30).step(i) { |j| sieve.clear(j) }
end
puts "primes < 30: #{sieve.to_a.inspect}"
p bs.test(3)
p Bitset.new(10).set(5).set(9).count
