# frozen_string_literal: true
# String#chop
p("hello".chop)
a032 = "hello"; p(a032.chop)
a033 = "hello"; c033 = (a033.chop); p c033
# chop removes a trailing \r\n pair as one, and an empty string is unchanged
p("hello\r\n".chop)
p("".chop)
# ASCII trailing byte
a034 = "abc"; c034 = (a034.chop); p c034
# chop should remove the last character, not its last byte, on a multibyte receiver
p("café".chop.bytes)
a035 = "café"; c035 = (a035.chop.bytes); p c035
p("hi👍".chop.bytes)
