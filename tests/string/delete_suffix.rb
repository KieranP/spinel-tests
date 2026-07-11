# frozen_string_literal: true
# String#delete_suffix
p("x_suf".delete_suffix("_suf"))
a046 = "x_suf"; p(a046.delete_suffix("_suf"))
a047 = "x_suf"; b047 = "_suf"; p(a047.delete_suffix(b047))
a048 = "x_suf"; b048 = "_suf"; c048 = (a048.delete_suffix(b048)); p c048

# #delete_suffix on a String returned by Fiber#resume.
f80delete_suffix = Fiber.new { Fiber.yield("t=1.5"); nil }
w80delete_suffix = f80delete_suffix.resume
r80delete_suffix = (w80delete_suffix.delete_suffix("5") rescue $!.class); p r80delete_suffix
