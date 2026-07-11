# frozen_string_literal: true
# FileTest.exist?
p001 = "/tmp/sp_filetest_exist_1"
File.write(p001, "x")
n001 = "/tmp/sp_filetest_exist_none_zzz"
r001 = (FileTest.exist?(p001) rescue $!.class); p r001
r002 = (FileTest.exist?(n001) rescue $!.class); p r002
File.delete(p001)
