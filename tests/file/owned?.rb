# frozen_string_literal: true
# File.owned?
p001 = "/tmp/sp_file_owned_1"
File.write(p001, "hi")
p File.owned?(p001)
a001 = p001; p File.owned?(a001)
v001 = File.owned?(p001); p v001
File.delete(p001)
