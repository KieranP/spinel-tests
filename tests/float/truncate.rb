# frozen_string_literal: true
# Float#truncate
p(3.7.truncate)
a001 = 3.7; p(a001.truncate)
a002 = 3.7; c002 = (a002.truncate); p c002

# truncation toward zero, both signs
p(-3.7.truncate)
p(3.0.truncate)

# Float#truncate(n)
p(3.14159.truncate(2))
a003 = 3.14159; p(a003.truncate(2))
a004 = 3.14159; b004 = 2; p(a004.truncate(b004))
a005 = 3.14159; b005 = 2; c005 = (a005.truncate(b005)); p c005
p(-3.14159.truncate(2))

# Float#truncate(n) — negative digits round toward zero to a power of ten (Integer)
p(1234.5678.truncate(-2))
p(-1234.5678.truncate(-2))

# non-finite receiver — Ruby raises FloatDomainError
r250 = (Float::INFINITY.truncate rescue $!.class); p r250
r251 = (Float::NAN.truncate rescue $!.class); p r251
a251 = Float::INFINITY; c251 = (a251.truncate rescue $!.class); p c251

r880 = (1.5.truncate("x") rescue $!.class); p r880
