# frozen_string_literal: true
# String#+@
# +@ yields a mutable (never-frozen) string
p((+"abc").frozen?)
a001 = "abc"; p((+a001).frozen?)
a002 = "abc"; v002 = (+a002); p(v002.frozen?)
# on a frozen receiver, +@ returns an unfrozen copy that is still ==
a003 = "abc".freeze; p((+a003).frozen?)
a004 = "abc".freeze; p((+a004) == a004)
a005 = "abc".freeze; v005 = (+a005); p(v005.frozen?)
# the returned string is mutable
a006 = "abc".freeze; b006 = (+a006); b006 << "d"; p b006
# value is preserved
p((+"café"))
# embedded NUL: +@ copies the whole byte sequence
p((+"a\0b").bytes)
a007pa = "a\0b"; v007pa = (+a007pa); p v007pa.bytes
