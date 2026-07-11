# frozen_string_literal: true
# String#undump
p("\"hello\"".undump)
a01 = "\"hello\""; p(a01.undump)
a02 = "\"hello\""; c02 = (a02.undump); p c02
# round-trips dump escapes back to the original bytes
p("\"a\\tb\\nc\"".undump)
p("\"say \\\"hi\\\"\"".undump)
# dump/undump round trip
p("a\tb\n\"c\\d".dump.undump == "a\tb\n\"c\\d")
