# frozen_string_literal: true
# String#rpartition
p("a-b-c".rpartition("-"))
a105 = "a-b-c"; p(a105.rpartition("-"))
a106 = "a-b-c"; b106 = "-"; p(a106.rpartition(b106))
a107 = "a-b-c"; b107 = "-"; c107 = (a107.rpartition(b107)); p c107

# A String returned from a method with a `raise` branch loses much of String's
# method table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_rp(orp)
  case orp
  when Integer then "i"
  when String  then "sample text"
  else raise ArgumentError, "no"
  end
end
rb_rp = (raisebr_rp("ab").rpartition(" ") rescue $!.class); p rb_rp

# On a String returned by Fiber#resume.
f81rpartition = Fiber.new { Fiber.yield('aabbcc'); nil }
w81rpartition = f81rpartition.resume
r81rpartition = (w81rpartition.rpartition("b") rescue $!.class); p r81rpartition
