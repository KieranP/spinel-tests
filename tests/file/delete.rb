# frozen_string_literal: true
# File.delete
p001 = "/tmp/sp_file_delete_1"
File.write(p001, "hi")
p File.delete(p001)
p File.exist?(p001)
a001 = "/tmp/sp_file_delete_2"
File.write(a001, "hi")
v001 = File.delete(a001); p v001
p File.exist?(a001)
# File.unlink
p002 = "/tmp/sp_file_delete_3"
File.write(p002, "hi")
p File.unlink(p002)
p File.exist?(p002)
a002 = "/tmp/sp_file_delete_4"
File.write(a002, "hi")
v002 = File.unlink(a002); p v002
p File.exist?(a002)
