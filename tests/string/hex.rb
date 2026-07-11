# frozen_string_literal: true
# String#hex
p("ff".hex)
a068 = "ff"; p(a068.hex)
a069 = "ff"; c069 = (a069.hex); p c069

# On a String returned by Fiber#resume.
f81hex = Fiber.new { Fiber.yield('aabbcc'); nil }
w81hex = f81hex.resume
r81hex = (w81hex.hex rescue $!.class); p r81hex
