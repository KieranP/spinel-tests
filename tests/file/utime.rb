# frozen_string_literal: true
# File.utime
p001 = "/tmp/sp_file_utime_1"
File.write(p001, "hi")
t001 = Time.at(1_000_000)
r001 = (File.utime(t001, t001, p001) rescue $!.class); p r001
a001 = p001; r002 = (File.utime(t001, t001, a001) rescue $!.class); p r002
v001 = (File.utime(t001, t001, p001) rescue $!.class); p v001
File.delete(p001)
