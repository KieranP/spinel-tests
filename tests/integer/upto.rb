# frozen_string_literal: true
# Integer#upto
p(1.upto(4).to_a)
a092 = 1; p(a092.upto(4).to_a)
a093 = 1; b093 = 4; p(a093.upto(b093).to_a)
a094 = 1; b094 = 4; c094 = (a094.upto(b094).to_a); p c094

p(3.upto(3).to_a)
p(4.upto(1).to_a)
p((-2).upto(2).to_a)
p((-4).upto(-1).to_a)

s095 = 0; 1.upto(5) { |i| s095 += i }; p s095
p(1.upto(4).map { |i| i * 2 })
p(1.upto(4) { })
p(1.upto(4).size)

# Bignum receiver.
big100 = 2 ** 100; p((big100 - 3).upto(big100).to_a)

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_iu(oiu)
  case oiu
  when Integer then 7
  when String  then 12
  else raise ArgumentError, "no"
  end
end
rb_iu = (raisebr_iu("ab").upto(14).to_a rescue $!.class); p rb_iu

# As a method's implicit return value this yields a zero value of the receiver's
# type instead of the receiver itself.
def ir811(x811); x811.upto(2) { |i811| nil }; end
p ir811(1)
v811 = ir811(1); p v811
# control: the same call with the result consumed explicitly
def ic811(y811); return y811.upto(2) { |i811| nil }; end
p ic811(1)

r880 = (1.upto("a").to_a rescue $!.class); p r880
