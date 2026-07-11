# frozen_string_literal: true
# String#-@
p((-"abc").frozen?)
a001 = "abc"; p((-a001).frozen?)
a002 = "abc"; v002 = (-a002); p(v002.frozen?)
# the value is preserved and still == the original
a003 = "abc"; p((-a003) == a003)
p((-"café"))
# applying -@ to an already-frozen string returns that same object
# WONTFIX: See docs/limitations.md - "By design — String#equal? and literal identity"
# (each literal OCCURRENCE is its own frozen static object and -@ dedups to the one
#  interned object, so the two are not `equal?`; identity here is implementation-defined)
# a004 = "abc".freeze; p((-a004).equal?(a004))
# a005 = "abc".freeze; v005 = ((-a005).equal?(a005)); p v005
