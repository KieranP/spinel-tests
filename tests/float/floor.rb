# frozen_string_literal: true
# Float#floor
p(3.7.floor)
a016 = 3.7; p(a016.floor)
a017 = 3.7; c017 = (a017.floor); p c017

# negative and already-integral receivers
p(-3.2.floor)
p(3.0.floor)
a021 = -3.1; p(a021.floor)

# Float#floor(n) — positive digits keep Float class
p(3.14159.floor(2))
a018 = 3.14159; p(a018.floor(2))
a019 = 3.14159; b019 = 2; p(a019.floor(b019))
a020 = 3.14159; b020 = 2; c020 = (a020.floor(b020)); p c020
p(3.14159.floor(2).class)
p(3.14159.floor(0))
p(-3.14159.floor(2))

# Float#floor(n) — negative digits round to a power of ten (Integer)
p(1234.5678.floor(-2))
p(-1234.5678.floor(-2))
a022 = 15.7; b022 = -1; p(a022.floor(b022))
a023 = 15.7; b023 = -1; c023 = (a023.floor(b023)); p c023

# Float#floor on Infinity (Ruby raises FloatDomainError)
r251 = (Float::INFINITY.floor rescue $!.class); p r251
a251 = Float::INFINITY; c251 = (a251.floor rescue $!.class); p c251

r880 = (1.5.floor("x") rescue $!.class); p r880
hm881 = :even; r881 = (1.5.floor(half: hm881) rescue $!.class); p r881
