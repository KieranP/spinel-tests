# frozen_string_literal: true
# File.binwrite
p001 = "/tmp/sp_file_binwrite_1"
p File.binwrite(p001, "abc")
p File.binread(p001)
a001 = p001; b001 = "xyz"
v001 = File.binwrite(a001, b001); p v001
p File.binread(p001)
File.delete(p001)
p002 = "/tmp/sp_file_binwrite_mb"
p File.binwrite(p002, "café")
v002 = File.binwrite(p002, "café"); p v002
File.delete(p002)
