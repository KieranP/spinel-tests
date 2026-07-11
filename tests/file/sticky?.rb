# frozen_string_literal: true
# File.sticky?
p001 = "/tmp/sp_file_sticky_1"
File.write(p001, "hi")
p File.sticky?(p001)
a001 = p001; p File.sticky?(a001)
v001 = File.sticky?(p001); p v001
File.delete(p001)
