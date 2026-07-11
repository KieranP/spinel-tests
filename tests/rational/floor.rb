# frozen_string_literal: true
# Rational#floor
p(Rational(7,2).floor)
a062 = Rational(7,2); v062 = a062.floor; p v062
p(Rational(-7,2).floor)
a084 = Rational(-7,2); v084 = a084.floor; p v084
p(Rational(314,100).floor(1))
a085 = Rational(314,100); b085 = 1; v085 = a085.floor(b085); p v085
# exact integer-valued rational floors to itself
p(Rational(4,2).floor)
a086 = Rational(4,2); v086 = a086.floor; p v086
# negative digit argument rounds down to tens; result is Integer
p(Rational(12345,100).floor(-1))
a087 = Rational(12345,100); b087 = -1; v087 = a087.floor(b087); p v087
p(Rational(12345,100).floor(-2))
a088 = Rational(12345,100); b088 = -2; v088 = a088.floor(b088); p v088
# floor toward negative infinity for negative values
p(Rational(-314,100).floor(1))
a089 = Rational(-314,100); b089 = 1; v089 = a089.floor(b089); p v089
# positive digits keep Rational; zero/no digits give Integer
p((Rational(314,100).floor(1)).class)
a090 = Rational(314,100); v090 = (a090.floor(1)).class; p v090
p((Rational(7,2).floor).class)
a091 = Rational(7,2); v091 = (a091.floor).class; p v091

# A Rational produced by Array#sum loses #floor.
rs90 = [Rational(1, 2), Rational(1, 4)].sum
r90 = (rs90.floor rescue $!.class); p r90
rs91 = [Rational(1, 2), Rational(1, 4)].reduce(:+)
r91 = ((rs91 * 100).floor rescue $!.class); p r91
