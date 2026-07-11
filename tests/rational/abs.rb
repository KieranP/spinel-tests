# frozen_string_literal: true
# Rational#abs
p(Rational(-3,4).abs)
a056 = Rational(-3,4); p(a056.abs)
a057 = Rational(-3,4); v057 = a057.abs; p v057
# already-positive is unchanged
p(Rational(3,4).abs)
a058 = Rational(3,4); v058 = a058.abs; p v058
# sign normalized onto numerator then removed
p(Rational(1,-2).abs)
a059 = Rational(1,-2); v059 = a059.abs; p v059
# zero
p(Rational(0,5).abs)
a060 = Rational(0,5); v060 = a060.abs; p v060
# result stays Rational
p((Rational(-3,4).abs).class)
a061 = Rational(-3,4); v061 = (a061.abs).class; p v061

# Through a block parameter the receiver loses the method entirely (NoMethodError).
# Rescue-wrapped so the abort can't take out the rest of the file.
r988d = ([Rational(-7,2)].map { |x988d| x988d.abs } rescue $!.class); p r988d
