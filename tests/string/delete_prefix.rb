# frozen_string_literal: true
# String#delete_prefix
p("pre_x".delete_prefix("pre_"))
a043 = "pre_x"; p(a043.delete_prefix("pre_"))
a044 = "pre_x"; b044 = "pre_"; p(a044.delete_prefix(b044))
a045 = "pre_x"; b045 = "pre_"; c045 = (a045.delete_prefix(b045)); p c045

# A String returned from a method with a `raise` branch loses much of String's
# method table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_dp(odp)
  case odp
  when Integer then "i"
  when String  then "sample text"
  else raise ArgumentError, "no"
  end
end
rb_dp = (raisebr_dp("ab").delete_prefix("s") rescue $!.class); p rb_dp

# #delete_prefix on a String returned by Fiber#resume.
f80delete_prefix = Fiber.new { Fiber.yield("t=1.5"); nil }
w80delete_prefix = f80delete_prefix.resume
r80delete_prefix = (w80delete_prefix.delete_prefix("t=") rescue $!.class); p r80delete_prefix
