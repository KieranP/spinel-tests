# frozen_string_literal: true
# Chunk-based run-length encode/decode using Enumerable#chunk_while and #flat_map.
# Inference: chunk_while grouping consecutive equal chars, map to [char, count]
# pairs, and flat_map expanding pairs back to a String on decode.

def encode(str)
  str.chars.chunk_while { |a, b| a == b }.map { |run| [run.first, run.length] }
end

def decode(pairs)
  pairs.flat_map { |ch, n| [ch] * n }.join
end

samples = ["aaabbbcccd", "aabcccccaaa", "abcdef", "zzzzz"]
samples.each do |s|
  enc = encode(s)
  desc = enc.map { |c, n| "#{c}#{n}" }.join
  puts "#{s} -> #{desc} -> #{decode(enc)}"
end

# compression ratio (pairs vs chars)
total_chars = samples.sum(&:length)
total_pairs = samples.sum { |s| encode(s).length }
puts "chars: #{total_chars}, runs: #{total_pairs}"

# roundtrip
ok = samples.all? { |s| decode(encode(s)) == s }
puts "roundtrip ok: #{ok}"

# longest run across all samples
longest = samples.flat_map { |s| encode(s) }.max_by { |_c, n| n }
puts "longest run: #{longest.inspect}"

grouped = "aabbbc".chars.chunk_while { |a, b| a == b }.to_a
puts "chunks: #{grouped.inspect}"
p encode("wwwwaaadexxxxxx")
p decode([["a", 3], ["b", 2]])
