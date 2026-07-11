# frozen_string_literal: true
# Float#next_float
p(1.0.next_float)
a001 = 1.0; p(a001.next_float)
a002 = 1.0; c002 = a002.next_float; p c002

# smallest step above assorted values and special cases
p(0.0.next_float)
p((-0.0).next_float)
p(Float::MAX.next_float)
p(Float::INFINITY.next_float)
p((-Float::INFINITY).next_float)
p(Float::NAN.next_float)
