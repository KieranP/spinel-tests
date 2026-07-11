# frozen_string_literal: true
# Float#%
p(5.5 % 2.0)
a001 = 5.5; b001 = 2.0; p(a001 % b001)
a002 = 5.5; b002 = 2.0; c002 = (a002 % b002); p c002

# Float % Integer
p(5.5 % 2)
a003 = 5.5; b003 = 2; c003 = (a003 % b003); p c003

# sign of the result follows the divisor
p(-5.5 % 2.0)
p(5.5 % -2.0)
p(-5.5 % -2.0)

# infinite divisor, and division by zero
p(5.5 % Float::INFINITY)
p(-5.5 % Float::INFINITY)
r001 = (1.5 % 0.0 rescue $!.class); p r001
r002 = (1.5 % 0 rescue $!.class); p r002

r880 = (1.5 % "x" rescue $!.class); p r880

# sign of the result follows the divisor, with the operands in variables
v881 = -5.5; w881 = 2.0; x881 = (v881 % w881); p x881
v882 = 5.5; w882 = -2.0; x882 = (v882 % w882); p x882

# Float#% with a nil divisor (Ruby raises TypeError)
r881 = (1.5 % nil rescue $!.class); p r881
