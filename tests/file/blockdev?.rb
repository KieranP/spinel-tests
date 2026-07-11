# frozen_string_literal: true
# File.blockdev?
p001 = "/tmp/sp_file_blockdev_1"
File.write(p001, "hi")
p File.blockdev?(p001)
a001 = p001; p File.blockdev?(a001)
v001 = File.blockdev?(p001); p v001
File.delete(p001)
