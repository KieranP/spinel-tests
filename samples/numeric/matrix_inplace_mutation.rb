# frozen_string_literal: true
# Matrix operations with in-place nested mutation, transpose, multiply.
def make_matrix(rows, cols, &block)
  Array.new(rows) { |i| Array.new(cols) { |j| block.call(i, j) } }
end

def multiply(a, b)
  n, m, p = a.length, b.length, b[0].length
  result = Array.new(n) { Array.new(p, 0) }
  n.times do |i|
    p.times do |j|
      sum = 0
      m.times { |k| sum += a[i][k] * b[k][j] }
      result[i][j] = sum
    end
  end
  result
end

a = make_matrix(2, 3) { |i, j| i * 3 + j + 1 }
b = make_matrix(3, 2) { |i, j| i * 2 + j + 1 }
puts "A: #{a.inspect}"
puts "B: #{b.inspect}"
puts "A*B: #{multiply(a, b).inspect}"

# in-place scaling of last row
m = [[1, 2], [3, 4]]
m.last.map! { |x| x * 10 }
puts "scaled last: #{m.inspect}"

# transpose and diagonal
sq = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
puts "transpose: #{sq.transpose.inspect}"
puts "diagonal: #{(0...sq.length).map { |i| sq[i][i] }.inspect}"
puts "trace: #{(0...sq.length).sum { |i| sq[i][i] }}"
puts "flat sum: #{sq.flatten.sum}"
