# frozen_string_literal: true
# Float#to_int (alias of #to_i)
p(3.9.to_int)
a001 = 3.9; p(a001.to_int)
a002 = -3.9; c002 = a002.to_int; p c002

# truncation toward zero, both signs
p(3.99.to_int)
p(-3.99.to_int)
p(0.0.to_int)
a003 = -1234.9; p(a003.to_int)

# non-finite receiver — Ruby raises FloatDomainError (as #to_i does)
r001 = (Float::INFINITY.to_int rescue $!.class); p r001
r002 = ((-Float::INFINITY).to_int rescue $!.class); p r002
r003 = (Float::NAN.to_int rescue $!.class); p r003
a004 = Float::INFINITY; c004 = (a004.to_int rescue $!.class); p c004
