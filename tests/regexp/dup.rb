# frozen_string_literal: true
# Regexp#dup
p(/ab/.dup.class)
a037 = /ab/; b037 = a037.dup; p(b037.class)
a038 = /ab/; v038 = a038.dup; p(v038 == a038)
