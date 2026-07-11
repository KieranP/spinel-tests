# frozen_string_literal: true
# File.symlink
p001 = "/tmp/sp_file_symlink_tgt"
p002 = "/tmp/sp_file_symlink_lnk"
File.write(p001, "hi")
r001 = (File.symlink(p001, p002) rescue $!.class); p r001
File.delete(p002) if File.symlink?(p002)
a001 = p001; b001 = p002
r002 = (File.symlink(a001, b001) rescue $!.class); p r002
File.delete(b001) if File.symlink?(b001)
File.delete(p001)
