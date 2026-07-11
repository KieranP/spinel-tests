# frozen_string_literal: true
# String#squeeze
p("aaabbb".squeeze)
a122 = "aaabbb"; p(a122.squeeze)
a123 = "aaabbb"; c123 = (a123.squeeze); p c123
# squeezes runs of the same character on a multibyte receiver
p("aa☕☕bb".squeeze)
p("café  ée".squeeze(" "))
a124 = "aa☕☕bb"; c124 = (a124.squeeze); p c124
# restrict to a selector / range
p("aaabbbccc".squeeze("a-b"))
p("mississippi".squeeze("sp"))

# A String returned from a method with a `raise` branch loses much of String's
# method table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_sq(osq)
  case osq
  when Integer then "i"
  when String  then "sample text"
  else raise ArgumentError, "no"
  end
end
rb_sq = (raisebr_sq("ab").squeeze rescue $!.class); p rb_sq

# A String returned by Fiber#resume has no #squeeze.
f80squeeze = Fiber.new { Fiber.yield("t=1.5"); nil }
w80squeeze = f80squeeze.resume
r80squeeze = (w80squeeze.squeeze rescue $!.class); p r80squeeze
# a character range and a negated selector
p("aaabbbccc".squeeze("a-b"))
z001 = "aaabbbccc"; v001 = z001.squeeze("a-b"); p v001
p("mississippi".squeeze("^s"))
# the intersection of two selectors
p("aaabbb".squeeze("a-b", "b"))
v002 = ("aaabbb".squeeze("a-b", "b")); p v002
