# frozen_string_literal: true
# Integer#!=
p(5 != 3)
a001 = 5; p(a001 != 3)
a002 = 5; b002 = 3; p(a002 != b002)
a003 = 5; b003 = 3; c003 = (a003 != b003); p c003

# equal / Float / String / nil arguments
p(5 != 5)
p(5 != 5.0)
p(5 != 4.5)
p(5 != "5")
p(5 != nil)
a004 = 5; b004 = 5; c004 = (a004 != b004); p c004
a005 = 5; b005 = 5.0; c005 = (a005 != b005); p c005

# Bignum
p((2 ** 100) != (2 ** 100))
p((2 ** 100) != 5)
a006 = 2 ** 100; b006 = 2 ** 100; c006 = (a006 != b006); p c006
