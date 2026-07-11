# frozen_string_literal: true
# String#center
p("hi".center(8, "*"))
a025 = "hi"; p(a025.center(8, "*"))
a026 = "hi"; b026 = 8; p(a026.center(b026, "*"))
a027 = "hi"; b027 = 8; c027 = (a027.center(b027, "*")); p c027
# width is measured in characters; a multibyte receiver pads to the character width
p("café".center(8, "*"))
p("café".center(8))
p("café".center(8).length)
a028 = "café"; b028 = 8; c028 = (a028.center(b028, "*")); p c028
# width no larger than the length returns the string unchanged
p("café".center(2))
# multibyte padding string
p("hi".center(8, "☕"))

s254 = [["a", "b"]][0][0]; r254 = (s254.center(3) rescue $!.class); p r254

# embedded NUL: padding is measured on the whole string
p("a\0b".center(7, "-").bytes)
a029ct = "a\0b"; b029ct = 7; c029ct = a029ct.center(b029ct, "-"); p c029ct.bytes
r_ep = ("hi".center(5, "") rescue $!.class); p r_ep
# a multi-character pad repeats; the extra character goes on the right
p("hi".center(9, "ab"))
v_mp = ("hi".center(9, "ab")); p v_mp
p("hi".center(11, "<>"))
p("".center(4, "-"))
