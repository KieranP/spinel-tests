# frozen_string_literal: true
# String#length
p("hello".length)
a001 = "hello"; p(a001.length)
a002 = "hello"; v002 = a002.length; p v002
# empty string
p("".length)
# length counts characters (codepoints), not bytes, for multibyte text
p("café".length)
p("héllo".length)
p("☕".length)
a003 = "café"; v003 = a003.length; p v003
# whitespace and repeats count
p("a a".length)
p("aaa".length)
