# frozen_string_literal: true
# Recursive JSON serializer for nested Hash/Array/scalar values.
# Inference: a recursive method dispatching on runtime type via case/when (Hash,
# Array, String, Integer, Float, true/false/nil), building a String.

def to_json(value)
  case value
  when Hash
    inner = value.map { |k, v| "#{to_json(k.to_s)}:#{to_json(v)}" }.join(",")
    "{#{inner}}"
  when Array
    "[#{value.map { |v| to_json(v) }.join(',')}]"
  when String
    "\"#{value}\""
  when Integer, Float
    value.to_s
  when true
    "true"
  when false
    "false"
  when nil
    "null"
  else
    "\"#{value}\""
  end
end

doc = {
  "name" => "widget",
  "count" => 3,
  "price" => 9.5,
  "tags" => ["a", "b"],
  "meta" => { "active" => true, "note" => nil },
}

puts to_json(doc)
puts to_json([1, 2, [3, 4], { "x" => 5 }])
puts to_json("hello")
puts to_json(42)
puts to_json(nil)
puts to_json([true, false, nil])

nested = { "list" => [{ "id" => 1 }, { "id" => 2 }] }
puts to_json(nested)
puts "length: #{to_json(doc).length}"
p to_json({ "empty" => [] })
p to_json([])
