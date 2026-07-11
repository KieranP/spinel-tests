# frozen_string_literal: true
# Float#round
p(3.5.round)
a023 = 3.5; p(a023.round)
a024 = 3.5; c024 = (a024.round); p c024

# default rounds half away from zero; result is an Integer
p(2.5.round)
p(0.5.round)
p(1.5.round)
a028 = -2.5; p(a028.round)
p(3.5.round.class)

# half: keyword (:even banker's rounding, :down toward zero)
p(2.5.round(half: :even))
p(0.5.round(half: :even))
p(1.5.round(half: :even))
p(2.5.round(half: :down))
a029 = -2.5; p(a029.round(half: :even))

# Float#round(n) — positive digits keep Float class
p(3.14159.round(2))
a025 = 3.14159; p(a025.round(2))
a026 = 3.14159; b026 = 2; p(a026.round(b026))
a027 = 3.14159; b027 = 2; c027 = (a027.round(b027)); p c027
p(3.14159.round(2).class)
p(2.675.round(2))

# Float#round(n) — negative digits round to a power of ten (Integer)
p(15.0.round(-1))
p(25.0.round(-1))
p(1234.5678.round(-2))
a030 = 250.0; b030 = -2; c030 = (a030.round(b030)); p c030

# Float#round on Infinity (Ruby raises FloatDomainError)
r251 = (Float::INFINITY.round rescue $!.class); p r251
a251 = Float::INFINITY; c251 = (a251.round rescue $!.class); p c251

class Shape929
  def initialize(s929) = @s929 = s929
  def area = @s929 * 3.14
end
shapes929 = [["a", 2], ["b", 3]].map { |_, s929| Shape929.new(s929) }
p shapes929.sum { |x929| x929.area }.round(2)

p((-0.0001).round(2))
vrd = (-0.0001).round(2); p vrd

r880 = (1.5.round("x") rescue $!.class); p r880
hm881 = :even; r881 = (1.5.round(half: hm881) rescue $!.class); p r881
r882 = (1.5.round(half: nil) rescue $!.class); p r882

# half: with a positive ndigits (0.125 and 1.25 are exact binary halves)
p(0.125.round(2, half: :even))
p(0.125.round(2, half: :down))
p(1.25.round(1, half: :even))
v883 = -0.125; x883 = (v883.round(2, half: :even)); p x883

# an unrecognised half: mode (Ruby raises ArgumentError)
r884 = (1.5.round(half: :bogus) rescue $!.class); p r884
r885 = (1.5.round(2, half: :bogus) rescue $!.class); p r885

# Float#round with a nil ndigits (Ruby raises TypeError)
r886 = (1.5.round(nil) rescue $!.class); p r886
