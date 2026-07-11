# frozen_string_literal: true
# String#ljust
p("hi".ljust(5, "."))
a076 = "hi"; p(a076.ljust(5, "."))
a077 = "hi"; b077 = 5; p(a077.ljust(b077, "."))
a078 = "hi"; b078 = 5; c078 = (a078.ljust(b078, ".")); p c078
# width measured in characters on a multibyte receiver
p("café".ljust(8, "."))
p("café".ljust(8).length)
a079 = "café"; b079 = 8; c079 = (a079.ljust(b079, ".")); p c079
# multibyte padding string
p("hi".ljust(6, "☕"))
p("café".ljust(2))
c618s = [["a", "b"]]; r618s = (c618s.map { |k618, _v618| k618.ljust(3) } rescue $!.class); p r618s
s254 = [["a", "b"]][0][0]; r254 = (s254.ljust(3) rescue $!.class); p r254

h107 = Hash.new(0); h107[1] = 1; h107[4] = 1; w107 = h107.keys.max; p "x".ljust(w107 + 2)
a107 = "x"; b107 = h107.keys.max + 2; c107 = a107.ljust(b107); p c107

# embedded NUL: padding is measured on the whole string
p("a\0b".ljust(6, "-").bytes)
a080lj = "a\0b"; b080lj = 6; c080lj = a080lj.ljust(b080lj, "-"); p c080lj.bytes
r_ep = ("hi".ljust(5, "") rescue $!.class); p r_ep
# a multi-character pad repeats and is truncated to the requested width
p("hi".ljust(7, "abc"))
v_mp = ("hi".ljust(7, "abc")); p v_mp
p("".ljust(3, "-"))
