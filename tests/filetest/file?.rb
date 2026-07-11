# frozen_string_literal: true
# FileTest.file?
p001 = "/tmp/sp_filetest_file_1"
File.write(p001, "x")
d001 = "/tmp/sp_filetest_file_dir"
Dir.mkdir(d001) unless Dir.exist?(d001)
r001 = (FileTest.file?(p001) rescue $!.class); p r001
r002 = (FileTest.file?(d001) rescue $!.class); p r002
File.delete(p001); Dir.rmdir(d001)
