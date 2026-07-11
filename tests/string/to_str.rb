# frozen_string_literal: true
# String#to_str
p("abc".to_str)
a001 = "abc"; p(a001.to_str)
a002 = "abc"; v002 = a002.to_str; p v002
# to_str returns an equal string (implicit-conversion protocol)
a003 = "abc"; p(a003.to_str == a003)
a004 = "abc"; p(a004.to_str.class)
# empty and multibyte
p("".to_str)
p("café".to_str)
