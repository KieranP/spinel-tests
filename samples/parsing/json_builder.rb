# frozen_string_literal: true
# Serialize a nested Ruby structure to a JSON-ish String by hand.
# Inference: a recursive serializer dispatches on runtime class (Hash, Array,
# String, Integer, Float, true/false/nil) — the whole-program view must union
# every value type reachable in the document.

def to_json(value)
  case value
  when Hash
    inner = value.map { |k, v| "#{to_json(k.to_s)}:#{to_json(v)}" }.join(",")
    "{#{inner}}"
  when Array
    "[#{value.map { |v| to_json(v) }.join(",")}]"
  when String
    "\"#{value}\""
  when Integer, Float
    value.to_s
  when true, false
    value.to_s
  when nil
    "null"
  end
end

doc = {
  "name" => "spinel",
  "version" => 8,
  "stable" => true,
  "ratio" => 1.5,
  "tags" => ["compiler", "ruby", "c"],
  "meta" => { "nested" => [1, 2, ["deep", nil]] },
}

puts to_json(doc)
puts to_json([1, "two", 3.0, false, nil])
