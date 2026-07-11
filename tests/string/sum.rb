# frozen_string_literal: true
# String#sum
p("abc".sum)
a201 = "abc"; p(a201.sum)
a202 = "abc"; c202 = (a202.sum); p c202
# String#sum with a bits argument
p("hello".sum(8))
v076 = ("hello".sum(8)); p v076

# A String returned from a method with a `raise` branch loses much of String's
# method table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_sm(osm)
  case osm
  when Integer then "i"
  when String  then "sample text"
  else raise ArgumentError, "no"
  end
end
rb_sm = (raisebr_sm("ab").sum rescue $!.class); p rb_sm

# On a String returned by Fiber#resume.
f81sum = Fiber.new { Fiber.yield('aabbcc'); nil }
w81sum = f81sum.resume
r81sum = (w81sum.sum rescue $!.class); p r81sum
