# frozen_string_literal: true
# Regexp#casefold?
p(/ab/i.casefold?)
p(/ab/.casefold?)
a001 = /ab/i; p(a001.casefold?)
a002 = /ab/i; v002 = (a002.casefold?); p v002

# casefold? with other flags present / combined
p(/ab/mi.casefold?)
p(/ab/m.casefold?)
p(/ab/mix.casefold?)
a003 = /ab/mix; v003 = (a003.casefold?); p v003

# casefold? on a Regexp.new-constructed receiver
p(Regexp.new("ab").casefold?)
b001 = Regexp.new("ab"); v004 = (b001.casefold?); p v004

# casefold? on a Regexp.new pattern built with the IGNORECASE constant
p(Regexp.new("ab", Regexp::IGNORECASE).casefold?)
p(Regexp.new(/ab/i).casefold?)
b002 = Regexp.new("ab", Regexp::IGNORECASE | Regexp::MULTILINE); v005 = b002.casefold?; p v005
