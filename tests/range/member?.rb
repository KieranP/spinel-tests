# frozen_string_literal: true
# Range#member?
p((1..5).member?(3))
a001 = (1..5); p(a001.member?(3))
a002 = (1..5); b002 = 3; p(a002.member?(b002))
a003 = (1..5); b003 = 3; c003 = (a003.member?(b003)); p c003
p((1..5).member?(6))
p((..5).member?(3))
v004 = ((..5).member?(3)); p(v004)

p((1..).member?(100))
p(("a".."e").member?("c"))
a005 = (1.0..5.0); v005 = (a005.member?(2)); p v005
p((1..5).member?("x"))
v006 = ((1..5).member?("x")); p v006
b007 = "x"; v007 = ((1..5).member?(b007)); p v007
