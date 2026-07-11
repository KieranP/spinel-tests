# frozen_string_literal: true
# String#b
p("hello".b)
a01 = "hello"; p(a01.b)
a02 = "hello"; c02 = (a02.b); p c02
# WONTFIX: See docs/limitations.md - "Fundamental limits — Mixed / non-UTF-8 encodings"
# p("hello".b.encoding.to_s)
# the copy has the same bytes and is a distinct object
p("hello".b.bytes)
# WONTFIX: See docs/limitations.md - "Fundamental limits — Mixed / non-UTF-8 encodings"
# a03 = "hello"; p(a03.b.equal?(a03))
p("hello".b.frozen?)
v_fz = ("hello".b.frozen?); p v_fz
z001 = "hello".b; r001 = ((z001 << "!") rescue $!.class); p r001
# #dup and +@ off the same literal are correctly unfrozen
p("hello".dup.frozen?)
p((+"hello").frozen?)
