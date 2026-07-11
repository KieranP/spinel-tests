# frozen_string_literal: true
# Kernel#Rational
p(Rational(1, 2))
c401 = Rational(1, 2); p(c401)
p(Rational(3))
c402 = Rational(3); p(c402)
p(Rational("1/3"))
c403 = Rational("1/3"); p(c403)
p(Rational(2, 4))
a404 = 2; b404 = 4; c404 = Rational(a404, b404); p(c404)

fr011 = [[6, 8], [10, 15]]
p fr011.map { |n, d| g = n.gcd(d); Rational(n / g, d / g) }

# Rational() with a summed-Rational numerator silently returns (0/1).
sr970 = [Rational(1, 2), Rational(1, 4)].sum
p(Rational(sr970, 2))
v970 = Rational(sr970, 2); p v970

# more argument forms
p(Rational(1.5))
c405 = Rational(1.5); p(c405)
p(Rational("0.5"))
p(Rational(Rational(1, 2), 2))
p(Rational(1.5, 0.5))
r406 = (Rational(1, 0) rescue $!.class); p r406
c406 = (Rational(1, 0) rescue $!.class); p c406

# unparseable / nil arguments answer a Rational instead of raising
r407 = (Rational("bad") rescue $!.class); p r407
r408 = (Rational("") rescue $!.class); p r408
r409 = (Rational(nil) rescue $!.class); p r409
r410 = (Rational("1/2/3") rescue $!.class); p r410
p(Rational("1.5e2"))
c411 = Rational("1.5e2"); p(c411)
p(Rational("2", "4") == Rational(1, 2))
c412 = Rational("2", "4") == Rational(1, 2); p c412

# the exception: keyword on a String that parses
p(Rational("1/2", exception: false) == Rational(1, 2))
c413 = Rational("1/2", exception: false) == Rational(1, 2); p c413
# on a String that does not parse the keyword is ignored and ArgumentError is raised,
# which takes the whole file down, so these are kept commented
p(Rational("x", exception: false))
r414 = Rational("x", exception: false); p r414
