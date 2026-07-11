# frozen_string_literal: true
# Rational#*
p(Rational(1,2) * 4)
a016 = Rational(1,2); p(a016 * 4)
a017 = Rational(1,2); b017 = 4; p(a017 * b017)
a018 = Rational(1,2); b018 = 4; v018 = a018 * b018; p v018
p(Rational(1,2) * Rational(2,3))
a019 = Rational(1,2); b019 = Rational(2,3); p(a019 * b019)
p(Rational(1,2) * 0.5)
a020 = Rational(1,2); b020 = 0.5; v020 = a020 * b020; p v020
p(4 * Rational(1,2))
a084 = 4; b084 = Rational(1,2); v084 = a084 * b084; p v084
# product reduces to an integer-valued rational
p(Rational(2,3) * Rational(3,2))
a021 = Rational(2,3); b021 = Rational(3,2); v021 = a021 * b021; p v021
# multiplying by zero
p(Rational(3,4) * 0)
a022 = Rational(3,4); b022 = 0; v022 = a022 * b022; p v022
# negative operand
p(Rational(1,2) * -4)
a023 = Rational(1,2); b023 = -4; v023 = a023 * b023; p v023
# Integer keeps Rational; Float contaminates to Float
p((Rational(1,2) * 4).class)
a024 = Rational(1,2); v024 = (a024 * 4).class; p v024
p((Rational(1,2) * 0.5).class)
a025 = Rational(1,2); v025 = (a025 * 0.5).class; p v025

# right operand is a user object defining #coerce
class CoerceMul026
  attr_reader :cents

  def initialize(cents)
    @cents = cents
  end

  def coerce(other)
    [CoerceMul026.new(other), self]
  end

  def *(other)
    other = CoerceMul026.new(other) unless other.is_a?(CoerceMul026)
    CoerceMul026.new(@cents * other.cents)
  end
end
# Integer and Float on the left coerce correctly
p((6 * CoerceMul026.new(3)).cents)
a026 = 1.5; v026 = (a026 * CoerceMul026.new(4)).cents; p v026
p((Rational(3,2) * CoerceMul026.new(6)).cents)
a027 = Rational(3,2); v027 = (a027 * CoerceMul026.new(6)).cents; p v027
