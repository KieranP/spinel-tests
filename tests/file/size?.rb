# frozen_string_literal: true
# File.size?
p001 = "/tmp/sp_file_sizeq_1"
File.write(p001, "hello world!")
p File.size?(p001)
a001 = p001; p File.size?(a001)
v001 = File.size?(p001); p v001
r001 = (File.size?(p001) rescue $!.class); p r001
File.delete(p001)
