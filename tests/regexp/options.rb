# frozen_string_literal: true
# Regexp#options
p(/ab/.options)
p(/ab/i.options)
p(/ab/m.options)
p(/ab/x.options)
p(/ab/mix.options)
a001 = /ab/i; p(a001.options)
a002 = /ab/i; v002 = a002.options; p v002

# A Regexp.new-constructed receiver
p(Regexp.new("ab").options)
b001 = Regexp.new("ab"); p(b001.options)

# options is the OR of the flag bits
p(/ab/im.options)
p(/ab/ix.options)
p(Regexp.new("ab", Regexp::IGNORECASE | Regexp::EXTENDED).options)
a003 = /ab/mix; v003 = a003.options; p v003

# The flag constants themselves
p(Regexp::IGNORECASE)
p(Regexp::EXTENDED)
p(Regexp::MULTILINE)
