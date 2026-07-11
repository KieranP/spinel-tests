# frozen_string_literal: true
# Matrix of Rationals: row sums, column means, transpose — value types in containers.
require 'rational' rescue nil

rows = [
  [Rational(1, 2), Rational(1, 3), Rational(1, 6)],
  [Rational(2, 3), Rational(1, 4), Rational(1, 12)],
  [Rational(3, 4), Rational(1, 8), Rational(1, 8)],
]

rows.each_with_index do |row, i|
  s = row.sum(Rational(0))
  puts "row #{i} sum = #{s}"
end

cols = rows.transpose
cols.each_with_index do |col, j|
  total = col.reduce(Rational(0)) { |acc, x| acc + x }
  mean = total / col.length
  puts "col #{j} mean = #{mean}"
end

grand = rows.flatten.sum(Rational(0))
puts "grand total = #{grand}"
puts "max element = #{rows.flatten.max}"
