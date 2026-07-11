# frozen_string_literal: true
# IO.binwrite

p001 = "/tmp/sp_io_binwrite_1.txt"

p(IO.binwrite(p001, "hello"))
p File.read(p001)

a002 = IO.binwrite(p001, "abcdef")
p a002
p File.read(p001)

# path and data both in variables
b003 = "/tmp/sp_io_binwrite_2.txt"
c003 = "written via vars"
p(IO.binwrite(b003, c003))
d003 = IO.binwrite(b003, c003)
p d003
p File.read(b003)

# binwrite truncates by default
IO.binwrite(p001, "0123456789")
p(IO.binwrite(p001, "xy"))
p File.read(p001)

# with an offset it does NOT truncate, it patches in place
IO.binwrite(p001, "0123456789")
p(IO.binwrite(p001, "AB", 2))
p File.read(p001)

e004 = IO.binwrite(p001, "ZZ", 5)
p e004
p File.read(p001)

# an offset past EOF zero-fills the gap
IO.binwrite(b003, "ab")
IO.binwrite(b003, "z", 5)
p File.read(b003).bytes

# empty string writes 0 bytes
IO.binwrite(p001, "keep")
p(IO.binwrite(p001, ""))
p File.read(p001)

# binary content round-trips byte for byte
f005 = "\x00\x01\xFE\xFF".b
p(IO.binwrite(b003, f005))
p File.binread(b003).bytes
g005 = File.binread(b003)
p g005.bytes

# a non-existent directory raises
r006 = (IO.binwrite("/tmp/sp_io_binwrite_nodir_xyz/f.txt", "a") rescue $!.class); p r006

File.delete(p001)
File.delete(b003)
