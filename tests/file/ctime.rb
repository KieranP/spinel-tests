# frozen_string_literal: true
# File.ctime
p001 = "/tmp/sp_file_ctime_1"
File.write(p001, "hi")
p File.ctime(p001).class
a001 = p001; p File.ctime(a001).class
v001 = File.ctime(p001); p v001.class
r001 = File.ctime(p001); p r001.class
File.delete(p001)
