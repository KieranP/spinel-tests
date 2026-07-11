# frozen_string_literal: true
# Integer#downto
p(4.downto(1).to_a)
a095 = 4; p(a095.downto(1).to_a)
a096 = 4; b096 = 1; p(a096.downto(b096).to_a)
a097 = 4; b097 = 1; c097 = (a097.downto(b097).to_a); p c097

p(3.downto(3).to_a)
p(1.downto(4).to_a)
p(2.downto(-2).to_a)
p((-1).downto(-4).to_a)

s098 = 0; 5.downto(1) { |i| s098 += i }; p s098
p(5.downto(1).map { |i| i * 2 })
p(5.downto(1) { })
p(4.downto(1).size)

# Float limit: Ruby stops as soon as the counter drops below the limit.
p(5.downto(1.5).to_a)
a099 = 5; b099 = 1.5; c099 = (a099.downto(b099).to_a); p c099

# Bignum receiver.
big100 = 2 ** 100; p(big100.downto(big100 - 3).to_a)

r880 = (3.downto("a").to_a rescue $!.class); p r880
