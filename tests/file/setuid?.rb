# frozen_string_literal: true
# File.setuid?
p001 = "/tmp/sp_file_setuid_1"
File.write(p001, "hi")
p File.setuid?(p001)
a001 = p001; p File.setuid?(a001)
v001 = File.setuid?(p001); p v001
File.delete(p001)
