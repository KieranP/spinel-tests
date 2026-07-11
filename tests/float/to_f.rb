# frozen_string_literal: true
# Float#to_f
p(1.5.to_f)
a001 = 1.5; p(a001.to_f)
a002 = 1.5; c002 = a002.to_f; p c002

# returns self, including special values and signed zero
p(-2.5.to_f)
p((-0.0).to_f)
p(Float::INFINITY.to_f)
p((-Float::INFINITY).to_f)
p(Float::NAN.to_f)
a003 = Float::INFINITY; c003 = a003.to_f; p c003
