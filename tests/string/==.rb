# frozen_string_literal: true
# String#==
p("abc" == "abc")
a031 = "abc"; b031 = "abc"; p(a031 == b031)
a032 = "abc"; v032 = (a032 == a032); p v032
# unequal strings
p("abc" == "abd")
p("abc" == "ab")
p("" == "")
# a frozen and an unfrozen copy are still == (frozenness is not part of equality)
a033 = "abc".freeze; b033 = "abc"; p(a033 == b033)
# comparison against non-String values is always false, never an error
p("abc" == 1)
p("abc" == nil)
p("abc" == :abc)
p("1" == 1)
a034 = "abc"; b034 = 1; v034 = (a034 == b034); p v034
a035 = "abc"; v035 = (a035 == nil); p v035
# byte-exact (multibyte + embedded structure)
p("café" == "café")
p("a\tb" == "a\tb")
a036 = "café"; b036 = "cafe"; p(a036 == b036)
