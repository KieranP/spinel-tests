# frozen_string_literal: true
# Integer#lcm
p(4.lcm(6))
a061 = 4; p(a061.lcm(6))
a062 = 4; b062 = 6; p(a062.lcm(b062))
a063 = 4; b063 = 6; c063 = (a063.lcm(b063)); p c063

# Integer#lcm with zero operands (lcm with 0 is 0)
p(0.lcm(5))
p(5.lcm(0))
p(0.lcm(0))
a100 = 0; b100 = 0; c100 = (a100.lcm(b100)); p c100

# Integer#lcm with negative operands (result is non-negative)
p((-4).lcm(6))
p(4.lcm(-6))
p((-4).lcm(-6))
a101 = -4; b101 = 6; c101 = (a101.lcm(b101)); p c101

# Integer#lcm with equal and coprime operands
p(6.lcm(6))
p(4.lcm(9))
a102 = 4; b102 = 9; c102 = (a102.lcm(b102)); p c102

# Integer#lcm with a Bignum receiver
p((2 ** 70).lcm(4))
a103 = 2 ** 70; b103 = 4; c103 = (a103.lcm(b103)); p c103

# Integer#lcm with a Float argument (Ruby raises TypeError)
r247 = (12.lcm(2.5) rescue $!.class); p r247
a247 = 12; b247 = 2.5; c247 = (a247.lcm(b247) rescue $!.class); p c247
r880 = (5.lcm("x") rescue $!.class); p r880

# Integer#lcm with a nil argument (Ruby raises TypeError)
r881 = (5.lcm(nil) rescue $!.class); p r881
