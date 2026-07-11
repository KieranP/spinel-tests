# frozen_string_literal: true
# Integer#allbits?
p(14.allbits?(6))
a341 = 14; p(a341.allbits?(6))
a342 = 14; b342 = 6; p(a342.allbits?(b342))
a343 = 14; b343 = 6; c343 = (a343.allbits?(b343)); p c343

p(14.allbits?(0))
p(15.allbits?(15))
p(14.allbits?(7))
p(8.allbits?(4))
p((-1).allbits?(6))
ab01 = -8; p(ab01.allbits?(4))
ab02 = 14; abm2 = 2 ** 100; cab02 = (ab02.allbits?(abm2)); p cab02
p((2 ** 100).allbits?(2 ** 100))
