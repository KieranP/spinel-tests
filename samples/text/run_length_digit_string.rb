# frozen_string_literal: true
# Run-length encoding/decoding of strings
def encode(str)
  str.chars.chunk_while { |a, b| a == b }.map { |group|
    "#{group.length}#{group.first}"
  }.join
end

def decode(str)
  str.scan(/(\d+)(\D)/).map { |count, ch| ch * count.to_i }.join
end

inputs = [
  "aaabbbcccd",
  "wwwwwwwwww",
  "abcdef",
  "aabbaabb",
  "zzzzzzzzzzzzzzz",
]

inputs.each do |s|
  enc = encode(s)
  dec = decode(enc)
  ok = dec == s
  puts "#{s} -> #{enc} -> #{dec} (#{ok})"
end

p inputs.map { |s| encode(s) }
