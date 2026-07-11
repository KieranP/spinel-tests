# frozen_string_literal: true
# String#include?
p("hello".include?("ell"))
a001 = "hello"; p(a001.include?("ell"))
a002 = "hello"; b002 = "ell"; p(a002.include?(b002))
a003 = "hello"; b003 = "ell"; v003 = (a003.include?(b003)); p v003
# not present
p("hello".include?("xyz"))
# empty needle is always included
p("hello".include?(""))
# single character and whole string
p("hello".include?("h"))
p("hello".include?("hello"))
p("hello".include?("helloo"))
# multibyte substring
p("café".include?("fé"))
a004 = "café"; b004 = "fé"; p(a004.include?(b004))

# a splatted argument list held in a variable
sx160 = ["h"]
p("hello".include?(*sx160))
vx160 = "hello".include?(*sx160); p vx160
# control: the same argument positionally, and a literal array splatted in place
p("hello".include?("h"))
p("hello".include?(*["h"]))
