# frozen_string_literal: true
# Fiber#alive?
p(Fiber.new { 1 }.alive?)

a001 = Fiber.new { 1 }
p a001.alive?

a002 = Fiber.new { 1 }
a002.resume
p a002.alive?

a003 = Fiber.new { 1 }
c003 = a003.alive?
p c003.class
p c003

# alive while suspended at a yield, dead after the body returns
a004 = Fiber.new { Fiber.yield("mid"); "end" }
p a004.alive?
a004.resume
p a004.alive?
a004.resume
p a004.alive?

a005 = Fiber.new { Fiber.yield("mid"); "end" }
a005.resume
c005 = a005.alive?
p c005

# a generator stays alive until its body falls through
a006 = Fiber.new do
  3.times { |i| Fiber.yield(i) }
  nil
end
d006 = []
4.times { a006.resume; d006 << a006.alive? }
p d006

# a fiber whose body is empty dies on the first resume
a007 = Fiber.new { nil }
p a007.alive?
a007.resume
p a007.alive?
