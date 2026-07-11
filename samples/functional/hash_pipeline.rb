# frozen_string_literal: true
# A small ETL pipeline over Hashes: build, reshape, filter, aggregate.
# Inference: each_with_object into a Hash, transform_keys/transform_values,
# filter_map, tally, group_by, and dig on nested structures.

words = %w[apple ant bear bird cat cow crane]

by_letter = words.each_with_object(Hash.new { |h, k| h[k] = [] }) do |w, acc|
  acc[w[0]] << w
end
by_letter.keys.sort.each { |k| puts "#{k}: #{by_letter[k].inspect}" }

lengths = words.map { |w| [w, w.length] }.to_h
upcased = lengths.transform_keys(&:upcase)
puts "transform_keys: #{upcased.keys.first(2).inspect}"

doubled = lengths.transform_values { |v| v * 2 }
puts "transform_values sum: #{doubled.values.sum}"

long = words.filter_map { |w| w.upcase if w.length >= 4 }
puts "filter_map: #{long.inspect}"

counts = words.map { |w| w.length }.tally
puts "length tally: #{counts.sort.inspect}"

grouped = words.group_by(&:length)
puts "group_by length keys: #{grouped.keys.sort.inspect}"

nested = { a: { b: { c: 42 } } }
puts "dig: #{nested.dig(:a, :b, :c)}"
puts "dig miss: #{nested.dig(:a, :x, :c).inspect}"

p words.sum(&:length)
p lengths.min_by { |_w, len| len }
