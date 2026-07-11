# frozen_string_literal: true
# Proc#class
p(->(a) { a }.class)
a001 = ->(a) { a }; p(a001.class)
a002 = ->(a) { a }; v002 = a002.class; p v002

# Proc.class
p(Proc.class)
v003 = Proc.class; p v003
