# frozen_string_literal: true
# Integer#modulo
p(7.modulo(3))
a064 = 7; p(a064.modulo(3))
a065 = 7; b065 = 3; p(a065.modulo(b065))
a066 = 7; b066 = 3; c066 = (a066.modulo(b066)); p c066

# Integer#modulo with a Float argument
p(7.modulo(2.5))
a246 = 7; b246 = 2.5; c246 = (a246.modulo(b246)); p c246

# Integer#modulo with negative operands (result takes the sign of the divisor)
p((-7).modulo(3))
p(7.modulo(-3))
p((-7).modulo(-3))
a067 = -7; b067 = 3; c067 = (a067.modulo(b067)); p c067

# Integer#modulo by zero -> ZeroDivisionError
r068 = (5.modulo(0) rescue $!.class); p r068
a068 = 5; b068 = 0; r068b = (a068.modulo(b068) rescue $!.class); p r068b

p((2 ** 100).modulo(7))
a069 = 2 ** 100; b069 = 7; c069 = (a069.modulo(b069)); p c069

r880 = (5.modulo("x") rescue $!.class); p r880

# Integer#modulo with a nil argument (Ruby raises TypeError)
r881 = (5.modulo(nil) rescue $!.class); p r881
