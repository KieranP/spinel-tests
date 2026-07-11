# frozen_string_literal: true
# String#frozen?
p("abc".frozen?)
a004 = "abc"; p(a004.frozen?)
a005 = "abc"; v005 = a005.frozen?; p v005
# a plain literal is frozen by default (frozen_string_literal: true)
a006 = "abc"; p(a006.frozen?)
# after freeze it is frozen
a007 = "abc".freeze; p(a007.frozen?)
a008 = "abc"; a008.freeze; p(a008.frozen?)
# dup is not frozen; result of + is not frozen
a009 = "abc".freeze; p(a009.dup.frozen?)
a010 = "abc".freeze; p((a010 + "d").frozen?)
# derived strings (upcase, etc.) are not frozen
p("abc".upcase.frozen?)
a011 = "abc"; v011 = (a011.upcase.frozen?); p v011
