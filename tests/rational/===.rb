# frozen_string_literal: true
# Rational#===
p(Rational(1,2) === Rational(2,4))
a001 = Rational(1,2); b001 = Rational(2,4); v001 = (a001 === b001); p v001
p(Rational(1,2) === 0.5)
a002 = Rational(1,2); b002 = 1; v002 = (a002 === b002); p v002
# case has more than one arm; a single-arm case and a top-level local both match
def rat_kind160(v160)
  case v160
  when Integer then :int
  when Rational then :rat
  else :other
  end
end
p rat_kind160(Rational(1, 2))
v161 = rat_kind160(Rational(1, 2)); p v161
p rat_kind160(3)
def rat_kind162(v162)
  case v162
  when Integer, Rational then :num
  else :other
  end
end
p rat_kind162(Rational(1, 2))
