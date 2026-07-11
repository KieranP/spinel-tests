# frozen_string_literal: true
# Float#abs
p(-3.5.abs)
a001 = -3.5; p(a001.abs)
a002 = -3.5; c002 = (a002.abs); p c002

p(3.5.abs)
a003 = 3.5; p(a003.abs)

# already-positive and integer-valued
p(0.0.abs)
a004 = 2.0; c004 = a004.abs; p c004

# Infinity / NaN
p((-Float::INFINITY).abs)
a005 = -Float::INFINITY; p(a005.abs)
p(Float::NAN.abs)

# #magnitude alias
p(-3.5.magnitude)
a006 = -3.5; c006 = a006.magnitude; p c006

p((-0.0).abs)
a007 = -0.0; p(a007.abs)
a008 = -0.0; c008 = a008.abs; p c008
b009 = 0.0; c009 = -1.0; p((b009 * c009).abs)
p((-0.0).magnitude)
