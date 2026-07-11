# frozen_string_literal: true
# Sparse vectors as hashes: dot product, add, scale.
v1 = { 0 => 3, 2 => 5, 5 => 1 }
v2 = { 1 => 2, 2 => 4, 5 => 6 }

# dot product over shared keys
dot = (v1.keys & v2.keys).sum { |k| v1[k] * v2[k] }
puts "dot=#{dot}"

# vector addition (merge with block)
sum = v1.merge(v2) { |_k, a, b| a + b }
p sum.sort.to_h

# scale
scaled = v1.transform_values { |x| x * 10 }
p scaled.sort.to_h

# magnitude squared
mag2 = v1.values.sum { |x| x * x }
puts "mag2=#{mag2}"

# filter_map: nonzero after subtracting 3
adjusted = v1.filter_map { |k, x| [k, x - 3] if x - 3 != 0 }
p adjusted.sort

# dig into nested sparse matrix
matrix = { 0 => { 1 => 9 }, 2 => { 3 => 7 } }
p matrix.dig(0, 1)
p matrix.dig(2, 3)
p matrix.dig(1, 1)
