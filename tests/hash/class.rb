# frozen_string_literal: true
# Hash#class
p({ a: 1 }.class)
a001 = { a: 1 }; p(a001.class)
a002 = { a: 1 }; v002 = a002.class; p v002

# Hash.class
p(Hash.class)
v003 = Hash.class; p v003
