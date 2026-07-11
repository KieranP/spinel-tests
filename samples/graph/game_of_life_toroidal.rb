# frozen_string_literal: true
# Conway's Life on a wrapping torus, driven by a sparse Set of live coordinates
# rather than a dense grid: a glider is walked until it returns to its starting
# shape, a blinker's period is measured, and a still life is shown to be fixed.
# Inference: Set{[Integer, Integer]} with Array keys, neighbour counts folded into
# Hash{[Integer,Integer]=>Integer}, and a generation history compared by value so
# cycle detection depends on Array/Set equality rather than identity.

require "set"

WIDTH = 12
HEIGHT = 12

class Life
  attr_reader :live, :generation

  def initialize(cells)
    @live = Set.new(cells.map { |r, c| [r % HEIGHT, c % WIDTH] })
    @generation = 0
  end

  def neighbours(cell)
    r, c = cell
    [-1, 0, 1].product([-1, 0, 1]).reject { |dr, dc| dr.zero? && dc.zero? }
              .map { |dr, dc| [(r + dr) % HEIGHT, (c + dc) % WIDTH] }
  end

  def step
    counts = Hash.new(0)
    @live.each { |cell| neighbours(cell).each { |n| counts[n] += 1 } }
    survivors = counts.select do |cell, n|
      @live.include?(cell) ? (n == 2 || n == 3) : n == 3
    end
    @live = Set.new(survivors.keys)
    @generation += 1
    self
  end

  def population = @live.size

  def bounding_box
    return nil if @live.empty?

    rows = @live.map(&:first)
    cols = @live.map(&:last)
    [rows.min, cols.min, rows.max, cols.max]
  end

  def normalised
    return Set.new if @live.empty?

    min_r, min_c, = bounding_box
    Set.new(@live.map { |r, c| [r - min_r, c - min_c] })
  end

  def render
    (0...HEIGHT).map do |r|
      (0...WIDTH).map { |c| @live.include?([r, c]) ? "#" : "." }.join
    end
  end

  def to_key = @live.to_a.sort
end

def run_until_repeat(life, limit)
  seen = { life.to_key => 0 }
  shapes = { life.normalised.to_a.sort => 0 }
  limit.times do
    life.step
    key = life.to_key
    if seen.key?(key)
      return [:exact, seen[key], life.generation]
    end

    shape = life.normalised.to_a.sort
    if shapes.key?(shape)
      return [:translated, shapes[shape], life.generation]
    end

    seen[key] = life.generation
    shapes[shape] = life.generation
  end
  [:none, nil, life.generation]
end

puts "== a blinker oscillates with period 2 =="
blinker = Life.new([[5, 4], [5, 5], [5, 6]])
kind, first_seen, at = run_until_repeat(blinker, 20)
puts "detected #{kind} repeat: generation #{first_seen} recurs at #{at} (period #{at - first_seen})"
puts "population stays #{blinker.population}"

puts
puts "== a block is a still life =="
block = Life.new([[2, 2], [2, 3], [3, 2], [3, 3]])
before = block.to_key
3.times { block.step }
puts "unchanged after 3 generations: #{block.to_key == before}"
puts "cells: #{block.to_key.inspect}"

puts
puts "== a glider walks the torus and returns =="
glider = Life.new([[0, 1], [1, 2], [2, 0], [2, 1], [2, 2]])
start_shape = glider.normalised.to_a.sort
puts "initial shape: #{start_shape.inspect}"
glider.render.each { |row| puts "  #{row}" }

positions = []
48.times do
  glider.step
  positions << glider.bounding_box.first(2) if glider.normalised.to_a.sort == start_shape
end
puts "generations run: #{glider.generation}, population #{glider.population}"
puts "shape recurred at offsets: #{positions.first(6).inspect}"
puts "returned to the exact start cells: #{glider.to_key == Life.new([[0, 1], [1, 2], [2, 0], [2, 1], [2, 2]]).to_key}"
glider.render.each { |row| puts "  #{row}" }

puts
puts "== a toad has period 2 as well =="
toad = Life.new([[6, 5], [6, 6], [6, 7], [7, 4], [7, 5], [7, 6]])
kind, first_seen, at = run_until_repeat(toad, 20)
puts "#{kind} repeat, period #{at - first_seen}, population #{toad.population}"

puts
puts "== a full row wraps into itself =="
row = Life.new((0...WIDTH).map { |c| [4, c] })
puts "population before: #{row.population}"
row.step
puts "after one step: #{row.population} cells on rows #{row.live.map(&:first).uniq.sort.inspect}"
row.step
puts "after two steps: #{row.population}"

puts
puts "== a lone cell and an empty board die out =="
lone = Life.new([[0, 0]])
lone.step
puts "lone cell survives: #{lone.population.positive?}"
empty = Life.new([])
empty.step
puts "empty stays empty: #{empty.population.zero?} (bounding box #{empty.bounding_box.inspect})"

puts
puts "== neighbour wrapping is symmetric =="
corner = Life.new([[0, 0]])
ns = corner.neighbours([0, 0]).sort
puts "corner neighbours: #{ns.inspect}"
puts "count: #{ns.size}, all distinct: #{ns.uniq.size == ns.size}"
mutual = ns.all? { |n| corner.neighbours(n).include?([0, 0]) }
puts "adjacency is mutual: #{mutual}"
