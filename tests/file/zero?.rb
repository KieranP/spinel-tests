# frozen_string_literal: true
# File.zero?
p001 = "/tmp/sp_file_zero_1"
File.write(p001, "")
p File.zero?(p001)
a001 = p001
p File.zero?(a001)
v001 = File.zero?(p001); p v001
File.write(p001, "x")
p File.zero?(p001)
v002 = File.zero?(p001); p v002
File.delete(p001)
