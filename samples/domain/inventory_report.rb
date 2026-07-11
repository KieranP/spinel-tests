# frozen_string_literal: true
# Inventory report: Struct records in containers, aggregation, sprintf formatting.
Item = Struct.new(:sku, :qty, :price) do
  def value
    qty * price
  end
end

items = [
  Item.new("A1", 3, 2.5),
  Item.new("B2", 10, 0.99),
  Item.new("C3", 1, 100.0),
]

puts "%-6s %5s %8s %10s" % ["SKU", "QTY", "PRICE", "VALUE"]
items.each do |it|
  puts "%-6s %5d %8.2f %10.2f" % [it.sku, it.qty, it.price, it.value]
end

total = items.sum(&:value)
puts "-" * 32
puts "%-6s %5d %8s %10.2f" % ["TOTAL", items.sum(&:qty), "", total]

# Struct methods pulled from a container element
first = items.first
puts "members: #{first.members.inspect}"
puts "to_a: #{first.to_a.inspect}"
puts "to_h: #{first.to_h.inspect}"
cheapest = items.min_by(&:price)
puts "cheapest: #{cheapest.sku} == #{items.sort_by(&:price).first.sku}"
