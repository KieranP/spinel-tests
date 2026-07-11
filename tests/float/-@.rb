# frozen_string_literal: true
# Float#-@
p(-(3.5))
a001 = 3.5; p(-a001)
a002 = 3.5; c002 = -a002; p c002
# so the build aborts with "expression is not assignable". Kept commented: it takes the
# whole file down.
p(-(-3.5))
v3501 = -(-3.5); p v3501

# signed zero and special values
a003 = -0.0; p(-a003)
p(-(0.0))
p(-Float::INFINITY)
p(-(-Float::INFINITY))
p(-Float::NAN)
a004 = 2.5; c004 = -a004; p c004
