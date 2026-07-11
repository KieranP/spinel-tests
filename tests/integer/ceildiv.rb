# frozen_string_literal: true
# Integer#ceildiv
p(7.ceildiv(2))
a029 = 7; p(a029.ceildiv(2))
a030 = 7; b030 = 2; p(a030.ceildiv(b030))
a031 = 7; b031 = 2; c031 = (a031.ceildiv(b031)); p c031

# Integer#ceildiv negative operands
p((-7).ceildiv(2))
p(7.ceildiv(-2))
p((-7).ceildiv(-2))
a100 = -7; b100 = 2; c100 = (a100.ceildiv(b100)); p c100

# Integer#ceildiv exact division and zero dividend
p(6.ceildiv(3))
p(0.ceildiv(5))
a101 = 6; b101 = 3; c101 = (a101.ceildiv(b101)); p c101

# Integer#ceildiv with a Float argument
p(7.ceildiv(2.5))
a102 = 7; b102 = 2.5; c102 = (a102.ceildiv(b102)); p c102

# Integer#ceildiv with a Bignum receiver
p((2 ** 70).ceildiv(3))
a103 = 2 ** 70; b103 = 3; c103 = (a103.ceildiv(b103)); p c103

# Integer#ceildiv by zero (ZeroDivisionError)
r104 = (7.ceildiv(0) rescue $!.class); p r104
a105 = 7; b105 = 0; r105 = (a105.ceildiv(b105) rescue $!.class); p r105

r880 = (5.ceildiv("x") rescue $!.class); p r880

# Integer#ceildiv with a nil argument (Ruby raises TypeError)
r881 = (5.ceildiv(nil) rescue $!.class); p r881
