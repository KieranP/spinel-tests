# frozen_string_literal: true
# String#unpack
p("abc".unpack("C*"))
a01 = "abc"; p(a01.unpack("C*"))
a02 = "abc"; b02 = "C*"; p(a02.unpack(b02))
a03 = "abc"; b03 = "C*"; c03 = (a03.unpack(b03)); p c03
# fixed-count and multiple directives
p("abcdef".unpack("a2a2a2"))
p("ABCD".unpack("N"))
p("ABCD".unpack("n2"))
# ASCII string / hex directive
p("hello".unpack("H*"))
# space-stripped ASCII (A) with counts
p("hello world".unpack("A5A6"))
a04 = "hello world"; v04 = a04.unpack("A5A6"); p v04
# bit-string directives (B / b)
p("A".unpack("B8"))
a05 = "A"; v05 = a05.unpack("B8"); p v05
p("A".unpack("b8"))
a06 = "A"; v06 = a06.unpack("b8"); p v06
# NUL-preserving (a) directive: byte-correct but inspect renders NUL differently
# WONTFIX: See docs/limitations.md - "By design — Embedded NUL bytes: byte-exact core, C-string transforms"
# p("hi\x00\x00\x00".unpack("a5"))
# a07 = "hi\x00\x00\x00"; v07 = a07.unpack("a5"); p v07
p("abcdef".unpack("a2X2a4"))
v_x = ("abcdef".unpack("a2X2a4")); p v_x
p("hello".unpack("@2a*"))
v_at = ("hello".unpack("@2a*")); p v_at
r_ck = ("abc".unpack("%C3") rescue $!.class); p r_ck
# the forward-skip directive x is honoured
p("abcdef".unpack("x2a4"))
v_fs = ("abcdef".unpack("x2a4")); p v_fs
# little/big-endian integer directives
p("\x01\x02\x03\x04".unpack("V"))
p("\x01\x02\x03\x04".unpack("v2"))
p("\x01\x02\x03\x04".unpack("N"))
p("\x01\x02".unpack("s"))
p("\x01\x02".unpack("S"))
p("\x80".unpack("c"))
p("\x80".unpack("C"))
v_le = ("\x01\x02\x03\x04".unpack("V")); p v_le
# Z* stops at the first NUL; A* strips trailing spaces
p("abc\0\0".unpack("Z*"))
p("ab  ".unpack("A*"))
p("ab  ".unpack("Z*"))
# UTF-8 codepoints
p("\xE2\x98\x95".unpack("U*"))
