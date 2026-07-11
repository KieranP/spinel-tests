# frozen_string_literal: true
# Integer#succ
p(5.succ)
a081 = 5; p(a081.succ)
a082 = 5; c082 = (a082.succ); p c082

p(0.succ)
p((-1).succ)
p((-5).succ)
a083 = 0; p(a083.succ)
a084 = -1; c084 = (a084.succ); p c084

# Boundary (2**64 - 1).succ:
p((2 ** 64 - 1).succ)
x085 = 2 ** 64 - 1; p(x085.succ)
x086 = 2 ** 64 - 1; c086 = (x086.succ); p c086

# Bignum receiver (big + 1):
p((2 ** 100).succ)
x087 = 2 ** 100; p(x087.succ)
x088 = 2 ** 100; c088 = (x088.succ); p c088

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_is(ois)
  case ois
  when Integer then 7
  when String  then 12
  else raise ArgumentError, "no"
  end
end
rb_is = (raisebr_is("ab").succ rescue $!.class); p rb_is

# [UserType, self], Integer#succ on an ivar resolves to the user method and raises
class FxSuc950
  attr_reader :units
  def initialize(units) = @units = units
  def succ = FxSuc950.new(@units)
  def coerce(other) = [FxSuc950.new(other), self]
  def probe = @units.succ
end
r954 = (FxSuc950.new(1999).probe rescue $!.class); p r954
v955 = (FxSuc950.new(1999).probe rescue $!.class); p v955
