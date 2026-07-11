# frozen_string_literal: true
# Integer#remainder
p(7.remainder(3))
a072 = 7; p(a072.remainder(3))
a073 = 7; b073 = 3; p(a073.remainder(b073))
a074 = 7; b074 = 3; c074 = (a074.remainder(b074)); p c074

# Integer#remainder with a Float argument
p(7.remainder(2.5))
a246 = 7; b246 = 2.5; c246 = (a246.remainder(b246)); p c246

# Integer#remainder with a negative Float argument (result takes the dividend's sign)
p((-7).remainder(2.5))
p(7.remainder(-2.5))
a248 = -7; b248 = 2.5; c248 = (a248.remainder(b248)); p c248

# Integer#remainder with negative operands (result takes the sign of the dividend)
p((-7).remainder(3))
p(7.remainder(-3))
p((-7).remainder(-3))
a075 = -7; b075 = 3; c075 = (a075.remainder(b075)); p c075

# Integer#remainder by zero -> ZeroDivisionError
r076 = (5.remainder(0) rescue $!.class); p r076
a076 = 5; b076 = 0; r076b = (a076.remainder(b076) rescue $!.class); p r076b

p((2 ** 100).remainder(7))
a077 = 2 ** 100; b077 = 7; c077 = (a077.remainder(b077)); p c077

r880 = (5.remainder("x") rescue $!.class); p r880

# Integer#remainder with a nil argument (Ruby raises TypeError)
r881 = (5.remainder(nil) rescue $!.class); p r881
