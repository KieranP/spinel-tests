# frozen_string_literal: true
# Regexp.linear_time?
p(Regexp.linear_time?(/a/))
p(Regexp.linear_time?("a"))
a001 = /a+/; p(Regexp.linear_time?(a001))
a002 = /a+/; v002 = Regexp.linear_time?(a002); p v002

# A backreference makes a pattern non-linear
p(Regexp.linear_time?(/(a)\1/))
p(Regexp.linear_time?(/a|b/))
a003 = /(?<x>a)\k<x>/; v003 = Regexp.linear_time?(a003); p v003
a005 = /(a)\1/; v005 = Regexp.linear_time?(a005); p v005

# A String argument is treated as the pattern source
p(Regexp.linear_time?("a+b"))
a004 = "a+b"; v004 = Regexp.linear_time?(a004); p v004
p(Regexp.linear_time?("(a)\\1"))
