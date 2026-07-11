# frozen_string_literal: true
# Integer#floor
p(1234.floor(-2))
a052 = 1234; p(a052.floor(-2))
a053 = 1234; b053 = -2; p(a053.floor(b053))
a054 = 1234; b054 = -2; c054 = (a054.floor(b054)); p c054

p(1234.floor)
p(1234.floor(0))
p(1234.floor(2))
p(5.floor(-1))
p((-1234).floor(-2))
p(1234.floor.class)
a055 = 1234; c055 = (a055.floor); p c055
a056 = 1234; c056 = (a056.floor(-2)); p c056

# Bignum receiver
big100 = 2 ** 100; p(big100.floor(-2))
