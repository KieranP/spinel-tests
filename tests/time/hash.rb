# frozen_string_literal: true
# Time#hash

p Time.utc(2020, 1, 1).hash.class

a001 = Time.utc(2020, 1, 1)
b001 = Time.utc(2020, 1, 1)
p (a001.hash == b001.hash)

c002 = Time.utc(2020, 1, 1)
d002 = Time.utc(2020, 6, 1)
p (c002.hash == d002.hash)

e003 = Time.utc(2020, 1, 1)
f003 = e003.hash
p f003.class

# Equal Times hash alike, whichever zone they carry, and round-trip as a Hash key.
g004 = Time.utc(2020, 1, 1)
h004 = Time.utc(2020, 1, 1).getlocal("+09:00")
p (g004 == h004)
p (g004.hash == h004.hash)
i005 = { g004 => :x }
p i005[Time.utc(2020, 1, 1)]
p i005.key?(Time.utc(2020, 1, 1))
j006 = Time.utc(2020, 1, 1, 0, 0, 0, 1)
p (g004.hash == j006.hash)
k006 = i005[Time.utc(2020, 1, 1)]; p k006
