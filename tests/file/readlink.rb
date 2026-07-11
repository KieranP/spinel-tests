# frozen_string_literal: true
# File.readlink
p001 = "/tmp/sp_file_readlink_tgt"
p002 = "/tmp/sp_file_readlink_lnk"
File.write(p001, "hi")
File.symlink(p001, p002)
p File.readlink(p002)
a001 = p002; v001 = File.readlink(a001); p v001
File.delete(p002)
File.delete(p001)
