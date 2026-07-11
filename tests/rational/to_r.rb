# frozen_string_literal: true
# Rational.to_r (from String / Float / Integer)
p("3/4".to_r)
a010 = "3/4"; p(a010.to_r)
a011 = "3/4"; v011 = a011.to_r; p v011
p(0.5.to_r)
a012 = 0.5; p(a012.to_r)
a013 = 0.5; v013 = a013.to_r; p v013
p(2.to_r)
a014 = 2; p(a014.to_r)
a015 = 2; v015 = a015.to_r; p v015
v016 = ("1/0".to_r rescue $!.class); p v016
a017 = "6/0"; v017 = (a017.to_r rescue $!.class); p v017

# Rational#to_r
p(Rational(3,4).to_r)
a076 = Rational(3,4); p(a076.to_r)
a077 = Rational(3,4); v077 = a077.to_r; p v077
