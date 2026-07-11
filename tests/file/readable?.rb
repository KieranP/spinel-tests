# frozen_string_literal: true
# File.readable?
p001 = "/tmp/sp_file_readable_1"
File.write(p001, "hi")
p File.readable?(p001)
a001 = p001
p File.readable?(a001)
v001 = File.readable?(p001); p v001
p File.readable?("/tmp/sp_file_readable_nope")
v002 = File.readable?("/tmp/sp_file_readable_nope"); p v002
File.delete(p001)
