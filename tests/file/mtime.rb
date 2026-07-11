# frozen_string_literal: true
# File.mtime
p001 = "/tmp/sp_file_mtime_1"
File.write(p001, "hi")
p File.mtime(p001).class
p File.mtime(p001) <= Time.now
a001 = p001
p File.mtime(a001).class
v001 = File.mtime(p001); p v001.class
v002 = File.mtime(p001) <= Time.now; p v002
File.delete(p001)

# File#mtime
p002 = "/tmp/sp_file_mtime_inst"
File.write(p002, "hi")
f001 = File.open(p002); p f001.mtime.class; f001.close
r001 = File.open(p002).mtime; p r001.class
File.delete(p002)
