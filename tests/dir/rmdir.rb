# frozen_string_literal: true
# Dir.rmdir
d001 = "/tmp/sp_dir_rmdir_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
p Dir.rmdir(d001)
p Dir.exist?(d001)
a001 = "/tmp/sp_dir_rmdir_2"
Dir.mkdir(a001) unless Dir.exist?(a001)
v001 = Dir.rmdir(a001); p v001
p Dir.exist?(a001)

b001 = "/tmp/sp_dir_rmdir_3"
Dir.mkdir(b001) unless Dir.exist?(b001)
r001 = (Dir.delete(b001) rescue $!.class); p r001
p Dir.exist?(b001)
Dir.rmdir(b001) rescue nil
c001 = "/tmp/sp_dir_rmdir_4"
Dir.mkdir(c001) unless Dir.exist?(c001)
r002 = (Dir.unlink(c001) rescue $!.class); p r002
Dir.rmdir(c001) rescue nil
