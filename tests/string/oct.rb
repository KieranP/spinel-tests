# frozen_string_literal: true
# String#oct
p("777".oct)
a084 = "777"; p(a084.oct)
a085 = "777"; c085 = (a085.oct); p c085

# On a String returned by Fiber#resume.
f81oct = Fiber.new { Fiber.yield('aabbcc'); nil }
w81oct = f81oct.resume
r81oct = (w81oct.oct rescue $!.class); p r81oct
