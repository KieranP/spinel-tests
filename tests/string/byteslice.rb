# frozen_string_literal: true
# String#byteslice
p("hello".byteslice(1))
a001 = "hello"; p(a001.byteslice(1))
a002 = "hello"; b002 = 1; p(a002.byteslice(b002, 3))
a003 = "hello"; b003 = 1; v003 = (a003.byteslice(b003, 3)); p v003
# negative index counts from the end
p("hello".byteslice(-1))
p("hello".byteslice(-3, 2))
# multibyte: byteslice works on raw bytes (can split a character)
p("café".byteslice(3, 2))
p("café".byteslice(0, 3))
a004 = "café"; v004 = (a004.byteslice(3, 2)); p v004
# an out-of-range byte index returns nil
p("hello".byteslice(10))
p("hello".byteslice(5))
a005 = "hello"; v005 = (a005.byteslice(10)); p v005
# a Range argument
p("hello".byteslice(1..3))
p("hello".byteslice(2..))
a006 = "hello"; b006 = (1..3); v006 = (a006.byteslice(b006)); p v006
