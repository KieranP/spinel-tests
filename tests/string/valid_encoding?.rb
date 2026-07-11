# frozen_string_literal: true
# String#valid_encoding?
p("hello".valid_encoding?)
a01 = "hello"; p(a01.valid_encoding?)
a02 = "hello"; c02 = (a02.valid_encoding?); p c02
# empty string is validly encoded
p("".valid_encoding?)
# an invalid UTF-8 byte sequence is not valid
p("abc\x80".valid_encoding?)
a03 = "abc\x80"; c03 = (a03.valid_encoding?); p c03
