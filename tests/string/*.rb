# frozen_string_literal: true
# String#*
p("ab" * 3)
a004 = "ab"; p(a004 * 3)
a005 = "ab"; b005 = 3; p(a005 * b005)
a006 = "ab"; b006 = 3; c006 = (a006 * b006); p c006
# embedded NUL: repetition copies the whole byte sequence
p(("a\0b" * 2).bytes)
a007ml = "a\0b"; b007ml = 2; c007ml = (a007ml * b007ml); p c007ml.bytes
