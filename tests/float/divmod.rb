# frozen_string_literal: true
# Float#divmod
p(7.5.divmod(2.0))
a011 = 7.5; p(a011.divmod(2.0))
a012 = 7.5; b012 = 2.0; p(a012.divmod(b012))
a013 = 7.5; b013 = 2.0; c013 = (a013.divmod(b013)); p c013

# sign of the modulo part follows the divisor
p((-7.5).divmod(2.0))
p(7.5.divmod(-2.0))
p((-7.5).divmod(-2.0))
p(7.5.divmod(2))

# Float#divmod with an infinite divisor
p(5.0.divmod(Float::INFINITY))
a250 = 5.0; b250 = Float::INFINITY; c250 = (a250.divmod(b250)); p c250

# divmod by zero raises ZeroDivisionError; a NaN receiver raises FloatDomainError
r250 = (5.0.divmod(0.0) rescue $!.class); p r250
r251 = (5.0.divmod(0) rescue $!.class); p r251
r252 = (Float::NAN.divmod(2.0) rescue $!.class); p r252

# an infinite RECEIVER must raise FloatDomainError (Spinel returns [0, 0.0])
r253 = (Float::INFINITY.divmod(2.0) rescue $!.class); p r253
r254 = ((-Float::INFINITY).divmod(2.0) rescue $!.class); p r254
a253 = Float::INFINITY; b253 = 2; c253 = (a253.divmod(b253) rescue $!.class); p c253

r880 = (1.5.divmod("x") rescue $!.class); p r880

# a signed-zero receiver
p((-0.0).divmod(2.0))
v881 = -0.0; w881 = 2.0; x881 = (v881.divmod(w881)); p x881

# Float#divmod with a nil argument (Ruby raises TypeError)
r882 = (1.5.divmod(nil) rescue $!.class); p r882
