# frozen_string_literal: true
# Knuth's Dancing Links (Algorithm X) exact-cover solver, run over the classic
# 7-column matrix and then over a pentomino-style tiling of a 3x4 board.
# Inference: a circular doubly-linked object graph where every Node field holds
# another Node (or a Column, a Node subclass), links are re-pointed in place and
# restored on backtrack, and the solution accumulates as Array(Array(String)).

class Node
  attr_accessor :left, :right, :up, :down, :column, :row_name

  def initialize(row_name = nil)
    @row_name = row_name
    @left = self
    @right = self
    @up = self
    @down = self
    @column = nil
  end

  def append_to_row(other)
    @left = other
    @right = other.right
    other.right.left = self
    other.right = self
    self
  end
end

class Column < Node
  attr_accessor :size, :name

  def initialize(name)
    super(nil)
    @name = name
    @size = 0
    @column = self
  end

  def cover
    right.left = left
    left.right = right
    i = down
    while !i.equal?(self)
      j = i.right
      while !j.equal?(i)
        j.down.up = j.up
        j.up.down = j.down
        j.column.size -= 1
        j = j.right
      end
      i = i.down
    end
  end

  def uncover
    i = up
    while !i.equal?(self)
      j = i.left
      while !j.equal?(i)
        j.column.size += 1
        j.down.up = j
        j.up.down = j
        j = j.left
      end
      i = i.up
    end
    right.left = self
    left.right = self
  end
end

class ExactCover
  attr_reader :solutions

  def initialize(column_names)
    @root = Column.new("__root__")
    @columns = {}
    column_names.each do |name|
      col = Column.new(name)
      col.append_to_row(@root.left)
      @columns[name] = col
    end
    @solutions = []
    @stack = []
  end

  def add_row(name, members)
    first = nil
    members.each do |member|
      col = @columns.fetch(member)
      node = Node.new(name)
      node.column = col
      node.up = col.up
      node.down = col
      col.up.down = node
      col.up = node
      col.size += 1
      first = first.nil? ? node : node.append_to_row(first.left)
    end
    self
  end

  def search
    if @root.right.equal?(@root)
      @solutions << @stack.map(&:row_name).sort
      return
    end
    col = smallest_column
    return if col.size.zero?

    col.cover
    row = col.down
    while !row.equal?(col)
      @stack.push(row)
      node = row.right
      while !node.equal?(row)
        node.column.cover
        node = node.right
      end
      search
      @stack.pop
      node = row.left
      while !node.equal?(row)
        node.column.uncover
        node = node.left
      end
      row = row.down
    end
    col.uncover
  end

  def remaining_columns
    names = []
    col = @root.right
    while !col.equal?(@root)
      names << "#{col.name}(#{col.size})"
      col = col.right
    end
    names
  end

  private

  def smallest_column
    best = @root.right
    col = best.right
    while !col.equal?(@root)
      best = col if col.size < best.size
      col = col.right
    end
    best
  end
end

puts "== Knuth's example matrix =="
knuth = ExactCover.new(%w[1 2 3 4 5 6 7])
{
  "A" => %w[3 5 6],
  "B" => %w[1 4 7],
  "C" => %w[2 3 6],
  "D" => %w[1 4],
  "E" => %w[2 7],
  "F" => %w[4 5 7]
}.each { |name, members| knuth.add_row(name, members) }

puts "columns before search: #{knuth.remaining_columns.join(" ")}"
knuth.search
puts "solutions: #{knuth.solutions.inspect}"
puts "columns after search: #{knuth.remaining_columns.join(" ")}"

# Every cover must partition the universe exactly once.
COVERS = {
  "A" => %w[3 5 6], "B" => %w[1 4 7], "C" => %w[2 3 6],
  "D" => %w[1 4], "E" => %w[2 7], "F" => %w[4 5 7]
}.freeze
knuth.solutions.each do |sol|
  used = sol.flat_map { |name| COVERS.fetch(name) }
  puts "  #{sol.join("+")} covers #{used.sort.join(",")} (exact: #{used.sort == %w[1 2 3 4 5 6 7]})"
end

puts
puts "== tiling a 3x4 board with L-trominoes and dominoes =="

WIDTH = 4
HEIGHT = 3
CELLS = (0...HEIGHT).flat_map { |r| (0...WIDTH).map { |c| "r#{r}c#{c}" } }.freeze

SHAPES = {
  "L0" => [[0, 0], [1, 0], [1, 1]],
  "L1" => [[0, 0], [0, 1], [1, 1]],
  "L2" => [[0, 0], [0, 1], [1, 0]],
  "L3" => [[0, 1], [1, 0], [1, 1]],
  "H"  => [[0, 0], [0, 1]],
  "V"  => [[0, 0], [1, 0]]
}.freeze

def placements
  rows = {}
  SHAPES.each do |shape, offsets|
    (0...HEIGHT).each do |r|
      (0...WIDTH).each do |c|
        cells = offsets.map { |dr, dc| [r + dr, c + dc] }
        next if cells.any? { |rr, cc| rr >= HEIGHT || cc >= WIDTH }

        rows["#{shape}@#{r},#{c}"] = cells.map { |rr, cc| "r#{rr}c#{cc}" }
      end
    end
  end
  rows
end

board = ExactCover.new(CELLS)
rows = placements
rows.each { |name, cells| board.add_row(name, cells) }
puts "placements generated: #{rows.size}"
board.search
puts "tilings found: #{board.solutions.size}"

by_piece_count = board.solutions.group_by(&:size).transform_values(&:size)
puts "tilings by piece count: #{by_piece_count.sort.inspect}"

three_piece = board.solutions.select { |s| s.size == 4 }.sort.first
puts "one 4-piece tiling: #{three_piece.inspect}"

grid = Array.new(HEIGHT) { Array.new(WIDTH, ".") }
three_piece.each_with_index do |name, idx|
  rows.fetch(name).each do |cell|
    r = cell[1].to_i
    c = cell[3].to_i
    grid[r][c] = ("a".ord + idx).chr
  end
end
grid.each { |line| puts line.join }

all_valid = board.solutions.all? do |sol|
  sol.flat_map { |name| rows.fetch(name) }.sort == CELLS.sort
end
puts "every tiling is exact: #{all_valid}"
