# frozen_string_literal: true
# File.symlink?
p001 = "/tmp/sp_file_symlink_1"
File.write(p001, "hi")
p File.symlink?(p001)
a001 = p001
p File.symlink?(a001)
v001 = File.symlink?(p001); p v001
File.delete(p001)
