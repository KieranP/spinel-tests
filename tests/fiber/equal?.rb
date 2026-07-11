# frozen_string_literal: true
# Fiber#equal?

p(Fiber.new { 1 }.equal?(Fiber.new { 1 }))
a001 = Fiber.new { 1 }
p a001.equal?(a001)
a002 = Fiber.new { 1 }
b002 = Fiber.new { 1 }
p a002.equal?(b002)
a003 = Fiber.new { 1 }
c003 = a003.equal?(a003)
p c003.class
p c003

a004 = Fiber.new { 1 }
p a004 == a004
b004 = Fiber.new { 1 }
p a004 == b004
p a004 != a004

# the neighbouring Object operations on the same receiver are supported
a005 = Fiber.new { 1 }
p a005.object_id.class
p a005.nil?
p a005.alive?
p a005.class
p a005.itself.class
p a005.hash.class
