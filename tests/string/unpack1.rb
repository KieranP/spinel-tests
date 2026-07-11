# frozen_string_literal: true
# String#unpack1
p("abc".unpack1("C"))
a01 = "abc"; p(a01.unpack1("C"))
a02 = "abc"; b02 = "C"; p(a02.unpack1(b02))
a03 = "abc"; b03 = "C"; c03 = (a03.unpack1(b03)); p c03
# returns only the first value of the equivalent unpack
p("abcdef".unpack1("a2"))
p("ABCD".unpack1("N"))
p("hello".unpack1("H*"))
# little-endian (v) and big-endian (n) 16-bit directives
p("\x01\x00".unpack1("v"))
a04 = "\x01\x00"; v04 = a04.unpack1("v"); p v04
p("ABCD".unpack1("n"))
a05 = "ABCD"; v05 = a05.unpack1("n"); p v05
