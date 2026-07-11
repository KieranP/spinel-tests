# frozen_string_literal: true
# A centred interval tree for stabbing and overlap queries over calendar-style
# bookings, with a linear-scan cross-check on every query.

Interval = Struct.new(:label, :from, :to) do
  include Comparable

  def <=>(other)
    c = from <=> other.from
    c.zero? ? (to <=> other.to) : c
  end

  def covers?(point)
    point >= from && point <= to
  end

  def overlaps?(other)
    from <= other.to && other.from <= to
  end

  def length
    to - from
  end

  def to_s
    "#{label}[#{from}..#{to}]"
  end
end

class IntervalTree
  Node = Struct.new(:centre, :here, :left, :right)

  def initialize(intervals)
    @root = build(intervals.sort)
    @size = intervals.length
  end

  attr_reader :size

  def build(items)
    return nil if items.empty?

    mid = items[items.length / 2]
    centre = mid.from + (mid.length / 2)

    here = []
    left = []
    right = []
    items.each do |iv|
      if iv.to < centre
        left << iv
      elsif iv.from > centre
        right << iv
      else
        here << iv
      end
    end

    # Guard against a centre that fails to split anything.
    if here.length == items.length
      return Node.new(centre, here.sort, nil, nil)
    end

    Node.new(centre, here.sort, build(left), build(right))
  end

  def stab(point)
    out = []
    walk_stab(@root, point, out)
    out.sort
  end

  def walk_stab(node, point, out)
    return if node.nil?
    node.here.each { |iv| out << iv if iv.covers?(point) }
    if point < node.centre
      walk_stab(node.left, point, out)
    elsif point > node.centre
      walk_stab(node.right, point, out)
    else
      walk_stab(node.left, point, out)
      walk_stab(node.right, point, out)
    end
  end

  def overlapping(query)
    out = []
    walk_overlap(@root, query, out)
    out.sort
  end

  def walk_overlap(node, query, out)
    return if node.nil?
    node.here.each { |iv| out << iv if iv.overlaps?(query) }
    walk_overlap(node.left, query, out) if query.from < node.centre
    walk_overlap(node.right, query, out) if query.to > node.centre
  end

  def depth(node = @root)
    return 0 if node.nil?
    l = depth(node.left)
    r = depth(node.right)
    1 + (l > r ? l : r)
  end

  def node_count(node = @root)
    return 0 if node.nil?
    1 + node_count(node.left) + node_count(node.right)
  end
end

BOOKINGS = [
  Interval.new("standup", 9, 10),
  Interval.new("design", 9, 12),
  Interval.new("1:1", 11, 12),
  Interval.new("lunch", 12, 13),
  Interval.new("review", 13, 15),
  Interval.new("focus", 14, 18),
  Interval.new("retro", 16, 17),
  Interval.new("oncall", 8, 20),
  Interval.new("deploy", 17, 19),
  Interval.new("wrapup", 19, 20)
].freeze

tree = IntervalTree.new(BOOKINGS)

puts "#{tree.size} bookings, tree depth #{tree.depth}, #{tree.node_count} nodes"
puts
puts "sorted bookings:"
BOOKINGS.sort.each { |iv| puts "  #{iv}" }
puts

puts "=== stabbing queries (who is busy at hour H) ==="
(8..20).each do |hour|
  got = tree.stab(hour)
  expected = BOOKINGS.select { |iv| iv.covers?(hour) }.sort
  flag = got == expected ? "" : "  MISMATCH"
  puts format("  %2d:00  %-46s %d%s", hour, got.map(&:label).join(" "), got.length, flag)
end
puts

puts "=== overlap queries ==="
queries = [
  Interval.new("morning", 9, 11),
  Interval.new("midday", 12, 13),
  Interval.new("afternoon", 14, 16),
  Interval.new("evening", 18, 21),
  Interval.new("allday", 0, 24),
  Interval.new("gap", 21, 23)
]
queries.each do |q|
  got = tree.overlapping(q)
  expected = BOOKINGS.select { |iv| iv.overlaps?(q) }.sort
  flag = got == expected ? "ok" : "MISMATCH"
  puts format("  %-11s %-2d..%-2d  %-40s %s", q.label, q.from, q.to, got.map(&:label).join(" "), flag)
end
puts

puts "=== peak concurrency ==="
peak = 0
peak_hours = []
(0..24).each do |hour|
  n = tree.stab(hour).length
  if n > peak
    peak = n
    peak_hours = [hour]
  elsif n == peak && n.positive?
    peak_hours << hour
  end
end
puts "  peak #{peak} concurrent, at hours #{peak_hours.inspect}"
puts

puts "=== load histogram ==="
(8..20).each do |hour|
  n = tree.stab(hour).length
  puts format("  %2d:00 %-2d %s", hour, n, "#" * n)
end
puts

puts "=== Comparable behaviour on Interval ==="
a = Interval.new("a", 9, 12)
b = Interval.new("b", 9, 15)
c = Interval.new("c", 10, 11)
puts "  a<b #{a < b}   b<c #{b < c}   a==a.dup #{a == Interval.new("a", 9, 12)}"
puts "  min #{[a, b, c].min}   max #{[a, b, c].max}"
puts "  sorted #{[c, b, a].sort.map(&:label).inspect}"
puts "  sort order is a<b<c: #{a < b && b < c}"
puts "  b.clamp(a, c) #{b.clamp(a, c)}"
puts "  a.clamp(b, c) #{a.clamp(b, c)}"
puts "  between? #{b.between?(a, Interval.new("z", 99, 99))}"
puts

puts "=== total booked hours (overlaps merged) ==="
merged = []
BOOKINGS.sort.each do |iv|
  if merged.empty? || merged.last.to < iv.from
    merged << Interval.new("m#{merged.length}", iv.from, iv.to)
  elsif iv.to > merged.last.to
    merged[-1] = Interval.new(merged.last.label, merged.last.from, iv.to)
  end
end
puts "  merged spans #{merged.map(&:to_s).join(" ")}"
puts "  covered hours #{merged.reduce(0) { |s, iv| s + iv.length }}"
