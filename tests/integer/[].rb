# frozen_string_literal: true
# Integer#[]
p(255[0])
a016 = 255; p(a016[0])
a017 = 255; b017 = 0; p(a017[b017])
a018 = 255; b018 = 0; c018 = (a018[b018]); p c018

# Integer#[] with a Range (bit-slice) argument
p(0b101101[1..3])
a245 = 0b101101; p(a245[1..])
a246r = 0b101101; b246r = (2..5); p(a246r[b246r])
p(0b101101[2, 4])

# exclusive-range and more (i, len) slice forms on a small Integer receiver
p(0b101101[1...4])
a247r = 0b101101; b247r = (1...4); p(a247r[b247r])
p(0b1111[0, 2])
a248 = 0b101101; b248 = 2; c248 = 4; p(a248[b248, c248])

# Bignum-receiver bit-slice: range form C-aborts, (i, len) form is front-end rejected.
p((2 ** 100)[10..20])
p((2 ** 100)[10, 5])

# Out-of-range bit index (>= 64 or < 0): the shift is now clamped, returns 0 / 0 / 0 / 1.
p(5[100])
p(5[64])
a300 = 5; p(a300[-1])
p((-8)[200])

p((2 ** 100)[100])
a250 = 2 ** 100; b250 = 100; c250 = (a250[b250]); p c250
# Integer#[] with a nil index (Ruby raises TypeError)
r881 = (5[nil] rescue $!.class); p r881

# two's-complement bits of a negative receiver, and the (i, len) / Range forms in variables
p([(-1)[0], (-1)[99], (-2)[0], (-2)[1]])
vb1 = 0b101101; wb1 = 1; xb1 = (vb1[wb1, 3]); p xb1
vb2 = 0b101101; wb2 = (1...4); xb2 = (vb2[wb2]); p xb2

# Beginless range: both Ruby and Spinel now raise ArgumentError (infinity); stdout empty both sides.
# Kept LIVE as the last line - the uncaught raise flushes/discards prior stdout on each side.
puts 255[..3]
