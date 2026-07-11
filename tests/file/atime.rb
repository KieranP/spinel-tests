# frozen_string_literal: true
# File.atime
p001 = "/tmp/sp_file_atime_1"
File.write(p001, "hi")
p File.atime(p001).class
a001 = p001; p File.atime(a001).class
v001 = File.atime(p001); p v001.class
r001 = File.atime(p001); p r001.class
File.delete(p001)
