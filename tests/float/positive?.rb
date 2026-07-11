# frozen_string_literal: true
# Float#positive?
p(1.5.positive?)
a001 = 1.5; p(a001.positive?)
a002 = -1.5; c002 = a002.positive?; p c002

# zero (either sign) is not positive; specials
p(0.0.positive?)
p(-0.0.positive?)
p(Float::INFINITY.positive?)
p((-Float::INFINITY).positive?)
p(Float::NAN.positive?)
a003 = 2.5; c003 = a003.positive?; p c003
