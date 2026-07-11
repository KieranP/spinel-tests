# frozen_string_literal: true
# Rational() construction
p(Rational(3, 4))
v001 = Rational(3, 4); p v001
b002 = 3; c002 = 4; p(Rational(b002, c002))
b003 = 3; c003 = 4; v003 = Rational(b003, c003); p v003
p(Rational(6, 8))
v004 = Rational(6, 8); p v004
p(Rational(2))
v005 = Rational(2); p v005
b006 = 2; p(Rational(b006))
b007 = 2; v007 = Rational(b007); p v007
p(Rational("3/4"))
b008 = "3/4"; v008 = Rational(b008); p v008
p(Rational("0.5"))
p(Rational("-2/6"))
p(Rational(0.5))
p(Rational(Rational(1,2), 3))
v009 = (Rational(1, 0) rescue $!.class); p v009
b010 = 1; c010 = 0; v010 = (Rational(b010, c010) rescue $!.class); p v010
# sign normalization: sign lives on the numerator, denominator stays positive
p(Rational(1, -2))
v011 = Rational(1, -2); p v011
p(Rational(-1, 2))
v012 = Rational(-1, 2); p v012
p(Rational(-1, -2))
v013 = Rational(-1, -2); p v013
p(Rational(6, -8))
b014 = 6; c014 = -8; v014 = Rational(b014, c014); p v014
# auto-reduction to lowest terms
p(Rational(100, 50))
v015 = Rational(100, 50); p v015
# zero numerator normalizes to (0/1)
p(Rational(0, -5))
v016 = Rational(0, -5); p v016
# zero denominator raises regardless of numerator sign
v017 = (Rational(-3, 0) rescue $!.class); p v017
b018 = 0; c018 = 0; v018 = (Rational(b018, c018) rescue $!.class); p v018
