# frozen_string_literal: true
# Integer#pow
p(3.pow(4, 5))
a067 = 3; p(a067.pow(4, 5))
a068 = 3; b068 = 5; p(a068.pow(4, b068))
a069 = 3; b069 = 5; c069 = (a069.pow(4, b069)); p c069

# Integer#pow one-arg (same as **)
p(3.pow(4))
p(3.pow(0))
p(3.pow(1))
a100 = 3; p(a100.pow(4))
a101 = 3; b101 = 4; c101 = (a101.pow(b101)); p c101

# Integer#pow one-arg with a big (would-be Bignum) result
# WONTFIX: See docs/limitations.md - "By design — Integer overflow"
# p(2.pow(100))
# p(2.pow(100).class)
# a102 = 2; b102 = 100; c102 = (a102.pow(b102)); p c102

# Integer#pow with a Bignum base (receiver)
p((2 ** 70).pow(2))
a103 = 2 ** 70; c103 = (a103.pow(2)); p c103

p((2 ** 100).pow(2, 7))
a103m = 2 ** 100; b103m = 2; d103m = 7; c103m = (a103m.pow(b103m, d103m)); p c103m

# Integer#pow(e, m) with a Bignum MODULUS (result 8 fits int64 - only the modulus is a Bignum)
p(2.pow(3, 2 ** 64))
a103n = 2; b103n = 3; d103n = 2 ** 64; c103n = (a103n.pow(b103n, d103n)); p c103n

# Integer#pow(negative, mod) - modular inverse; both Ruby and Spinel raise RangeError
p((3.pow(-1, 7) rescue $!.class))
a103p = 3; b103p = -1; d103p = 7; r103p = (a103p.pow(b103p, d103p) rescue $!.class); p r103p

# Integer#pow modular exponentiation, larger modulus
p(2.pow(10, 1000))
a104 = 2; b104 = 10; d104 = 1000; c104 = (a104.pow(b104, d104)); p c104

# Integer#pow modular with a negative base
p((-3).pow(3, 7))
a105 = -3; b105 = 3; d105 = 7; c105 = (a105.pow(b105, d105)); p c105

# Integer#pow modular with a negative modulus
p(3.pow(3, -7))
a106 = 3; b106 = 3; d106 = -7; c106 = (a106.pow(b106, d106)); p c106

# Integer#pow modular with a zero exponent
p(7.pow(0, 5))

# Integer#pow modular with a zero modulus (ZeroDivisionError)
r107 = (3.pow(2, 0) rescue $!.class); p r107
a108 = 3; b108 = 2; d108 = 0; r108 = (a108.pow(b108, d108) rescue $!.class); p r108

p(2.pow(0.5))
p(9.pow(0.5))
p(2.pow(2.0))
a110f = 2; b110f = 0.5; c110f = (a110f.pow(b110f)); p c110f

# Integer#pow one-arg with a literal negative exponent (Ruby: Rational)
r109 = (3.pow(-2) rescue $!.class); p r109

# Integer#pow with a runtime (variable) negative exponent
# WONTFIX: See docs/limitations.md - "By design — Integer#** with a negative exponent"
# a109 = 3; b109 = -2; r110 = (a109.pow(b109) rescue $!.class); p r110

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_ip(oip)
  case oip
  when Integer then 7
  when String  then 12
  else raise ArgumentError, "no"
  end
end
rb_ip = (raisebr_ip("ab").pow(2) rescue $!.class); p rb_ip

r880 = (5.pow("x") rescue $!.class); p r880

# Integer#pow with a nil argument (Ruby raises TypeError)
r881 = (5.pow(nil) rescue $!.class); p r881
