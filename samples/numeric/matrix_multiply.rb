# frozen_string_literal: true
# Dense matrix multiply over Array-of-Array-of-Integer.
# Inference: nested container types (Array(Array(Integer))) must be preserved
# through index reads, accumulation, and the freshly built result matrix.

def multiply(a, b)
  rows = a.length
  cols = b[0].length
  inner = b.length
  result = Array.new(rows) { Array.new(cols, 0) }
  rows.times do |i|
    cols.times do |j|
      sum = 0
      inner.times { |k| sum += a[i][k] * b[k][j] }
      result[i][j] = sum
    end
  end
  result
end

a = [[1, 2, 3], [4, 5, 6]]
b = [[7, 8], [9, 10], [11, 12]]

product = multiply(a, b)
product.each { |row| p row }
p product.flatten.sum
