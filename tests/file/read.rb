# frozen_string_literal: true
# File.read
p001 = "/tmp/sp_file_read_1"
File.write(p001, "hello world")
p File.read(p001)
a001 = p001
p File.read(a001)
v001 = File.read(p001); p v001
p File.read(p001, 5)
b001 = 5; p File.read(p001, b001)
r001 = (File.read(p001, 5) rescue $!.class); p r001
File.delete(p001)
p002 = "/tmp/sp_file_read_mb"
File.write(p002, "café\n")
p File.read(p002)
v002 = File.read(p002); p v002
File.delete(p002)
p003 = "/tmp/sp_file_read_empty"
File.write(p003, "")
p File.read(p003)
v003 = File.read(p003); p v003
File.delete(p003)
