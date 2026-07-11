# frozen_string_literal: true
# Float#numerator
p(0.5.numerator)
a001 = 0.5; p(a001.numerator)
a002 = 0.75; c002 = a002.numerator; p c002

# integral values, negatives, and non-exact fractions
p(2.0.numerator)
p((-0.5).numerator)
p(0.1.numerator)
a003 = 0.25; c003 = a003.numerator; p c003

# non-finite receivers: Ruby returns the value itself; Spinel raises FloatDomainError
r001 = (Float::INFINITY.numerator rescue $!.class); p r001
r002 = (Float::NAN.numerator rescue $!.class); p r002
a004 = -Float::INFINITY; c004 = (a004.numerator rescue $!.class); p c004
