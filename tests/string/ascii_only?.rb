# frozen_string_literal: true
# String#ascii_only?
p("hello".ascii_only?)
a01 = "hello"; p(a01.ascii_only?)
a02 = "hello"; c02 = (a02.ascii_only?); p c02
# empty string is ascii-only
p("".ascii_only?)
# a byte above 0x7f is not ascii-only
p("abc\x80".ascii_only?)
a03 = "abc\x80"; c03 = (a03.ascii_only?); p c03
