# frozen_string_literal: true
# Integer#to_s
p(255.to_s(16))
a089 = 255; p(a089.to_s(16))
a090 = 255; b090 = 16; p(a090.to_s(b090))
a091 = 255; b091 = 16; c091 = (a091.to_s(b091)); p c091
x110t = 2 ** 100; p(x110t.to_s)
x110s = 2 ** 100; p(x110s.to_s(16))
x110u = 2 ** 100; c110u = (x110u.to_s(16)); p c110u

# no-arg and valid-base boundaries (2..36) match
p(255.to_s)
p(255.to_s(2))
p(255.to_s(8))
p(255.to_s(36))
p((-255).to_s(16))
# negative receiver across more bases, and zero
p((-255).to_s(2))
p((-255).to_s(8))
p((-255).to_s(36))
p(0.to_s(16))
p(0.to_s(2))
a093 = -255; b093 = 2; c093 = (a093.to_s(b093)); p c093

p((255.to_s(1)  rescue $!.class))
p((255.to_s(0)  rescue $!.class))
p((255.to_s(-1) rescue $!.class))
p((255.to_s(37) rescue $!.class))
a092 = 255; b092 = 37; r092 = (a092.to_s(b092) rescue $!.class); p r092
co618 = (0...3).map { |n618| n618 }; r618i = (co618.each_cons(2).map { |a618b, b618b| (a618b ^ b618b).to_s(2) } rescue $!.class); p r618i

r880 = (5.to_s("x") rescue $!.class); p r880

# Integer#to_s with a nil base (Ruby raises TypeError)
r881 = (5.to_s(nil) rescue $!.class); p r881

# every legal base round-trips through String#to_i
p((2..36).all? { |bs1| 123456.to_s(bs1).to_i(bs1) == 123456 })
vs1 = (2..36).map { |bs2| (-255).to_s(bs2) }; p vs1
