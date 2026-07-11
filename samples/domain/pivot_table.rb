# frozen_string_literal: true
# Pivot table: aggregate sales by region and product.
sales = [
  { region: "north", product: "widget", amount: 100 },
  { region: "north", product: "gadget", amount: 150 },
  { region: "south", product: "widget", amount: 200 },
  { region: "north", product: "widget", amount: 50 },
  { region: "south", product: "gadget", amount: 75 },
]

# total by region
by_region = sales.group_by { |s| s[:region] }
                 .transform_values { |rows| rows.sum { |r| r[:amount] } }
p by_region.sort.to_h

# total by product
by_product = sales.each_with_object(Hash.new(0)) do |s, h|
  h[s[:product]] += s[:amount]
end
p by_product.sort.to_h

# nested pivot: region -> product -> total
pivot = Hash.new { |h, k| h[k] = Hash.new(0) }
sales.each { |s| pivot[s[:region]][s[:product]] += s[:amount] }
pivot.sort.each do |region, products|
  puts "#{region}: #{products.sort.to_h}"
end

# grand total via reduce
grand = sales.reduce(0) { |acc, s| acc + s[:amount] }
puts "grand total: #{grand}"

# top sale
top = sales.max_by { |s| s[:amount] }
puts "top: #{top[:region]}/#{top[:product]} = #{top[:amount]}"
