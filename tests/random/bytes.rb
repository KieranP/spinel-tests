# frozen_string_literal: true
# Random#bytes
# Random.bytes

r001 = Random.new(5)

# Random#bytes(n) -> a String of n bytes
p(r001.bytes(4).class)
p(r001.bytes(4).length)
p(r001.bytes(4).bytesize)
p(r001.bytes(0))
a002 = 4; c002 = r001.bytes(a002); p(c002.length)
p(r001.bytes(4).length.class)

# Random.bytes (class method)
p(Random.bytes(3).class)
p(Random.bytes(3).length)
a003 = 3; c003 = Random.bytes(a003); p(c003.length)

# WONTFIX: See docs/limitations.md - "Fundamental limits — Mixed / non-UTF-8 encodings"
# p(r001.bytes(4).encoding.name)
# p(Random.bytes(3).encoding.name)

# a seeded draw's concrete bytes are PRNG-algorithm-specific, so probe type + length
p(Random.new(42).bytes(4).class)
p(Random.new(42).bytes(4).length)

e004 = (r001.bytes(-1) rescue $!.class); p e004
e005 = (Random.bytes(-1) rescue $!.class); p e005
a006 = -1; e006 = (r001.bytes(a006) rescue $!.class); p e006

# Random.urandom(negative) correctly raises ArgumentError under both engines
e007 = (Random.urandom(-1) rescue $!.class); p e007
