# frozen_string_literal: true
# Float#===
p(1.5 === 1.5)
p(1.5 === 2.5)
a001 = 1.5; b001 = 1.5; p(a001 === b001)
a002 = 1.5; b002 = 2.5; c002 = (a002 === b002); p c002

# numeric value comparison across types; special / non-numeric values
p(1.0 === 1)
p(-0.0 === 0.0)
p(Float::NAN === Float::NAN)
p(1.0 === "1.0")
p(1.0 === Object.new)

# nil / Rational / Complex arguments — Ruby returns a boolean (delegates to #==)
r001 = (1.0 === nil rescue $!.class); p r001
r002 = (0.5 === Rational(1, 2) rescue $!.class); p r002
r003 = (1.0 === Complex(1, 0) rescue $!.class); p r003
a003 = 0.5; b003 = Rational(1, 2); r004 = (a003 === b003 rescue $!.class); p r004
