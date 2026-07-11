# frozen_string_literal: true
# Integer#gcd
p(12.gcd(18))
a055 = 12; p(a055.gcd(18))
a056 = 12; b056 = 18; p(a056.gcd(b056))
a057 = 12; b057 = 18; c057 = (a057.gcd(b057)); p c057

# Integer#gcd with zero operands
p(0.gcd(5))
p(5.gcd(0))
p(0.gcd(0))
a100 = 0; b100 = 0; c100 = (a100.gcd(b100)); p c100

# Integer#gcd with negative operands (result is non-negative)
p((-12).gcd(18))
p(12.gcd(-18))
p((-12).gcd(-18))
a101 = -12; b101 = 18; c101 = (a101.gcd(b101)); p c101

# Integer#gcd with equal and coprime operands
p(12.gcd(12))
p(14.gcd(15))
a102 = 14; b102 = 15; c102 = (a102.gcd(b102)); p c102

# Integer#gcd with a Bignum receiver
p((2 ** 70).gcd(2 ** 69))
a103 = 2 ** 70; b103 = 2 ** 69; c103 = (a103.gcd(b103)); p c103
# Bignum receiver, small Integer argument works
p((2 ** 70).gcd(255))
a104 = 2 ** 70; b104 = 255; c104 = (a104.gcd(b104)); p c104

# Bignum ARGUMENT (small receiver, result 1) - the argument type, not magnitude, aborts.
p(255.gcd(2 ** 64))
a105 = 255; b105 = 2 ** 64; c105 = (a105.gcd(b105)); p c105

# Integer#gcd with a Float argument (Ruby raises TypeError)
r247 = (12.gcd(2.5) rescue $!.class); p r247
a247 = 12; b247 = 2.5; c247 = (a247.gcd(b247) rescue $!.class); p c247
r880 = (5.gcd("x") rescue $!.class); p r880

# Integer#gcd with a nil argument (Ruby raises TypeError)
r881 = (5.gcd(nil) rescue $!.class); p r881
