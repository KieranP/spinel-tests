# frozen_string_literal: true
# File.birthtime
p001 = "/tmp/sp_file_birthtime_1"
File.write(p001, "hi")
r001 = (File.birthtime(p001).class rescue $!.class); p r001
a001 = p001; r002 = (File.birthtime(a001).class rescue $!.class); p r002
v001 = (File.birthtime(p001).class rescue $!.class); p v001
File.delete(p001)

# File#birthtime
p002 = "/tmp/sp_file_birthtime_inst"
File.write(p002, "hi")
f001 = File.open(p002)
r003 = (f001.birthtime.class rescue $!.class); p r003
f001.close
File.delete(p002)
