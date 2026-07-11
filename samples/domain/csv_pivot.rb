# frozen_string_literal: true
# Parse CSV-ish data, pivot/group, compute per-group stats.
raw = <<~CSV
  region,product,units
  north,widget,10
  south,widget,5
  north,gadget,3
  south,gadget,8
  north,widget,7
CSV

rows = raw.lines.map(&:chomp).reject(&:empty?)
header = rows.shift.split(",")
records = rows.map { |line| header.zip(line.split(",")).to_h }

# pivot: region -> total units
by_region = Hash.new(0)
records.each { |r| by_region[r["region"]] += r["units"].to_i }
by_region.sort.each { |region, total| puts "#{region}: #{total}" }

# nested pivot: region -> product -> units
nested = Hash.new { |h, k| h[k] = Hash.new(0) }
records.each { |r| nested[r["region"]][r["product"]] += r["units"].to_i }
nested.sort.each do |region, products|
  products.sort.each { |prod, u| puts "  #{region}/#{prod}: #{u}" }
end

units = records.map { |r| r["units"].to_i }
puts "grand total: #{units.sum}"
puts "avg: #{(units.sum.to_f / units.length).round(2)}"
puts "distinct products: #{records.map { |r| r["product"] }.uniq.sort.inspect}"
