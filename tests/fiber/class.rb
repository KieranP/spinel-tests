# frozen_string_literal: true
# Fiber#class
p(Fiber.new { 1 }.class)

a001 = Fiber.new { 1 }
p a001.class

a002 = Fiber.new { Fiber.yield(1); nil }
a002.resume
p a002.class

a003 = Fiber.new { 1 }
c003 = a003.class
p c003.class
p c003
p c003.name

# Fiber.current is a Fiber
p Fiber.current.class
c004 = Fiber.current.class
p c004

# the class constant itself, as a value
r005 = (Fiber rescue $!.class)
p r005
r006 = (Fiber.name rescue $!.class)
p r006
