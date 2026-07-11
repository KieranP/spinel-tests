# frozen_string_literal: true
# Interval scheduling: sort, merge overlaps, count conflicts — ranges & comparisons.
intervals = [[1, 4], [2, 5], [7, 9], [3, 6], [8, 10], [11, 12]]

sorted = intervals.sort_by { |s, e| [s, e] }
merged = []
sorted.each do |s, e|
  if merged.any? && s <= merged.last[1]
    merged[-1][1] = [merged.last[1], e].max
  else
    merged << [s, e]
  end
end
puts "merged: #{merged.inspect}"

total = merged.sum { |s, e| e - s }
puts "covered: #{total}"

ranges = merged.map { |s, e| (s...e) }
puts "point 3 covered? #{ranges.any? { |r| r.include?(3) }}"
puts "point 6 covered? #{ranges.any? { |r| r.include?(6) }}"

gaps = []
merged.each_cons(2) { |a, b| gaps << (a[1]...b[0]) if b[0] > a[1] }
puts "gaps: #{gaps.map { |g| [g.begin, g.end] }.inspect}"
