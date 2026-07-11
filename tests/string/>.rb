# frozen_string_literal: true
# String#>
p("b" > "a")
a001 = "b"; p(a001 > "a")
a002 = "b"; b002 = "a"; p(a002 > b002)
a003 = "b"; b003 = "a"; c003 = (a003 > b003); p c003
p("a" > "a")
p("a" > "b")
p("abc" > "ab")
p("" > "")
p("a" > "Z")
a004 = "cafz"; b004 = "café"; c004 = (a004 > b004); p c004
r005 = ("a" > 1 rescue $!.class); p r005
