# frozen_string_literal: true
# Deep pattern matching over nested hashes/arrays with guards and bindings.
orders = [
  { id: 1, customer: { name: "Alice", tier: :gold }, items: [{ sku: "x", qty: 2 }] },
  { id: 2, customer: { name: "Bob", tier: :silver }, items: [] },
  { id: 3, customer: { name: "Carol", tier: :gold }, items: [{ sku: "y", qty: 5 }, { sku: "z", qty: 1 }] },
]

orders.each do |order|
  case order
  in { id:, customer: { name:, tier: :gold }, items: [*, { qty: }] } if qty > 3
    puts "#{name} (order #{id}): big gold order, last qty #{qty}"
  in { id:, customer: { name:, tier: :gold }, items: [_, *] }
    puts "#{name} (order #{id}): gold with items"
  in { id:, customer: { name: }, items: [] }
    puts "#{name} (order #{id}): empty"
  else
    puts "order #{id}: other"
  end
end

# find pattern
data = [1, 2, "target", 4, 5]
case data
in [*pre, String => s, *post]
  puts "found #{s.inspect}, #{pre.length} before, #{post.length} after"
end

# array deconstruct with pin
expected = 42
case [42, 99]
in [^expected, rest]
  puts "matched pin, rest=#{rest}"
end
