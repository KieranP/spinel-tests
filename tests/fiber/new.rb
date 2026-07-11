# frozen_string_literal: true
# Fiber.new
p(Fiber.new { 1 }.class)

a001 = Fiber.new { 1 }
p a001.class

b002 = 41
a002 = Fiber.new { b002 + 1 }
p a002.class
p a002.resume

a003 = Fiber.new { 7 }
c003 = a003.resume
p c003.class
p c003

# block parameters come from the first #resume
a004 = Fiber.new { |x| x * 2 }
p a004.resume(21)
a005 = Fiber.new { |x| x * 2 }
c005 = a005.resume(5)
p c005

# multiple block parameters
a006 = Fiber.new { |x, y| x + y }
p a006.resume(3, 4)
a007 = Fiber.new { |x, y| x + y }
c007 = a007.resume(3, 4)
p c007

# a fiber that yields before returning
a008 = Fiber.new { Fiber.yield("mid"); "end" }
p a008.resume
p a008.resume
a009 = Fiber.new { Fiber.yield("mid"); "end" }
c009 = a009.resume
p c009

# a body returning nil
a010 = Fiber.new { nil }
p a010.resume
a011 = Fiber.new { nil }
c011 = a011.resume
p c011

# closing over a local
d012 = []
a012 = Fiber.new { d012 << "ran"; d012.length }
p a012.resume
p d012
