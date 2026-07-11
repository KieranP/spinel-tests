# frozen_string_literal: true
# File.lstat
p001 = "/tmp/sp_file_lstat_1"
File.write(p001, "hi")
p File.lstat(p001).class
a001 = p001; p File.lstat(a001).class
v001 = File.lstat(p001); p v001.class
r001 = File.lstat(p001); p r001.class
File.delete(p001)

# File#lstat
p002 = "/tmp/sp_file_lstat_inst"
File.write(p002, "hi")
f001 = File.open(p002)
p f001.lstat.class
r002 = f001.lstat; p r002.class
f001.close
File.delete(p002)
