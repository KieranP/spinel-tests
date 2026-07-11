# frozen_string_literal: true
# Time arithmetic, formatting, duration computation, comparison.
base = Time.new(2026, 7, 21, 9, 0, 0)

events = [
  ["standup", base + 0],
  ["review", base + 3600],
  ["lunch", base + 3 * 3600],
  ["deploy", base + 5 * 3600 + 1800],
]

events.each do |name, t|
  puts "#{name}: #{t.strftime("%H:%M")} (hour #{t.hour})"
end

first = events.first[1]
last = events.last[1]
duration = last - first
puts "span: #{(duration / 3600).round(1)} hours"
puts "span seconds: #{duration.to_i}"

# gaps between events
events.each_cons(2) do |(n1, t1), (n2, t2)|
  gap = ((t2 - t1) / 60).to_i
  puts "#{n1} -> #{n2}: #{gap} min"
end

sorted = events.sort_by { |_, t| t }
puts "chronological: #{sorted.map(&:first).inspect}"
puts "earliest: #{events.min_by { |_, t| t }.first}"
puts "day of week: #{base.wday}, yday: #{base.yday}"
puts "is future? #{base > Time.new(2020, 1, 1)}"
