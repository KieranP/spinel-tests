# frozen_string_literal: true
# Integer#=== (case equality, same as ==)
p(3 === 3)
a001 = 3; p(a001 === 3)
a002 = 3; b002 = 3; p(a002 === b002)
a003 = 3; b003 = 3; c003 = (a003 === b003); p c003

# unequal / Float / String arguments
p(3 === 4)
p(3 === 3.0)
p(3 === 2.5)
p(3 === "3")
p(0 === 0.0)
a004 = 3; b004 = 4; c004 = (a004 === b004); p c004
a005 = 3; b005 = 3.0; c005 = (a005 === b005); p c005

# Bignum (Bignum === Fixnum is correct; Bignum === Bignum is not)
p((2 ** 100) === 5)
p((2 ** 100) === (2 ** 100))
a006 = 2 ** 100; b006 = 2 ** 100; c006 = (a006 === b006); p c006

p(3 === nil)
a007 = 3; c007 = (a007 === nil); p c007
p(::Integer === 7)
