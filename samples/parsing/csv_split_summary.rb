# frozen_string_literal: true
# CSV parsing and summary using split/strip
data = <<~CSV
  product,qty,price
  apple,10,0.50
  banana,5,0.25
  cherry,20,1.10
  date,3,2.00
CSV

lines = data.lines.map(&:chomp).reject(&:empty?)
header = lines.shift.split(",")

records = lines.map do |line|
  fields = line.split(",")
  Hash[header.zip(fields)]
end

puts "columns: #{header.join(" | ")}"

total = 0.0
records.each do |r|
  subtotal = r["qty"].to_i * r["price"].to_f
  total += subtotal
  puts "%-8s x%-3d = %6.2f" % [r["product"], r["qty"].to_i, subtotal]
end

puts "-" * 22
puts "%-13s %8.2f" % ["TOTAL", total]
