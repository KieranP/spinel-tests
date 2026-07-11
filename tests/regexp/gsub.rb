# frozen_string_literal: true
# String#gsub (Regexp pattern)
p("hello".gsub(/l/, "L"))
a001 = "hello"; p(a001.gsub(/l/, "L"))
a002 = "hello"; b002 = /l/; c002 = (a002.gsub(b002, "L")); p c002

# gsub with numbered backreferences
p("2024-01".gsub(/(\d+)-(\d+)/, '\2/\1'))
a003 = "2024-01"; p(a003.gsub(/(\d+)-(\d+)/, '\2/\1'))
a004 = "2024-01"; v004 = (a004.gsub(/(\d+)-(\d+)/, '\2/\1')); p v004

# gsub with named backreferences
p("john smith".gsub(/(?<f>\w+) (?<l>\w+)/, '\k<l>, \k<f>'))
a005 = "john smith"; p(a005.gsub(/(?<f>\w+) (?<l>\w+)/, '\k<l>, \k<f>'))

# gsub with a block (match passed to block)
p("hello".gsub(/l/) { |m001| m001.upcase })
a006 = "hello"; v006 = (a006.gsub(/l/) { |m002| m002.upcase }); p v006

# gsub with a Hash replacement
p("cat".gsub(/[aeiou]/, "a" => "4", "e" => "3"))
a007 = "cat"; v007 = (a007.gsub(/[aeiou]/, "a" => "4")); p v007

# gsub, no match (unchanged copy)
p("hello".gsub(/z/, "X"))
a008 = "hello"; v008 = (a008.gsub(/z/, "X")); p v008

# gsub with an empty match inserts between every character
p("abc".gsub(//, "-"))
a009 = "abc"; v009 = (a009.gsub(//, "-")); p v009

# gsub with the case-insensitive flag
p("Hello".gsub(/l/i, "L"))
a010 = "Hello"; v010 = (a010.gsub(/[a-z]/i, "*")); p v010
