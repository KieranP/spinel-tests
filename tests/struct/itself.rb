# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Point#itself
a008 = Point.new(1, 2); p(a008.itself.equal?(a008))
a009 = Point.new(1, 2); v009 = a009.itself; p(v009.equal?(a009))
