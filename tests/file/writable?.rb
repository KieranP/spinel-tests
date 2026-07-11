# frozen_string_literal: true
# File.writable?
p001 = "/tmp/sp_file_writable_1"
File.write(p001, "hi")
p File.writable?(p001)
a001 = p001; p File.writable?(a001)
v001 = File.writable?(p001); p v001
r001 = (File.writable?(p001) rescue $!.class); p r001
File.delete(p001)
