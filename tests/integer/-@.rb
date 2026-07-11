# frozen_string_literal: true
# Integer#-@
p(-(5))
a329 = 5; p(-a329)
a330 = 5; c330 = (-a330); p c330

p(-(0))
# so the build aborts with "expression is not assignable". Kept commented: it takes the
# whole file down.
p(-(-7))
v333 = -(-7); p v333
a331 = -12; c331 = (-a331); p c331
a332 = 100; p(-a332)

p(-(2 ** 100))
b333 = 2 ** 100; p(-b333)
