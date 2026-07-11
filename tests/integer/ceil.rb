# frozen_string_literal: true
# Integer#ceil
p(1234.ceil(-2))
a026 = 1234; p(a026.ceil(-2))
a027 = 1234; b027 = -2; p(a027.ceil(b027))
a028 = 1234; b028 = -2; c028 = (a028.ceil(b028)); p c028

p(1234.ceil)
p(1234.ceil(0))
p(1234.ceil(2))
p(5.ceil(-1))
p((-1234).ceil(-2))
p(1234.ceil.class)
a029 = 1234; c029 = (a029.ceil); p c029
a030 = 1234; c030 = (a030.ceil(-2)); p c030

# Bignum receiver
big100 = 2 ** 100; p(big100.ceil(-2))

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_ic(oic)
  case oic
  when Integer then 7
  when String  then 12
  else raise ArgumentError, "no"
  end
end
rb_ic = (raisebr_ic("ab").ceil(-1) rescue $!.class); p rb_ic
