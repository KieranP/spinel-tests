# frozen_string_literal: true
# Rational#divmod
p(Rational(7,2).divmod(Rational(1,3)))
a241 = Rational(7,2); b241 = Rational(1,3); v241 = a241.divmod(b241); p v241
p(Rational(7,2).divmod(2))
a246 = Rational(7,2); b246 = 2; v246 = a246.divmod(b246); p v246
p(Rational(5,3).divmod(-2))
p(Rational(7,2).divmod(2.0))
a247 = Rational(7,2); b247 = 2.0; v247 = a247.divmod(b247); p v247

# Through a block parameter the receiver loses the method entirely (NoMethodError).
# Rescue-wrapped so the abort can't take out the rest of the file.
r988a = ([Rational(7,2)].map { |x988a| x988a.divmod(2) } rescue $!.class); p r988a
