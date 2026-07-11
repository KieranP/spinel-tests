# frozen_string_literal: true
# String#<
p("a" < "b")
a001 = "a"; p(a001 < "b")
a002 = "a"; b002 = "b"; p(a002 < b002)
a003 = "a"; b003 = "b"; c003 = (a003 < b003); p c003
# equal strings, and a prefix compared with its extension
p("a" < "a")
p("b" < "a")
p("ab" < "abc")
p("abc" < "ab")
# case matters: upper case sorts before lower case
p("Z" < "a")
# empty string sorts before everything
p("" < "a")
# multibyte comparison is by codepoint
p("café" < "cafz")
a004 = "café"; b004 = "cafz"; c004 = (a004 < b004); p c004
# a non-String operand raises
r005 = ("a" < 1 rescue $!.class); p r005
