# frozen_string_literal: true
# User class instances as Hash keys, relying on custom #hash and #eql?.
# Inference: a value object defining #hash/#eql?/#== used as a Hash key, so lookups
# must dispatch the user methods, and Set membership must too.

require "set"

class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def hash = [x, y].hash
  def eql?(other) = other.is_a?(Point) && x == other.x && y == other.y
  def ==(other) = eql?(other)
  def to_s = "(#{x},#{y})"
end

grid = {}
grid[Point.new(0, 0)] = "origin"
grid[Point.new(1, 2)] = "a"
grid[Point.new(1, 2)] = "b" # overwrites same logical key

puts "size: #{grid.size}"
puts "lookup (1,2): #{grid[Point.new(1, 2)]}"
puts "lookup (0,0): #{grid[Point.new(0, 0)]}"
puts "missing (9,9): #{grid[Point.new(9, 9)].inspect}"
puts "has (1,2)?: #{grid.key?(Point.new(1, 2))}"

# count visits with a default hash
visits = Hash.new(0)
[[0, 0], [1, 1], [0, 0], [1, 1], [0, 0]].each { |x, y| visits[Point.new(x, y)] += 1 }
puts "visit counts: #{visits.values.sort.inspect}"
puts "distinct points: #{visits.size}"

seen = Set.new
seen << Point.new(3, 4)
puts "set includes (3,4): #{seen.include?(Point.new(3, 4))}"
puts "set includes (4,3): #{seen.include?(Point.new(4, 3))}"
p Point.new(1, 2).eql?(Point.new(1, 2))
p grid[Point.new(1, 2)]
