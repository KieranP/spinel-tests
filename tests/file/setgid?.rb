# frozen_string_literal: true
# File.setgid?
p001 = "/tmp/sp_file_setgid_1"
File.write(p001, "hi")
p File.setgid?(p001)
a001 = p001; p File.setgid?(a001)
v001 = File.setgid?(p001); p v001
File.delete(p001)
