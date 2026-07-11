# frozen_string_literal: true
# File.chown
# nil,nil means "do not change" -- a portable no-op that returns the file count.
p001 = "/tmp/sp_file_chown_1"
File.write(p001, "hi")
r001 = (File.chown(nil, nil, p001) rescue $!.class); p r001
a001 = p001; r002 = (File.chown(nil, nil, a001) rescue $!.class); p r002
v001 = (File.chown(nil, nil, p001) rescue $!.class); p v001
File.delete(p001)

# File#chown
p002 = "/tmp/sp_file_chown_inst"
File.write(p002, "hi")
f001 = File.open(p002)
r003 = (f001.chown(nil, nil) rescue $!.class); p r003
f001.close
File.delete(p002)
