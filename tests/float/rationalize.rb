# frozen_string_literal: true
# Float#rationalize
p(0.5.rationalize)
a001 = 0.5; p(a001.rationalize)
a002 = 0.75; c002 = a002.rationalize; p c002

# recovers a simple fraction; integral and negative values
p(0.3.rationalize)
p(3.14.rationalize)
p(2.0.rationalize)
p((-0.5).rationalize)

# non-finite receiver — Ruby raises FloatDomainError
r001 = (Float::INFINITY.rationalize rescue $!.class); p r001
r002 = (Float::NAN.rationalize rescue $!.class); p r002

# Float epsilon argument works under both:
p(0.333333.rationalize(0.001))
v010 = 0.333333.rationalize(0.001); p v010
r011 = (0.333333.rationalize(Rational(1, 1000)) rescue $!.class); p r011
