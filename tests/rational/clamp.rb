# frozen_string_literal: true
# Rational#clamp
p(Rational(1,2).clamp(Rational(0,1), Rational(1,1)))
a001 = Rational(5,2); b001 = Rational(0,1); c001 = Rational(1,1); v001 = a001.clamp(b001, c001); p v001
r002 = (Rational(5, 2).clamp(1, 2) rescue $!.class); p r002
r003 = (Rational(5, 2).clamp(1.0, 2.0) rescue $!.class); p r003
