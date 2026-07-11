# frozen_string_literal: true
# Rabin-Karp substring search using a rolling polynomial hash.
# Inference: Integer modular arithmetic over String#bytes, a sliding hash update,
# and match verification collecting positions.

BASE = 256
MOD = 1_000_000_007

def rolling_hash(bytes)
  bytes.reduce(0) { |h, b| (h * BASE + b) % MOD }
end

def rabin_karp(text, pattern)
  return [] if pattern.empty? || pattern.length > text.length
  m = pattern.length
  tb = text.bytes
  pb = pattern.bytes
  pat_hash = rolling_hash(pb)
  high = (1...m).reduce(1) { |acc, _| acc * BASE % MOD }

  window = rolling_hash(tb[0, m])
  matches = []
  (0..tb.length - m).each do |i|
    if window == pat_hash && text[i, m] == pattern
      matches << i
    end
    if i < tb.length - m
      window = ((window - tb[i] * high % MOD + MOD) % MOD * BASE + tb[i + m]) % MOD
    end
  end
  matches
end

puts "'ab' in 'abcabab': #{rabin_karp('abcabab', 'ab').inspect}"
puts "'aa' in 'aaa': #{rabin_karp('aaa', 'aa').inspect}"
puts "'xyz' in 'hello': #{rabin_karp('hello', 'xyz').inspect}"
puts "'issi' in 'mississippi': #{rabin_karp('mississippi', 'issi').inspect}"

puts "hash of 'abc': #{rolling_hash('abc'.bytes)}"
puts "full match: #{rabin_karp('test', 'test').inspect}"
puts "count in repeated: #{rabin_karp('abababab', 'ab').length}"
p rolling_hash("a".bytes)
p rabin_karp("banana", "ana")
