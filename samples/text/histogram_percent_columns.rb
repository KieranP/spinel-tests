# frozen_string_literal: true
# Format a numeric histogram with aligned columns and percentages.
data = [3, 7, 7, 2, 9, 7, 3, 5, 9, 9, 1, 7]
counts = Hash.new(0)
data.each { |x| counts[x] += 1 }

total = data.length
maxc = counts.values.max
maxkw = counts.keys.map { |k| k.to_s.length }.max

counts.sort.each do |val, cnt|
  pct = (cnt * 100.0 / total).round(1)
  bar = "*" * ((cnt.to_f / maxc) * 20).round
  puts "#{val.to_s.rjust(maxkw)} | #{bar.ljust(20)} #{cnt} (#{pct}%)"
end

puts "-" * 30
puts "mean: #{(data.sum.to_f / total).round(3)}"
sorted = data.sort
mid = total / 2
median = total.even? ? (sorted[mid - 1] + sorted[mid]) / 2.0 : sorted[mid]
puts "median: #{median}"
puts "mode: #{counts.max_by { |_, c| c }.first}"
