# frozen_string_literal: true
# File.rename
p001 = "/tmp/sp_file_rename_1"
p002 = "/tmp/sp_file_rename_2"
File.write(p001, "hi")
p File.rename(p001, p002)
p File.exist?(p001)
p File.exist?(p002)
p File.read(p002)
a001 = p002; b001 = p001
v001 = File.rename(a001, b001); p v001
p File.exist?(p001)
File.delete(p001)
