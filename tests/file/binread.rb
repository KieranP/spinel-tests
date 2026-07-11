# frozen_string_literal: true
# File.binread
p001 = "/tmp/sp_file_binread_1"
File.write(p001, "hello")
p File.binread(p001)
a001 = p001
p File.binread(a001)
v001 = File.binread(p001); p v001
File.delete(p001)
