# frozen_string_literal: true
# Dir.exist?
d001 = "/tmp/sp_dir_exist_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
p Dir.exist?(d001)
p Dir.exist?("/tmp/sp_dir_exist_none_zzz")
a001 = d001
v001 = Dir.exist?(a001); p v001
a002 = "/tmp/sp_dir_exist_none_zzz"
v002 = Dir.exist?(a002); p v002
f001 = "/tmp/sp_dir_exist_file_1"
File.write(f001, "x")
p Dir.exist?(f001)
v003 = Dir.exist?(f001); p v003
File.delete(f001)
Dir.rmdir(d001)
