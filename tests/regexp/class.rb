# frozen_string_literal: true
# Regexp#class
p(/ab/.class)
a001 = /ab/; p(a001.class)
a002 = /ab/; v002 = a002.class; p v002

# Regexp.class
p(Regexp.class)
v003 = Regexp.class; p v003
