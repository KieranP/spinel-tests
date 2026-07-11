# frozen_string_literal: true
# Float#+@ (unary plus — returns self)
p(+3.5)
a001 = 3.5; p(+a001)
a002 = 3.5; c002 = (+a002); p c002

# negatives, zero, and special values are returned unchanged
p(+(-3.5))
p(+0.0)
p(+(-0.0))
p(+Float::INFINITY)
p(+Float::NAN)
a003 = -2.5; c003 = (+a003); p c003
p((+3.5).class)
