# frozen_string_literal: true
# File.empty?
p001 = "/tmp/sp_file_empty_1"
File.write(p001, "")
p File.empty?(p001)
a001 = p001
p File.empty?(a001)
v001 = File.empty?(p001); p v001
# non-empty file: both agree (false)
File.write(p001, "x")
p File.empty?(p001)
v002 = File.empty?(p001); p v002
File.delete(p001)
