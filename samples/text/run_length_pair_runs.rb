# frozen_string_literal: true
# Run-length encode / decode round trip on a String.
# Inference: encode maps String -> Array([String, Integer]); decode maps it
# back to String. The pair element types must survive both directions.

def encode(str)
  runs = []
  str.each_char do |ch|
    if !runs.empty? && runs.last[0] == ch
      runs.last[1] += 1
    else
      runs << [ch, 1]
    end
  end
  runs
end

def decode(runs)
  runs.map { |ch, n| ch * n }.join
end

original = "aaabbbcccd_eeeeff"
runs = encode(original)

p runs
puts decode(runs)
p decode(runs) == original
p runs.sum { |_, n| n }
