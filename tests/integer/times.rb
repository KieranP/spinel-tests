# frozen_string_literal: true
# Integer#times
p(3.times.to_a)
a083 = 3; p(a083.times.to_a)
a084 = 3; c084 = (a084.times.to_a); p c084

p(0.times.to_a)
p((-3).times.to_a)
p(1.times.to_a)

s085 = 0; 4.times { |i| s085 += i }; p s085
p(3.times.map { |i| i * i })
p(3.times { })
p(3.times.size)
p(5.times.reduce(:+))
a086 = 3; c086 = (a086.times.map { |i| i + 1 }); p c086

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_it(oit)
  case oit
  when Integer then 7
  when String  then 12
  else raise ArgumentError, "no"
  end
end
rb_it = (raisebr_it("ab").times.to_a rescue $!.class); p rb_it

# As a method's implicit return value this yields a zero value of the receiver's
# type instead of the receiver itself.
def ir810(x810); x810.times { |i810| nil }; end
p ir810(2)
v810 = ir810(2); p v810
# control: the same call with the result consumed explicitly
def ic810(y810); return y810.times { |i810| nil }; end
p ic810(2)

# the same iterator in the tail position of a BLOCK aborts the C build
# Kept commented: the compile abort takes down the whole file.
def by810; yield(2); end
p(by810 { |n823| n823.times { |i823| nil } })
w823 = by810 { |n824| n824.times { |i824| nil } }; p w823
# control: the same call with the result consumed inside the block
def bc810; yield(2); end
p(bc810 { |n825| r825 = n825.times { |i825| nil }; r825 })
u825 = bc810 { |n826| r826 = n826.times { |i826| nil }; r826 }; p u825
