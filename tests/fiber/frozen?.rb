# frozen_string_literal: true
# Fiber#frozen?

p(Fiber.new { 1 }.frozen?)
a001 = Fiber.new { 1 }
p a001.frozen?
a002 = Fiber.new { 1 }
a002.freeze
p a002.frozen?
a003 = Fiber.new { 1 }
c003 = a003.frozen?
p c003.class
p c003

# #freeze on the same receiver works and returns the Fiber
a004 = Fiber.new { 1 }
p a004.freeze.class
c004 = a004.freeze
p c004.class
p c004.resume
p a004.nil?
