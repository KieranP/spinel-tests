# frozen_string_literal: true
# Bin packing: compare First-Fit, First-Fit-Decreasing, Best-Fit-Decreasing and
# Next-Fit on the same item list, and report how close each gets to the
# theoretical lower bound.

Item = Struct.new(:name, :size) do
  def to_s
    "#{name}(#{size})"
  end
end

class Bin
  attr_reader :capacity, :items

  def initialize(capacity)
    @capacity = capacity
    @items = []
  end

  def used
    @items.reduce(0) { |s, it| s + it.size }
  end

  def free
    @capacity - used
  end

  def fits?(item)
    item.size <= free
  end

  def add(item)
    @items << item
    self
  end

  def to_s
    "[#{@items.map(&:to_s).join(" ")}] #{used}/#{@capacity}"
  end
end

def next_fit(items, cap)
  bins = [Bin.new(cap)]
  items.each do |it|
    bins << Bin.new(cap) unless bins.last.fits?(it)
    bins.last.add(it)
  end
  bins
end

def first_fit(items, cap)
  bins = []
  items.each do |it|
    target = bins.find { |b| b.fits?(it) }
    if target.nil?
      target = Bin.new(cap)
      bins << target
    end
    target.add(it)
  end
  bins
end

def best_fit(items, cap)
  bins = []
  items.each do |it|
    candidates = bins.select { |b| b.fits?(it) }
    target = candidates.min_by(&:free)
    if target.nil?
      target = Bin.new(cap)
      bins << target
    end
    target.add(it)
  end
  bins
end

def lower_bound(items, cap)
  total = items.reduce(0) { |s, it| s + it.size }
  (total + cap - 1) / cap
end

def report(label, bins, bound)
  puts "#{label}: #{bins.size} bins (lower bound #{bound})"
  bins.each_with_index do |b, i|
    puts format("  bin %-2d %s", i + 1, b)
  end
  waste = bins.reduce(0) { |s, b| s + b.free }
  puts format("  wasted %d units, %.1f%% over bound", waste, ((bins.size - bound) * 100.0) / bound)
  puts
end

CAPACITY = 100

items = [
  Item.new("kernel", 44), Item.new("libc", 27), Item.new("shell", 61),
  Item.new("editor", 18), Item.new("docs", 39), Item.new("fonts", 52),
  Item.new("icons", 12), Item.new("locale", 33), Item.new("tests", 71),
  Item.new("assets", 25), Item.new("manpage", 9), Item.new("sound", 46)
]

puts "capacity #{CAPACITY} per bin, #{items.size} items"
puts "items: #{items.map(&:to_s).join(" ")}"
total = items.reduce(0) { |s, it| s + it.size }
puts "total size #{total}"
bound = lower_bound(items, CAPACITY)
puts "lower bound #{bound} bins"
puts

decreasing = items.sort_by { |it| -it.size }
puts "decreasing order: #{decreasing.map(&:to_s).join(" ")}"
puts

report("Next-Fit          ", next_fit(items, CAPACITY), bound)
report("First-Fit         ", first_fit(items, CAPACITY), bound)
report("First-Fit-Decr    ", first_fit(decreasing, CAPACITY), bound)
report("Best-Fit-Decr     ", best_fit(decreasing, CAPACITY), bound)

puts "summary:"
results = {
  "Next-Fit" => next_fit(items, CAPACITY).size,
  "First-Fit" => first_fit(items, CAPACITY).size,
  "First-Fit-Decreasing" => first_fit(decreasing, CAPACITY).size,
  "Best-Fit-Decreasing" => best_fit(decreasing, CAPACITY).size
}
results.each do |name, n|
  bar = "#" * n
  puts format("  %-22s %2d %s", name, n, bar)
end
best = results.min_by { |_, n| n }
puts "  best: #{best[0]} with #{best[1]} bins"
puts

puts "every item placed exactly once, per strategy:"
[["NF", next_fit(items, CAPACITY)],
 ["FF", first_fit(items, CAPACITY)],
 ["FFD", first_fit(decreasing, CAPACITY)],
 ["BFD", best_fit(decreasing, CAPACITY)]].each do |label, bins|
  placed = bins.flat_map(&:items).map(&:name).sort
  expected = items.map(&:name).sort
  overfull = bins.count { |b| b.used > b.capacity }
  puts format("  %-4s placed=%-3d complete=%-5s overfull=%d", label, placed.size, placed == expected, overfull)
end
