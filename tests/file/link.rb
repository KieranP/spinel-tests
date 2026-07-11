# frozen_string_literal: true
# File.link
p001 = "/tmp/sp_file_link_tgt"
p002 = "/tmp/sp_file_link_lnk"
File.write(p001, "hi")
r001 = (File.link(p001, p002) rescue $!.class); p r001
File.delete(p002) if File.exist?(p002)
a001 = p001; b001 = p002
r002 = (File.link(a001, b001) rescue $!.class); p r002
File.delete(b001) if File.exist?(b001)
File.delete(p001)
