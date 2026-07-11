# frozen_string_literal: true
# File.exist?
p001 = "/tmp/sp_file_exist_1"
File.write(p001, "hi")
p File.exist?(p001)
a001 = p001
p File.exist?(a001)
v001 = File.exist?(p001); p v001
File.delete(p001)
p File.exist?(p001)
v002 = File.exist?(p001); p v002
