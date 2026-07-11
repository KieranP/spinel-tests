# frozen_string_literal: true
# Parse a CSV-ish string into rows, then aggregate sales per region.
# Inference: String#split chains, each_with_object building a Hash keyed by a
# runtime String, numeric coercion, and sort_by over the aggregated pairs.

DATA = <<~CSV.freeze
  north,widget,10
  south,gadget,5
  north,gadget,7
  east,widget,3
  south,widget,8
  north,widget,2
CSV

rows = DATA.each_line.map do |line|
  region, product, qty = line.strip.split(",")
  { region: region, product: product, qty: qty.to_i }
end

by_region = rows.each_with_object(Hash.new(0)) do |row, acc|
  acc[row[:region]] += row[:qty]
end

puts "rows: #{rows.length}"
by_region.sort_by { |region, total| [-total, region] }.each do |region, total|
  puts "#{region}: #{total}"
end

top = by_region.max_by { |_region, total| total }
puts "top region: #{top[0]} (#{top[1]})"

widget_total = rows.select { |r| r[:product] == "widget" }.sum { |r| r[:qty] }
puts "widgets: #{widget_total}"
