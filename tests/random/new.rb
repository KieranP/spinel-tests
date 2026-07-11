# frozen_string_literal: true
# Random.new

# Random.new returns a working generator (seeded or unseeded)
r001 = Random.new(5)
p(r001.rand(10).class)
p((0...10).include?(r001.rand(10)))

r002 = Random.new
p(r002.rand(10).class)
p((0...10).include?(r002.rand(10)))

# a seeded generator is reproducible: two draws from separate same-seed
# generators agree with each other (algorithm-independent), for a variety of
# seed kinds (positive, zero, negative, Float)
p(Random.new(123).rand(1000) == Random.new(123).rand(1000))
p(Random.new(0).rand(1000) == Random.new(0).rand(1000))
p(Random.new(-5).rand(1000) == Random.new(-5).rand(1000))
p(Random.new(3.9).rand(1000) == Random.new(3.9).rand(1000))
a004 = 77; p(Random.new(a004).rand(1000) == Random.new(a004).rand(1000))

# a Bignum seed is accepted; the drawn value is PRNG-algorithm-specific,
# so probe algorithm-independent reproducibility within a run
p(Random.new(2**70).rand(100) == Random.new(2**70).rand(100))

# an out-of-range Float seed truncates to a Bignum integer in Ruby (reproducible);
# Spinel casts it to mrb_int (UB out of range), so same-seed draws disagree
p(Random.new(1e300).rand(1000) == Random.new(1e300).rand(1000))
b005 = 2.0**70; p(Random.new(b005).rand(1000) == Random.new(b005).rand(1000))

# a Random instance reflects its class
p(Random.new(5).class)
c003 = Random.new(5).class; p c003
r003 = Random.new(5); p(r003.class)

# the raw inspect embeds a Ruby-nondeterministic address, so probe the stable class-name prefix
# and the address-normalized full form
p(Random.new(5).inspect.start_with?("#<Random"))
r004 = Random.new(5); p(r004.inspect.start_with?("#<Random"))
p(Random.new(5).inspect.sub(/0x\h+/, "0xADDR"))
c004 = Random.new(5).inspect.sub(/0x\h+/, "0xADDR"); p c004
