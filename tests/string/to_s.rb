# frozen_string_literal: true
# String#to_s
p("abc".to_s)
a035 = "abc"; p(a035.to_s)
a036 = "abc"; v036 = a036.to_s; p v036
# Interpolation is String#to_s dispatch. A global that is never assigned is nil, and nil
# interpolates as the empty string.
p "a#{$z_never_assigned_gv}b"
p "a#$z_never_assigned_gv b"
$z001 = "X"
p "a#{$z001}b"
p "a#$z001 b"
z002 = "abc"; p "<#{z002.to_s}>"
z003 = "abc"; v003 = "<#{z003}>"; p v003
