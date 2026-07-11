# frozen_string_literal: true
# Integer#! (boolean negation — every Integer is truthy, so always false)
p(!5)
p(!0)
p(!(-5))
a001 = 5; p(!a001)
a002 = 0; p(!a002)
a003 = 5; c003 = (!a003); p c003
p((!5).class)
