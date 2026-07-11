# frozen_string_literal: true
# Conway's Game of Life on a sparse grid keyed by [x, y] coordinate arrays.
# Inference: a Hash with Array(Integer) keys (non-Symbol), Set membership, neighbor
# enumeration via product, and a generation step folding counts.

require "set"

def neighbors(x, y)
  [-1, 0, 1].product([-1, 0, 1]).reject { |dx, dy| dx == 0 && dy == 0 }
    .map { |dx, dy| [x + dx, y + dy] }
end

def step(alive)
  counts = Hash.new(0)
  alive.each do |cell|
    neighbors(cell[0], cell[1]).each { |n| counts[n] += 1 }
  end
  next_gen = Set.new
  counts.each do |cell, count|
    next_gen << cell if count == 3 || (count == 2 && alive.include?(cell))
  end
  next_gen
end

# blinker oscillator
alive = Set[[1, 0], [1, 1], [1, 2]]
puts "gen 0: #{alive.to_a.sort.inspect}"

gen1 = step(alive)
puts "gen 1: #{gen1.to_a.sort.inspect}"

gen2 = step(gen1)
puts "gen 2: #{gen2.to_a.sort.inspect}"

puts "period 2: #{alive == gen2}"
puts "gen1 size: #{gen1.size}"

# a block dies out
lonely = Set[[5, 5]]
puts "lonely next: #{step(lonely).to_a.inspect}"

grid = { [0, 0] => "a", [1, 2] => "b", [0, 0] => "c" }
puts "array-keyed hash: #{grid[[0, 0]]} #{grid[[1, 2]]}"
p neighbors(0, 0).sort
p step(Set[[0, 0], [0, 1], [1, 0], [1, 1]]).to_a.sort
