# frozen_string_literal: true
# File.writable_real?
p001 = "/tmp/sp_file_writable_real_1"
File.write(p001, "hi")
p File.writable_real?(p001)
a001 = p001
p File.writable_real?(a001)
v001 = File.writable_real?(p001); p v001
p File.writable_real?("/tmp/sp_file_writable_real_nope")
v002 = File.writable_real?("/tmp/sp_file_writable_real_nope"); p v002

## a directory is writable too
# p File.writable_real?("/tmp")
# v003 = File.writable_real?("/tmp"); p v003

## a read-only file is not writable
# p002 = "/tmp/sp_file_writable_real_2"
# File.write(p002, "x")
# File.chmod(0o444, p002)
# p File.writable_real?(p002)
# v004 = File.writable_real?(p002); p v004
# File.chmod(0o644, p002)
# p File.writable_real?(p002)

# File.delete(p001)
# File.delete(p002)
