# frozen_string_literal: true
# String#between?
p("b".between?("a", "c"))
a001 = "b"; p(a001.between?("a", "c"))
a002 = "b"; b002 = "a"; c002 = "c"; p(a002.between?(b002, c002))
a003 = "b"; b003 = "a"; c003 = "c"; d003 = (a003.between?(b003, c003)); p d003
# the bounds are inclusive
p("a".between?("a", "c"))
p("c".between?("a", "c"))
# outside the range, and an inverted range
p("d".between?("a", "c"))
p("b".between?("c", "a"))
# multibyte bounds
p("café".between?("cafa", "cafz"))
a004 = "café"; d004 = (a004.between?("cafa", "cafz")); p d004
