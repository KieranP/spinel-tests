# frozen_string_literal: true
# String#sub (Regexp pattern) — replaces only the first match
p("hello".sub(/l/, "L"))
a001 = "hello"; p(a001.sub(/l/, "L"))
a002 = "hello"; b002 = /l/; c002 = (a002.sub(b002, "L")); p c002

# sub with numbered backreferences
p("2024-01".sub(/(\d+)-(\d+)/, '\2-\1'))
a003 = "2024-01"; v003 = (a003.sub(/(\d+)-(\d+)/, '\2-\1')); p v003

# sub with a named backreference
p("john smith".sub(/(?<f>\w+) (?<l>\w+)/, '\k<l>, \k<f>'))
a004 = "john smith"; v004 = (a004.sub(/(?<f>\w+) (?<l>\w+)/, '\k<l>, \k<f>')); p v004

# sub with a block
p("hello".sub(/l+/) { |m001| m001.upcase })
a005 = "hello"; v005 = (a005.sub(/l+/) { |m002| m002.upcase }); p v005

# sub, no match (unchanged copy)
p("hello".sub(/z/, "X"))
a006 = "hello"; v006 = (a006.sub(/z/, "X")); p v006

# sub with the whole-match backreference \0
p("abc".sub(/b/, '[\0]'))
a007 = "abc"; v007 = (a007.sub(/b/, '[\0]')); p v007
