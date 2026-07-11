# frozen_string_literal: true
# Float#denominator
p(0.5.denominator)
a001 = 0.5; p(a001.denominator)
a002 = 0.75; c002 = a002.denominator; p c002

# integral values, negatives, and non-exact fractions
p(2.0.denominator)
p((-0.5).denominator)
p(0.1.denominator)
a003 = 0.25; c003 = a003.denominator; p c003

# non-finite receivers: Ruby returns 1; Spinel raises FloatDomainError
r001 = (Float::INFINITY.denominator rescue $!.class); p r001
r002 = (Float::NAN.denominator rescue $!.class); p r002
a004 = -Float::INFINITY; c004 = (a004.denominator rescue $!.class); p c004
