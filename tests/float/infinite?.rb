# frozen_string_literal: true
# Float#infinite?
p((1.0 / 0).infinite?)
a032 = (1.0 / 0); p(a032.infinite?)
a033 = (1.0 / 0); c033 = (a033.infinite?); p c033

# -1 for -Infinity, nil for finite values and NaN
p((-1.0 / 0).infinite?)
p(1.5.infinite?)
p(0.0.infinite?)
p(Float::NAN.infinite?)
p(Float::INFINITY.infinite?)
a034 = -Float::INFINITY; c034 = a034.infinite?; p c034

# infinite? over the specials and a signed zero
p([Float::NAN, Float::INFINITY, -Float::INFINITY, -0.0, 1.0].map { |f880| f880.infinite? })
v881 = [Float::INFINITY, -Float::INFINITY].map { |f881| f881.infinite? }; p v881
