# frozen_string_literal: true
# File.grpowned?
p001 = "/tmp/sp_file_grpowned_1"
File.write(p001, "hi")
p File.grpowned?(p001)
a001 = p001; p File.grpowned?(a001)
v001 = File.grpowned?(p001); p v001
File.delete(p001)
