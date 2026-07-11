# frozen_string_literal: true
# String#nil?
p("abc".nil?)
a006 = "abc"; p(a006.nil?)
a007 = "abc"; v007 = a007.nil?; p v007
# an empty string is still not nil
p("".nil?)
a008 = ""; v008 = a008.nil?; p v008
# result of string operations is never nil
p("abc".upcase.nil?)
a009 = "abc"; v009 = (a009.dup.nil?); p v009
