# frozen_string_literal: true
# Rational#itself
a008 = Rational(1, 2); p(a008.itself.equal?(a008))
a009 = Rational(1, 2); v009 = a009.itself; p(v009.equal?(a009))
