# frozen_string_literal: true
# String#partition
p("a-b-c".partition("-"))
a088 = "a-b-c"; p(a088.partition("-"))
a089 = "a-b-c"; b089 = "-"; p(a089.partition(b089))
a090 = "a-b-c"; b090 = "-"; c090 = (a090.partition(b090)); p c090

# A String returned from a method with a `raise` branch loses much of String's
# method table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_pt(opt)
  case opt
  when Integer then "i"
  when String  then "sample text"
  else raise ArgumentError, "no"
  end
end
rb_pt = (raisebr_pt("ab").partition(" ") rescue $!.class); p rb_pt

# On a String returned by Fiber#resume.
f81partition = Fiber.new { Fiber.yield('aabbcc'); nil }
w81partition = f81partition.resume
r81partition = (w81partition.partition("b") rescue $!.class); p r81partition
