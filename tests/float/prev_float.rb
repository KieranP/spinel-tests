# frozen_string_literal: true
# Float#prev_float
p(1.0.prev_float)
a001 = 1.0; p(a001.prev_float)
a002 = 1.0; c002 = a002.prev_float; p c002

# largest step below assorted values and special cases
p(0.0.prev_float)
p((-0.0).prev_float)
p((-Float::MAX).prev_float)
p((-Float::INFINITY).prev_float)
p(Float::INFINITY.prev_float)
p(Float::NAN.prev_float)
