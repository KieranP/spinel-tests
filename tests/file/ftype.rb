# frozen_string_literal: true
# File.ftype
p001 = "/tmp/sp_file_ftype_1"
File.write(p001, "hi")
p File.ftype(p001)
a001 = p001; p File.ftype(a001)
v001 = File.ftype(p001); p v001
r001 = (File.ftype(p001) rescue $!.class); p r001
File.delete(p001)
