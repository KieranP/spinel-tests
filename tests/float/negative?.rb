# frozen_string_literal: true
# Float#negative?
p(-1.5.negative?)
a001 = -1.5; p(a001.negative?)
a002 = 1.5; c002 = a002.negative?; p c002

# zero (either sign) is not negative; specials
p(0.0.negative?)
p(-0.0.negative?)
p((-Float::INFINITY).negative?)
p(Float::INFINITY.negative?)
p(Float::NAN.negative?)
a003 = -2.5; c003 = a003.negative?; p c003
