# frozen_string_literal: true
# String#codepoints
p("abc".codepoints)
a001 = "abc"; p(a001.codepoints)
a002 = "abc"; v002 = a002.codepoints; p v002
# empty string
p("".codepoints)
# multibyte: one integer codepoint per character
p("café".codepoints)
p("☕".codepoints)
a003 = "café"; v003 = a003.codepoints; p v003
# length equals character count
a004 = "héllo"; p(a004.codepoints.length == a004.length)
