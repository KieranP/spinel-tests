# frozen_string_literal: true
# Float#to_i
p(3.9.to_i)
a028 = 3.9; p(a028.to_i)
a029 = 3.9; c029 = (a029.to_i); p c029

# truncation toward zero (not rounding), both signs
p(3.99.to_i)
p(-3.99.to_i)
p(-3.1.to_i)
p(0.0.to_i)
a030 = -1234.9; p(a030.to_i)
a031 = 2.5; c031 = a031.to_i; p c031

# #to_i on Infinity / NaN (Ruby raises FloatDomainError)
r250 = (Float::INFINITY.to_i rescue $!.class); p r250
r251 = (Float::NAN.to_i rescue $!.class); p r251
a250 = Float::NAN; c250 = (a250.to_i rescue $!.class); p c250

# WONTFIX: See docs/limitations.md - "By design — Integer overflow"
# r112a = (1e20.to_i rescue "overflow"); p r112a    # Ruby: 100000000000000000000   Spinel: "overflow" (RangeError caught)
# r112b = (1.9e19.to_i rescue "overflow"); p r112b  # Ruby: 19000000000000000000    Spinel: "overflow" (RangeError caught)

# a signed-zero receiver truncates to 0
p((-0.0).to_i)
v880 = -0.0; x880 = (v880.to_i); p x880
