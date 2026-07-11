# frozen_string_literal: true
# Greedy activity selection over time intervals held as Structs.
# Inference: an Array of Struct intervals sorted by an attribute, a greedy fold
# tracking the last finish time, and derived aggregate stats.

Interval = Struct.new(:name, :start, :finish) do
  def length = finish - start
end

def select_activities(intervals)
  sorted = intervals.sort_by(&:finish)
  chosen = []
  last_finish = -1
  sorted.each do |iv|
    if iv.start >= last_finish
      chosen << iv
      last_finish = iv.finish
    end
  end
  chosen
end

intervals = [
  Interval.new("a", 1, 4),
  Interval.new("b", 3, 5),
  Interval.new("c", 0, 6),
  Interval.new("d", 5, 7),
  Interval.new("e", 3, 9),
  Interval.new("f", 5, 9),
  Interval.new("g", 6, 10),
  Interval.new("h", 8, 11),
]

chosen = select_activities(intervals)
puts "chosen: #{chosen.map(&:name).inspect}"
puts "count: #{chosen.length}"
puts "total busy time: #{chosen.sum(&:length)}"

longest = intervals.max_by(&:length)
puts "longest: #{longest.name} (#{longest.length})"

overlaps = intervals.combination(2).count do |a, b|
  a.start < b.finish && b.start < a.finish
end
puts "overlapping pairs: #{overlaps}"

by_start = intervals.sort_by(&:start).map(&:name)
puts "by start: #{by_start.inspect}"
p chosen.map { |iv| [iv.start, iv.finish] }
