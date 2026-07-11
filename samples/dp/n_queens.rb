# frozen_string_literal: true
# N-Queens solver by backtracking, counting and returning placements.
# Inference: recursive descent carrying an Array(Integer) of column choices,
# conflict checks folded over the partial solution, and solution collection.

def safe?(placement, row, col)
  placement.each_with_index.all? do |c, r|
    c != col && (r - row).abs != (c - col).abs
  end
end

def solve(n, row = 0, placement = [], solutions = [])
  if row == n
    solutions << placement.dup
    return solutions
  end
  (0...n).each do |col|
    if safe?(placement, row, col)
      placement.push(col)
      solve(n, row + 1, placement, solutions)
      placement.pop
    end
  end
  solutions
end

counts = (1..8).map { |n| solve(n).length }
puts "solutions for n=1..8: #{counts.inspect}"

sols4 = solve(4)
puts "n=4 count: #{sols4.length}"
sols4.each { |s| puts s.inspect }

first6 = solve(6).first
puts "first n=6 solution: #{first6.inspect}"
puts "valid: #{(0...6).all? { |r| safe?(first6[0...r], r, first6[r]) }}"
p solve(1).length
p solve(5).length
