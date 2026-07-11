# frozen_string_literal: true
# Float#to_r
p(0.5.to_r)
a030 = 0.5; p(a030.to_r)
a031 = 0.5; c031 = (a031.to_r); p c031

# exact binary fractions and integral values
p(0.25.to_r)
p(2.0.to_r)
p((-0.5).to_r)
p(0.0.to_r)

# non-finite receiver — Ruby raises FloatDomainError
r001 = (Float::INFINITY.to_r rescue $!.class); p r001
r002 = (Float::NAN.to_r rescue $!.class); p r002
a032 = Float::INFINITY; c032 = (a032.to_r rescue $!.class); p c032
