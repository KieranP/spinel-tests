# frozen_string_literal: true
# String#===
p("abc" === "abc")
a001 = "abc"; b001 = "abc"; p(a001 === b001)
a002 = "abc"; v002 = (a002 === "abc"); p v002
# unequal strings and non-String operands
p("abc" === "abd")
p("abc" === 1)
p("abc" === :abc)
a003 = "abc"; b003 = 1; v003 = (a003 === b003); p v003
# === is value equality (same as ==) for String
a004 = "abc"; p((a004 === "abc") == (a004 == "abc"))
# comparing against nil returns false in Ruby
p("abc" === nil)
