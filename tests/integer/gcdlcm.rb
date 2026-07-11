# frozen_string_literal: true
# Integer#gcdlcm
p(12.gcdlcm(18))
a058 = 12; p(a058.gcdlcm(18))
a059 = 12; b059 = 18; p(a059.gcdlcm(b059))
a060 = 12; b060 = 18; c060 = (a060.gcdlcm(b060)); p c060

# Integer#gcdlcm with zero operands
p(12.gcdlcm(0))
p(0.gcdlcm(12))
p(0.gcdlcm(0))
a100 = 0; b100 = 0; c100 = (a100.gcdlcm(b100)); p c100

# Integer#gcdlcm with negative operands
p((-12).gcdlcm(18))
p(12.gcdlcm(-18))
a101 = -12; b101 = 18; c101 = (a101.gcdlcm(b101)); p c101

# Integer#gcdlcm with equal and coprime operands
p(12.gcdlcm(12))
p(14.gcdlcm(15))
a102 = 14; b102 = 15; c102 = (a102.gcdlcm(b102)); p c102

# Integer#gcdlcm with a Bignum receiver
p((2 ** 70).gcdlcm(2 ** 69))
a103 = 2 ** 70; b103 = 2 ** 69; c103 = (a103.gcdlcm(b103)); p c103

# Integer#gcdlcm with a Float argument (Ruby raises TypeError)
r247 = (12.gcdlcm(2.5) rescue $!.class); p r247
a247 = 12; b247 = 2.5; c247 = (a247.gcdlcm(b247) rescue $!.class); p c247

[[48, 36]].each { |acr, bcr| p acr.gcdlcm(bcr) }
pcr = [[48, 36]]; pcr.each { |acr, bcr| gvr = (acr.gcdlcm(bcr) rescue $!.class); p gvr }
r880 = (5.gcdlcm("x") rescue $!.class); p r880

# Integer#gcdlcm with a nil argument (Ruby raises TypeError)
r881 = (5.gcdlcm(nil) rescue $!.class); p r881
