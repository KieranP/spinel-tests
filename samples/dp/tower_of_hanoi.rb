# frozen_string_literal: true
# Tower of Hanoi solver that yields each move to a block.
# Inference: a recursive method taking a block, yielding [from, to] Symbol pairs;
# the caller collects moves into an Array and folds counts.

def hanoi(n, from, to, via, &block)
  return if n.zero?
  hanoi(n - 1, from, via, to, &block)
  yield [from, to]
  hanoi(n - 1, via, to, from, &block)
end

moves = []
hanoi(3, :a, :c, :b) { |m| moves << m }

puts "move count: #{moves.length}"
moves.each_with_index { |(from, to), i| puts "#{i + 1}: #{from} -> #{to}" }

# how many moves land on each peg
landings = moves.map { |_from, to| to }.tally
puts "landings: #{landings.sort.inspect}"

counts = (1..5).map do |n|
  c = 0
  hanoi(n, :a, :c, :b) { |_m| c += 1 }
  c
end
puts "counts for n=1..5: #{counts.inspect}"
puts "matches 2^n - 1: #{counts == (1..5).map { |n| 2**n - 1 }}"
p moves.first
p moves.last
