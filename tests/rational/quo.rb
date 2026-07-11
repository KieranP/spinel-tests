# frozen_string_literal: true
# Rational#quo
p(Rational(7,2).quo(Rational(1,3)))
a244 = Rational(7,2); b244 = Rational(1,3); v244 = a244.quo(b244); p v244
p(Rational(7,2).quo(2))
a246 = Rational(7,2); b246 = 2; v246 = a246.quo(b246); p v246

# Through a block parameter the receiver loses the method entirely (NoMethodError).
# Rescue-wrapped so the abort can't take out the rest of the file.
r988c = ([Rational(7,2)].map { |x988c| x988c.quo(2) } rescue $!.class); p r988c
