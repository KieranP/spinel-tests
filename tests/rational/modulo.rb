# frozen_string_literal: true
# Rational#modulo
p(Rational(7,2).modulo(Rational(1,3)))
a001 = Rational(7,2); b001 = Rational(1,3); p(a001.modulo(b001))
a002 = Rational(7,2); b002 = Rational(1,3); v002 = a002.modulo(b002); p v002
p(Rational(7,2).modulo(2))
a003 = Rational(7,2); b003 = 2; v003 = a003.modulo(b003); p v003
p(Rational(-7,2).modulo(2))
a004 = Rational(-7,2); b004 = 2; v004 = a004.modulo(b004); p v004
p(Rational(7,2).modulo(2.0))
a005 = Rational(7,2); b005 = 2.0; v005 = a005.modulo(b005); p v005

# Through a block parameter the receiver loses the method entirely (NoMethodError).
# Rescue-wrapped so the abort can't take out the rest of the file.
r988b = ([Rational(7,2)].map { |x988b| x988b.modulo(2) } rescue $!.class); p r988b
