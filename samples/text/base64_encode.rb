# frozen_string_literal: true
# Base64 encoding (and decoding) implemented from scratch over byte arrays.
# Inference: String#bytes, bit shifting/masking into 6-bit groups, index into an
# alphabet String, and padding logic driven by the input length modulo 3.

ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".freeze

def encode(str)
  bytes = str.bytes
  out = +""
  bytes.each_slice(3) do |chunk|
    b0 = chunk[0]
    b1 = chunk[1] || 0
    b2 = chunk[2] || 0
    n = (b0 << 16) | (b1 << 8) | b2
    out << ALPHABET[(n >> 18) & 63]
    out << ALPHABET[(n >> 12) & 63]
    out << (chunk.length > 1 ? ALPHABET[(n >> 6) & 63] : "=")
    out << (chunk.length > 2 ? ALPHABET[n & 63] : "=")
  end
  out
end

def decode(str)
  clean = str.delete("=")
  bits = clean.chars.map { |c| ALPHABET.index(c) }
  bytes = []
  bits.each_slice(4) do |group|
    n = group.each_with_index.reduce(0) { |acc, (v, i)| acc | (v << (18 - 6 * i)) }
    bytes << ((n >> 16) & 255)
    bytes << ((n >> 8) & 255) if group.length > 2
    bytes << (n & 255) if group.length > 3
  end
  bytes.pack("C*")
end

samples = ["Man", "Ma", "M", "hello world", "Ruby"]
samples.each { |s| puts "#{s.inspect} -> #{encode(s)}" }

puts "roundtrip: #{samples.all? { |s| decode(encode(s)) == s }}"
puts "empty: #{encode('').inspect}"
puts "decode 'aGk=': #{decode('aGk=').inspect}"
p encode("foobar")
p decode(encode("test"))
