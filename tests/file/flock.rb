# frozen_string_literal: true
# File#flock
p001 = "/tmp/sp_file_flock_1"
File.write(p001, "hi")
f001 = File.open(p001, "r")
r001 = (f001.flock(File::LOCK_SH) rescue $!.class); p r001
r002 = (f001.flock(File::LOCK_UN) rescue $!.class); p r002
f001.close

f002 = File.open(p001, "w")
m001 = File::LOCK_EX
r003 = (f002.flock(m001) rescue $!.class); p r003
v001 = (f002.flock(File::LOCK_UN) rescue $!.class); p v001
f002.close
File.delete(p001)
