# frozen_string_literal: true
# Integer#round
p(1234.round(-2))
a075 = 1234; p(a075.round(-2))
a076 = 1234; b076 = -2; p(a076.round(b076))
a077 = 1234; b077 = -2; c077 = (a077.round(b077)); p c077

p(1234.round)
p(1234.round(0))
p(1234.round(2))
p(1250.round(-2))
p((-1250).round(-2))
p(5.round(-2))
p(1234.round.class)
a078 = 1234; c078 = (a078.round(-2)); p c078

# Integer#round with a half: keyword
p(15.round(half: :even))
p(25.round(-1, half: :up))
p(25.round(-1, half: :down))
p(25.round(-1, half: :even))
p(35.round(-1, half: :even))
r249 = (25.round(-1, half: :up) rescue $!.class); p r249

# negative receiver with a half: keyword
p((-15).round(-1, half: :even))
p((-25).round(-1, half: :up))
p((-25).round(-1, half: :down))
p(35.round(-1, half: :down))
p(250.round(-2, half: :even))
a079 = -25; b079 = -1; c079 = (a079.round(b079, half: :up)); p c079

# Bignum receiver
big100 = 2 ** 100; p(big100.round(-2))

# Integer#round with a nil ndigits (Ruby raises TypeError)
r881 = (5.round(nil) rescue $!.class); p r881

# an unrecognised half: mode (Ruby raises ArgumentError)
r882 = (15.round(-1, half: :bogus) rescue $!.class); p r882

# [UserType, self], Integer#round on an ivar resolves to the user method and raises
class FxRnd950
  attr_reader :units
  def initialize(units) = @units = units
  def round = FxRnd950.new(@units)
  def coerce(other) = [FxRnd950.new(other), self]
  def probe = @units.round
end
r952 = (FxRnd950.new(1999).probe rescue $!.class); p r952
v953 = (FxRnd950.new(1999).probe rescue $!.class); p v953
