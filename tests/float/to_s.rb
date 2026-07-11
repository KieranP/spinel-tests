# frozen_string_literal: true
# Float#to_s
p(1.5.to_s)
a035 = 1.5; p(a035.to_s)
a036 = 1.5; v036 = a036.to_s; p v036

# integral, negative, signed zero
p(2.0.to_s)
p(-3.5.to_s)
p(0.0.to_s)
p((-0.0).to_s)

# large / small magnitudes switch to exponent notation
p(1.0e20.to_s)
p(1.0e-10.to_s)
p(1234567.89.to_s)

# Infinity / NaN
p(Float::INFINITY.to_s)
p((-Float::INFINITY).to_s)
p(Float::NAN.to_s)
a037 = Float::INFINITY; c037 = a037.to_s; p c037

# fractional values in 1e15..1e16 — CRuby keeps plain decimal, Spinel goes exponent
p(4503599627370495.5.to_s)
a038 = 1000000000000000.5; c038 = a038.to_s; p c038
