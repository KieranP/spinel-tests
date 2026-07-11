# frozen_string_literal: true
# Float#zero?
p(0.0.zero?)
a001 = 0.0; p(a001.zero?)
a002 = 1.5; c002 = a002.zero?; p c002

# signed zero is zero; nonzero and special values are not
p(-0.0.zero?)
p(1.5.zero?)
p(Float::INFINITY.zero?)
p(Float::NAN.zero?)
a003 = -0.0; c003 = a003.zero?; p c003
