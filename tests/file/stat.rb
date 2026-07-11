# frozen_string_literal: true
# File.stat
p001 = "/tmp/sp_file_stat_1"
File.write(p001, "hi")
p File.stat(p001).class
a001 = p001; p File.stat(a001).class
v001 = File.stat(p001); p v001.class
r001 = File.stat(p001); p r001.class
File.delete(p001)

# File#stat
p002 = "/tmp/sp_file_stat_inst"
File.write(p002, "hi")
f001 = File.open(p002); p f001.stat.class; f001.close
r002 = File.open(p002).stat; p r002.class
File.delete(p002)
