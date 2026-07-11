# frozen_string_literal: true
# String#<=
p("a" <= "b")
a001 = "a"; p(a001 <= "b")
a002 = "a"; b002 = "a"; p(a002 <= b002)
a003 = "b"; b003 = "a"; c003 = (a003 <= b003); p c003
p("a" <= "a")
p("ab" <= "abc")
p("" <= "")
a004 = "café"; b004 = "café"; c004 = (a004 <= b004); p c004
r005 = ("a" <= 1 rescue $!.class); p r005
