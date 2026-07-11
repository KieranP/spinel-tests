# frozen_string_literal: true
# Integer#digits
p(12345.digits(16))
a040 = 12345; p(a040.digits(16))
a041 = 12345; b041 = 16; p(a041.digits(b041))
a042 = 12345; b042 = 16; c042 = (a042.digits(b042)); p c042
x110a = 2 ** 100; p(x110a.digits)
x110b = 2 ** 100; c110b = (x110b.digits); p c110b

# base 2 / 8 / 10, no-arg
p(12345.digits)
p(255.digits(2))
p(255.digits(8))
p(255.digits(10))
dg01 = 255; dg01b = 2; cdg01 = (dg01.digits(dg01b)); p cdg01
# 0.digits → [0]
p(0.digits)
p(0.digits(10))
# negative → Math::DomainError
p(((-5).digits rescue $!.class))
dg02 = -5; p((dg02.digits rescue $!.class))
# base < 2 → ArgumentError
p((5.digits(1) rescue $!.class))
p((5.digits(0) rescue $!.class))
dg03 = 5; dg03b = 1; p((dg03.digits(dg03b) rescue $!.class))
# Large radix on a Bignum receiver.
p(((2 ** 100).digits(1024) rescue $!.class))

# Bignum BASE (small receiver, result [255]) - the base type, not the magnitude, aborts.
p(255.digits(2 ** 64))
dg04 = 255; dg04b = 2 ** 64; cdg04 = (dg04.digits(dg04b)); p cdg04

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_ig(oig)
  case oig
  when Integer then 7
  when String  then 12
  else raise ArgumentError, "no"
  end
end
rb_ig = (raisebr_ig("ab").digits rescue $!.class); p rb_ig

r880 = (5.digits("x") rescue $!.class); p r880

# Integer#digits with a nil base (Ruby raises TypeError)
r881 = (5.digits(nil) rescue $!.class); p r881

# base round-trip through String#to_i across the whole legal base range
p((2..36).map { |bg1| 255.to_s(bg1).to_i(bg1) }.uniq)
vg1 = (2..36).map { |bg2| 4095.digits(bg2).size }; p vg1
