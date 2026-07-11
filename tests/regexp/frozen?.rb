# frozen_string_literal: true
# Regexp#frozen?
p(/ab/.frozen?)
a004 = /ab/; p(a004.frozen?)
a005 = /ab/; v005 = a005.frozen?; p v005
p(/ab/i.frozen?)
a002 = /ab/; v002 = a002.frozen?; p v002
