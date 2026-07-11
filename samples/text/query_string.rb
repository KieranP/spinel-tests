# frozen_string_literal: true
# Parse and build URL query strings, collecting repeated keys into arrays.
# Inference: String#split chains, each_with_object into a Hash whose values are
# Arrays, and map/join to round-trip back to a string.

def parse_query(qs)
  qs.split("&").each_with_object({}) do |pair, params|
    key, value = pair.split("=", 2)
    value = "" if value.nil?
    (params[key] ||= []) << value
  end
end

def build_query(params)
  params.flat_map do |key, values|
    values.map { |v| "#{key}=#{v}" }
  end.join("&")
end

qs = "name=alice&age=30&tag=a&tag=b&tag=c&empty="
params = parse_query(qs)

puts "keys: #{params.keys.sort.inspect}"
puts "name: #{params['name'].inspect}"
puts "tags: #{params['tag'].inspect}"
puts "empty: #{params['empty'].inspect}"
puts "age as int: #{params['age'].first.to_i + 1}"

puts "tag count: #{params['tag'].length}"
puts "total values: #{params.values.sum(&:length)}"

rebuilt = build_query(params)
puts "rebuilt: #{rebuilt}"
puts "roundtrip keys: #{parse_query(rebuilt).keys.sort == params.keys.sort}"

single = parse_query("x=1")
puts "single: #{single.inspect}"
p parse_query("a=1&a=2")["a"]
p build_query({ "q" => ["ruby"] })
