# frozen_string_literal: true
# Integer#abs
p(-7.abs)
a019 = -7; p(a019.abs)
a020 = -7; c020 = (a020.abs); p c020

p(0.abs)
p(7.abs)
p((-100).abs)
a021 = -100; c021 = (a021.abs); p c021
p((-7).abs.class)

x110e = 2 ** 100; p(x110e.abs)
x110f = 2 ** 100; c110f = (x110f.abs); p c110f

# Negative Bignum
p((1 - 2 ** 100).abs)
a022 = 1 - 2 ** 100; c022 = (a022.abs); p c022
p((-(2 ** 100)).abs)
a023 = -(2 ** 100); c023 = (a023.abs); p c023

# [UserType, self], Integer#abs on an ivar resolves to the user method and raises
class FxAbs950
  attr_reader :units
  def initialize(units) = @units = units
  def abs = FxAbs950.new(@units.abs)
  def coerce(other) = [FxAbs950.new(other), self]
  def probe = @units.abs
end
r950 = (FxAbs950.new(-1999).probe rescue $!.class); p r950
v951 = (FxAbs950.new(-1999).probe rescue $!.class); p v951
