# frozen_string_literal: true
# Symbol#class
p(:abc.class)
a001 = :abc; p(a001.class)
a002 = :abc; v002 = a002.class; p v002

# Symbol.class
p(Symbol.class)
v003 = Symbol.class; p v003
