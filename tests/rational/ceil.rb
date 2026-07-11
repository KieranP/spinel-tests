# frozen_string_literal: true
# Rational#ceil
p(Rational(7,2).ceil)
a058 = Rational(7,2); v058 = a058.ceil; p v058
p(Rational(-7,2).ceil)
a084 = Rational(-7,2); v084 = a084.ceil; p v084
p(Rational(314,100).ceil(1))
a085 = Rational(314,100); b085 = 1; v085 = a085.ceil(b085); p v085
# exact integer-valued rational ceils to itself
p(Rational(4,2).ceil)
a086 = Rational(4,2); v086 = a086.ceil; p v086
# negative digit argument rounds up to tens; result is Integer
p(Rational(12345,100).ceil(-1))
a087 = Rational(12345,100); b087 = -1; v087 = a087.ceil(b087); p v087
p(Rational(12345,100).ceil(-2))
a088 = Rational(12345,100); b088 = -2; v088 = a088.ceil(b088); p v088
# ceil toward positive infinity for negative values
p(Rational(-314,100).ceil(1))
a089 = Rational(-314,100); b089 = 1; v089 = a089.ceil(b089); p v089
# positive digits keep Rational; zero/no digits give Integer
p((Rational(314,100).ceil(1)).class)
a090 = Rational(314,100); v090 = (a090.ceil(1)).class; p v090
p((Rational(7,2).ceil).class)
a091 = Rational(7,2); v091 = (a091.ceil).class; p v091
