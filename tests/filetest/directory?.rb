# frozen_string_literal: true
# FileTest.directory?
d001 = "/tmp/sp_filetest_dir_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
p001 = "/tmp/sp_filetest_dir_file"
File.write(p001, "x")
r001 = (FileTest.directory?(d001) rescue $!.class); p r001
r002 = (FileTest.directory?(p001) rescue $!.class); p r002
Dir.rmdir(d001); File.delete(p001)
