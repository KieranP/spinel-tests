# frozen_string_literal: true
# Float#finite?
p(1.5.finite?)
a014 = 1.5; p(a014.finite?)
a015 = 1.5; c015 = (a015.finite?); p c015

# false for infinities and NaN
p(0.0.finite?)
p(Float::INFINITY.finite?)
p((-Float::INFINITY).finite?)
p(Float::NAN.finite?)
a016 = Float::INFINITY; c016 = a016.finite?; p c016
