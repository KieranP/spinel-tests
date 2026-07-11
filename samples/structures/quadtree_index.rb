# frozen_string_literal: true
# A point quadtree with subdivision, rectangular range queries and nearest-
# neighbour search. Used to index named map pins and answer region reports.
# Inference: a recursive tree of nodes each holding Array(Struct) buckets and
# four nilable children; queries return Arrays that flow into sort_by/map chains.

Pin = Struct.new(:name, :x, :y) do
  def to_s = "#{name}(#{x},#{y})"
  def dist2(px, py) = (x - px)**2 + (y - py)**2
end

class QuadNode
  CAPACITY = 2

  attr_reader :depth

  def initialize(x0, y0, x1, y1, depth)
    @x0 = x0
    @y0 = y0
    @x1 = x1
    @y1 = y1
    @depth = depth
    @pins = []
    @children = nil
  end

  def contains?(px, py)
    px >= @x0 && px < @x1 && py >= @y0 && py < @y1
  end

  def insert(pin)
    return false unless contains?(pin.x, pin.y)
    if @children
      @children.each { |child| return true if child.insert(pin) }
      return false
    end
    @pins << pin
    subdivide if @pins.length > CAPACITY && @depth < 4
    true
  end

  def subdivide
    mx = (@x0 + @x1) / 2
    my = (@y0 + @y1) / 2
    @children = [
      QuadNode.new(@x0, @y0, mx, my, @depth + 1),
      QuadNode.new(mx, @y0, @x1, my, @depth + 1),
      QuadNode.new(@x0, my, mx, @y1, @depth + 1),
      QuadNode.new(mx, my, @x1, @y1, @depth + 1)
    ]
    moved = @pins
    @pins = []
    moved.each do |pin|
      @children.each { |child| break if child.insert(pin) }
    end
  end

  def query(rx0, ry0, rx1, ry1, found)
    return found if rx1 <= @x0 || rx0 >= @x1 || ry1 <= @y0 || ry0 >= @y1
    @pins.each do |pin|
      found << pin if pin.x >= rx0 && pin.x < rx1 && pin.y >= ry0 && pin.y < ry1
    end
    @children&.each { |child| child.query(rx0, ry0, rx1, ry1, found) }
    found
  end

  def all(acc)
    acc.concat(@pins)
    @children&.each { |child| child.all(acc) }
    acc
  end

  def leaves
    return 1 unless @children
    @children.sum(&:leaves)
  end

  def max_depth
    return @depth unless @children
    @children.map(&:max_depth).max
  end
end

PINS = [
  ["cafe", 5, 5], ["dock", 60, 12], ["park", 20, 70], ["mall", 75, 80],
  ["gate", 8, 9], ["quay", 63, 15], ["barn", 25, 66], ["silo", 90, 95],
  ["well", 2, 40], ["mill", 45, 45]
].map { |name, x, y| Pin.new(name, x, y) }

root = QuadNode.new(0, 0, 100, 100, 0)
PINS.each { |pin| p root.insert(pin) }

p root.leaves
p root.max_depth
p root.all([]).length

def report(root, label, rect)
  hits = root.query(rect[0], rect[1], rect[2], rect[3], []).sort_by(&:name)
  puts format("%-10s %d hit(s): %s", label, hits.length, hits.map(&:to_s).join(", "))
  hits
end

sw = report(root, "southwest", [0, 0, 50, 50])
ne = report(root, "northeast", [50, 50, 100, 100])
strip = report(root, "midstrip", [0, 40, 100, 50])
report(root, "empty", [95, 0, 100, 5])

p sw.map(&:name)
p ne.map(&:name)
p strip.map(&:name)

def nearest(root, px, py)
  root.all([]).min_by { |pin| pin.dist2(px, py) }
end

near = nearest(root, 30, 30)
p near.name
p near.dist2(30, 30)
p nearest(root, 99, 99).name
p nearest(root, 0, 0).to_s

# Every range query must agree with a linear filter over all pins.
[[0, 0, 50, 50], [50, 50, 100, 100], [0, 40, 100, 50]].each do |rx0, ry0, rx1, ry1|
  linear = PINS.select { |pin| pin.x >= rx0 && pin.x < rx1 && pin.y >= ry0 && pin.y < ry1 }
  tree = root.query(rx0, ry0, rx1, ry1, [])
  p linear.map(&:name).sort == tree.map(&:name).sort
end
