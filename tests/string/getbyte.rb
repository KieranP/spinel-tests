# frozen_string_literal: true
# String#getbyte
p("abc".getbyte(0))
a001 = "abc"; p(a001.getbyte(0))
a002 = "abc"; b002 = 1; p(a002.getbyte(b002))
a003 = "abc"; b003 = 1; v003 = (a003.getbyte(b003)); p v003
# negative index counts from the end
p("abc".getbyte(-1))
# out-of-range index returns nil
p("abc".getbyte(3))
p("abc".getbyte(10))
a004 = "abc"; v004 = (a004.getbyte(10)); p v004
# multibyte: getbyte returns raw bytes, not codepoints
p("é".getbyte(0))
p("é".getbyte(1))
p("é".bytesize)
