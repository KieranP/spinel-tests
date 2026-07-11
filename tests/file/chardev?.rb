# frozen_string_literal: true
# File.chardev?
p001 = "/tmp/sp_file_chardev_1"
File.write(p001, "hi")
p File.chardev?(p001)
a001 = p001; p File.chardev?(a001)
v001 = File.chardev?(p001); p v001
File.delete(p001)
