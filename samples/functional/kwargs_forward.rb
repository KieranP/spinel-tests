# frozen_string_literal: true
# Keyword arguments, splat/double-splat forwarding, default values.
def build(name:, size: 10, **opts)
  parts = ["name=#{name}", "size=#{size}"]
  opts.each { |k, v| parts << "#{k}=#{v}" }
  parts.join(" ")
end

def forward(**kw)
  build(**kw)
end

puts build(name: "a")
puts build(name: "b", size: 20)
puts build(name: "c", size: 5, color: "red", weight: 3)
puts forward(name: "d", color: "blue")

# positional splat
def total(*nums, multiplier: 1)
  nums.sum * multiplier
end
puts "splat: #{total(1, 2, 3)}"
puts "splat + kw: #{total(1, 2, 3, multiplier: 10)}"

args = [4, 5, 6]
puts "splat forward: #{total(*args)}"
puts "splat + kw forward: #{total(*args, multiplier: 2)}"

# mixed
def describe(first, *rest, last:, **extra)
  "first=#{first} rest=#{rest.inspect} last=#{last} extra=#{extra.inspect}"
end
puts describe(1, 2, 3, last: 9, a: 1, b: 2)

opts = { color: "green", size: 7 }
puts build(name: "e", **opts)
