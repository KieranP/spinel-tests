# frozen_string_literal: true
# String#rjust
p("hi".rjust(5, "."))
a102 = "hi"; p(a102.rjust(5, "."))
a103 = "hi"; b103 = 5; p(a103.rjust(b103, "."))
a104 = "hi"; b104 = 5; c104 = (a104.rjust(b104, ".")); p c104
# width measured in characters on a multibyte receiver
p("café".rjust(8, "."))
p("café".rjust(8).length)
a105 = "café"; b105 = 8; c105 = (a105.rjust(b105, ".")); p c105
# multibyte padding string
p("hi".rjust(6, "☕"))
p("café".rjust(2))

h106 = Hash.new(0); h106[1] = 1; h106[4] = 1; w106 = h106.keys.max; p "x".rjust(w106)
a106 = "x"; b106 = h106.keys.max; c106 = a106.rjust(b106); p c106

s254 = [["a", "b"]][0][0]; r254 = (s254.rjust(3) rescue $!.class); p r254

# embedded NUL: padding is measured on the whole string
p("a\0b".rjust(6, "-").bytes)
a107rj = "a\0b"; b107rj = 6; c107rj = a107rj.rjust(b107rj, "-"); p c107rj.bytes
r_ep = ("hi".rjust(5, "") rescue $!.class); p r_ep
# a multi-character pad repeats and is truncated to the requested width
p("hi".rjust(7, "abc"))
v_mp = ("hi".rjust(7, "abc")); p v_mp
p("".rjust(3, "-"))
