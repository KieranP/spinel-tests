# frozen_string_literal: true
# Build a nested structure and serialize it to a JSON-ish string manually.
def encode(obj)
  case obj
  when Hash
    inner = obj.map { |k, v| "#{encode(k.to_s)}:#{encode(v)}" }.join(",")
    "{#{inner}}"
  when Array
    "[#{obj.map { |x| encode(x) }.join(",")}]"
  when String
    "\"#{obj}\""
  when Integer, Float
    obj.to_s
  when true, false, nil
    obj.inspect
  else
    encode(obj.to_s)
  end
end

data = {
  name: "widget",
  tags: ["a", "b", "c"],
  meta: { count: 3, ratio: 0.5, active: true, note: nil },
  matrix: [[1, 2], [3, 4]],
}

puts encode(data)
puts encode([1, "two", 3.0, nil, false])
puts encode({ nested: { deep: { deeper: [1, [2, [3]]] } } })
