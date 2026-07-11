# frozen_string_literal: true
# Warehouse inventory over Struct records.
# Inference: Struct.new produces a real class; an Array of Item structs is
# grouped, summed, and sorted — the record field types flow through each step.

Item = Struct.new(:name, :category, :price, :qty) do
  def value = price * qty
end

inventory = [
  Item.new("widget", :hardware, 250, 4),
  Item.new("gizmo", :hardware, 175, 10),
  Item.new("manual", :books, 30, 25),
  Item.new("novel", :books, 45, 12),
  Item.new("cable", :hardware, 60, 30),
]

by_category = inventory.group_by(&:category)

by_category.each do |cat, items|
  total = items.sum(&:value)
  puts "#{cat}: #{items.length} items, value #{total}"
end

p inventory.sum(&:value)
p inventory.max_by(&:value).name
p inventory.map(&:name).sort
