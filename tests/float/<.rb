# frozen_string_literal: true
# Float#<
p(1.5 < 2.5)
a001 = 1.5; b001 = 2.5; p(a001 < b001)
a002 = 2.5; b002 = 1.5; c002 = (a002 < b002); p c002

# mixed with Integer / Rational
p(1.5 < 2)
p(1.5 < Rational(3, 2))
a003 = 2.5; b003 = 2; c003 = (a003 < b003); p c003

# equal receivers, signed zero
p(2.5 < 2.5)
p(-0.0 < 0.0)

# Infinity / NaN (NaN comparisons are always false)
p(1.0 < Float::INFINITY)
p(-Float::INFINITY < 0.0)
p(1.0 < Float::NAN)
p(Float::NAN < Float::NAN)

# non-numeric argument — Ruby raises ArgumentError
r001 = (1.5 < nil rescue $!.class); p r001
r002 = (1.5 < Object.new rescue $!.class); p r002
a004 = 1.5; b004 = nil; r003 = (a004 < b004 rescue $!.class); p r003
r004 = (1.5 < "x" rescue $!.class); p r004
