# frozen_string_literal: true
# String#>=
p("b" >= "a")
a001 = "b"; p(a001 >= "a")
a002 = "a"; b002 = "a"; p(a002 >= b002)
a003 = "a"; b003 = "b"; c003 = (a003 >= b003); p c003
p("a" >= "a")
p("abc" >= "ab")
p("" >= "")
a004 = "café"; b004 = "café"; c004 = (a004 >= b004); p c004
r005 = ("a" >= 1 rescue $!.class); p r005
