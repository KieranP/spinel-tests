# frozen_string_literal: true
# String#split (Regexp pattern)
p("aXbXc".split(/X/))
a001 = "aXbXc"; p(a001.split(/X/))
a002 = "aXbXc"; b002 = /X/; c002 = (a002.split(b002)); p c002

# split on a character class
p("a1b2c3".split(/\d/))
a003 = "a1b2c3"; v003 = (a003.split(/\d/)); p v003

# split keeps empty fields between adjacent separators
p("a,b,,c".split(/,/))
a004 = "a,b,,c"; v004 = (a004.split(/,/)); p v004

# split with a capturing group keeps the captured separators
p("a1b2c".split(/(\d)/))
a005 = "a1b2c"; v005 = (a005.split(/(\d)/)); p v005

# split with a limit
p("a,b,c,d".split(/,/, 2))
a006 = "a,b,c,d"; v006 = (a006.split(/,/, 2)); p v006

# split on whitespace regexp
p("foo  bar\tbaz".split(/\s+/))
a007 = "foo  bar\tbaz"; v007 = (a007.split(/\s+/)); p v007

# split with no match returns the whole string in one element
p("hello".split(/z/))
a008 = "hello"; v008 = (a008.split(/z/)); p v008

# split on an empty pattern splits into characters
p("abc".split(//))
a009 = "abc"; v009 = (a009.split(//)); p v009
