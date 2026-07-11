# frozen_string_literal: true
# A redux-like reducer with symbol dispatch and immutable-ish state updates.
def reducer(state, action)
  case action
  in { type: :increment, by: }
    state.merge(count: state[:count] + by)
  in { type: :decrement, by: }
    state.merge(count: state[:count] - by)
  in { type: :add_item, item: }
    state.merge(items: state[:items] + [item])
  in { type: :reset }
    { count: 0, items: [] }
  else
    state
  end
end

actions = [
  { type: :increment, by: 5 },
  { type: :add_item, item: "a" },
  { type: :increment, by: 3 },
  { type: :decrement, by: 2 },
  { type: :add_item, item: "b" },
]

final = actions.reduce({ count: 0, items: [] }) { |s, a| reducer(s, a) }
puts "count: #{final[:count]}"
puts "items: #{final[:items].inspect}"

# replay with history
history = actions.each_with_object([{ count: 0, items: [] }]) do |action, acc|
  acc << reducer(acc.last, action)
end
puts "states: #{history.length}"
history.each_with_index { |s, i| puts "  step #{i}: count=#{s[:count]} items=#{s[:items].length}" }
puts "max count: #{history.map { |s| s[:count] }.max}"
