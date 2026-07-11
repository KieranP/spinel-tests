# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Point#equal?
a026 = Point.new(1, 2); p(a026.equal?(a026))
a027 = Point.new(1, 2); b027 = Point.new(1, 2); p(a027.equal?(b027))
a028 = Point.new(1, 2); v028 = a028.equal?(a028); p v028
