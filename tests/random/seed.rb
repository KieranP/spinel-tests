# frozen_string_literal: true
# Random#seed

r001 = Random.new(12345)
p(r001.rand(10).class)

# Random#seed returns the seed the generator was created with
p(r001.seed)
p(Random.new(12345).seed)
c001 = r001.seed; p c001
p(Random.new(0).seed)

# a negative seed round-trips, seed is an Integer, and drawing does not change it
p(Random.new(-99).seed)
p(Random.new(12345).seed.class)
r002 = Random.new(0)
r002.rand(10)
p(r002.seed)
c002 = r002.seed; p c002
