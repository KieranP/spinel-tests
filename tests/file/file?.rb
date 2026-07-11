# frozen_string_literal: true
# File.file?
p001 = "/tmp/sp_file_file_1"
File.write(p001, "hi")
p File.file?(p001)
a001 = p001
p File.file?(a001)
v001 = File.file?(p001); p v001
p File.file?("/tmp")
v002 = File.file?("/tmp"); p v002
File.delete(p001)
