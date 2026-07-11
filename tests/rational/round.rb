# frozen_string_literal: true
# Rational#round
p(Rational(11,4).round)
a071 = Rational(11,4); v071 = a071.round; p v071
p(Rational(-11,4).round)
a084 = Rational(-11,4); v084 = a084.round; p v084
p(Rational(314,100).round(1))
a085 = Rational(314,100); b085 = 1; v085 = a085.round(b085); p v085
# half-value ties (Ruby rounds half away from zero for Rational)
p(Rational(1,2).round)
a100 = Rational(1,2); v100 = a100.round; p v100
p(Rational(3,2).round)
a101 = Rational(3,2); v101 = a101.round; p v101
p(Rational(5,2).round)
a102 = Rational(5,2); v102 = a102.round; p v102
p(Rational(-1,2).round)
a103 = Rational(-1,2); v103 = a103.round; p v103
p(Rational(-3,2).round)
a104 = Rational(-3,2); v104 = a104.round; p v104
# negative digit argument rounds to tens/hundreds; result is Integer
p(Rational(12345,100).round(-1))
a105 = Rational(12345,100); b105 = -1; v105 = a105.round(b105); p v105
p(Rational(12345,100).round(-2))
a106 = Rational(12345,100); b106 = -2; v106 = a106.round(b106); p v106
# zero digits returns Integer; positive digits keeps Rational
p(Rational(7,2).round(0))
a107 = Rational(7,2); b107 = 0; v107 = a107.round(b107); p v107
p((Rational(314,100).round(1)).class)
a108 = Rational(314,100); b108 = 1; v108 = (a108.round(b108)).class; p v108
# keyword-only half: forms round correctly
v109 = (Rational(1,2).round(half: :up) rescue $!.class); p v109
a110 = Rational(5,2); v110 = (a110.round(half: :even) rescue $!.class); p v110
v111 = (Rational(5,2).round(0, half: :up) rescue $!.class); p v111

# A Rational produced by Array#sum loses #round.
rs90 = [Rational(1, 2), Rational(1, 4)].sum
r90 = (rs90.round rescue $!.class); p r90
rs91 = [Rational(1, 2), Rational(1, 4)].reduce(:+)
r91 = ((rs91 * 100).round rescue $!.class); p r91
