# frozen_string_literal: true
# File.directory?
p001 = "/tmp/sp_file_directory_1"
File.write(p001, "hi")
p File.directory?(p001)
a001 = p001
p File.directory?(a001)
v001 = File.directory?(p001); p v001
p File.directory?("/tmp")
v002 = File.directory?("/tmp"); p v002
File.delete(p001)
