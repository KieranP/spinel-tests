# frozen_string_literal: true
# Float#! (only nil and false are falsy — every Float is truthy)
p(!3.5)
a001 = 3.5; p(!a001)
a002 = 3.5; c002 = (!a002); p c002

# zero, negative, and special values are all truthy
p(!0.0)
p(!(-2.5))
p(!Float::INFINITY)
p(!Float::NAN)
p(!!3.5)
a003 = 0.0; c003 = (!a003); p c003
