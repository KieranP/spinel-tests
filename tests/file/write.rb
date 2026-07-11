# frozen_string_literal: true
# File.write
p001 = "/tmp/sp_file_write_1"
p File.write(p001, "hello")
p File.read(p001)
a001 = p001; b001 = "world!!"
v001 = File.write(a001, b001); p v001
p File.read(p001)
File.delete(p001)
p002 = "/tmp/sp_file_write_mb"
p File.write(p002, "café")
v002 = File.write(p002, "café"); p v002
File.delete(p002)

File.write(p001, "hello"); File.write(p001, "XY", 1); p File.read(p001); File.delete(p001)
File.write(p001, "a"); File.write(p001, "b", mode: "a"); p File.read(p001); File.delete(p001)
