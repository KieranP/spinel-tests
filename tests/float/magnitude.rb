# frozen_string_literal: true
# Float#magnitude (alias of #abs)
p(-3.5.magnitude)
a001 = -3.5; p(a001.magnitude)
a002 = -3.5; c002 = (a002.magnitude); p c002
p(3.5.magnitude)
p((-Float::INFINITY).magnitude)
p(Float::NAN.magnitude)

p((-0.0).magnitude)
a003 = -0.0; c003 = a003.magnitude; p c003
