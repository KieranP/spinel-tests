# frozen_string_literal: true
# File.executable?
p001 = "/tmp/sp_file_executable_1"
File.write(p001, "hi")
p File.executable?(p001)
a001 = p001; p File.executable?(a001)
v001 = File.executable?(p001); p v001
r001 = (File.executable?(p001) rescue $!.class); p r001
File.delete(p001)
