# frozen_string_literal: true
# Random.urandom

# Random.urandom(n) returns n random bytes sourced from the OS entropy pool
p(Random.urandom(4).class)
p(Random.urandom(4).length)
p(Random.urandom(0))
s001 = Random.urandom(8); p(s001.length)
a002 = 4; c002 = Random.urandom(a002); p(c002.length)

p 8000.times.any? { Random.urandom(1).bytes[0] == 0 }
v003 = 8000.times.any? { Random.urandom(1).bytes[0] == 0 }; p v003

# bytesize matches the requested count, and a negative count raises ArgumentError
p(Random.urandom(4).bytesize)
p(Random.urandom(0).class)
v004 = (Random.urandom(-1) rescue $!.class); p v004
a005 = -1; v005 = (Random.urandom(a005) rescue $!.class); p v005

# a draw whose bytes contain a zero byte still has length n
p(2000.times.any? { Random.urandom(4).length != 4 })
v006 = 2000.times.any? { Random.urandom(4).length != 4 }; p v006
