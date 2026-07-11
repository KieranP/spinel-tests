# frozen_string_literal: true
# File.size
p001 = "/tmp/sp_file_size_1"
File.write(p001, "hello")
p File.size(p001)
a001 = p001
p File.size(a001)
v001 = File.size(p001); p v001
File.write(p001, "")
p File.size(p001)
v002 = File.size(p001); p v002
File.delete(p001)
p002 = "/tmp/sp_file_size_mb"
File.write(p002, "café")
p File.size(p002)
v003 = File.size(p002); p v003
File.write(p002, "longer content here")
p File.size(p002)
v004 = File.size(p002); p v004
File.delete(p002)

# File#size
p003 = "/tmp/sp_file_size_inst"
File.write(p003, "hi")
f001 = File.open(p003); p f001.size; f001.close
r001 = (File.open(p003).size rescue $!.class); p r001
File.delete(p003)
