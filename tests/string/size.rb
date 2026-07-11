# frozen_string_literal: true
# String#size
p("hello".size)
a001 = "hello"; p(a001.size)
a002 = "hello"; v002 = a002.size; p v002
# empty string
p("".size)
# size is an alias of length: character count, not byte count
p("café".size)
p("☕".size)
a003 = "café"; v003 = a003.size; p v003
# size matches length
a004 = "héllo"; p(a004.size == a004.length)
