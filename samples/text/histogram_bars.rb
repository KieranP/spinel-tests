# frozen_string_literal: true
# Text histogram: tally items and render proportional bars.
# Inference: Hash{String=>Integer} tallies from a fold, then sorted pairs render
# to Strings — the [String, Integer] pair type flows through sort and formatting.

scores = [85, 92, 78, 90, 88, 76, 95, 82, 91, 79, 84, 88, 73, 99, 81]

buckets = Hash.new(0)
scores.each do |s|
  bucket = "#{(s / 10) * 10}s"
  buckets[bucket] += 1
end

rows = buckets.sort_by { |label, _| label }
rows.each do |label, count|
  puts "#{label}: #{'#' * count} (#{count})"
end

p buckets["80s"]
p buckets.values.sum
p buckets.max_by { |_, c| c }.first
