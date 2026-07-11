# frozen_string_literal: true
# Regexp#kind_of?
p(/ab/.kind_of?(Regexp))
p(/ab/.kind_of?(Object))
p(/ab/.kind_of?(String))
a016 = /ab/; p(a016.kind_of?(Regexp))
a017 = /ab/; v017 = a017.kind_of?(String); p v017
