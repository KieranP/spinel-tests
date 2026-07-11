# frozen_string_literal: true
# File.readable_real?
p001 = "/tmp/sp_file_readable_real_1"
File.write(p001, "hi")
p File.readable_real?(p001)
a001 = p001
p File.readable_real?(a001)
v001 = File.readable_real?(p001); p v001
p File.readable_real?("/tmp/sp_file_readable_real_nope")
v002 = File.readable_real?("/tmp/sp_file_readable_real_nope"); p v002

## a directory is readable too
# p File.readable_real?("/tmp")
# v003 = File.readable_real?("/tmp"); p v003

## a write-only file is not readable
# p002 = "/tmp/sp_file_readable_real_2"
# File.write(p002, "x")
# File.chmod(0o200, p002)
# p File.readable_real?(p002)
# v004 = File.readable_real?(p002); p v004
# File.chmod(0o644, p002)
# p File.readable_real?(p002)

# File.delete(p001)
# File.delete(p002)
