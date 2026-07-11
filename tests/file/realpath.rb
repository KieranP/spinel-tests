# frozen_string_literal: true
# File.realpath
p001 = "/tmp/sp_file_realpath_1"
File.write(p001, "hi")
p File.realpath(p001).class
a001 = p001; p File.realpath(a001).class
v001 = File.realpath(p001); p v001.class
r001 = (File.realpath(p001) rescue $!.class); p r001
File.delete(p001)
