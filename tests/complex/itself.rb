# frozen_string_literal: true
# Complex#itself
a008 = Complex(2, 3); p(a008.itself.equal?(a008))
a009 = Complex(2, 3); v009 = a009.itself; p(v009.equal?(a009))
