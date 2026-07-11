# frozen_string_literal: true
# File.identical?
p001 = "/tmp/sp_file_identical_1"
File.write(p001, "hi")
p File.identical?(p001, p001)
a001 = p001; b001 = p001; p File.identical?(a001, b001)
v001 = File.identical?(p001, p001); p v001
r001 = (File.identical?(p001, p001) rescue $!.class); p r001
File.delete(p001)
