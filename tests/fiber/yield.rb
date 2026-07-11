# frozen_string_literal: true
# Fiber.yield
p(Fiber.new { Fiber.yield(1); nil }.resume)

a001 = Fiber.new { Fiber.yield(1); nil }
p a001.resume

b002 = "payload"
a002 = Fiber.new { Fiber.yield(b002); nil }
p a002.resume

a003 = Fiber.new { Fiber.yield(1); nil }
c003 = a003.resume
p c003.class
p c003

# yielding several times in order
a004 = Fiber.new do
  Fiber.yield("a")
  Fiber.yield("b")
  Fiber.yield("c")
  nil
end
d004 = []
4.times { d004 << a004.resume }
p d004

# Fiber.yield returns whatever the next #resume was given
a005 = Fiber.new do
  first = Fiber.yield("ask1")
  second = Fiber.yield("saw #{first}")
  "saw #{second}"
end
p a005.resume
p a005.resume("A")
p a005.resume("B")

# yielding without parentheses
a006 = Fiber.new { Fiber.yield 42; nil }
p a006.resume

# yielding nil ends a nil-terminated drive loop early
a007 = Fiber.new { Fiber.yield(nil); "unreached-by-loop" }
p a007.resume
p a007.alive?

# yielding a collection
a008 = Fiber.new { Fiber.yield([1, [2, 3]]); nil }
c008 = a008.resume
p c008
a009 = Fiber.new { Fiber.yield({ "a" => [1] }); nil }
c009 = a009.resume
p c009

# the value of the fiber body after the last yield
a010 = Fiber.new { Fiber.yield("mid"); "final" }
a010.resume
p a010.resume
p a010.alive?

# Fiber.yield outside a fiber raises FiberError
r011 = (Fiber.yield(1) rescue $!.class)
p r011
