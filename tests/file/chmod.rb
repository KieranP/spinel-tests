# frozen_string_literal: true
# File.chmod
p001 = "/tmp/sp_file_chmod_1"
File.write(p001, "hi")
p File.chmod(0644, p001)
a001 = p001; p File.chmod(0644, a001)
v001 = File.chmod(0644, p001); p v001
r001 = (File.chmod(0644, p001) rescue $!.class); p r001
File.delete(p001)

# File#chmod
p002 = "/tmp/sp_file_chmod_inst"
File.write(p002, "hi")
f001 = File.open(p002); p f001.chmod(0644); f001.close
r002 = (File.open(p002).chmod(0644) rescue $!.class); p r002
File.delete(p002)
