# frozen_string_literal: true
# Rational#%
p(Rational(7,2) % Rational(1,3))
a236 = Rational(7,2); b236 = Rational(1,3); v236 = a236 % b236; p v236
p(Rational(7,2) % 2)
a237 = Rational(7,2); b237 = 2; v237 = a237 % b237; p v237
p(Rational(-7,2) % 2)
v238 = Rational(-7,2) % 2; p v238
p(10 % Rational(3,1))
v239 = 10 % Rational(3,1); p v239
p(1.5 % Rational(1,2))
v240 = 1.5 % Rational(1,2); p v240
# a Rational receiver on the poly `%` path takes an Integer `%`, losing the remainder
p([Rational(7,2)].map { |r241| r241 % 2 })
v241 = [Rational(7,2)].map { |r242| r242 % 2 }; p v241
