# frozen_string_literal: true
# String#scrub
p("hello".scrub)
a01 = "hello"; p(a01.scrub)
a02 = "hello"; c02 = (a02.scrub); p c02
# valid string is returned unchanged
p("hello".scrub("?"))
# invalid bytes are replaced with the replacement string
p("abc\x80def".scrub("?"))
a03 = "abc\x80def"; c03 = (a03.scrub("?")); p c03
