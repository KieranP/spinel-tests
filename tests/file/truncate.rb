# frozen_string_literal: true
# File.truncate
p001 = "/tmp/sp_file_truncate_1"
File.write(p001, "hello world")
p File.truncate(p001, 5)
p File.read(p001)
a001 = p001; b001 = 5; v001 = File.truncate(a001, b001); p v001
r001 = (File.truncate(p001, 5) rescue $!.class); p r001
File.delete(p001)
