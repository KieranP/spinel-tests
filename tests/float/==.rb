# frozen_string_literal: true
# Float#==
p(1.5 == 1.5)
a031 = 1.5; b031 = 1.5; p(a031 == b031)
a032 = 1.5; v032 = (a032 == a032); p v032

p(1.5 == 2.5)
a033 = 1.5; b033 = 2.5; p(a033 == b033)

# Float == Integer (numeric value comparison)
p(1.0 == 1)
p(1.5 == 1)
a034 = 1.0; b034 = 1; p(a034 == b034)
a035 = 2.0; b035 = 2; v035 = (a035 == b035); p v035

# Float == Rational
p(1.0 == Rational(1, 1))
p(0.5 == Rational(1, 2))

# signed zero compares equal; NaN never equal (even to itself)
p(-0.0 == 0.0)
p(Float::NAN == Float::NAN)
p(Float::INFINITY == Float::INFINITY)
a036 = Float::NAN; v036 = (a036 == a036); p v036

# Float == non-numeric is false, not an error
p(1.0 == nil)
p(1.0 == "1.0")
p(1.0 == Object.new)
